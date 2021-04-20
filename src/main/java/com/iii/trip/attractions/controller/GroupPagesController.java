package com.iii.trip.attractions.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.iii.trip.attractions.model.TravelGroupBean;
import com.iii.trip.attractions.model.TravelGroupDateBean;
import com.iii.trip.attractions.service.GroupPagesService;

@Controller
@SessionAttributes(names = { "totalPages", "totalElements" })
public class GroupPagesController {
	
	@Autowired
	private GroupPagesService groupPagesService;
	
	
	
	//讀取所有行程
	@GetMapping("/travelGroup.groupHome")
    public String getAllGroups(Model m) {
    	List<TravelGroupBean> getAllGroups = groupPagesService.findAll(); 
    	m.addAttribute("getAllGroups",getAllGroups);
    	return  "/attractions/groupHome";
    }

	//讀取所有行程(依瀏覽人次排名)
    @PostMapping("/findAllGroupByCountDesc")
    @ResponseBody
    public List<TravelGroupBean> findAllGroupByCountDesc() {
    	System.out.println(groupPagesService.findAllByCountDesc());
    	
    	return groupPagesService.findAllByCountDesc();
    }
    
    //讀取行程的所有開團日期
    @PostMapping("/travelGroup/getAllGroupsDate")
    public @ResponseBody Map<String, Object> getAllGroupsDateMain(@RequestParam("id") Integer id,HttpServletRequest request){
 		
    	TravelGroupBean findByGroupId =  groupPagesService.findByPk(id);
     	List<TravelGroupDateBean> GroupDateId =findByGroupId.getTravelGroupBeanId();
     	System.out.println("GID"+GroupDateId.size());
     	
     	HttpSession session =request.getSession();
     	
     	session.removeAttribute("GroupDateAll");
     	session.removeAttribute("GroupDatesize");
     	System.out.println(GroupDateId.get(0).getId());
     	session.setAttribute("GroupDateAll",GroupDateId);
     	session.setAttribute("GroupDatesize",GroupDateId.size());
     	
     	Map<String, Object> map  =new HashMap<String, Object>();
     	map.put("url", "http://localhost:8080/goToGroupDateTable");
       return map ;
    
    }
    
    
	//groupDateTable-行程日期人數頁面
    @GetMapping("/goToGroupDateTable")
    public String  groupDateTable() {
    	return "/attractions/groupDateTable";
    }
    
	//新增日期
	@GetMapping("/groupDateI.controller")
	public @ResponseBody String saveAndFlushGroup() {
		Map<String, Object> map = new HashMap<String, Object>();
			 String date="2021-04-29";

		     Integer id =2;
		
			try {
			 //建立時間
				TravelGroupDateBean travelGroupDateBean =new TravelGroupDateBean(date,20,0);
			 //收尋套裝行程
				groupPagesService.saveAndFlush(id,travelGroupDateBean);
			 //新增到套裝行程的時間
			    
			 //存檔
			   
			    map.put("success", "成功");
			} catch (Exception e) {
				map.put("fail", "失敗：" + e.getMessage());
			}
		return "OK----------" + date+ "      id" +id;
    }

	
	//查詢行程By name Or counties
	@PostMapping("/findgGroupByNameOrCounties/{searchName}/{searchOrigin}/{searchDestination}")
    @ResponseBody
    public List<TravelGroupBean> findgGroupByNameOrDestination(@PathVariable("searchName") String name,@PathVariable("searchOrigin") String origin, 
    		@PathVariable("searchDestination") String destination) {
		System.out.println("name--------------" + name);
		System.out.println("origin--------------" + origin);
		System.out.println("destination--------------" + destination);
		if("null".equals(name) && "null".equals(origin) && "null".equals(destination) ) {
		}
		//查詢行程BY name
		if(!"null".equals(name) && "null".equals(origin) && "null".equals(destination)) {
			return groupPagesService.findByNameLike("%"+name+"%");
		}
		
		//查詢行程BY origin
		if("null".equals(name) && !"null".equals(origin) && "null".equals(destination) ) {
			return groupPagesService.findByOrigin(origin);
		}
		
		//查詢行程BY destination
		if("null".equals(name) && "null".equals(origin) && !"null".equals(destination) ) {
			return groupPagesService.findByDestination(destination);
		}
		//查詢行程BY Origin destination
		if("null".equals(name) && !"null".equals(origin) && !"null".equals(destination) ) {
			return groupPagesService.findByOriginAndDestination(origin,destination);
		}
//		System.out.println(attractionsPagesService.findByNameOrCounties(name, counties));
        return groupPagesService.findByNameOrDestination(name, destination);
    }


    //行程分頁功能
    @PostMapping("/queryAllGroupByPage.controller/{pageNo}")
    @ResponseBody
    public List<TravelGroupBean> queryAllGroupByPage(@PathVariable(name = "pageNo") int pageNo, Model m) {
    	

    	int pageSize = 9;
    	Pageable pageable = PageRequest.of(pageNo-1, pageSize);
    	Page<TravelGroupBean> page = groupPagesService.findAllByPage(pageable);
    	
    	int totalPages = page.getTotalPages();
    	long totalElements = page.getTotalElements();
    	m.addAttribute("totalPages", totalPages);
    	m.addAttribute("totalElements", totalElements);
    	
    	return page.getContent();
    }
}
