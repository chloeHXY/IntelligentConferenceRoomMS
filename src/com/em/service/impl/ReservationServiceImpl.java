package com.em.service.impl;

import com.em.dao.ReservationMapper;
import com.em.domain.PagingVO;
import com.em.domain.Reservation;
import com.em.domain.ReservationCustom;
import com.em.domain.ReservationVo;
import com.em.service.ReservationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

/**
 * Created by Admiral on 2018/1/19.
 */
@Service
public class ReservationServiceImpl implements ReservationService {

	@Autowired
	private ReservationMapper reservationMapper;

	@Override
	public Integer reservationCount() {
		return reservationMapper.reservationCount();
	}

	@Override
	public List<ReservationVo> findByPaging(Integer toPageNo) {
		PagingVO pagingVO = new PagingVO();
		pagingVO.setToPageNo(toPageNo);

		List<ReservationVo> list = reservationMapper.findByPaging(pagingVO);
		return list;
	}

	@Override
	public List<Reservation> findByName(String name) {
		return reservationMapper.findByName(name);
	}

	@Override
	public Integer reservationPassCount() {
		return reservationMapper.reservationPassCount();
	}

	@Override
	public List<ReservationVo> findRecord(Integer toPageNo) throws Exception {
		PagingVO pagingVO = new PagingVO();
		pagingVO.setToPageNo(toPageNo);

		List<ReservationVo> list = reservationMapper.findRecord(pagingVO);
		return list;
	}

	@Override
	public void reviewReservation(Integer id) throws Exception {
		reservationMapper.reviewReservation(id);
	}

	@Override
	public void rejectReservation(Integer id) throws Exception {
		reservationMapper.rejectReservation(id);
	}

	@Override
	public Integer reserveCount() throws Exception {
		return reservationMapper.reserveCount();
	}

	@Override
	public List<ReservationVo> findAllByPaging(Integer toPageNo) throws Exception {
		PagingVO pagingVO = new PagingVO();
		pagingVO.setToPageNo(toPageNo);

		List<ReservationVo> list = reservationMapper.findAllByPaging(pagingVO);
		return list;
	}

	@Override
	public void addReservation(ReservationCustom reservationCustom) throws Exception {
		reservationMapper.addReservation(reservationCustom);
	}

	@Override
	public List<ReservationVo> queryByUser(String name) throws Exception {
		return reservationMapper.queryByUser(name);
	}

	@Override
	public List<ReservationCustom> findByUser(String name) throws Exception {
		return reservationMapper.findByUser(name);
	}

	@Override
	public void cancelApplication(Integer id) throws Exception {
		reservationMapper.cancelApplication(id);
	}

	@Override
	public Integer reservationNoPassCount() {
		// TODO Auto-generated method stub
		return reservationMapper.reservationNoPassCount();
	}

	@Override
	public List<ReservationVo> findRejectRecord(Integer toPageNo) throws Exception {
		// TODO Auto-generated method stub
		return reservationMapper.findRejectRecord(toPageNo);
	}

	@Override
	public List<ReservationVo> findRejectRecord(PagingVO pagingVO) throws Exception {
		// TODO Auto-generated method stub
		return reservationMapper.findRejectRecord(pagingVO);
	}

	@Override
	public List<Reservation> findByDate(ReservationCustom reservationCustom) {
		return reservationMapper.findByDate(reservationCustom);
	}
}
