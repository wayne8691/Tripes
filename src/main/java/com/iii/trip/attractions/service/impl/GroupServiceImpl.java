package com.iii.trip.attractions.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.iii.trip.attractions.model.TravelGroupBean;
import com.iii.trip.attractions.repository.GroupRepository;
import com.iii.trip.attractions.service.GroupService;

@Transactional
@Service("TravelGroupBean")
public class GroupServiceImpl implements GroupService{

    @Autowired
    @Qualifier("groupRepositoryImpl")
    	private GroupRepository groupRepository;
	
	
	@Override
	public TravelGroupBean getGroupById(Integer id) {
		// TODO Auto-generated method stub
		return groupRepository.getGroupById(id);
	}

	@Override
	public Integer deleteGroupById(Integer id) {
		// TODO Auto-generated method stub
		return groupRepository.deleteGroupById(id);
	}

	@Override
	public void updateGroup(TravelGroupBean travelGroupBean) {
		groupRepository.updateGroup(travelGroupBean);
		
	}

	@Override
	public List<TravelGroupBean> getAllGroups() {
		// TODO Auto-generated method stub
		return groupRepository.getAllGroups();
	}


	@Override
	public void insertGroup(TravelGroupBean travelGroupBean) {
		groupRepository.insertGroup(travelGroupBean);
		
	}

	@Override
	public boolean checkTravelGroupName(String name) {
		// TODO Auto-generated method stub
		return groupRepository.checkTravelGroupName(name);
	}

}
