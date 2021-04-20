package com.iii.trip.attractions.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.iii.trip.attractions.model.TravelGroupBean;

public interface GroupPagesRepository extends JpaRepository<TravelGroupBean, Integer> {

	//查詢行程By name Or counties
	List<TravelGroupBean> findByNameOrDestination(String name, String destination);
	
	//查詢行程BY Origin And Destination
	List<TravelGroupBean> findByOriginAndDestination(String origin, String destination);

	// 搜尋By Counties
	List<TravelGroupBean> findByNameLike(String name);
	
	// 搜尋By name 
	List<TravelGroupBean> findByDestination(String destination);

	//查詢行程BY Origin
	List<TravelGroupBean> findByOrigin(String origin);
	
	//讀取所有行程(依瀏覽人次排名)
	List<TravelGroupBean> findTop4ByOrderByCountDesc();

	

	
}
