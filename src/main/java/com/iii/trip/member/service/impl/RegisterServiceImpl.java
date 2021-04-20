package com.iii.trip.member.service.impl;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.EnableTransactionManagement;

import com.iii.trip.member.dao.RegisterMemDao;
import com.iii.trip.member.model.MemberBean;
import com.iii.trip.member.service.RegisterService;

@Service
@Transactional
@EnableTransactionManagement
public class RegisterServiceImpl implements RegisterService {
	
	@Autowired
	RegisterMemDao registerMemDao;

	@Override
	public boolean checkFirst() {
		return registerMemDao.checkFirst();
	}
	
	@Override
	public boolean checkMemId(String userid) {
		return registerMemDao.checkMemId(userid);
	}

	@Override
	public void save(MemberBean memberBean) {
		registerMemDao.save(memberBean);
	}

	@Override
	public void updateStatus(String userid) {
		registerMemDao.updateStatus(userid);
	}

	

}
