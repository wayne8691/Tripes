package com.iii.trip.member.action;

import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import com.iii.trip.member.model.BrowseRecordBean;
import com.iii.trip.member.model.MemberBean;
import com.iii.trip.member.service.LoginService;

@SessionAttributes({ "loginuser", "browserpagelength" })
@Controller
public class memberPageController {

	@Autowired
	private LoginService loginService;

	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

	@GetMapping(path = "/bsrecord.controller")
	public String bsrecordAction(Model m, HttpSession session) {
		MemberBean loginuser = (MemberBean) session.getAttribute("loginuser");
		if (session.getAttribute("loginuser") != null) {

			List<BrowseRecordBean> list = loginService.getBrowserRecord(loginuser.getUserid());
			int pages = 1;
			if (list.size() == 0) {
				pages = 0;
			} else if (list.size() % 3 == 0) {
				pages = list.size() / 3;
			} else {
				pages = list.size() / 3 + 1;
			}
			m.addAttribute("browserpagelength", pages);
		}
		return "member/browserrecord";
	}

	@GetMapping(path = "/success")
	public String successAction() {
		return "member/success";
	}

	@RequestMapping(path = "/test2", method = RequestMethod.GET)
	public String test2Action() {
		return "member/test2";
	}

	@RequestMapping(path = "/test", method = RequestMethod.GET)
	public String testAction() {
		return "member/test";
	}

	@RequestMapping(path = "/managementindex", method = RequestMethod.GET)
	public String TripWebMainAqwection() {
		return "managementindex";
	}

	@RequestMapping(path = "/login.controller", method = RequestMethod.GET)
	public String loginAction(HttpSession session) {
		MemberBean loginuser = (MemberBean) session.getAttribute("loginuser");
		if (loginuser != null) {
			return "redirect:/";
		} else {
			return "member/login";
		}

	}

	@RequestMapping(path = "/emailcheck.controller", method = RequestMethod.GET)
	public String emailcheckAction(HttpSession session) {
		MemberBean loginuser = (MemberBean) session.getAttribute("loginuser");
		if (loginuser != null) {
			return "redirect:/";
		} else {
			return "member/emailcheck";
		}

	}

	@RequestMapping(path = "/register.controller", method = RequestMethod.GET)
	public String registerAction(HttpSession session, SessionStatus sessionStatus) {
		MemberBean registermb = (MemberBean) session.getAttribute("registeruser");
		if (registermb != null) {
			sessionStatus.setComplete();
			session.removeAttribute("registeruser");
		}
		MemberBean loginuser = (MemberBean) session.getAttribute("loginuser");
		if (loginuser != null) {
			return "redirect:/";
		} else {
			return "member/register";
		}

	}

	@GetMapping(path = "/forgetpwd.controller")
	public String forgetAction(HttpSession session) {
		MemberBean loginuser = (MemberBean) session.getAttribute("loginuser");
		if (loginuser != null) {
			return "redirect:/";
		} else {
			return "member/forgetpwd";
		}

	}

	@GetMapping(path = "/userprofile.controller")
	public String userprofileAction() {
		return "member/userprofile";
	}

	@GetMapping(path = "/userpassword.controller")
	public String userpasswordAction() {
		return "member/userpassword";
	}

	@GetMapping(path = "/googleregister.controller")
	public String googleregisterAction(HttpSession session) {
		MemberBean loginuser = (MemberBean) session.getAttribute("loginuser");
		if (loginuser != null) {
			return "redirect:/";
		} else {
			return "member/googleregister";
		}

	}

	@GetMapping(path = "/managememberchart.controller")
	public String managememberchartAction() {
		return "member/managememberchart";
	}

	@GetMapping(path = "/404")
	public String error404() {
		return "member/404";
	}
	
	@GetMapping(path = "/400")
	public String error400() {
		return "member/400";
	}
	
	@GetMapping(path = "/500")
	public String error500() {
		return "member/500";
	}

}
