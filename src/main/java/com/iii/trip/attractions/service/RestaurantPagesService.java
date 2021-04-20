package com.iii.trip.attractions.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.iii.trip.attractions.model.RestaurantBean;
import com.iii.trip.attractions.repository.RestaurantPagesRepository;


@Service
public class RestaurantPagesService {
	@Autowired
    private RestaurantPagesRepository restaurantPagesRepository;
	
	public RestaurantBean findByPk(Integer pk) {
		Optional<RestaurantBean> pRep = restaurantPagesRepository.findById(pk);
		
		if(pRep.isPresent()) {
			return pRep.get();
		}
		
		return null;
	}
	
	public List<RestaurantBean> findAll(){
		return restaurantPagesRepository.findAll();
	}
	
	public Page<RestaurantBean> findAllByPage(Pageable pageable){
		return restaurantPagesRepository.findByOrderByPkDesc(pageable);
	}
	
	
	//查詢餐廳By name Or counties
	public List<RestaurantBean> findByNameReOrCountiesRe(String nameRe, String countiesRe) {
		return restaurantPagesRepository.findByNameReOrCountiesRe(nameRe, countiesRe);
	}
	
	//查詢餐廳BY name 
	public List<RestaurantBean> findByNameReLike(String nameRe) {
		return restaurantPagesRepository.findByNameReLike("%"+ nameRe +"%");
	}
	
    //查詢餐廳BY counties 
	public List<RestaurantBean> findByCountiesRe(String countiesRe) {
		return restaurantPagesRepository.findByCountiesRe(countiesRe);
	}

	public List<RestaurantBean> findAllByCountReDesc() {
		return restaurantPagesRepository.findTop4ByOrderByCountReDesc();
	}
	
}
