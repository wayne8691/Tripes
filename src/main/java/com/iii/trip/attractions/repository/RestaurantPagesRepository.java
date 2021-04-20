package com.iii.trip.attractions.repository;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

import com.iii.trip.attractions.model.RestaurantBean;

public interface RestaurantPagesRepository extends JpaRepository<RestaurantBean, Integer> {

	//查詢餐廳By name Or counties
	List<RestaurantBean> findByNameReOrCountiesRe(String nameRe, String countiesRe);
	
	// 搜尋By Counties
	List<RestaurantBean> findByNameReLike(String nameRe);
	
	// 搜尋By name 
	List<RestaurantBean> findByCountiesRe(String countiesRe);

	List<RestaurantBean> findTop4ByOrderByCountReDesc();

	Page<RestaurantBean> findByOrderByPkDesc(Pageable pageable);
	
	
}
