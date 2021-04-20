package com.iii.trip.attractions.repository;

import java.util.List;

import com.iii.trip.attractions.model.RestaurantBean;

public interface RestaurantRepository {
	
	//餐廳
	
		 List<RestaurantBean> getAllRe() ;

		 boolean checkRestaurantName(String name);
		 
		 void insertRe(RestaurantBean restaurantBean);
		
		 Integer deleteRe(Integer pk);
		
		 RestaurantBean selectReByName(Integer pk);

		 RestaurantBean getRestaurantByPk(Integer pk);
		 
		 Object updateRe(RestaurantBean restaurantBean,Integer pk);
		 
}
