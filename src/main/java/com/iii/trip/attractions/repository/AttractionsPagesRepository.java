package com.iii.trip.attractions.repository;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

//import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.iii.trip.attractions.model.AttractionsBean;

public interface AttractionsPagesRepository extends JpaRepository<AttractionsBean, Integer> {

	//查詢景點By name Or counties
	List<AttractionsBean> findByNameAndCounties(String name, String counties);
	
	// 搜尋By Counties
	List<AttractionsBean> findByCounties(String counties);
	
	// 搜尋By name 
    List<AttractionsBean> findByNameLike(String name);

	//讀取所有景點(依瀏覽人次排名)
   
	List<AttractionsBean> findTop4ByOrderByCountDesc();
	
	
    Page<AttractionsBean> findByOrderByPkDesc(Pageable pageable);
}
