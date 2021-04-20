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

import com.iii.trip.attractions.model.AttractionsBean;
import com.iii.trip.attractions.service.AttractionsPagesService;

@Controller
@RequestMapping(path = "/attractions")
@SessionAttributes(names = { "totalPages", "totalElements" })
public class AttractionsPagesController {
	
	@Autowired
	private AttractionsPagesService attractionsPagesService;
	
	//查詢景點By name Or counties
	@PostMapping("/findAttractionsByNameOrCounties/{searchName}/{searchCounties}")
    @ResponseBody
    public List<AttractionsBean> findByNameOrCounties(@PathVariable("searchName") String name, @PathVariable("searchCounties") String counties) {
//		System.out.println("searchName--------------" + name);
//		System.out.println("counties--------------" + counties);
		System.out.println(name);
		System.out.println(counties);
		if("null".equals(name) && "null".equals(counties)) {	
			//未輸入
			List<AttractionsBean> no  =new ArrayList<AttractionsBean>();
			return no;
		}else if(!"null".equals(name) && "null".equals(counties)) {
			System.out.println("OK");
			//查詢景點BY name
			return attractionsPagesService.findByNameLike("%"+name+"%");
		}else if("null".equals(name) && !"null".equals(counties)) {
			//查詢景點BY Counties 
			List<AttractionsBean> findByCounties = attractionsPagesService.findByCounties(counties);
			return findByCounties;
		}
		return attractionsPagesService.findByNameAndCounties(name, counties);
            
    }
	

	//讀取所有景點(依瀏覽人次排名)
    @PostMapping("/findAllAttractionsByCountDesc")
    @ResponseBody
    public List<AttractionsBean> findAllAttractionsByCountDesc() {
    	System.out.println(attractionsPagesService.findAllByCountDesc());
    	
    	return attractionsPagesService.findAllByCountDesc();
    }
    
	//讀取所有景點
    @PostMapping("/attractions.getAllAttractions")
    @ResponseBody
    public List<AttractionsBean> getAllAttractions() {
    	return attractionsPagesService.findAll();
    }
    
    
    @PostMapping("/queryAllAttractionsByPage.controller/{pageNo}")
    @ResponseBody
    public List<AttractionsBean> queryAllAttractionsByPage(@PathVariable(name = "pageNo") int pageNo, Model m) {
    	
    	int pageSize = 9;
    	Pageable pageable = PageRequest.of(pageNo-1, pageSize);
    	Page<AttractionsBean> page = attractionsPagesService.findAllByPage(pageable);
    	int totalPages = page.getTotalPages();
    	long totalElements = page.getTotalElements();
    	m.addAttribute("totalPages", totalPages);
    	m.addAttribute("totalElements", totalElements);
    	
    	return page.getContent();
    	
    }
}
