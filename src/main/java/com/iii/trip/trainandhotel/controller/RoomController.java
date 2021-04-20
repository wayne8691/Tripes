package com.iii.trip.trainandhotel.controller;

import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.iii.trip.member.model.BrowseRecordBean;
import com.iii.trip.member.model.MemberBean;
import com.iii.trip.member.service.LoginService;
import com.iii.trip.trainandhotel.repository.CityRepository;
import com.iii.trip.trainandhotel.repository.Hotel;
import com.iii.trip.trainandhotel.repository.HotelFacilityRelationRepository;
import com.iii.trip.trainandhotel.repository.HotelFacilityRepository;
import com.iii.trip.trainandhotel.repository.HotelFav;
import com.iii.trip.trainandhotel.repository.HotelFavRepository;
import com.iii.trip.trainandhotel.repository.HotelRepository;
import com.iii.trip.trainandhotel.repository.HotelTagRelationRepository;
import com.iii.trip.trainandhotel.repository.HotelTagRepository;
import com.iii.trip.trainandhotel.repository.Room;
import com.iii.trip.trainandhotel.repository.RoomFacility;
import com.iii.trip.trainandhotel.repository.RoomFacilityRelationRepository;
import com.iii.trip.trainandhotel.repository.RoomFacilityRepository;
import com.iii.trip.trainandhotel.repository.RoomOrder;
import com.iii.trip.trainandhotel.repository.RoomOrderRepository;
import com.iii.trip.trainandhotel.repository.RoomRepository;
import com.iii.trip.trainandhotel.utility.Utility;

@Controller
@RequestMapping(value="")
public class RoomController {
	private static final String TEMPLATE_PREFIX = "/trainandhotel/hotel";
	
	@Autowired
	private LoginService loginService;
	@Autowired
	private HotelRepository hotelRepo;
	@Autowired
	private CityRepository cityRepo;
	@Autowired
	private RoomRepository roomRepo;
	@Autowired
	private RoomOrderRepository roRepo;
	@Autowired
	private HotelFavRepository hotelFavRepo;
	@Autowired
	private HotelFacilityRepository hotelFacilityRepo;
	@Autowired
	private HotelFacilityRelationRepository hotelFacilityRelationRepo;
	@Autowired
	private RoomFacilityRelationRepository roomFacilityRelationRepo;
	@Autowired
	private RoomFacilityRepository roomFacilityRepo;
	@Autowired
	private HotelTagRelationRepository hotelTagRelationRepo;
	@Autowired
	private HotelTagRepository hotelTagRepo;

	
	//旅館房間
	@GetMapping(value = "/rooms")
	public String rooms(HttpServletRequest request, @RequestParam("name") String hotelId,HttpSession session) {
	    Hotel hotel = hotelRepo.findById(hotelId).orElse(null);
	    hotel.setClickCount(hotel.getClickCount()+1);
	    hotelRepo.save(hotel);
		List<Room> roomList = roomRepo.findByHotel(hotel);
		Set<String> roomTypes = new HashSet<>();
		for (Room room: roomList) {
			roomTypes.add(room.getName().substring(0, 3));
		}
		/*瀏覽紀錄*/
		if(session.getAttribute("loginuser")!=null) {
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			MemberBean loginuserid = (MemberBean) session.getAttribute("loginuser");
			//System.out.println(loginuserid.getUserid());
			BrowseRecordBean browseRecordBean = new BrowseRecordBean(hotelRepo.getOne(hotelId).getName(),loginuserid.getUserid(),sdf.format(new Date()),"hotel");
			loginService.browserrecord(browseRecordBean);
		}
		/*------*/
		
	    request.setAttribute("hotel", hotel);
	    request.setAttribute("hotelFacilityList", hotelFacilityRepo.findAllById(hotelFacilityRelationRepo.findFacilityIdsByHotelId(hotelId)));
	    request.setAttribute("roomList", roomList);
	    request.setAttribute("roomTypes", roomTypes);
	    request.setAttribute("cityList", cityRepo.findAll());
	    request.setAttribute("hotelTagList", hotelTagRepo.findAllById(hotelTagRelationRepo.findTagIdsByHotelId(hotelId)));
	 
		return TEMPLATE_PREFIX + "/room/showRooms";
	}
	
	//旅館房間
	@PostMapping(value = "/getRooms/{page}")
	public String getRoomList(final HttpServletRequest request,
			@RequestParam("hotelId") final String hotelId,
			@RequestParam("roomType") final Optional<String> optionalRoomType,
			@RequestParam("sort") final Optional<Integer> optionalSortType,
			@PathVariable("page") Optional<Integer> optionalPage) {
		
		final int countPerPage = 9;
		int page = optionalPage.orElse(1);
		if (page < 1) {
			page = 1;
		}
		// 0 is low2high, 1 is high2low
		int sortType = optionalSortType.orElse(0);
		if (sortType != 0 && sortType != 1) {
			sortType = 0;
		}
		String roomType = optionalRoomType.orElse("");
	    
		List<Room> roomListAll = roomRepo.findByHotelIdAndType(hotelId, roomType);
		if (sortType == 1) {
			Collections.reverse(roomListAll);
		}
		
		int maxPage = (int) Math.floor((double) roomListAll.size() / countPerPage)+1;
		
		List<Room> roomList = new ArrayList<>();
		for (int i = (page - 1) * countPerPage; i < page * countPerPage && i < roomListAll.size(); i++) {
			roomList.add(roomListAll.get(i));
		}
		
		List<Room> roomsInHotel = roomRepo.findByHotelId(hotelId);
		Map<Room,List<RoomFacility>> roomFacilityMap = new HashMap<>();
		
		for(Room room : roomsInHotel) {
			roomFacilityMap.put(room, roomFacilityRepo.findAllById(roomFacilityRelationRepo.findFacilityIdsByRoomId(room.getId())));
		}
		
		request.setAttribute("roomFacilityMap", roomFacilityMap);
	    request.setAttribute("roomList", roomList);
	    request.setAttribute("pageNow", page);
	    request.setAttribute("maxPage", maxPage);
		return TEMPLATE_PREFIX + "/room/rooms";
	}

	//空旅館
	@GetMapping(value = "/emptyRooms")
	public String emptyRoom(HttpServletRequest request,@RequestParam("name") String hotelId,
		@RequestParam("start")String startDate, @RequestParam("end")String endDate){
		
		Hotel hotel = hotelRepo.findById(hotelId).orElse(null);
		hotel.setClickCount(hotel.getClickCount()+1);
	    hotelRepo.save(hotel);
		
		List<Room> roomList = roomRepo.findByHotel(hotel);
		
		List<RoomOrder> roomOrderedAfterDate = roRepo.findAfterStartDateAndEndDate(LocalDate.parse(startDate), LocalDate.parse(endDate));
		List<RoomOrder> roomOrderedBeforeDate = roRepo.findBeforeStartDateAndEndDate(LocalDate.parse(startDate), LocalDate.parse(endDate));
		Map<String,Room> roomMap = new HashMap<>();
		
		for(Room room:roomList) {
			roomMap.put(room.getId(), room);
		}
		
		for(RoomOrder ro:roomOrderedAfterDate) {
			if(roomMap.containsKey(ro.getRoom().getId())){
				roomMap.remove(ro.getRoom().getId());
			}
		}
		
		for(RoomOrder ro:roomOrderedBeforeDate) {
			if(roomMap.containsKey(ro.getRoom().getId())){
				roomMap.remove(ro.getRoom().getId());
			}
		}
		
		List<Room> emptyRoomInHotel = new ArrayList<>(roomMap.values());
	    request.setAttribute("hotelFacilityList", hotelFacilityRepo.findAllById(hotelFacilityRelationRepo.findFacilityIdsByHotelId(hotelId)));
	    request.setAttribute("hotelTagList", hotelTagRepo.findAllById(hotelTagRelationRepo.findTagIdsByHotelId(hotelId)));
	    request.setAttribute("hotel", hotel);
	    request.setAttribute("roomList", emptyRoomInHotel);
	    request.setAttribute("start", startDate);
	    request.setAttribute("end", endDate);
		return TEMPLATE_PREFIX + "/room/showEmptyRooms";
	}	
	
	//空旅館房間
		@PostMapping(value = "/getEmptyRooms/{page}")
		public String getEmptyRoomList(final HttpServletRequest request,
				@RequestParam("hotelId") final String hotelId,
				@RequestParam("cap") final Optional<String> optionalCap,
				@RequestParam("sort") final Optional<Integer> optionalSortType,
				@PathVariable("page") Optional<Integer> optionalPage,
				@RequestParam("startDate") String startDate,
				@RequestParam("endDate") String endDate) {
			
			final int countPerPage = 9;
			int page = optionalPage.orElse(1);
			if (page < 1) {
				page = 1;
			}
			// 0 is low2high, 1 is high2low
			int sortType = optionalSortType.orElse(0);
			if (sortType != 0 && sortType != 1) {
				sortType = 0;
			}
			
			String cap = optionalCap.orElse("");
			List<Room> roomListInHotel = new ArrayList<>();
		    if(cap.equals("")) {
		    	roomListInHotel = roomRepo.findByHotelIdOrderByPriceASC(hotelId);
		    }else {
		    	roomListInHotel = roomRepo.findByHotelIdAndCapOrderByPriceASC(hotelId, cap);
		    }
			List<RoomOrder> roomOrderAll = roRepo.findAll();
			Set<RoomOrder> roomOrderSet = new HashSet<>();			
			List<RoomOrder> roomOrderedAfterDate = roRepo.findAfterStartDateAndEndDate(LocalDate.parse(startDate), LocalDate.parse(endDate));
			List<RoomOrder> roomOrderedBeforeDate = roRepo.findBeforeStartDateAndEndDate(LocalDate.parse(startDate), LocalDate.parse(endDate));
			Set<Room> roomSet = new LinkedHashSet<>();
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
			
			for(Room room:roomListInHotel) {
				roomSet.add(room);
			}
			//全部的房間有扣掉訂單的
			for(RoomOrder ro:roomOrderSet) {
				if(roomSet.contains(ro.getRoom())){
					roomSet.remove(ro.getRoom());
				}
			}
			//剩下房間List
			List<Room> roomList = new ArrayList<>();
			roomList.addAll(roomSet);
			
			if (sortType == 1) {
				Collections.reverse(roomList);
			}
		
			int maxPage = (int) Math.floor((double) roomList.size() / countPerPage)+1;
			
			List<Room> roomPerPage = new ArrayList<>();
			for (int i = (page - 1) * countPerPage; i < page * countPerPage && i < roomList.size(); i++) {
				roomPerPage.add(roomList.get(i));
			}
			
			Map<Room,List<RoomFacility>> roomFacilityMap = new HashMap<>();
			
			for(Room room : roomList) {
				roomFacilityMap.put(room, roomFacilityRepo.findAllById(roomFacilityRelationRepo.findFacilityIdsByRoomId(room.getId())));
			}
		    request.setAttribute("hotelTagList", hotelTagRepo.findAllById(hotelTagRelationRepo.findTagIdsByHotelId(hotelId)));
			request.setAttribute("roomFacilityMap", roomFacilityMap);
		    request.setAttribute("roomList", roomPerPage);
		    request.setAttribute("pageNow", page);
		    request.setAttribute("maxPage", maxPage);
			return TEMPLATE_PREFIX + "/room/emptyRooms";
		}
		
		
		@GetMapping(value = "/emptyRooms2")
		public String emptyRoom2(HttpServletRequest request,@RequestParam("name") String hotelId,
			@RequestParam("startDate")String startDate, @RequestParam("endDate")String endDate){
			
			Hotel hotel = hotelRepo.findById(hotelId).orElse(null);
			hotel.setClickCount(hotel.getClickCount()+1);
		    hotelRepo.save(hotel);
			
			List<Room> roomList = roomRepo.findByHotel(hotel);
			
			List<RoomOrder> roomOrderedAfterDate = roRepo.findAfterStartDateAndEndDate(LocalDate.parse(startDate), LocalDate.parse(endDate));
			List<RoomOrder> roomOrderedBeforeDate = roRepo.findBeforeStartDateAndEndDate(LocalDate.parse(startDate), LocalDate.parse(endDate));
			Map<String,Room> roomMap = new HashMap<>();
			
			for(Room room:roomList) {
				roomMap.put(room.getId(), room);
			}
			
			for(RoomOrder ro:roomOrderedAfterDate) {
				if(roomMap.containsKey(ro.getRoom().getId())){
					roomMap.remove(ro.getRoom().getId());
				}
			}
			
			for(RoomOrder ro:roomOrderedBeforeDate) {
				if(roomMap.containsKey(ro.getRoom().getId())){
					roomMap.remove(ro.getRoom().getId());
				}
			}
			
			List<Room> emptyRoomInHotel = new ArrayList<>(roomMap.values());
		    request.setAttribute("hotelFacilityList", hotelFacilityRepo.findAllById(hotelFacilityRelationRepo.findFacilityIdsByHotelId(hotelId)));
		    request.setAttribute("hotelTagList", hotelTagRepo.findAllById(hotelTagRelationRepo.findTagIdsByHotelId(hotelId)));
			request.setAttribute("hotel", hotel);
		    request.setAttribute("roomList", emptyRoomInHotel);
		    request.setAttribute("start", startDate);
		    request.setAttribute("end", endDate);
			return TEMPLATE_PREFIX + "/room/showEmptyRooms";
		}	
			
}
