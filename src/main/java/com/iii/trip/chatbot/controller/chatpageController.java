package com.iii.trip.chatbot.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.iii.trip.member.model.MemberBean;

@Controller
public class chatpageController {

	@GetMapping(path = "/chatrobot")
	public String successAction(HttpSession session) {
		MemberBean loginuser = (MemberBean) session.getAttribute("loginuser");
		if(loginuser != null) {
			return "member/chatrobot";
		}else {
			return "redirect:/";
		}
		
	}
	
}
