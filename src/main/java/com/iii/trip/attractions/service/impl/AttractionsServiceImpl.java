package com.iii.trip.attractions.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.iii.trip.attractions.model.AttractionsBean;
import com.iii.trip.attractions.repository.AttractionsRepository;
import com.iii.trip.attractions.service.AttractionsService;


@Transactional
@Service("AttractionsBean")
public class AttractionsServiceImpl implements AttractionsService {

    @Autowired
    @Qualifier("attractionsRepositoryImpl")
    	private AttractionsRepository attractionsRepository;

	//景點-------------------------------------------------------------------------------
		// 景點-查詢所有資料
		@Override
		public List<AttractionsBean> getAllAttractions() {
			return attractionsRepository.getAllAttractions() ;
		}
		
		// 景點-確認景點有無重複
		@Override
		public boolean checkAttractionsName(String name) {
			return attractionsRepository.checkAttractionsName(name);

		}

		//景點-新增資料
		@Override
		public void insertAttractions(AttractionsBean attractionsBean) {
			attractionsRepository.insertAttractions(attractionsBean);
		}
		
		//景點-修改資料庫
		@Override
		public void updateAttractions(AttractionsBean attractionsBean,Integer pk) {
			attractionsRepository.updateAttractions(attractionsBean,pk);
		}

		//景點-根據pk 刪除資料
		@Override
		public Integer deleteAttractions(Integer pk) {
			return attractionsRepository.deleteAttractions(pk) ;
		}

		//景點-根據pk進行 查詢
		@Override
		public AttractionsBean getAttractions(Integer pk) {
			return attractionsRepository.getAttractions(pk);
		}

		//景點-根據縣市進行查詢
		@Override
		public List<AttractionsBean> getByCounties(String counties) {
			return attractionsRepository.getByCounties(counties) ;
		}

	}