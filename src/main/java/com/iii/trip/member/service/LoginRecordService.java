package com.iii.trip.member.service;

import java.util.List;

import com.iii.trip.member.model.LoginInfBean;

public interface LoginRecordService {
	
	public void saveLoginRecord(LoginInfBean loginInfBean);

	public void updateLogout(LoginInfBean loginrecord);

	public List<LoginInfBean> getAllRecord(String string);

}
