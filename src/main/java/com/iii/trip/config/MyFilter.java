package com.iii.trip.config;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;

import com.iii.trip.member.model.LoginInfBean;
import com.iii.trip.member.model.MemberBean;
import com.iii.trip.member.service.LoginRecordService;

/**
 * Servlet Filter implementation class MyFilter
 */
@WebFilter({ "/shoppingcart/*", "/managementindex", "/userprofile.controller", "/bsrecord.controller",
		"/userpassword.controller", "/userloginrecord.controller", "/managememberchart.controller",
		"/manageAllMembers" })
public class MyFilter extends HttpFilter {

	private static final long serialVersionUID = 1L;
	@Autowired
	private LoginRecordService loginrecordService;
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

	
	public void doFilter(HttpServletRequest req, HttpServletResponse res, FilterChain chain)
			throws IOException, ServletException {
		
		HttpSession session = req.getSession();
		MemberBean memberBean = (MemberBean) session.getAttribute("loginuser");
		if (memberBean != null) {
			LoginInfBean loginInfBean = (LoginInfBean) session.getAttribute("loginrecord");
			loginInfBean.setLogout_time(sdf.format(new Date()));
			loginrecordService.updateLogout(loginInfBean);
			chain.doFilter(req, res);

		} else {
			res.sendRedirect(req.getContextPath() + "/login.controller");
//			res.sendRedirect("http://localhost:8080/TripWeb/login.controller");
		}

	}

}
