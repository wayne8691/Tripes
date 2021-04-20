package com.iii.trip.attractions.repository.impl;

import java.util.List;

import javax.persistence.EntityManager;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.iii.trip.attractions.model.RestaurantBean;
import com.iii.trip.attractions.repository.RestaurantRepository;


@Repository("restaurantRepositoryImpl")
@Transactional
public class RestaurantRepositoryImpl implements RestaurantRepository {
	@Autowired
	 EntityManager entityManager;

	// 餐廳-------------------------------------------------------------------------------
		// 餐廳-查詢所有資料
		@SuppressWarnings("unchecked")
		@Override
		public List<RestaurantBean> getAllRe() {
			String hql = "FROM RestaurantBean";
			List<RestaurantBean> list = entityManager.createQuery(hql).getResultList();
			return list;
		}

		// 餐廳-新增資料
		@Override
		public void insertRe(RestaurantBean restaurantBean) {
			if (checkRestaurantName(restaurantBean.getNameRe())) {
				throw new RuntimeException("餐廳已存在，請勿重複新增");
			}
			entityManager.persist(restaurantBean);
		}

		// 餐廳-修改資料庫
		public Object updateRe(RestaurantBean restaurantBean ,Integer pk) {
			RestaurantBean ab = entityManager.find(RestaurantBean.class, pk);
			entityManager.remove(ab);
			entityManager.merge(restaurantBean);
			return null;
		}

		// 餐廳-根據pk 刪除資料
		@Override
		public Integer deleteRe(Integer pk) { // 刪除
			RestaurantBean rb = entityManager.find(RestaurantBean.class, pk);
			if (rb == null) {
				return -1;
			}
			entityManager.remove(rb);
			return 1;
		}

		// 餐廳-根據pk進行 查詢
		@Override
		public RestaurantBean selectReByName(Integer pk) {
			RestaurantBean rb = entityManager.find(RestaurantBean.class, pk);
			return rb;
		}

		
		// 餐廳-根據pk進行 查詢
		@Override
		public RestaurantBean getRestaurantByPk(Integer pk) {
			RestaurantBean restaurantBean = entityManager.find(RestaurantBean.class, pk);
			//紀錄瀏覽人次
			Integer aCount = restaurantBean.getCountRe();
			aCount++;
			restaurantBean.setCountRe(aCount);
			entityManager.merge(restaurantBean);
			return restaurantBean;
		}

		// 比對餐廳名有無重複
		@SuppressWarnings("unchecked")
		@Override
		public boolean checkRestaurantName(String name) {
			boolean exist = false;
			String hql = "FROM RestaurantBean a WHERE a.nameRe = :anameRe";
			List<RestaurantBean> restaurantBean = entityManager.createQuery(hql).setParameter("anameRe", name).getResultList();
			if (restaurantBean.isEmpty()) {
				exist = false;
			} else {
				exist = true;
			}
			return exist;
		}
}
