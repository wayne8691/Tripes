package com.iii.trip.member.service;

import java.util.List;

import com.iii.trip.attractions.model.AttractionsBean;
import com.iii.trip.attractions.model.RestaurantBean;
import com.iii.trip.attractions.model.TravelGroupBean;
import com.iii.trip.member.model.MemberBean;
import com.iii.trip.trainandhotel.repository.Hotel;

public interface ManageService {

	public List<MemberBean> getAllmembers();

	public void updateStatus(String userid,String status);

	public List<MemberBean> findthisMember(String userid);

	public List<MemberBean> getAllmembers1();

	public List<MemberBean> getAllAdmin();

	public List<Integer> getStatus();

	public List<Integer> getArea();

	public List<Integer> get7dayrecord();

	public List<Integer> getAge();

	public List<AttractionsBean> getAAttractions();

	public List<RestaurantBean> getRestaurants();

	public List<Integer> getAttractionsArea();

	public List<Integer> getRestaurantsArea();

	public List<Integer> getatreSum();

	public List<Object[]> getTravel();

	public List<TravelGroupBean> getbytrpk(int i);

	public List<Object[]> getHotelnum();

	public List<Hotel> getbyhtpk(String i);


}
