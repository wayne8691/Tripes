package com.iii.trip.attractions.service;

import java.util.List;

import com.iii.trip.attractions.model.TravelGroupBean;

public interface GroupService {

	TravelGroupBean getGroupById(Integer id);

	Integer deleteGroupById(Integer id);

	void updateGroup(TravelGroupBean travelGroupBean);

	List<TravelGroupBean> getAllGroups();

	void insertGroup(TravelGroupBean travelGroupBean);

	boolean checkTravelGroupName(String name);

}
