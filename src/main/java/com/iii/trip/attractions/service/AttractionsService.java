package com.iii.trip.attractions.service;

import java.util.List;

import com.iii.trip.attractions.model.AttractionsBean;

public interface AttractionsService {

	// 景點
	List<AttractionsBean> getAllAttractions();

	boolean checkAttractionsName(String name);

	void insertAttractions(AttractionsBean attractionsBean);

	Integer deleteAttractions(Integer pk);

	AttractionsBean getAttractions(Integer pk);

	List<AttractionsBean> getByCounties(String counties);

	void updateAttractions(AttractionsBean attractionsBean, Integer pk);


}