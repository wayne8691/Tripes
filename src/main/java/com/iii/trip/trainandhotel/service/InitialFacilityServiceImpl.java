package com.iii.trip.trainandhotel.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.iii.trip.trainandhotel.repository.HotelFacility;
import com.iii.trip.trainandhotel.repository.HotelFacilityRelationRepository;
import com.iii.trip.trainandhotel.repository.HotelFacilityRepository;
import com.iii.trip.trainandhotel.repository.HotelTag;
import com.iii.trip.trainandhotel.repository.HotelTagRelationRepository;
import com.iii.trip.trainandhotel.repository.HotelTagRepository;
import com.iii.trip.trainandhotel.repository.RoomFacility;
import com.iii.trip.trainandhotel.repository.RoomFacilityRelationRepository;
import com.iii.trip.trainandhotel.repository.RoomFacilityRepository;

@Service
@Transactional
public class InitialFacilityServiceImpl implements InitialFacilityService {

	@Autowired
	private RoomFacilityRepository rfRepo;
	@Autowired
	private HotelFacilityRepository hfRepo;
	@Autowired
	private HotelTagRepository htRepo;
	@Autowired
	private RoomFacilityRelationRepository rfRelationRepo;
	@Autowired
	private HotelFacilityRelationRepository hfRelationRepo;
	@Autowired
	private HotelTagRelationRepository htRelationRepo;
	
	
	
	@Override
	public void insertAll() {
		rfRepo.deleteAll();
		hfRepo.deleteAll();
		htRepo.deleteAll();
		rfRelationRepo.deleteAll();
		hfRelationRepo.deleteAll();
		htRelationRepo.deleteAll();
		
		if(rfRepo.findAll().isEmpty()) {
			insertRoomFacility();
		}
		if(hfRepo.findAll().isEmpty()) {
			insertHotelFacility();
		}
		if(htRepo.findAll().isEmpty()) {
			insertTag();
		}
		
	}


	@Override
	public void insertRoomFacility() {
		RoomFacility rf = null;
		rf = new RoomFacility();
		rf.setName("冰箱");
		rfRepo.save(rf);
		
		rf = new RoomFacility();
		rf.setName("冷氣");
		rfRepo.save(rf);
		
		rf = new RoomFacility();
		rf.setName("吹風機");
		rfRepo.save(rf);
		
		rf = new RoomFacility();
		rf.setName("房內免費無線上網");
		rfRepo.save(rf);
		
		rf = new RoomFacility();
		rf.setName("房間保險箱");
		rfRepo.save(rf);
		
		rf = new RoomFacility();
		rf.setName("有線電視");
		rfRepo.save(rf);
		
		rf = new RoomFacility();
		rf.setName("辦公桌");
		rfRepo.save(rf);
		
		rf = new RoomFacility();
		rf.setName("電話");
		rfRepo.save(rf);
		
		rf = new RoomFacility();
		rf.setName("禁煙房");
		rfRepo.save(rf);
		
		rf = new RoomFacility();
		rf.setName("24小時客房服務");
		rfRepo.save(rf);
	}


	@Override
	public void insertHotelFacility() {
		
		HotelFacility hf = null;
		hf = new HotelFacility();
		hf.setName("24小時櫃檯");
		String path = "/static/img/counter.jpg";
		hf.setPic(path);
		hfRepo.save(hf);
		
		hf = new HotelFacility();
		hf.setName("停車場");
		path = "/static/img/parking.jpg";
		hf.setPic(path);
		hfRepo.save(hf);
		
		hf = new HotelFacility();
		hf.setName("健身房");
		path = "/static/img/gym.jpg";
		hf.setPic(path);
		hfRepo.save(hf);
		
		hf = new HotelFacility();
		hf.setName("可上網的電腦");
		path = "/static/img/computer.jpg";
		hf.setPic(path);
		hfRepo.save(hf);

		hf = new HotelFacility();
		hf.setName("美顏中心 / Spa");
		path = "/static/img/spa.jpg";
		hf.setPic(path);
		hfRepo.save(hf);
		
		hf = new HotelFacility();
		hf.setName("會議室");
		path = "/static/img/meeting.jpg";
		hf.setPic(path);
		hfRepo.save(hf);
		
		hf = new HotelFacility();
		hf.setName("機場接送服務");
		path = "/static/img/airport.jpg";
		hf.setPic(path);
		hfRepo.save(hf);
		
		hf = new HotelFacility();
		hf.setName("洗衣服務");
		path = "/static/img/wash.jpg";
		hf.setPic(path);
		hfRepo.save(hf);
		
		hf = new HotelFacility();
		hf.setName("游泳池");
		path = "/static/img/swim.jpg";
		hf.setPic(path);
		hfRepo.save(hf);
		
		hf = new HotelFacility();
		hf.setName("行李服務");
		path = "/static/img/suitcase.jpg";
		hf.setPic(path);
		hfRepo.save(hf);
		
		hf = new HotelFacility();
		hf.setName("飯店酒吧");
		path = "/static/img/bar.jpg";
		hf.setPic(path);
		hfRepo.save(hf);
		
		hf = new HotelFacility();
		hf.setName("餐廳");
		path = "/static/img/restaurant.jpg";
		hf.setPic(path);
		hfRepo.save(hf);
	
	}




	@Override
	public void insertTag() {
		HotelTag tag = null;
		
		tag = new HotelTag();
		tag.setName("山景");
		tag.setClickCount(0);
		htRepo.save(tag);
		
		tag = new HotelTag();
		tag.setName("海景");
		tag.setClickCount(0);
		htRepo.save(tag);
			
		tag = new HotelTag();
		tag.setName("日式旅館");
		tag.setClickCount(0);
		htRepo.save(tag);
		
		tag = new HotelTag();
		tag.setName("青年旅館");
		tag.setClickCount(0);
		htRepo.save(tag);
		
		tag = new HotelTag();
		tag.setClickCount(0);
		tag.setName("免費取消");
		htRepo.save(tag);
		
		tag = new HotelTag();
		tag.setClickCount(0);
		tag.setName("可刷卡");
		htRepo.save(tag);
	}
	
	
	
}
