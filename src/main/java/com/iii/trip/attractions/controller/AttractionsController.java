package com.iii.trip.attractions.controller;


import java.util.HashMap;
import java.util.List;
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


import com.iii.trip.attractions.model.AttractionsBean;
import com.iii.trip.attractions.service.AttractionsService;


@Controller
public class AttractionsController {

	@Autowired
	@Qualifier("AttractionsBean")
	AttractionsService attractionsService;
	
	//讀取景點資料by pk
	@GetMapping("/attractions/{pk}")
	public @ResponseBody AttractionsBean getAttractions(
			@PathVariable("pk") Integer pk) {
		return	attractionsService.getAttractions(pk);
	}
	
	//刪除景點資料by pk  
	@DeleteMapping("/attractions/{pk}")
	public @ResponseBody Map<String, Object> deleteAttractions(
			@PathVariable("pk") Integer pk) {
		Map<String, Object> map = new HashMap<String, Object>();
		Integer i =	attractionsService.deleteAttractions(pk);
		if ( i == -1) {
			map.put("fail", "該筆資料不存在");
		} else if  ( i == 1) {
			map.put("success", "刪除成功");
		}
		return map;  
	}
	
	
	//更新景點資料by pk
	@PutMapping("/attractions/{pk}")
	public @ResponseBody Map<String, Object> updateAttractions(@PathVariable("pk") Integer pk,
			@RequestBody AttractionsBean attractionsBean ) {
		System.out.println("attractionsBean=" + attractionsBean);
		System.out.println("pk=" + pk);
		Map<String, Object> map = new HashMap<>();
		try {
			attractionsService.updateAttractions(attractionsBean,pk);
			map.put("success", "修改成功");
		} catch (Exception e) {
			e.printStackTrace();
			map.put("fail", "修改失敗");
		}
		return map;  
	}
	
	//確認景點有無重複
		@PostMapping("/checkAttractions.controller")
		public @ResponseBody Map<String, Object> checkAttractionsName(@RequestParam("name") String name) {
			Map<String, Object> map = new HashMap<String, Object>();
			if (attractionsService.checkAttractionsName(name)) {
				map.put("name", "景點已存在，請勿重複新增");
			} else {
				map.put("name", "");
			}
			return map;
		}
		
		
	// 景點-新增資料
		@PostMapping("/saveAttractions.controller")
		public @ResponseBody Map<String, Object> saveAttractions(@RequestBody AttractionsBean attractionsBean) {
			System.out.println("attractionsBean:" + attractionsBean);
			Map<String, Object> map = new HashMap<String, Object>();
				try {
						attractionsService.insertAttractions(attractionsBean);
						map.put("success", "新增成功");
				} catch (Exception e) {
					map.put("fail", "無法新增：景點已存在" );
				}
			return map;
		}
	
	
	//讀取景點資料by 縣市
	@GetMapping("/getCountiesByAttractions1")
	public  @ResponseBody Map<String, Object> getCountiesByAttractions(@RequestParam(value="counties", required = false) String counties) {
		Map<String, Object> mapData = new HashMap<String, Object>();
		List<AttractionsBean> attractionsBean = attractionsService.getByCounties(counties);
		System.out.println(attractionsService.getByCounties(counties));
		mapData.put("attractionsBean", attractionsBean);
		System.out.println(mapData);
		return mapData;
	}

	
	
	
}
