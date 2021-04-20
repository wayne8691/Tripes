package com.iii.trip.attractions.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.iii.trip.attractions.model.TravelGroupBean;
import com.iii.trip.attractions.model.TravelGroupDateBean;
import com.iii.trip.attractions.repository.GroupPagesRepository;
@Service
public class GroupPagesService {
	@Autowired
    private GroupPagesRepository groupPagesRepository;
	
	public TravelGroupBean findByPk(Integer pk) {
		Optional<TravelGroupBean> pRep = groupPagesRepository.findById(pk);
		
		if(pRep.isPresent()) {
			return pRep.get();
		}
		return null;
	}

	//讀取所有行程
	public List<TravelGroupBean> findAll(){
		List<TravelGroupBean> findAll = groupPagesRepository.findAll();
		return findAll;
	}
	
	public Page<TravelGroupBean> findAllByPage(Pageable pageable){
		return groupPagesRepository.findAll(pageable);
	}
	
	
	//查詢行程By name Or counties
	public List<TravelGroupBean> findByNameOrDestination(String name, String destination) {
		return groupPagesRepository.findByNameOrDestination(name, destination);
	}
	
	//查詢行程BY name 
	public List<TravelGroupBean> findByNameLike(String name) {
		return groupPagesRepository.findByNameLike("%"+ name +"%");
	}
	
    //查詢行程BY counties 
	public List<TravelGroupBean> findByDestination(String destination) {
		return groupPagesRepository.findByDestination(destination);
	}

	//查詢行程BY Origin
	public List<TravelGroupBean> findByOrigin(String origin) {
		return groupPagesRepository.findByOrigin(origin);
	}

	public List<TravelGroupBean> findByOriginAndDestination(String origin, String destination) {
		return groupPagesRepository.findByOriginAndDestination(origin, destination);
	}

	//新增日期
	public void saveAndFlush(Integer id,TravelGroupDateBean date) {
		
		Optional<TravelGroupBean> findById = groupPagesRepository.findById(id);
		
		TravelGroupBean travelGroupBean =findById.get();
		travelGroupBean.getTravelGroupBeanId().add(date);
		
		groupPagesRepository.saveAndFlush(travelGroupBean);
	}
	
	//讀取所有行程(依瀏覽人次排名)
	public List<TravelGroupBean> findAllByCountDesc() {
		return groupPagesRepository.findTop4ByOrderByCountDesc();
	}

//	//查詢行程BY price
//	public List<TravelGroupBean> findByPriceBetween(Integer price) {
//		return groupPagesRepository.findByPriceBetween(price);
//	}
//	
}
