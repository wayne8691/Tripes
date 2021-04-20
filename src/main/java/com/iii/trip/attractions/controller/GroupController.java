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

import com.iii.trip.attractions.model.TravelGroupBean;
import com.iii.trip.attractions.service.GroupService;


@Controller
public class GroupController {

	@Autowired
	@Qualifier("TravelGroupBean")
	GroupService groupService;
	
	//讀取行程資料by Id
	@GetMapping("/travelGroup/{id}")
	public @ResponseBody TravelGroupBean getGroupById(
			@PathVariable("id") Integer id) {
		return	groupService.getGroupById(id);
	}
	
	//刪除行程資料by id  
	@DeleteMapping("/travelGroup/{id}")
	public @ResponseBody Map<String, Object> deleteGroupById(
			@PathVariable("id") Integer id) {
		Map<String, Object> map = new HashMap<String, Object>();
		Integer i =	groupService.deleteGroupById(id);
		if ( i == -1) {
			map.put("fail", "該筆資料不存在");
		} else if  ( i == 1) {
			map.put("success", "刪除成功");
		}
		return map;
	}
	
	
	//更新行程資料by id
	@PutMapping("/travelGroup/{id}")
	public @ResponseBody Map<String, Object> updateGroup(
			@PathVariable("id") Integer id,
			@RequestBody TravelGroupBean travelGroupBean 
			) {
		System.out.println("TravelGroupBean=" + travelGroupBean);
		System.out.println("id=" + id);
		Map<String, Object> map = new HashMap<>();
		try {
			groupService.updateGroup(travelGroupBean);
			map.put("success", "修改成功");
		} catch (Exception e) {
			e.printStackTrace();
			map.put("fail", "修改失敗");
		}
		return map;  
	}
		
	// 行程-新增資料
		@PostMapping("/insertTravelGroup.controller")
		public @ResponseBody Map<String, Object> insertGroup(@RequestBody TravelGroupBean travelGroupBean) {
			System.out.println("travelGroupBean:" + travelGroupBean);
			Map<String, Object> map = new HashMap<String, Object>();
				try {
					    groupService.insertGroup(travelGroupBean);
						map.put("success", "新增成功");
				} catch (Exception e) {
					map.put("fail", "新增失敗：" + e.getMessage());
				}
			return map;
		}
		
		//確認行程團名有無重複
		@PostMapping("/checkTravelGroup.controller")
		public @ResponseBody Map<String, Object> checkTravelGroupName(@RequestParam("name") String name) {
			Map<String, Object> map = new HashMap<String, Object>();
			if (groupService.checkTravelGroupName(name)) {
				map.put("name", "已存在");
			} else {
				map.put("name", "");
			}
			return map;
		}
	
}
