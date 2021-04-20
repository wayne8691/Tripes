package com.iii.trip.attractions.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.iii.trip.attractions.model.RestaurantBean;
import com.iii.trip.attractions.service.RestaurantPagesService;

@Controller
@RequestMapping(path = "/attractions.Restaurant")
@SessionAttributes(names = { "totalPages", "totalElements" })
public class RestaurantPagesController {
	
	@Autowired
	private RestaurantPagesService restaurantPagesService;
	
	//查詢餐廳By name Or counties
	@PostMapping("/findRestaurantByNameReOrCountiesRe/{searchName}/{searchCounties}")
    @ResponseBody
    public List<RestaurantBean> findByNameReOrCountiesRe(@PathVariable("searchName") String nameRe, @PathVariable("searchCounties") String countiesRe) {
//		System.out.println("searchName--------------" + nameRe);
//		System.out.println("searchCounties--------------" + countiesRe);
		if("null".equals(nameRe) && "null".equals(countiesRe)) {
			//未輸入
			List<RestaurantBean> no  =new ArrayList<RestaurantBean>();
			return no;
		}else if( !"null".equals(nameRe) && "null".equals(countiesRe)) {
			//查詢餐廳BY name
			return restaurantPagesService.findByNameReLike("%"+nameRe+"%");
		}else if("null".equals(nameRe) && !"null".equals(countiesRe)) {
			//查詢景點BY Counties 
			return restaurantPagesService.findByCountiesRe(countiesRe);
		}
//		System.out.println(attractionsPagesService.findByNameOrCounties(name, counties));
        return restaurantPagesService.findByNameReOrCountiesRe(nameRe, countiesRe);
    }
	
	//讀取所有餐廳(依瀏覽人次排名)
    @PostMapping("/findAllRestaurantByCountDesc")
    @ResponseBody
    public List<RestaurantBean> findAllRestaurantByCountDesc() {
    	System.out.println(restaurantPagesService.findAllByCountReDesc());
    	
    	return restaurantPagesService.findAllByCountReDesc();
    }
    
    @PostMapping("/attractions.getAllRestaurant")
    @ResponseBody
    public List<RestaurantBean> getAllAttractions() {
    	return restaurantPagesService.findAll();
    }
    
    
    @PostMapping("/queryAllRestaurantByPage.controller/{pageNo}")
    @ResponseBody
    public List<RestaurantBean> queryAllRestaurantBeanByPage(@PathVariable(name = "pageNo") int pageNo, Model m) {
    	
    	int pageSize = 9;
    	Pageable pageable = PageRequest.of(pageNo-1, pageSize);
    	Page<RestaurantBean> page = restaurantPagesService.findAllByPage(pageable);
    	
    	int totalPages = page.getTotalPages();
    	long totalElements = page.getTotalElements();
    	
    	m.addAttribute("totalPages", totalPages);
    	m.addAttribute("totalElements", totalElements);
    	
    	return page.getContent();
    }
}
