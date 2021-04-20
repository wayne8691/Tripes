package com.iii.trip.attractions.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import com.iii.trip.attractions.model.AttractionsBean;
import com.iii.trip.attractions.model.TravelGroupBean;
import com.iii.trip.attractions.service.AttractionsPagesService;
import com.iii.trip.attractions.service.GroupService;
import com.iii.trip.member.model.BrowseRecordBean;
import com.iii.trip.member.model.MemberBean;
import com.iii.trip.member.service.LoginService;



@Controller
public class FindViewController {
	@Autowired
	private LoginService loginService;
	@Autowired
	@Qualifier("TravelGroupBean")
	GroupService groupService;
	@Autowired
	private AttractionsPagesService attractionsPagesService;

//套裝行程-使用者主頁面
	@GetMapping("/showAllGroup.UserGroupHome")
	public String showAllGroup(Model model) {
    	int pageSize = 9;
    	Pageable pageable = PageRequest.of(1, pageSize);
    	Page<AttractionsBean> page = attractionsPagesService.findAllByPage(pageable);
    	int totalPages = page.getTotalPages();
    	model.addAttribute("totalPages", totalPages);
		return "attractions/userGroupHome" ;
	}
//套裝行程-管理者
	
//	//顯示所有行程
//	@GetMapping("/travelGroup.groupHome")
//    public String getAllGroups() {
//    	return "/attractions/groupHome" ;
//    }
//	
	

	//AtInitForm-新增行程
	@GetMapping("/GroupInitMain.GroupInitForm")
	public String GroupInitMain() {
		
		return "attractions/groupInitForm";
	}
	// 讀取並傳回單筆行程資料
	@GetMapping(value = "/groupConfirm/{key}", produces = { "application/json" })
	public String groupConfirm(@PathVariable Integer key, Model model,HttpSession session) {
		/*瀏覽紀錄*/
		if(session.getAttribute("loginuser")!=null) {
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			MemberBean loginuserid = (MemberBean) session.getAttribute("loginuser");
			BrowseRecordBean browseRecordBean = new BrowseRecordBean(groupService.getGroupById(key).getName(),loginuserid.getUserid(),sdf.format(new Date()),"group");
			loginService.browserrecord(browseRecordBean);	
		}
		/*------*/
		model.addAttribute("id", key);
		return "attractions/groupConfirm";
	}
	
	
	
	

	
//景點-使用者
	//AtUserHomeg-景點主頁面
	@GetMapping("/showAllAttractions.UserAtHome")
	public String showAllAttractionsUserAtHome(Model model) {
    	int pageSize = 9;
    	Pageable pageable = PageRequest.of(0, pageSize);
    	Page<AttractionsBean> page = attractionsPagesService.findAllByPage(pageable);
    	int totalPages = page.getTotalPages();
    	model.addAttribute("totalPages", totalPages);
		return "attractions/userAtHome" ;
	}	
	//userAtDisplay-跳轉顯示景點介紹
	@GetMapping(value ="/userAtDisplay/{key}", produces = { "application/json" })
	public String userAtDisplay(@PathVariable Integer key, Model model) {
		model.addAttribute("pk", key);
		return "attractions/userAtDisplay" ;
	}	
	
//景點-管理者
	//AtHome-景點主頁面
	@GetMapping("/attractionsMain.controller")
	public String attractionsMainPage(Model model) {
    	int pageSize = 9;
    	Pageable pageable = PageRequest.of(0, pageSize);
    	Page<AttractionsBean> page = attractionsPagesService.findAllByPage(pageable);
    	int totalPages = page.getTotalPages();
    	long totalElements = page.getTotalElements();
    	model.addAttribute("totalPages", totalPages);
    	model.addAttribute("totalElements", totalElements);
		return "attractions/atHome";
	}
	
	//AtInitForm-新增景點
	@GetMapping("/atInitMain.AtInitForm")
	public String attractionsInitMainPage() {
		return "attractions/atInitForm";
	}
	
	// 讀取並傳回單筆景點資料
	@GetMapping(value = "/attractionsEdit/{key}", produces = { "application/json" })
	public String atupdate(@PathVariable Integer key, Model model) {
		model.addAttribute("pk", key);
		return "attractions/atUpdateForm";
	}
	
	
//餐廳-使用者
		@GetMapping("/showAllRestaurant.UserReHome")
		public String showAllRestaurantUserReHome(Model model) {
	    	int pageSize = 9;
	    	Pageable pageable = PageRequest.of(0, pageSize);
	    	Page<AttractionsBean> page = attractionsPagesService.findAllByPage(pageable);
	    	int totalPages = page.getTotalPages();
	    	model.addAttribute("totalPages", totalPages);
			return "attractions/userReHome" ;
		}		
		
		//userReDisplay-跳轉顯示餐廳介紹
		@GetMapping(value ="/userReDisplay/{key}", produces = { "application/json" })
		public String userReDisplay(@PathVariable Integer key, Model model) {
			model.addAttribute("pk", key);
			return "attractions/userReDisplay" ;
		}	
//餐廳-管理者		
		//ReHome-餐廳主頁面
		@GetMapping("/restaurantMain.controller")
		public String restaurantMainPage(Model model) {
	    	int pageSize = 9;
	    	Pageable pageable = PageRequest.of(0, pageSize);
	    	Page<AttractionsBean> page = attractionsPagesService.findAllByPage(pageable);
	    	int totalPages = page.getTotalPages();
	    	long totalElements = page.getTotalElements();
	    	model.addAttribute("totalPages", totalPages);
	    	model.addAttribute("totalElements", totalElements);
			return "attractions/reHome";
		}
		
		//ReInitForm-新增餐廳
		@GetMapping("/reInitMain.controller")
		public String restaurantInitMainPage() {
			return "attractions/reInitForm";
		}

		// 讀取並傳回單筆餐廳資料
		@GetMapping(value = "/restaurantEdit/{key}", produces = { "application/json" })
		public String reUpdate(@PathVariable Integer key, Model model) {
			model.addAttribute("pk", key);
			return "attractions/reUpdateForm";
		}

		
		
}
