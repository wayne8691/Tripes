package com.iii.trip.member.service.impl;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.EnableTransactionManagement;

import com.iii.trip.attractions.model.AttractionsBean;
import com.iii.trip.attractions.model.RestaurantBean;
import com.iii.trip.attractions.model.TravelGroupBean;
import com.iii.trip.member.dao.LoginMemDao;
import com.iii.trip.member.model.BrowseRecordBean;
import com.iii.trip.member.model.CitytownBean;
import com.iii.trip.member.model.MemberBean;
import com.iii.trip.member.service.LoginService;
import com.iii.trip.trainandhotel.repository.Hotel;

@Service
@Transactional
@EnableTransactionManagement
public class LoginServiceImpl implements LoginService {

	@Autowired
	LoginMemDao loginMemDao;

	@Override
	public MemberBean getBaseData(String userid) {
		return loginMemDao.getBaseData(userid);
	}
	
	@Override
	public MemberBean getLoginInf(MemberBean memberBean) {
		return loginMemDao.getLoginInf(memberBean);
	}

	@Override
	public MemberBean forgetPassword(String userid,String password) {
		return loginMemDao.forgetPassword(userid,password);
	}

	@Override
	public void upadatePersonal(MemberBean memberBean) {
		loginMemDao.upadatePersonal(memberBean);
	}

	@Override
	public void saveImage(String userid, byte[] b) {
		loginMemDao.saveImage(userid,b);
		
	}

	@Override
	public void updatePwd(String userid, String password) {
		loginMemDao.updatePwd(userid,password);
	}

	@Override
	public List<CitytownBean> searchTown(String city) {
		return loginMemDao.searchTown(city);
	}

	@Override
	public void updatLast_logintime(MemberBean loginuserid) {
		loginMemDao.updatLast_logintime(loginuserid);
	}

	@Override
	public void updateAddress(MemberBean loginuser) {
		loginMemDao.updateAddress(loginuser);
	}

	@Override
	public void updateFailCount(MemberBean userinf) {
		loginMemDao.updateFailCount(userinf);
	}

	@Override
	public void resetFail(String userid) {
		loginMemDao.resetFail(userid);
	}

	@Override
	public void browserrecord(BrowseRecordBean browseRecordBean) {
		loginMemDao.browserrecord(browseRecordBean);
	}

	@Override
	public List<BrowseRecordBean> getBrowserRecord(String userid) {
		return loginMemDao.getBrowserRecord(userid);
	}

	@Override
	public List<TravelGroupBean> getGroupByName(String name) {
		return loginMemDao.getGroupByName(name);
	}

	@Override
	public List<Hotel> gethotHotel() {
		return loginMemDao.gethotHotel();
	}

	@Override
	public List<AttractionsBean> gethotAttraction() {
		return loginMemDao.gethotAttraction();
	}

	@Override
	public List<RestaurantBean> gethotRestaurant() {
		return loginMemDao.gethotRestaurant();
	}


	

}
