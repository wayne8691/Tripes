package com.iii.trip.member.action;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.iii.trip.attractions.model.AttractionsBean;
import com.iii.trip.attractions.model.RestaurantBean;
import com.iii.trip.attractions.model.TravelGroupBean;
import com.iii.trip.member.model.MemberBean;
import com.iii.trip.member.service.ManageService;
import com.iii.trip.trainandhotel.repository.Hotel;

@Controller
@SessionAttributes({ "lastlogintime", "summembers", "allmembers", "loginmanager", "loginrecord", "statusnumbers" })
public class manageController {
	@Autowired
	ManageService manageService;
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

	@GetMapping(path = "/manageAllMembers")
	public String showMembers(Model m) throws ParseException {
		List<MemberBean> list = manageService.getAllmembers();
		List<String> lastlogintime = new ArrayList<String>();
		for (int i = 0; i < list.size(); i++) {
			int last;
			int last0;
			if (list.get(i).getLast_logintime() != null) {
				Date date = sdf.parse(list.get(i).getLast_logintime());
				System.out.println(date);
				Date date1 = new Date();
				last0 = (int) ((date1.getTime() - date.getTime()) / (60 * 1000));
				last = (int) ((date1.getTime() - date.getTime()) / (60 * 60 * 1000));
			} else {
				last = -1;
				last0 = -1;
			}
			if (last < 24 && last >= 1) {
				lastlogintime.add((last % 24) + "小時前");
			} else if (last >= 24) {
				lastlogintime.add((last / 24) + "天前");
			} else if (last < 1 && last >= 0 && list.get(i).getLogin_status() == 1) {
				lastlogintime.add("線上");
			} else if (last < 1 && last >= 0 && list.get(i).getLogin_status() == 0) {
				lastlogintime.add(((last0) % 60) + "分鐘前");
			} else if (last < 0) {
				lastlogintime.add("尚未登入過");
			}

			System.out.println(lastlogintime.get(i));

		}

		if (list.size() == 0) {
			m.addAttribute("summembers", 1);
		} else {
			m.addAttribute("lastlogintime", lastlogintime);
			m.addAttribute("allmembers", list);
			m.addAttribute("summembers", list.size());
		}

		return "member/manageAllmembers";
	}

	@PostMapping(path = "/updatestatus")
	@ResponseBody
	public String updateStatusAction(@RequestParam("userid") String userid, @RequestParam("status") String status) {
		System.out.println(userid + status);
		manageService.updateStatus(userid, status);
		return "";
	}

	@PostMapping(path = "/findthismember")
	@ResponseBody
	public List<MemberBean> findthismemberAction(@RequestParam("userid") String userid) {
		List<MemberBean> list = manageService.findthisMember(userid);
		return list;
	}

	@PostMapping(path = "/getcustomernum")
	@ResponseBody
	public Map<String, Object> forindexAction() {
		Map<String, Object> map = new HashMap<String, Object>();
		List<MemberBean> list = manageService.getAllmembers1();
		List<MemberBean> list2 = manageService.getAllAdmin();
		List<Integer> list3 = manageService.getStatus();
		List<Integer> list4 = manageService.getArea();
		List<Integer> list5 = manageService.get7dayrecord();
		List<Integer> list6 = manageService.getAge();
		map.put("list1", list);
		map.put("list2", list2);
		map.put("list3", list3);
		map.put("list4", list4);
		map.put("list5", list5);
		map.put("list6", list6);
		return map;
	}

	@PostMapping(path = "/getotherInf")
	@ResponseBody
	public Map<String, Object> getotherInfAction() {
		Map<String, Object> map = new HashMap<String, Object>();
		List<Integer> list0 = manageService.getatreSum();
		List<AttractionsBean> list = manageService.getAAttractions();
		List<RestaurantBean> list2 = manageService.getRestaurants();
		List<Integer> list3 = manageService.getAttractionsArea();
		List<Integer> list4 = manageService.getRestaurantsArea();
		List<Object[]> list5 = manageService.getTravel();
		List<Integer> list6 = new ArrayList<Integer>();
		List<Object[]> list7 = manageService.getHotelnum();
		List<Integer> list8 = new ArrayList<Integer>();
		List<TravelGroupBean> tr1 = new ArrayList<TravelGroupBean>();
		List<Hotel> tr2 = new ArrayList<Hotel>();
		int i = 0,j=0;
		for (Object[] oa : list5) {
			if (i >= 3) {
				break;
			}
			tr1.add(manageService.getbytrpk((int) oa[0]).get(0));
			list6.add((int) oa[1]);
			System.out.println(oa[0] + "," + oa[1]);
			System.out.println(tr1.get(i).getName());
			i++;
		}
		
		for (Object[] oa : list7) {
			if (j >= 3) {
				break;
			}
			tr2.add(manageService.getbyhtpk((String) oa[0]).get(0));
			list8.add((int) oa[1]);
			System.out.println(oa[0] + "," + oa[1]);
			System.out.println(tr2.get(j).getName());
			j++;
		}
		
//		List<Integer> list6 = manageService.getAge();
		map.put("list0", list0);
		map.put("list1", list);
		map.put("list2", list2);
		map.put("list3", list3);
		map.put("list4", list4);
		map.put("tr1", tr1);
		map.put("tr2", tr2);
		map.put("list6", list6);
		map.put("list7", list7);
		map.put("list8", list8);
		return map;
	}

}
