
package com.iii.trip.trainandhotel.controller;

import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.iii.trip.member.model.LoginInfBean;
import com.iii.trip.member.model.MemberBean;
import com.iii.trip.member.service.LoginRecordService;
import com.iii.trip.member.service.LoginService;
import com.iii.trip.trainandhotel.repository.City;
import com.iii.trip.trainandhotel.repository.CityRepository;
import com.iii.trip.trainandhotel.repository.Hotel;
import com.iii.trip.trainandhotel.repository.HotelFav;
import com.iii.trip.trainandhotel.repository.HotelFavRepository;
import com.iii.trip.trainandhotel.repository.HotelRepository;
import com.iii.trip.trainandhotel.repository.HotelTag;
import com.iii.trip.trainandhotel.repository.HotelTagRelationRepository;
import com.iii.trip.trainandhotel.repository.HotelTagRepository;
import com.iii.trip.trainandhotel.repository.Room;
import com.iii.trip.trainandhotel.repository.RoomOrder;
import com.iii.trip.trainandhotel.repository.RoomOrderRepository;
import com.iii.trip.trainandhotel.repository.RoomRepository;
import com.iii.trip.trainandhotel.repository.TrainStationRepository;

@Controller
@RequestMapping(value="")
@SessionAttributes({"loginuser", "loginrecord" })
public class HotelController {
	private static final String TEMPLATE_PREFIX = "/trainandhotel/hotel";
	
	@Autowired
	private LoginRecordService loginrecordService;
	@Autowired
	private LoginService loginService;
	@Autowired
	private HotelRepository hotelRepo;
	@Autowired
	private CityRepository cityRepo;
	@Autowired
	private RoomRepository roomRepo;
	@Autowired
	private HotelTagRepository hotelTagRepo;
	@Autowired
	private HotelTagRelationRepository hotelTagRelationRepo;
	@Autowired
	private RoomOrderRepository roRepo;
	@Autowired
	private HotelFavRepository hotelFavRepo;
	@Autowired
	private TrainStationRepository tsRepo;
		
	@GetMapping(value = "/trainandhotel/hotels")
	public String hotels(HttpServletRequest request,@RequestParam("name") String cityId) {
		List<Hotel> list = hotelRepo.findByCityId(cityId);
		request.setAttribute("hotelList", list);
		return TEMPLATE_PREFIX + "/showHotels";
	}
	
	@GetMapping(value = "/trainandhotel/hotel/hotel")
	public String showHotels(HttpServletRequest request) {
		request.setAttribute("hotelList", hotelRepo.findByPermit("1"));
		request.setAttribute("cityList", cityRepo.findAll());
		request.setAttribute("roomList", roomRepo.findAll());
		return TEMPLATE_PREFIX + "/hotel";
	}
	
	@GetMapping(value = "")
	public String showHotel(HttpServletRequest request,@CookieValue(value="loginuser",required=false) String name,Model m,HttpSession session) {
		request.setAttribute("hotelList", hotelRepo.findAllByOrderByClickCountDesc());
		request.setAttribute("newHotelList", hotelRepo.findAllByOrderByIdDesc());
		request.setAttribute("cityList", cityRepo.findAll());
		request.setAttribute("roomList", roomRepo.findAll());
		request.setAttribute("tagList", hotelTagRepo.findAll());
		HttpSession session2 =request.getSession();
		session2.setAttribute("all",tsRepo.findAll());
		
		if (name != null && session.getAttribute("loginuser")==null) {		
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			MemberBean loginuser = new MemberBean();
			LoginInfBean lib = new LoginInfBean();
			lib.setLogin_time(sdf.format(new Date()));
			lib.setLogout_time(sdf.format(new Date()));
			lib.setUserid(name);
			loginrecordService.saveLoginRecord(lib);
			loginuser.setUserid(name);
			loginuser = loginService.getLoginInf(loginuser);
			m.addAttribute("loginrecord", lib);
			m.addAttribute("loginuser", loginuser);
		}
		return "index";
	}
	
	//空旅館ajax
			@PostMapping(value = "/trainandhotel/emptyHotel")
			public String emptyHotels(HttpServletRequest request,
				@RequestParam("cityId") String cityId, @RequestParam("start")String startDate,
				@RequestParam("end")String endDate,	@RequestParam(name="cap") String cap){
				List<Room> roomList = new ArrayList<>();
				City city = cityRepo.findById(cityId).orElse(null);
				
				if(!cap.equals("")) {
					roomList = roomRepo.findByCapacity(cap);
				}else {
					roomList = roomRepo.findAll();
				}
				
				List<RoomOrder> roomOrderAll = roRepo.findAll();
				Set<RoomOrder> roomOrderSet = new HashSet<>();			
				List<RoomOrder> roomOrderedAfterDate = roRepo.findAfterStartDateAndEndDate(LocalDate.parse(startDate), LocalDate.parse(endDate));
				List<RoomOrder> roomOrderedBeforeDate = roRepo.findBeforeStartDateAndEndDate(LocalDate.parse(startDate), LocalDate.parse(endDate));
				Set<Room> roomSet = new HashSet<>();
				
				//全部訂單
				for(RoomOrder ro:roomOrderAll) {			
					roomOrderSet.add(ro);
				}
				//去掉日期前
				for(RoomOrder ro:roomOrderedAfterDate) {
					if(roomOrderSet.contains(ro)){
						roomOrderSet.remove(ro);
					}
				}
				//去掉日期後
				for(RoomOrder ro:roomOrderedBeforeDate) {
					if(roomOrderSet.contains(ro)){
						roomOrderSet.remove(ro);
					}
				}
				//加入全部房間
				for(Room room:roomList) {
					roomSet.add(room);
				}
				//全部的房間有扣掉訂單的
				for(RoomOrder ro:roomOrderSet) {
					if(roomSet.contains(ro.getRoom())){
						roomSet.remove(ro.getRoom());
					}
				}
				
				//轉成旅館
				Set<Hotel> hotelSets = new HashSet<>();
				for(Room room:roomSet) {
					hotelSets.add(room.getHotel());
				}
				
				List<Hotel> hbList = new ArrayList<>();
				for (Hotel hotel: hotelSets) {
					if (hotel.getCity().getId().equals(city.getId()) && !hbList.contains(hotel)) {
						hbList.add(hotel);
					}
				}
					
					request.setAttribute("hbList", hbList);
					request.setAttribute("start", startDate);
					request.setAttribute("end", endDate);
					request.setAttribute("cap", cap);
				return TEMPLATE_PREFIX + "/emptyHotel";
			}
		
			//tag搜尋
			@GetMapping(value = "/tagHotel")
			public String tagHotels(HttpServletRequest request, @RequestParam("name") String tagName) {
				String tagId = hotelTagRepo.findByName(tagName).getId();
				List<String> tagList = hotelTagRelationRepo.findHotelIdBytagId(tagId);
				List <Hotel> hotelList = new ArrayList<>();
				for (int i = 0; i < tagList.size() ; i++) {
					Hotel hotel = hotelRepo.findById(tagList.get(i)).orElse(null);
					if(hotel ==null || hotel.getPermission().equals("0")) {
						continue;
					}
					
					hotelList.add(hotel);
				}
				HotelTag hotelTag = hotelTagRepo.findByName(tagName);
				hotelTag.setClickCount(hotelTag.getClickCount()+1);
				hotelTagRepo.save(hotelTag);
				
				request.setAttribute("tagHotel", hotelList);
				request.setAttribute("cityList", cityRepo.findAll());
				request.setAttribute("tagList", hotelTagRepo.findAll());
				request.setAttribute("all",tsRepo.findAll());
				request.setAttribute("tag",hotelTagRepo.findByName(tagName));
				return TEMPLATE_PREFIX+"/tagHotel";
			}
			

			@PostMapping(value = "/fav", produces = "application/json")
			@ResponseBody
			public String favHotels(HttpServletRequest request, @RequestParam("hotelId") String hotelId) {
				String userId = "a123";
				HotelFav fav = hotelFavRepo.findByHotelIdAndUserId(hotelId, userId);
				JSONObject json = new JSONObject();
				if (fav == null) {
					hotelFavRepo.save(new HotelFav(hotelId, userId));
					json.put("status", "addFav");
				} else {
					hotelFavRepo.delete(fav);
					json.put("status", "delFav");
				}
				return json.toString();
			}
			
			//城市ajax
			@GetMapping(value = "/hotelInCity")
			public String hotelInCity(HttpServletRequest request,@RequestParam("name") String cityName){
				City city = cityRepo.findByName(cityName);
				List<Hotel> hotelInCityList = hotelRepo.findByCityAndPermission(city,"1");
				
				request.setAttribute("cityList", cityRepo.findAll());
				request.setAttribute("hotelInCityList", hotelInCityList);
				request.setAttribute("tagList", hotelTagRepo.findAll());
				request.setAttribute("all",tsRepo.findAll());
				request.setAttribute("city", city);
		
				return TEMPLATE_PREFIX + "/hotelInCity";
			}
				
	}
