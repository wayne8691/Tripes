package com.iii.trip.attractions.service;

import java.util.List;

import com.iii.trip.attractions.model.RestaurantBean;

public interface RestaurantService {
	
	//餐廳
		 List<RestaurantBean> getAllRe() ;
		 
		 boolean checkRestaurantName(String name);
		 
		 void insertRe(RestaurantBean restaurantBean);
		
		 void updateRe(RestaurantBean restaurantBean, Integer pk);
		
		 Integer deleteRe(Integer pk);
		
		 RestaurantBean selectReByName(Integer pk);

		 RestaurantBean getRestaurantByPk(Integer pk);

		
		 
		 
}
