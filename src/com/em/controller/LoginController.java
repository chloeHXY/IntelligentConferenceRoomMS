package com.em.controller;

import com.em.domain.User;
import com.em.service.UserService;

import javax.servlet.http.HttpServletRequest;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Created by Carson on 2017/11/30.
 */
@Controller
public class LoginController {

	@Autowired
	UserService userService;
    //登录跳转
    @RequestMapping(value = "/login", method = {RequestMethod.GET})
    public String loginUI() throws Exception {
        return "../../login";
    }

    //登录表单处理
    @RequestMapping(value = "/login", method = {RequestMethod.POST})
    public String login(User user,HttpServletRequest request) throws Exception {

        //Shiro实现登录
        UsernamePasswordToken token = new UsernamePasswordToken(user.getId(),user.getPassword());
        Subject subject = SecurityUtils.getSubject();

        //如果获取不到用户名就是登录失败，但登录失败的话，会直接抛出异常
        try {
			subject.login(token);
		} catch (Exception e) {
			return "/login";
		}

        if (subject.hasRole("admin")) {
        	request.getSession().setAttribute("admin", user.getId());
        	request.getSession().setAttribute("usersession", userService.findUserById(user.getId()));
            return "redirect:/admin/showRoom";
        } else if (subject.hasRole("ordinary")) {
        	request.getSession().setAttribute("user", user.getId());
        	request.getSession().setAttribute("usersession", userService.findUserById(user.getId()));
            return "redirect:/ordinary/showRoom";
        }

        return "/login";
    }

}
