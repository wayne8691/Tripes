package com.iii.trip.trainandhotel.controller;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Base64;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

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
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.iii.trip.member.model.MemberBean;
import com.iii.trip.trainandhotel.form.HotelForm;
import com.iii.trip.trainandhotel.repository.City;
import com.iii.trip.trainandhotel.repository.CityRepository;
import com.iii.trip.trainandhotel.repository.Hotel;
import com.iii.trip.trainandhotel.repository.HotelFacilityRelation;
import com.iii.trip.trainandhotel.repository.HotelFacilityRelationRepository;
import com.iii.trip.trainandhotel.repository.HotelFacilityRepository;
import com.iii.trip.trainandhotel.repository.HotelRepository;
import com.iii.trip.trainandhotel.repository.HotelTagRelation;
import com.iii.trip.trainandhotel.repository.HotelTagRelationRepository;
import com.iii.trip.trainandhotel.repository.HotelTagRepository;
import com.iii.trip.trainandhotel.repository.Room;
import com.iii.trip.trainandhotel.repository.RoomOrder;
import com.iii.trip.trainandhotel.repository.RoomOrderRepository;
import com.iii.trip.trainandhotel.repository.RoomRepository;
import com.iii.trip.trainandhotel.service.MailSenderService;
import com.iii.trip.trainandhotel.utility.Utility;

@Controller
@RequestMapping(value = "/trainandhotel/manage")
public class HotelManageController {
	private static final String PREFIX = "/trainandhotel/manage";
	private static final String TEMPLATE_PREFIX = "/trainandhotel/manage";

	@Autowired
	private HotelRepository hotelRepo;
	@Autowired
	private CityRepository cityRepo;
	@Autowired
	private HotelFacilityRepository hotelFacilityRepo;
	@Autowired
	private HotelTagRepository tagRepo;
	@Autowired
	private HotelFacilityRelationRepository hotelFacilityRelationRepo;
	@Autowired
	private HotelTagRelationRepository tagRelationRepo;
	@Autowired
	private RoomRepository roomRepo;
	@Autowired
	private RoomOrderRepository roRepo;

	@GetMapping(value = "/showHotelsInNoUser") // RequestMapping + getMapping = 路徑
	public String showAllForAdmin(Model model) {
		model.addAttribute("hotelList", hotelRepo.findAllByUserId("0"));
		return TEMPLATE_PREFIX + "/noUser"; // 回傳的jsp位置
	}

	@GetMapping(value = "/showHotels")
	public String showAll(Model model,@SessionAttribute("loginuser") MemberBean mb) {
		String userId = Utility.getStringNotNull(mb.getUserid());
		model.addAttribute("hotelList", hotelRepo.findByUserId(userId));
		return TEMPLATE_PREFIX + "/showAll";
	}

	@GetMapping(value = "/hotel/insert")
	public String insertPage(Model model) {
		model.addAttribute("cityList", cityRepo.findAll());
		model.addAttribute("hotelFacilityList", hotelFacilityRepo.findAll());
		model.addAttribute("tagList", tagRepo.findAll());
		return TEMPLATE_PREFIX + "/hotel/insert";
	}

	@PostMapping(value = "/hotel/insert")
	public String insert(@ModelAttribute HotelForm reqForm, BindingResult bindingResult, RedirectAttributes redirectAttributes ,@SessionAttribute("loginuser") MemberBean mb) {
		String userId = Utility.getStringNotNull(mb.getUserid());
		City city = cityRepo.findById(reqForm.getCityId()).orElse(null);
		if (city != null) {
			try {
				String pic = null;
				if (reqForm.getPic() != null && reqForm.getPic().getSize() > 0) {
					pic = Base64.getEncoder().encodeToString(IOUtils.toByteArray(reqForm.getPic().getInputStream()));
				}
				Hotel hotel = hotelRepo.save(new Hotel(reqForm.getName(), city, reqForm.getAddress(), reqForm.getIntro(), pic, reqForm.getPhone(), "1", userId, 0, reqForm.getType()));
				
				String[] hotelFacility = reqForm.getHotelFacility();
				if (hotelFacility != null) {
					for (int i = 0; i < hotelFacility.length; i++) {
						HotelFacilityRelation hotelFacilityRelation = new HotelFacilityRelation(hotel.getId(), Utility.getStringNotNull(hotelFacility[i]));
						hotelFacilityRelationRepo.save(hotelFacilityRelation);
					}
				}

				String[] hotelTags = reqForm.getHotelTags();
				if (hotelTags != null) {
					for (int i = 0; i < hotelTags.length; i++) {
						HotelTagRelation hotelTagRelation = new HotelTagRelation(hotel.getId(),
								Utility.getStringNotNull(hotelTags[i]));
						tagRelationRepo.save(hotelTagRelation);
					}
				}
				redirectAttributes.addFlashAttribute("status", "success");
				redirectAttributes.addFlashAttribute("msg", "新增成功");
				redirectAttributes.addFlashAttribute("type", "success");

			} catch (Exception e) {
				redirectAttributes.addFlashAttribute("status", "error");
				redirectAttributes.addFlashAttribute("msg", "新增發生錯誤");
				redirectAttributes.addFlashAttribute("type", "error");

			}
		} else {
			redirectAttributes.addFlashAttribute("status", "error");
			redirectAttributes.addFlashAttribute("msg", "新增發生錯誤");
			redirectAttributes.addFlashAttribute("type", "error");

		}
		return "redirect:" + PREFIX + "/showHotels";
	}

	@GetMapping(value = "/hotel/edit")
	public String updatePage(Model model, @RequestParam("id") String id) {
		model.addAttribute("hotel", hotelRepo.findById(id).orElse(new Hotel()));
		model.addAttribute("hotelFacilityList", hotelFacilityRepo.findAll());
		model.addAttribute("hotelFacilityRelationList", hotelFacilityRelationRepo.findFacilityIdsByHotelId(id));
		model.addAttribute("tagList", tagRepo.findAll());
		model.addAttribute("tagRelationList", tagRelationRepo.findTagIdsByHotelId(id));
		return TEMPLATE_PREFIX + "/hotel/edit";
	}

	@PostMapping(value = "/hotel/update")
	public String update(@ModelAttribute HotelForm reqForm, BindingResult bindingResult, RedirectAttributes redirectAttributes) {
		try {
			Hotel hotel = hotelRepo.findById(reqForm.getId()).orElse(null);
			if (hotel != null) {
				String pic = null;
				if (reqForm.getPic() != null && reqForm.getPic().getSize() > 0) {
					pic = Base64.getEncoder().encodeToString(IOUtils.toByteArray(reqForm.getPic().getInputStream()));
				}
				hotel.setName(reqForm.getName());
				hotel.setAddress(reqForm.getAddress());
				hotel.setIntro(reqForm.getIntro());
				hotel.setPhone(reqForm.getPhone());
				hotel.setType(reqForm.getType());
				if (pic != null) {
					hotel.setPic(pic);
				}
				hotelRepo.save(hotel);
				
				String[] hotelFacility = reqForm.getHotelFacility();
				if (hotelFacility != null) {
					hotelFacilityRelationRepo.deleteByHotelId(hotel.getId());
					for (int i = 0; i < hotelFacility.length; i++) {
						HotelFacilityRelation hotelFacilityRelation = new HotelFacilityRelation(hotel.getId(), Utility.getStringNotNull(hotelFacility[i]));
						hotelFacilityRelationRepo.save(hotelFacilityRelation);
					}
				}

				String[] hotelTags = reqForm.getHotelTags();
				if (hotelTags != null) {
					tagRelationRepo.deleteByHotelId(hotel.getId());
					for (int i = 0; i < hotelTags.length; i++) {
						HotelTagRelation hotelTagRelation = new HotelTagRelation(hotel.getId(), Utility.getStringNotNull(hotelTags[i]));
						tagRelationRepo.save(hotelTagRelation);
					}
				}
				redirectAttributes.addFlashAttribute("status", "success");
				redirectAttributes.addFlashAttribute("msg", "編輯成功");
				redirectAttributes.addFlashAttribute("type", "success");
			} else {
				redirectAttributes.addFlashAttribute("status", "error");
				redirectAttributes.addFlashAttribute("msg", "編輯發生錯誤");
				redirectAttributes.addFlashAttribute("type", "error");
			}
		} catch (Exception e) {
			redirectAttributes.addFlashAttribute("status", "error");
			redirectAttributes.addFlashAttribute("msg", "編輯發生錯誤");
			redirectAttributes.addFlashAttribute("type", "error");

		}
		return "redirect:" + PREFIX + "/showHotels";
	}

	@PostMapping(value = "/del")
	@ResponseBody
	public String delete(@RequestParam("id") String id, @RequestParam("reason") String reason,@SessionAttribute("loginuser") MemberBean mb) {
		JSONObject json = new JSONObject();
		Hotel hotel = hotelRepo.findById(id).orElse(null);
		List<Room> roomList = roomRepo.findByHotel(hotel);
		if (hotel != null) {
			List<RoomOrder> roList = roRepo.findByHotelAndStartDateAfter(hotel, LocalDate.now());
			if (roList != null && !roList.isEmpty()) {
				json.put("msg", "還有訂單未完成");
				json.put("title", "返回清單");
				json.put("type", "error");
				json.put("status", false);
				return json.toString();
			}
			
			for(Room room:roomList) {
				roomRepo.delete(room);
			}	
//			hotelRepo.deleteById(hotel.getId());
			hotel.setPermission("0");
			hotel.setUserId("0");
			hotelRepo.save(hotel);

			String userEmail = Utility.getStringNotNull(mb.getEmail());
			String title = "您已刪除"+hotel.getName();
			String text = "您已於" + LocalDate.now() +"刪除了" + hotel.getName()+",您給的原因為:"+reason+"。\n 若您有任何疑問，請通知我們的客服人員。";
			
			MailSenderService.toMail(userEmail,title, text);

			json.put("status", true);
			json.put("msg", "刪除完成");
			json.put("title", "返回清單");
			json.put("type", "success");
		} else {
			json.put("status", false);
			json.put("msg", "其他錯誤");
			json.put("title", "返回清單");
			json.put("type", "error");
		}
		return json.toString();
	}

	@PostMapping(value = "/changePermission")
	public String emptyHotels(Model model, @RequestParam("hotelId") String hotelId, @RequestParam("value") String permission) {
		Hotel hotelToUpdate = hotelRepo.findById(hotelId).orElse(null);
		if (hotelToUpdate != null) {
			hotelToUpdate.setPermission(permission);
			hotelRepo.save(hotelToUpdate);
			model.addAttribute("hotelList", hotelRepo.findAllByUserIdNotEquals("0"));
		}
		return TEMPLATE_PREFIX + "/changePermission";
	}

	@GetMapping(value = "/hotelInfo")
	public String singleHotel(Model model, @RequestParam("hotelId") String hotelId) {
		Hotel hotel = hotelRepo.findById(hotelId).orElse(null);
		List<Room> roomList = roomRepo.findByHotel(hotel);

		model.addAttribute("rooms", roomList);
		model.addAttribute("hotel", hotel);
		return TEMPLATE_PREFIX + "/hotel/hotelInfo";
	}

	@PostMapping(value = "/blurResult")
	public String resultHotel(Model model, @RequestParam("key") String key, @SessionAttribute("loginuser") MemberBean mb) {
		String userId = Utility.getStringNotNull(mb.getUserid());
		Set<Hotel> hotelSet = new HashSet<>();
		City city = cityRepo.findAllByNameContaining('%'+ key + '%');
		List<Hotel> hotelInCityList = hotelRepo.findByCity(city);
		List<Hotel> hotelListInNameContain = hotelRepo.findAllByUserIdAndNameContaining(userId, '%' + key + '%');
		List<Hotel> hotelList = new ArrayList<>();
		hotelSet.addAll(hotelListInNameContain);
		hotelSet.addAll(hotelInCityList);
		for(Hotel hotel:hotelSet) {
			hotelList.add(hotel);
		}
		model.addAttribute("hotels", hotelList);
		return TEMPLATE_PREFIX + "/blurResult";
	}
	
	@PostMapping(value = "/blurResultForAdmin")
	public String resultHotel2(Model model, @RequestParam("key") String key) {
		List<Hotel> hotelList = hotelRepo.findAllByNameContaining('%' + key + '%');

		model.addAttribute("hotels", hotelList);
		return TEMPLATE_PREFIX + "/blurResultForAdmin";
	}
	
	@GetMapping(value = "/roomOrder")
	public String ro(Model model, @RequestParam("name") String hotelId) {
		List<RoomOrder> roomOrderList = roRepo.findAllByHotel(hotelRepo.findById(hotelId).orElse(null));
		Hotel hotel = hotelRepo.findById(hotelId).orElse(null);
		model.addAttribute("ros", roomOrderList);
		model.addAttribute("hotel", hotel);
		return TEMPLATE_PREFIX + "/roomOrderInHotel";
	}
	
	@GetMapping(value = "/hotel/editOwner")
	public String updatePageUser(Model model, @RequestParam("id") String id) {
		model.addAttribute("hotel", hotelRepo.findById(id).orElse(new Hotel()));
		model.addAttribute("hotelFacilityList", hotelFacilityRepo.findAll());
		model.addAttribute("hotelFacilityRelationList", hotelFacilityRelationRepo.findFacilityIdsByHotelId(id));
		model.addAttribute("tagList", tagRepo.findAll());
		model.addAttribute("tagRelationList", tagRelationRepo.findTagIdsByHotelId(id));
		return TEMPLATE_PREFIX + "/hotel/editOwner";
	}
	
	@PostMapping(value = "/hotel/updateOwner")
	public String updateOwner(Model model,@RequestParam("owner") String owner,@ModelAttribute HotelForm reqForm, RedirectAttributes redirectAttributes) {
		Hotel hotel = hotelRepo.findById(reqForm.getId()).orElse(null);
		if (hotel != null) {
			hotel.setUserId(owner);
			hotel.setPermission("1");
			hotelRepo.save(hotel);
		}
		redirectAttributes.addFlashAttribute("status", "success");
		redirectAttributes.addFlashAttribute("msg", "編輯成功");
		redirectAttributes.addFlashAttribute("type", "success");
	return "redirect:" + PREFIX + "/showHotels";
	}
}
