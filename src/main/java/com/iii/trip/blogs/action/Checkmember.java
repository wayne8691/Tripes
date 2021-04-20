package com.iii.trip.blogs.action;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.iii.trip.member.model.MemberBean;

@Controller
public class Checkmember {
	
	@GetMapping("/checkmember.blogs")
	public String checkMember(HttpSession session) {
		MemberBean member = (MemberBean) session.getAttribute("loginuser");
		System.out.println(member.getUserid());
		if (member.getUserid()==null) {
			return "member/login";
		}
		return "blogs/BlogHome";
	}

}
