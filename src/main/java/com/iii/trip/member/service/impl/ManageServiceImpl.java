package com.iii.trip.member.service.impl;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.EnableTransactionManagement;

import com.iii.trip.attractions.model.AttractionsBean;
import com.iii.trip.attractions.model.RestaurantBean;
import com.iii.trip.attractions.model.TravelGroupBean;
import com.iii.trip.member.dao.ManageDao;
import com.iii.trip.member.model.MemberBean;
import com.iii.trip.member.service.ManageService;
import com.iii.trip.trainandhotel.repository.Hotel;

@Service
@Transactional
@EnableTransactionManagement
public class ManageServiceImpl implements ManageService {
	@Autowired
	ManageDao managerDao;

	@Override
	public List<MemberBean> getAllmembers() {
		return managerDao.getAllmembers();
	}

	@Override
	public void updateStatus(String userid, String status) {
		managerDao.updateStatus(userid, status);
	}

	@Override
	public List<MemberBean> findthisMember(String userid) {
		return managerDao.findthisMember(userid);
	}

	@Override
	public List<MemberBean> getAllmembers1() {
		return managerDao.getAllmembers1();
	}

	@Override
	public List<MemberBean> getAllAdmin() {
		return managerDao.getAllAdmin();
	}

	@Override
	public List<Integer> getStatus() {
		return managerDao.getStatus();
	}

	@Override
	public List<Integer> getArea() {
		return managerDao.getArea();
	}

	@Override
	public List<Integer> get7dayrecord() {
		return managerDao.get7dayrecord();
	}

	@Override
	public List<Integer> getAge() {
		return managerDao.getAge();
	}

	@Override
	public List<AttractionsBean> getAAttractions() {
		return managerDao.getAAttractions();
	}

	@Override
	public List<RestaurantBean> getRestaurants() {
		return managerDao.getRestaurants();
	}

	@Override
	public List<Integer> getAttractionsArea() {
		return managerDao.getAttractionsArea();
	}

	@Override
	public List<Integer> getRestaurantsArea() {
		return managerDao.getRestaurantsArea();
	}

	@Override
	public List<Integer> getatreSum() {
		return managerDao.getatreSum();
	}

	@Override
	public List<Object[]> getTravel() {
		return managerDao.getTravel();
	}

	@Override
	public List<TravelGroupBean> getbytrpk(int i) {
		return managerDao.getbytrpk(i);
	}

	@Override
	public List<Object[]> getHotelnum() {
		return managerDao.getHotelnum();
	}

	@Override
	public List<Hotel> getbyhtpk(String i) {
		return managerDao.getbyhtpk(i);
	}


}
