package com.iii.trip.attractions.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.iii.trip.attractions.model.AttractionsBean;
import com.iii.trip.attractions.repository.AttractionsPagesRepository;


@Service
public class AttractionsPagesService {
	@Autowired
    private AttractionsPagesRepository attractionsPagesRepository;
	
	public AttractionsBean findByPk(Integer pk) {
		Optional<AttractionsBean> pRep = attractionsPagesRepository.findById(pk);		
		if(pRep.isPresent()) {
			return pRep.get();
		}		
		return null;
	}
	
	public List<AttractionsBean> findAll(){
		return attractionsPagesRepository.findAll();
	}
	
	public Page<AttractionsBean> findAllByPage(Pageable pageable){
		return attractionsPagesRepository.findByOrderByPkDesc(pageable);
	}

	

	//查詢景點By name Or counties
	public List<AttractionsBean> findByNameAndCounties(String name, String counties) {
		return attractionsPagesRepository.findByNameAndCounties(name, counties);
	}
	
	//查詢景點BY name 
	public List<AttractionsBean> findByNameLike(String name) {
		return attractionsPagesRepository.findByNameLike("%"+name+"%");
	}
	
    //查詢景點BY counties 
	public List<AttractionsBean> findByCounties(String counties) {
		return attractionsPagesRepository.findByCounties(counties);
	}

	//讀取所有景點(依瀏覽人次排名)
	public List<AttractionsBean> findAllByCountDesc() {
		return attractionsPagesRepository.findTop4ByOrderByCountDesc();
	}
	
	//讀取所有景點(依瀏覽人次排名)
//	public List<AttractionsBean> findAllAttractionsByCountDesc(){
		
		
//		List<AttractionsBean> attractionsBean = attractionsPagesRepository.findAll(new Sort(Sort.Direction.ASC,count));
		
//		return attractionsBean;
//	}
}
