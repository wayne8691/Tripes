package com.iii.trip.attractions.repository.impl;

import java.util.List;

import javax.persistence.EntityManager;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.iii.trip.attractions.model.TravelGroupBean;
import com.iii.trip.attractions.repository.GroupRepository;

@Repository("groupRepositoryImpl")
public class GroupRepositoryImpl  implements GroupRepository{
	
	@Autowired
	 EntityManager entityManager;
	
	@Override
	public TravelGroupBean getGroupById(Integer id) {
		return entityManager.find(TravelGroupBean.class, id);
	}

	@Override
	public Integer deleteGroupById(Integer id) {
		TravelGroupBean tb = entityManager.find(TravelGroupBean.class, id);
		if (tb == null) {
			return -1;
		}
		entityManager.detach(tb);
		TravelGroupBean e = new TravelGroupBean();
		e.setId(id);
		entityManager.remove(e);
		return 1;
	}

	@Override
	public Object updateGroup(TravelGroupBean travelGroupBean) {
		entityManager.merge(travelGroupBean);
		return null;
		
	}
	
	//查詢所有資料
	@SuppressWarnings("unchecked")
	@Override
	public List<TravelGroupBean> getAllGroups() {
		String hql = " FROM TravelGroupBean ";
		List<TravelGroupBean> groups = entityManager.createQuery(hql).getResultList();
		return groups;
	}


	@Override
	public void insertGroup(TravelGroupBean travelGroupBean) {
		entityManager.persist(travelGroupBean);
		
	}

	@SuppressWarnings("unchecked")
	@Override
	public boolean checkTravelGroupName(String name) {
		boolean exist = false;
		String hql = "FROM TravelGroupBean a WHERE a.name = :aname";
		List<TravelGroupBean> group = entityManager.createQuery(hql).setParameter("aname", name).getResultList();
		if (group.isEmpty()) {
			exist = false;
		} else {
			exist = true;
		}
		return exist;
	}

}
