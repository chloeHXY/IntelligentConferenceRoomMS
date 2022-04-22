package com.em.service;

import com.em.domain.PagingVO;
import com.em.domain.Reservation;
import com.em.domain.ReservationCustom;
import com.em.domain.ReservationVo;

import java.util.Date;
import java.util.List;

/**
 * Created by Admiral on 2018/1/19.
 */
public interface ReservationService {
    /**
     * 查询待审核的预约总数
     * @return
     */
    public Integer reservationCount() throws Exception;

    /**
     * 查询所有待审核预约记录
     * @return
     */
    public List<ReservationVo> findByPaging(Integer toPageNo) throws Exception;

    /**
     * 根据预约人查询其所有预约记录
     * @param name
     * @return
     */
    public List<Reservation> findByName(String name);

    /**
     * 查询审核通过的预约总数
     * @return
     */
    public Integer reservationPassCount();

    /**
     * 查询审核通过预约记录
     * @param toPageNo
     * @return
     * @throws Exception
     */
    public List<ReservationVo> findRecord(Integer toPageNo) throws Exception;
    
    /**
     * 查询审核通过的预约总数
     * @return
     */
    public Integer reservationNoPassCount();

    /**
     * 查询所有审核通过预约记录
     * @param toPageNo
     * @return
     * @throws Exception
     */
    public List<ReservationVo> findRejectRecord(PagingVO pagingVO) throws Exception;
    
    /**
     * 查询所有审核通过预约记录
     * @param toPageNo
     * @return
     * @throws Exception
     */
    public List<ReservationVo> findRejectRecord(Integer toPageNo) throws Exception;

    /**
     * 审核预约陪读
     * @param id
     * @throws Exception
     */
    public void reviewReservation(Integer id) throws Exception;

    /**
     * 查询所有预约记录
     * @return
     */
    public Integer reserveCount() throws Exception;

    /**
     * 查询当前日期起,所有已被预约的陪读记录
     * @return
     */
    public List<ReservationVo> findAllByPaging(Integer toPageNo) throws Exception;

    /**
     * 添加陪读预约
     * @param reservationCustom
     */
    public void addReservation(ReservationCustom reservationCustom) throws Exception;

    /**
     * 根据预约人查询所有陪读预约信息
     * @param name
     * @return
     * @throws Exception
     */
    public List<ReservationVo> queryByUser(String name) throws Exception;

    /**
     * 查询指定预约人预约陪读信息
     * @param name
     * @return
     * @throws Exception
     */
    public List<ReservationCustom> findByUser(String name) throws Exception;

    /**
     * 根据id取消陪读申请
     * @param id
     * @throws Exception
     */
    public void cancelApplication(Integer id) throws Exception;

	void rejectReservation(Integer id) throws Exception;

	public List<Reservation> findByDate(ReservationCustom reservationCustom);
}
