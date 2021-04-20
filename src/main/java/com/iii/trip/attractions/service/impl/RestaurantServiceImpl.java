package com.iii.trip.attractions.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.iii.trip.attractions.model.RestaurantBean;
import com.iii.trip.attractions.repository.RestaurantRepository;
import com.iii.trip.attractions.service.RestaurantService;

@Service("RestaurantBean")
public class RestaurantServiceImpl implements RestaurantService  {
	 
	@Autowired
    @Qualifier("restaurantRepositoryImpl")
	private RestaurantRepository restaurantRepository;
	//餐廳------------------------------------
			// 餐廳-查詢所有資料
			@Override
			public List<RestaurantBean> getAllRe() {
				return restaurantRepository.getAllRe();
			}
			// 餐廳-確認餐廳有無重複
			@Override
			public boolean checkRestaurantName(String name) {
				return restaurantRepository.checkRestaurantName(name);
			}
			
			//餐廳-新增資料
			@Override
			public void insertRe(RestaurantBean restaurantBean) {
				restaurantRepository.insertRe(restaurantBean);
			}
			
			//餐廳-修改資料庫
			@Override
			public void updateRe(RestaurantBean restaurantBean,Integer pk) {
				restaurantRepository.updateRe(restaurantBean,pk);
			}

			// 餐廳-根據pk 刪除資料
			@Override
			public Integer deleteRe(Integer pk) {
				return restaurantRepository.deleteRe(pk);
			}

			//餐廳-根據pk進行 查詢
			@Override
			public RestaurantBean selectReByName(Integer pk) {
				return restaurantRepository.selectReByName(pk);
			}
			
			//餐廳-根據pk進行 查詢
			@Override
			public RestaurantBean getRestaurantByPk(Integer pk) {
				return restaurantRepository.getRestaurantByPk(pk);
			}
			

}
