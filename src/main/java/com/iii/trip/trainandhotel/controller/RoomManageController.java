package com.iii.trip.trainandhotel.controller;

import java.time.LocalDate;
import java.util.Base64;
import java.util.List;

import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.IOUtils;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.iii.trip.trainandhotel.form.RoomForm;
import com.iii.trip.trainandhotel.repository.Hotel;
import com.iii.trip.trainandhotel.repository.HotelRepository;
import com.iii.trip.trainandhotel.repository.Room;
import com.iii.trip.trainandhotel.repository.RoomFacilityRelation;
import com.iii.trip.trainandhotel.repository.RoomFacilityRelationRepository;
import com.iii.trip.trainandhotel.repository.RoomFacilityRepository;
import com.iii.trip.trainandhotel.repository.RoomOrderRepository;
import com.iii.trip.trainandhotel.repository.RoomRepository;
import com.iii.trip.trainandhotel.utility.Utility;

@MultipartConfig
@Controller
@RequestMapping(value = "/trainandhotel/manage/hotel/room")
public class RoomManageController {
	private static final String TEMPLATE_PREFIX = "/trainandhotel/manage/hotel/room";

	@Autowired
	HttpSession session;
	@Autowired
	private HotelRepository hotelRepo;
	@Autowired
	private RoomRepository roomRepo;
	@Autowired
	private RoomOrderRepository roRepo;
	@Autowired
	private RoomFacilityRepository roomFacilityRepo;
	@Autowired
	private RoomFacilityRelationRepository roomFacilityRelationRepo;

	@GetMapping(value = "/showRooms")
	public String showAll(Model model, @RequestParam("hotelId") String hotelId) {
		model.addAttribute("hotelId", hotelId);
		Hotel hotel = hotelRepo.findById(hotelId).orElse(new Hotel());
		model.addAttribute("roomList", roomRepo.findByHotel(hotel));
		return TEMPLATE_PREFIX + "/showAll";
	}

	@GetMapping(value = "/insert")
	public String insertPage(Model model, @RequestParam("hotelId") String hotelId) {
		model.addAttribute("roomFacilityList", roomFacilityRepo.findAll());
		model.addAttribute("hotel", hotelRepo.findById(hotelId).orElse(new Hotel()));
		model.addAttribute("hotelId", hotelId);
		model.addAttribute("roomfacility", roomFacilityRepo.findAll());
		return TEMPLATE_PREFIX + "/insert";
	}

	@PostMapping(value = "/insert")
	public String insert(@ModelAttribute RoomForm reqForm, BindingResult bindingResult, RedirectAttributes redirectAttributes) {
		Hotel hotel = hotelRepo.findById(reqForm.getHotelId()).orElse(null);
		if (hotel != null) {
			try {
				String pic = null;
				if (reqForm.getPic() != null && reqForm.getPic().getSize() > 0) {
					pic = Base64.getEncoder().encodeToString(IOUtils.toByteArray(reqForm.getPic().getInputStream()));
				}
				Room room = roomRepo.save(new Room(reqForm.getName(), hotel.getCity(), hotel, reqForm.getPrice(), reqForm.getCap(), pic, reqForm.getBed()));
				String[] roomFacility = reqForm.getRoomFacility();
				if (roomFacility != null) {
					for (int i = 0; i < roomFacility.length; i++) {
						RoomFacilityRelation roomFacilityRelation = new RoomFacilityRelation(room.getId(), Utility.getStringNotNull(roomFacility[i]));
						roomFacilityRelationRepo.save(roomFacilityRelation);
					}
				}
				redirectAttributes.addFlashAttribute("status", "success");
				redirectAttributes.addFlashAttribute("msg", "新增成功");
			} catch (Exception e) {
				redirectAttributes.addFlashAttribute("msg", "error");
				redirectAttributes.addFlashAttribute("msg", "新增發生錯誤");
			}
		} else {
			redirectAttributes.addFlashAttribute("msg", "error");
			redirectAttributes.addFlashAttribute("msg", "新增發生錯誤");
		}
		return "redirect:/trainandhotel/manage/hotelInfo?hotelId=" + reqForm.getHotelId();
	}

	@GetMapping(value = "/edit")
	public String updatePage(Model model, @RequestParam("id") String id) {
		model.addAttribute("room", roomRepo.findById(id).orElse(new Room()));
		model.addAttribute("roomFacilityList", roomFacilityRepo.findAll());
		model.addAttribute("roomFacilityRelationList", roomFacilityRelationRepo.findFacilityIdsByRoomId(id));
		return TEMPLATE_PREFIX + "/edit";
	}

	@PostMapping(value = "/update")
	public String update(@ModelAttribute RoomForm reqForm, BindingResult bindingResult, RedirectAttributes redirectAttributes) {
		Room room = roomRepo.findById(reqForm.getId()).orElse(null);
		if (room != null) {
			try {
				String pic = null;
				if (reqForm.getPic() != null && reqForm.getPic().getSize() > 0) {
					pic = Base64.getEncoder().encodeToString(IOUtils.toByteArray(reqForm.getPic().getInputStream()));
				}
				room.setName(reqForm.getName());
				room.setCapacity(reqForm.getCap());
				room.setPrice(reqForm.getPrice());
				room.setBed(reqForm.getBed());
				if (pic != null) {
					room.setPic(pic);
				}
				roomRepo.save(room);
				String[] roomFacility = reqForm.getRoomFacility();
				if (roomFacility != null) {
					roomFacilityRelationRepo.deleteByRoomId(reqForm.getId());
					for (int i = 0; i < roomFacility.length; i++) {
						RoomFacilityRelation roomFacilityRelation = new RoomFacilityRelation(room.getId(), Utility.getStringNotNull(roomFacility[i]));
						roomFacilityRelationRepo.save(roomFacilityRelation);
					}
				}
				redirectAttributes.addFlashAttribute("status", "success");
				redirectAttributes.addFlashAttribute("msg", "編輯成功");
				redirectAttributes.addFlashAttribute("type", "success");
			} catch (Exception e) {
				redirectAttributes.addFlashAttribute("status", "error");
				redirectAttributes.addFlashAttribute("msg", "編輯發生錯誤");
				redirectAttributes.addFlashAttribute("type", "success");
			}
		} else {
			redirectAttributes.addFlashAttribute("status", "error");
			redirectAttributes.addFlashAttribute("msg", "編輯發生錯誤");
			redirectAttributes.addFlashAttribute("type", "success");
		}
		return "redirect:/trainandhotel/manage/hotelInfo?hotelId=" + room.getHotel().getId();
	}

	@PostMapping(value = "/del")
	@ResponseBody
	public String delete(@RequestParam("id") String id) {
		JSONObject json = new JSONObject();

		Room room = roomRepo.findById(id).orElse(null);
		if (room != null) {
			if (roomFacilityRelationRepo.findFacilityIdsByRoomId(room.getId()) != null) {
				roomFacilityRelationRepo.deleteByRoomId(room.getId());
			}
			if(roRepo.findByRoomIdAndStartDateAfter(room.getId(),LocalDate.now()) != null && !roRepo.findByRoomIdAndStartDateAfter(room.getId(),LocalDate.now()).isEmpty()) {
				json.put("msg", "還有訂單未完成");
				json.put("title", "返回清單");
				json.put("type", "error");
				json.put("status", false);
				return json.toString();
			}
			roomRepo.delete(room);
			json.put("status", true);
			json.put("msg", "刪除完成");
			json.put("title", "返回清單");
			json.put("type", "success");
		} else {
			json.put("status", false);
			json.put("msg", "刪除失敗");
			json.put("title", "返回清單");
			json.put("type", "error");
		}
		return json.toString();
	}
	
	@PostMapping(value = "/blurResultRoom")
	public String resultHotel(Model model, @RequestParam("key") String key,@RequestParam("hotelId") String hotelId) {
		List<Room> roomList = roomRepo.findAllByHotelIdAndNameContaining(hotelId, '%' + key + '%');

		model.addAttribute("rooms", roomList);
		return TEMPLATE_PREFIX + "/blurResultRoom";
	}
}
