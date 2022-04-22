package com.em.controller;

import com.em.controller.converter.StringToDateConverter;
import com.em.domain.*;
import com.em.service.ReservationService;
import com.em.service.RoomService;
import com.em.service.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

/**
 * Created by Admiral on 2018/1/20.
 */
@Controller
@RequestMapping("/ordinary")
public class OrdinaryController {

	@Resource(name = "roomServiceImpl")
	private RoomService roomService;

	@Resource(name = "reservationServiceImpl")
	private ReservationService reservationService;

	@Resource(name = "userServiceImpl")
	private UserService userService;

	/*<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<会议室信息管理>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>*/
	// 会议室信息显示
	@RequestMapping("/showRoom")
	public String showRoom(Model model, Integer page) throws Exception {

		List<Room> list = null;
		//页码对象
		PagingVO pagingVO = new PagingVO();
		//设置总页数
		pagingVO.setTotalCount(roomService.roomCount());
		if (page == null || page == 0) {
			pagingVO.setToPageNo(1);
			list = roomService.findByPaging(1);
		} else {
			pagingVO.setToPageNo(page);
			list = roomService.findByPaging(page);
		}

		model.addAttribute("roomList", list);
		model.addAttribute("pagingVO", pagingVO);

		return "/ordinary/showRoom";
	}

	//搜索会议室
	@RequestMapping(value = "/queryRoom", method = {RequestMethod.POST})
	private String queryRoom(String findByName, Model model) throws Exception {

		List<Room> list = roomService.findByName(findByName);

		model.addAttribute("roomList", list);
		return "/ordinary/showRoom";
	}

	//个人信息修改
	@RequestMapping(value = "/showUser", method = {RequestMethod.GET})
	private String showUser(Model model,HttpServletRequest request) throws Exception {
		String id = String.valueOf(request.getSession().getAttribute("user"));
		User user = userService.findUserById(id);
		model.addAttribute("object", user);
		return "/ordinary/showUser";
	}

	//个人信息修改
	@RequestMapping(value = "/changeUser", method = {RequestMethod.POST})
	private String changeUser(String password, String username, Model model,HttpServletRequest request) throws Exception {
		String id = String.valueOf(request.getSession().getAttribute("user"));
		User user = userService.findUserById(id);
		user.setUsername(username);
		user.setPassword(password);
		userService.updateUser(user);
		model.addAttribute("object", user);
		return "/ordinary/showUser";
	}

	//查询接下来的所有已被预约的会议室记录
	@RequestMapping("/showRecord")
	public String findAllReservation(Model model, Integer page) throws Exception {
		List<ReservationVo> list = null;

		//页码对象
		PagingVO pagingVO = new PagingVO();
		//设置总页数
		pagingVO.setTotalCount(reservationService.reserveCount());
		if (page == null || page == 0) {
			pagingVO.setToPageNo(1);
			list = reservationService.findAllByPaging(1);
		} else {
			pagingVO.setToPageNo(page);
			list = reservationService.findAllByPaging(page);
		}

		model.addAttribute("recordList", list);
		model.addAttribute("pagingVo", pagingVO);

		return "/ordinary/showRecord";
	}

	//搜索借用人
	@RequestMapping(value = "/queryByUser", method = {RequestMethod.POST})
	private String queryUser(String findByName, Model model) throws Exception {

		List<ReservationVo> list = reservationService.queryByUser(findByName);

		model.addAttribute("recordList", list);

		return "/ordinary/showRecord";
	}

	//预约会议室页面跳转
	@RequestMapping(value = "/reserveRoom", method = RequestMethod.GET)
	public String reserveRoomUI(Model model,HttpServletRequest request) throws Exception {
		//从数据库查询出所有会议室信息回显到页面
		List<Room> list = roomService.nameList();
		model.addAttribute("nameList", list);
		User user = (User) request.getSession().getAttribute("usersession");
		
		System.out.println("左侧会议室："+user);
		model.addAttribute("object", user);
		return "/ordinary/reserveRoom";
	}

	//预约会议室功能实现
	@RequestMapping(value = "/reserveRoom", method = RequestMethod.POST)
	public String reserveRoomreservationCustom(Model model,HttpServletRequest request,ReservationCustom reservationCustom) throws Exception {

		System.out.println("reservationCustom:"+reservationCustom);
		//查询当前申请的时间内，是不是该会议室已经有人申请通过了，或者有人正在申请该会议室该时段
		List<Reservation>  reservation = reservationService.findByDate(reservationCustom);
		System.out.println("reservation========================="+reservation.toString()+ "    "+reservation.size());
		
		
		//从数据库查询出所有会议室信息回显到页面
		List<Room> list = roomService.nameList();
		model.addAttribute("nameList", list);
		User user = (User) request.getSession().getAttribute("usersession");
		System.out.println("刷新会议室："+user);
		model.addAttribute("object", user);
		if(reservation.size()>0) {
			model.addAttribute("msg", "当前会议室你申请的时间断已经有人申请通过了，或者有人正在申请该会议室该时段！");
			return "/ordinary/reserveRoom";
			
		}else {
			//判断结束时间大于开始时间
			if(!reservationCustom.getEndTime().after(reservationCustom.getBeginTime())) {
				model.addAttribute("msg", "结束时间必须大于开始时间！");
				return "/ordinary/reserveRoom";
			}else {
				model.addAttribute("msg", "");
				reservationService.addReservation(reservationCustom);
				return "redirect:/ordinary/showRecord";
			}
		}
	}

	//取消预约申请页面跳转
	@RequestMapping(value = "/cancelApplication",method = RequestMethod.GET)
	public String cancelApplicationUI(String user,Model model) throws Exception{
		List<ReservationCustom> list=reservationService.findByUser(user);
		model.addAttribute("reserveList",list);

		return "/ordinary/cancelApplication";
	}

	//取消预约申请业务实现
	@RequestMapping("/cancelApply")
	public String cancelApplication(Integer id) throws Exception{
		reservationService.cancelApplication(id);

		return "redirect:/ordinary/showRecord";
	}

}
