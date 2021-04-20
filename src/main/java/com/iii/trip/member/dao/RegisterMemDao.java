package com.iii.trip.member.dao;

import com.iii.trip.member.model.MemberBean;

public interface RegisterMemDao {
	
	public boolean checkMemId(String userid);

	public void save(MemberBean memberBean);
	
	public void updateStatus(String userid);

	public boolean checkFirst();

}
