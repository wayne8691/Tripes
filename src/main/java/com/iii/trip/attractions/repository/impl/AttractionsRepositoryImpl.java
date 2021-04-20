package com.iii.trip.attractions.repository.impl;

import java.util.List;

import javax.persistence.EntityManager;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.iii.trip.attractions.model.AttractionsBean;
import com.iii.trip.attractions.repository.AttractionsRepository;

//實作介面或繼承父類別,程式使用時直接寫父類別/介面名稱

@Repository("attractionsRepositoryImpl")
public class AttractionsRepositoryImpl implements AttractionsRepository {

	@Autowired
	 EntityManager entityManager;

	// 景點-------------------------------------------------------------------------------
	// 景點-查詢所有資料

	@SuppressWarnings("unchecked")
	@Override
	public List<AttractionsBean> getAllAttractions() {
		String hql = " FROM AttractionsBean ";
		List<AttractionsBean> attractionss = entityManager.createQuery(hql).getResultList();
		return attractionss;

		// return session.createQuery(hql).getResultList();
	}

	// 比對景點名有無重複
	@SuppressWarnings("unchecked")
	@Override
	public boolean checkAttractionsName(String name) {
		boolean exist = false;
		String hql = "FROM AttractionsBean a WHERE a.name = :aname";
		
		List<AttractionsBean> attractions = entityManager.createQuery(hql).setParameter("aname", name).getResultList();
		if (attractions.isEmpty()) {
			exist = false;
		} else {
			exist = true;
		}
		return exist;
	}

	// 景點-新增資料
	@Override
	public void insertAttractions(AttractionsBean attractionsBean) {
		if (checkAttractionsName(attractionsBean.getName())) {
			throw new RuntimeException("景點已存在，請勿重複新增");
		}
		entityManager.persist(attractionsBean);
	}

	// 景點-修改資料庫
	@Override
	public Object updateAttractions(AttractionsBean attractionsBean,Integer pk) {
		AttractionsBean ab = entityManager.find(AttractionsBean.class, pk);
		entityManager.remove(ab);
		entityManager.merge(attractionsBean);
		return null;
	}

	// 景點-根據pk 刪除資料
	@Override
	public Integer deleteAttractions(Integer pk) {
		AttractionsBean ab = entityManager.find(AttractionsBean.class, pk);
		if (ab == null) {
			return -1;
		}
		//entityManager.detach(ab);
		//AttractionsBean e = new AttractionsBean();
		//e.setPk(pk);
		entityManager.remove(ab);
		return 1;
	}

	// 景點-根據pk進行 查詢
	@Override
	public AttractionsBean getAttractions(Integer pk) {
		AttractionsBean attractionsBean = entityManager.find(AttractionsBean.class, pk);
		//紀錄瀏覽人次
		Integer aCount = attractionsBean.getCount();
		aCount++;
		attractionsBean.setCount(aCount);
		entityManager.merge(attractionsBean);
		return attractionsBean;
	}
	
		
	//景點-根據縣市進行 查詢
	@SuppressWarnings("unchecked")
	@Override
	public List<AttractionsBean> getByCounties(String counties) {
		
		String hql = "FROM AttractionsBean a WHERE a.counties = :acounties";
		List<AttractionsBean> attractionss = entityManager.createQuery(hql).setParameter("acounties", counties).getResultList();
		System.out.println("attractionss"+attractionss);
		return attractionss;
		
//		AttractionsBean bean = session.get(AttractionsBean.class, counties);
//		System.out.println(bean);
//		return (List<AttractionsBean>) bean;
	}
	
 


}