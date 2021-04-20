package com.iii.trip.attractions.repository;

import java.util.List;

import com.iii.trip.attractions.model.TravelGroupBean;

public interface GroupRepository {

	TravelGroupBean getGroupById(Integer id);

	Integer deleteGroupById(Integer id);

	Object updateGroup(TravelGroupBean travelGroupBean);

	List<TravelGroupBean> getAllGroups();

	void insertGroup(TravelGroupBean travelGroupBean);

	boolean checkTravelGroupName(String name);

}
