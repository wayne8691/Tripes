package com.iii.trip.trainandhotel.controller;

import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.iii.trip.trainandhotel.repository.City;
import com.iii.trip.trainandhotel.repository.CityRepository;
import com.iii.trip.trainandhotel.repository.Hotel;
import com.iii.trip.trainandhotel.repository.HotelRepository;
import com.iii.trip.trainandhotel.repository.Room;
import com.iii.trip.trainandhotel.repository.RoomOrder;
import com.iii.trip.trainandhotel.repository.RoomOrderRepository;
import com.iii.trip.trainandhotel.repository.RoomRepository;
import com.iii.trip.trainandhotel.repository.TrainRepository;
import com.iii.trip.trainandhotel.service.InitialFacilityService;
import com.iii.trip.trainandhotel.service.InitialService;

@Controller
public class DemoController {

	@Autowired
	CityRepository cityRepo;
	@Autowired
	HotelRepository hotelRepo;
	@Autowired
	RoomRepository roomRepo;
	@Autowired
	RoomOrderRepository roomOrderRepo;
	@Autowired
	InitialService initialService;
	@Autowired
	TrainRepository trainRepo;
	@Autowired
	InitialFacilityService ifs;
	
	/*
	@GetMapping(value = "/trainandhotel/test", produces = "application/json")
	@ResponseBody
	public String getTest() {
		JSONArray jsonArr = new JSONArray();
		List<City> city = cityRepo.findByName("臺北市");
		if (!city.isEmpty()) {
			List<Room> roomList = roomRepo.findByCityAndStartDateAndEndDate(city, "2021-03-15", "2021-03-20");
			for (Room room: roomList) {
				jsonArr.put(room.toJson());
				System.out.println(room.getName());
			}
		}
		return jsonArr.toString();
	}

    @GetMapping("/trainandhotel/init/all")
    @ResponseBody
	public String demoGet(HttpServletResponse response) {
    	initialService.initAll();

		List<City> cityList = cityRepo.findAll();
		List<Hotel> hotels = hotelRepo.findAll();
		List<Room> rooms = roomRepo.findAll();
		List<RoomOrder> ro = roomOrderRepo.findAll();
		
		for (City city: cityList) {
			System.out.println(city.getId());
		}
		for(Hotel hotel: hotels) {
			System.out.println(hotel.getName());
		}
		for(Room room: rooms) {
			System.out.println(room.getName());
		}
		for(RoomOrder ros : ro) {
			System.out.println(ros.getId());
		}
		
		return "OK";
	}
	*/
    @GetMapping("/trainandhotel/init/facility")
    @ResponseBody
	public String demoF(HttpServletResponse response) {
    	ifs.insertAll();

		return "OK2";
	}
    
   
}
