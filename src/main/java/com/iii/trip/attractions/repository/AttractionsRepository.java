package com.iii.trip.attractions.repository;

import java.util.List;


import com.iii.trip.attractions.model.AttractionsBean;

public interface AttractionsRepository {

	// 景點
	List<AttractionsBean> getAllAttractions();

	boolean checkAttractionsName(String name);

	void insertAttractions(AttractionsBean attractionsBean);

	Integer deleteAttractions(Integer pk);

	AttractionsBean getAttractions(Integer pk);

	List<AttractionsBean> getByCounties(String counties);

	Object updateAttractions(AttractionsBean attractionsBean, Integer pk);


}