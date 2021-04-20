package com.iii.trip.member.dao;

import java.util.List;

import com.iii.trip.member.model.LoginInfBean;

public interface LoginRecordDao {

	public void saveLoginRecord(LoginInfBean loginInfBean);

	public void updateLogout(LoginInfBean loginrecord);

	public List<LoginInfBean> getAllRecord(String userid);


}
