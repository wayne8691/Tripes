package com.iii.trip.member.service;

import java.util.List;

import com.iii.trip.attractions.model.AttractionsBean;
import com.iii.trip.attractions.model.RestaurantBean;
import com.iii.trip.attractions.model.TravelGroupBean;
import com.iii.trip.member.model.BrowseRecordBean;
import com.iii.trip.member.model.CitytownBean;
import com.iii.trip.member.model.MemberBean;
import com.iii.trip.trainandhotel.repository.Hotel;

public interface LoginService {
	
	public MemberBean getBaseData(String userid);

	public MemberBean getLoginInf(MemberBean memberBean);

	public MemberBean forgetPassword(String userid, String password);

	public void upadatePersonal(MemberBean memberBean);

	public void saveImage(String userid, byte[] b);

	public void updatePwd(String userid, String password);

	public List<CitytownBean> searchTown(String city);

	public void updatLast_logintime(MemberBean loginuserid);

	public void updateAddress(MemberBean loginuser);

	public void updateFailCount(MemberBean userinf);

	public void resetFail(String userid);

	public void browserrecord(BrowseRecordBean browseRecordBean);

	public List<BrowseRecordBean> getBrowserRecord(String userid);
	
	public List<TravelGroupBean> getGroupByName(String name);

	public List<Hotel> gethotHotel();

	public List<AttractionsBean> gethotAttraction();

	public List<RestaurantBean> gethotRestaurant();

	
}
