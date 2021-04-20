package com.iii.trip.attractions.controller;


import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.iii.trip.attractions.model.RestaurantBean;
import com.iii.trip.attractions.service.RestaurantService;


@Controller
public class RestaurantController  {

	@Autowired
	@Qualifier("RestaurantBean")
	private RestaurantService restaurantService;
	
	
	//讀取餐廳資料by pk
	@GetMapping("/getRestaurantByPk/{pk}")
	public @ResponseBody RestaurantBean getRestaurantByPk(
			@PathVariable("pk") Integer pk) {
		return	restaurantService.getRestaurantByPk(pk);
	}
	
	//刪除餐廳資料by pk
	@DeleteMapping("/deleterestaurant/{pk}")
	public @ResponseBody Map<String, Object> deleterestaurant(
			@PathVariable("pk") Integer pk) {
			
			Map<String, Object> map = new HashMap<String, Object>();
			Integer i =	restaurantService.deleteRe(pk);
			if ( i == -1) {
				map.put("fail", "該筆資料不存在");
			} else if  ( i == 1) {
				map.put("success", "刪除成功");
			}
			return map;  
		}
	//更新餐廳資料by pk
	@PutMapping("/updateRestaurant/{pk}")
	public @ResponseBody Map<String, Object> updateRestaurant(@PathVariable("pk") Integer pk,
			@RequestBody RestaurantBean restaurantBean) {
		System.out.println("restaurantBean=" + restaurantBean);
		System.out.println("pk" + pk);
		Map<String, Object> map = new HashMap<>();
		try {
			restaurantService.updateRe(restaurantBean,pk);
			map.put("success", "修改成功");
		} catch (Exception e) {
			e.printStackTrace();
			map.put("fail", "修改失敗");
		}
		return map;  
	}
	
	//確認餐廳有無重複
	@PostMapping("/checkRestaurantName")
	public @ResponseBody Map<String, Object> checkRestaurantName(@RequestParam("nameRe") String nameRe) {
		Map<String, Object> map = new HashMap<String, Object>();
		if (restaurantService.checkRestaurantName(nameRe)) {
			map.put("nameRe", "餐廳已存在，請勿重複新增");
		} else {
			map.put("nameRe", "");
		}
		return map;
	}
	
	//新增餐廳資料
	@PostMapping("/saveRestaurant")
	public @ResponseBody Map<String, Object> saveRestaurant(@RequestBody RestaurantBean restaurantBean) {
		System.out.println("restaurantBean:" + restaurantBean);
		Map<String, Object> map = new HashMap<String, Object>();
			try {
				restaurantService.insertRe(restaurantBean);
					map.put("success", "新增成功");
			} catch (Exception e) {
				map.put("fail", "新增失敗：餐廳已存在" );
				//map.put("fail", "新增失敗：" + e.getMessage());
			}
		return map;
	}

}
