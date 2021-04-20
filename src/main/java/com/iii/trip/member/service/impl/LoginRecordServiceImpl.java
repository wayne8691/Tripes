package com.iii.trip.member.service.impl;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.EnableTransactionManagement;

import com.iii.trip.member.dao.LoginRecordDao;
import com.iii.trip.member.model.LoginInfBean;
import com.iii.trip.member.service.LoginRecordService;

@Service
@Transactional
@EnableTransactionManagement
public class LoginRecordServiceImpl implements LoginRecordService{

	@Autowired
	LoginRecordDao loginrecordDao;
	
	@Override
	public void saveLoginRecord(LoginInfBean loginInfBean) {
		loginrecordDao.saveLoginRecord(loginInfBean);
	}


	@Override
	public void updateLogout(LoginInfBean loginrecord) {
		loginrecordDao.updateLogout(loginrecord);
	}


	@Override
	public List<LoginInfBean> getAllRecord(String userid) {
		return loginrecordDao.getAllRecord(userid);
	}





	
}
