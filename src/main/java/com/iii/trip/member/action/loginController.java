package com.iii.trip.member.action;

import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Base64;
import java.util.Base64.Encoder;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;
import java.util.regex.Pattern;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import com.iii.trip.member.model.BrowseRecordBean;
import com.iii.trip.member.model.CitytownBean;
import com.iii.trip.member.model.LoginInfBean;
import com.iii.trip.member.model.MemberBean;
import com.iii.trip.member.service.LoginRecordService;
import com.iii.trip.member.service.LoginService;
import com.iii.trip.member.service.RegisterService;
import com.iii.trip.trainandhotel.repository.HotelRepository;

@Controller
@SessionAttributes({ "registeruser", "loginuser", "loginrecord", "loginrecordlist", "browserlength",
		"browserpagelength" })
public class loginController {

	@Autowired
	private HotelRepository hotelRepo;
	@Autowired
	private LoginService loginService;
	@Autowired
	private RegisterService registerService;
	@Autowired
	private LoginRecordService loginrecordService;

	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

	// google登入
	@PostMapping("/GoogleSignin")
	@ResponseBody
	public Map<String, Object> googleSignin(@RequestBody MemberBean memberBean, Model m, HttpServletRequest req,
			HttpServletResponse response) {
		Map<String, Object> map = new HashMap<String, Object>();

		if (!(registerService.checkMemId(memberBean.getUserid()))) {
			m.addAttribute("registeruser", memberBean);
			map.put("success", "登入成功，請先填寫完整資料！");
			map.put("url", req.getContextPath() + "/googleregister.controller");
		} else if (registerService.checkMemId(memberBean.getUserid())) {
			// 將失敗次數歸0
			loginService.resetFail(memberBean.getUserid());
			// 取得會員資料
			MemberBean userinf = loginService.getLoginInf(memberBean);
			// 紀錄登入時間
			LoginInfBean lib = new LoginInfBean();
			lib.setLogin_time(sdf.format(new Date()));
			lib.setLogout_time(sdf.format(new Date()));
			lib.setUserid(memberBean.getUserid());
			loginrecordService.saveLoginRecord(lib);
			// 將登入資訊存入session
			m.addAttribute("loginrecord", lib);
			m.addAttribute("loginuser", userinf);
			map.put("success", "登入成功");
			map.put("url", req.getContextPath() + "/");
			// 儲存cookie
			Cookie cookie = new Cookie("loginuser", memberBean.getUserid());// 創建一個 cookie對象
			cookie.setPath("/");
			cookie.setMaxAge(86400 * 7);
			response.addCookie(cookie);
		}
		return map;
	}

	// 登入
	@PostMapping(value = "/loginaction")
	@ResponseBody
	public Map<String, Object> loginAction(@RequestParam String userid, @RequestParam String password,
			@RequestParam String checkbox, Model m, HttpServletResponse response)
			throws NoSuchAlgorithmException, UnsupportedEncodingException, ParseException {

		Map<String, Object> map = new HashMap<String, Object>();
		LoginInfBean lib = new LoginInfBean();
		MemberBean base = loginService.getBaseData(userid);
		lib.setLogin_time(sdf.format(new Date()));
		lib.setLogout_time(sdf.format(new Date()));
		lib.setUserid(base.getUserid());

		MessageDigest md = MessageDigest.getInstance("SHA-256");
		Encoder encoder = Base64.getEncoder();
		String salted = password + base.getSalt();
		md.update(salted.getBytes("UTF-8"));
		byte[] digest = md.digest();
		String encodepassword = encoder.encodeToString(digest);
		Date date;
		Date date1;
		int last = 31;
		if (base.getFail_time() != null) {
			date = sdf.parse(base.getFail_time());
			date1 = new Date();
			last = (int) ((date1.getTime() - date.getTime()) / (1000));
		}

		// 登入失敗：帳號不存在
		if (!(registerService.checkMemId(base.getUserid()))) {
			map.put("idfail", "帳號不存在");
		}
		// 登入失敗：已被停權
		else if (base.getStatus().equals("z_Suspension")) {
			map.put("stopfail", "此帳號已停權");
		}
		// 登入失敗帳號鎖定中
		else if (base.getFail_count() >= 3 && (last % 60 <= 15)) {
			map.put("pwdfail", "帳號已鎖定,請" + (15 - (last % 60)) + "秒後在試");
			System.out.println(last % 60);

		}
		// 登入失敗：帳號未認證，導向驗證畫面
		else if (base.getStatus().equals("y_Notcertified") && (base.getPassword().equals(encodepassword))) {
			m.addAttribute("registeruser", base);
			map.put("verify", "帳號未認證");

		}
		// 登入成功：普通會員
		else if (base.getStatus().equals("c_Member") && (base.getPassword().equals(encodepassword))) {
			// 將失敗次數歸0
			loginService.resetFail(base.getUserid());
			MemberBean userinf = loginService.getLoginInf(base);
			loginrecordService.saveLoginRecord(lib);
			m.addAttribute("loginrecord", lib);
			m.addAttribute("loginuser", userinf);
			map.put("success", "登入成功");
			// 儲存cookie
			if (checkbox.equals("true")) {
				Cookie cookie = new Cookie("loginuser", userid);// 創建一個 cookie對象
				cookie.setPath("/");
				cookie.setMaxAge(86400 * 7);
				response.addCookie(cookie);
			}

		}
		// 登入成功：管理員
		else if (base.getStatus().equals("b_Manager") && (base.getPassword().equals(encodepassword))) {
			// 將失敗次數歸0
			loginService.resetFail(base.getUserid());
			MemberBean userinf = loginService.getLoginInf(base);
			loginrecordService.saveLoginRecord(lib);
			m.addAttribute("loginrecord", lib);
			m.addAttribute("loginuser", userinf);
			map.put("success", "登入成功");
			// 儲存cookie
			if (checkbox.equals("true")) {
				Cookie cookie = new Cookie("loginuser", userid);// 創建一個 cookie對象
				cookie.setPath("/");
				cookie.setMaxAge(86400 * 7);
				response.addCookie(cookie);
			}

		}
		// 登入成功：最高權限使用者
		else if (base.getStatus().equals("a_Admin") && (base.getPassword().equals(encodepassword))) {
			// 將失敗次數歸0
			loginService.resetFail(base.getUserid());
			MemberBean userinf = loginService.getLoginInf(base);
			loginrecordService.saveLoginRecord(lib);
			m.addAttribute("loginrecord", lib);
			m.addAttribute("loginuser", userinf);
			map.put("success", "登入成功");
			// 儲存cookie
			if (checkbox.equals("true")) {
				Cookie cookie = new Cookie("loginuser", userid);// 創建一個 cookie對象
				cookie.setPath("/");
				cookie.setMaxAge(86400 * 7);
				response.addCookie(cookie);
			}

		}
		// 登入失敗：密碼錯誤
		else {
			loginService.updateFailCount(base);
			map.put("pwdfail", "密碼錯誤");
		}
		return map;
	}

	@PostMapping("/forgetpwd")
	@ResponseBody
	public Map<String, Object> forgetpwdAction(@RequestParam("userid") String userid) {
		Map<String, Object> map = new HashMap<String, Object>();
		MemberBean forgetmb = new MemberBean();
		String newpwd = getRandomPassword();
		// 判斷帳號是否存在
		if (!(registerService.checkMemId(userid))) {
			map.put("fail", "帳號不存在");
			return map;
		}
		// 尋找帳號與寄送新密碼
		else {
			forgetmb = loginService.forgetPassword(userid, newpwd);
		}

		// 寄信
		String host = "smtp.gmail.com";
		int port = 587;
		final String username = "eeit12601@gmail.com";
		final String password = "eeit123456";// your password

		Properties props = new Properties();
		props.put("mail.smtp.host", host);
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.starttls.enable", "true");
		props.put("mail.smtp.port", port);
		Session session = Session.getInstance(props, new Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(username, password);
			}
		});

		try {

			Message message = new MimeMessage(session);
			message.setFrom(new InternetAddress("eeit12601@gmail.com"));
			message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(forgetmb.getEmail()));
			message.setSubject("已重設新密碼");
			message.setText(" 帳號：" + forgetmb.getUserid() + " !" + "\r\n" + " 新密碼：" + newpwd + " !");
			Transport transport = session.getTransport("smtp");
			transport.connect(host, port, username, password);

			Transport.send(message);

			System.out.println("寄送email結束.");
			map.put("success", "已成功寄信到信箱");
			map.put("email", forgetmb.getEmail());
		} catch (MessagingException e) {
			map.put("fail", "false");
			throw new RuntimeException(e);
		}

		return map;
	}

	@GetMapping("/quicklogin/{key}")
	public String quickloginAction(@PathVariable("key") String userid, Model m, HttpServletResponse response,
			HttpServletRequest request) {

		MemberBean loginuser = new MemberBean();
		LoginInfBean lib = new LoginInfBean();
		lib.setLogin_time(sdf.format(new Date()));
		lib.setLogout_time(sdf.format(new Date()));
		lib.setUserid(userid);

		loginuser.setUserid(userid);
		loginuser = loginService.getLoginInf(loginuser);
		loginrecordService.saveLoginRecord(lib);
		m.addAttribute("loginrecord", lib);
		m.addAttribute("loginuser", loginuser);
		Cookie cookie = new Cookie("loginuser", loginuser.getUserid());// 創建一個 cookie對象
		cookie.setPath("/");
		cookie.setMaxAge(86400 * 7);
		response.addCookie(cookie);

		return "redirect:/";
	}

	@PostMapping(value = "/upadateimageaction")
	@ResponseBody
	public Map<String, Object> upadateimageAction(@RequestBody MemberBean memberBean, HttpServletRequest request,
			Model m) {
		Map<String, Object> map = new HashMap<String, Object>();

		if (memberBean.getImage1().equals("")) {
			map.put("fail", "請選擇要修改的照片");
			return map;
		}
		MemberBean loginuser = (MemberBean) m.getAttribute("loginuser");
		byte[] sb = memberBean.getImage1().getBytes();
		try {
			loginService.saveImage(memberBean.getUserid(), sb);
			map.put("success", "修改成功");
			loginuser.setImage(sb);
			loginuser.setImage1(memberBean.getImage1());
			m.addAttribute("loginuser", loginuser);
		} catch (Exception e) {
			map.put("fail", e.getMessage());
		}

		return map;
	}

	@PostMapping(value = "/upadatepersonalaction")
	@ResponseBody
	public Map<String, Object> upadatepersonalAction(@RequestBody MemberBean memberBean, Model m) {
		Map<String, Object> map = new HashMap<String, Object>();
		//|| memberBean.getB_address().equals("")
		if (memberBean.getA_address().equals("") || memberBean.getC_address().equals("")) {
			map.put("fail", "欄位不能為空");
			return map;
		}
		if (memberBean.getName().equals("") || memberBean.getPhone().equals("")) {
			map.put("fail", "資料欄不能為空");
			return map;
		}
		MemberBean loginuser = (MemberBean) m.getAttribute("loginuser");
		System.out.println(memberBean.getImage());
		try {

			loginService.upadatePersonal(memberBean);
			map.put("success", "修改成功");
			map.put("changename", memberBean.getName());
			loginuser.setName(memberBean.getName());
			loginuser.setPhone(memberBean.getPhone());
			loginuser.setA_address(memberBean.getA_address());
			loginuser.setB_address(memberBean.getB_address());
			loginuser.setC_address(memberBean.getC_address());
			m.addAttribute("loginuser", loginuser);
		} catch (Exception e) {
			map.put("fail", e.getMessage());
		}
		return map;
	}

	@PostMapping("/searchtown")
	@ResponseBody
	public List<CitytownBean> getAllEmployee(@RequestParam("city") String city) {
		return loginService.searchTown(city);
	}

	@PostMapping(value = "/upadatePwdaction")
	@ResponseBody
	public Map<String, Object> upadatePwdAction(@RequestParam String newpassword, @RequestParam String confirmpassword,
			@RequestParam String userid, HttpSession session, SessionStatus sessionStatus, Model m) {
		Map<String, Object> map = new HashMap<String, Object>();
		LoginInfBean loginrecord = (LoginInfBean) m.getAttribute("loginrecord");
		MemberBean loginuserid = (MemberBean) m.getAttribute("loginuser");
		String ckpwd = "^(?=.*[A-Za-z])(?=.*\\d)[A-Za-z\\d]{8,}$";

		if (newpassword.equals("") || confirmpassword.equals("")) {
			map.put("fail", "欄位不能為空");
			return map;
		}
		if (!Pattern.matches(ckpwd, newpassword)) {
			map.put("fail", "*(需含數字與大小寫英文,必須大於8個字)");
		}
		if (!newpassword.equals(confirmpassword)) {
			map.put("fail", "請確認輸入密碼");
			return map;
		}
		try {
			loginrecord.setLogout_time(sdf.format(new Date()));
			loginuserid.setLast_logintime(sdf.format(new Date()));
			loginrecordService.updateLogout(loginrecord);
			loginService.updatLast_logintime(loginuserid);
			loginService.updatePwd(userid, newpassword);
			map.put("success", "修改成功請重新登入");

			sessionStatus.setComplete();
			session.removeAttribute("loginuser");
			session.removeAttribute("loginrecord");
		} catch (Exception e) {
			map.put("fail", e.getMessage());
		}
		return map;
	}

	@GetMapping(path = "/userloginrecord.controller")
	public String userrecordAction(Model m) {
		MemberBean loginuserid = (MemberBean) m.getAttribute("loginuser");
		List<LoginInfBean> list = loginrecordService.getAllRecord(loginuserid.getUserid());
		m.addAttribute("loginrecordlist", list);
		return "member/userloginrecord";
	}

	@GetMapping(path = "/getbrowserrecord")
	@ResponseBody
	public Map<String, Object> getbrowserrecordAction(Model m, HttpServletRequest req) {
		Map<String, Object> map = new HashMap<String, Object>();
		MemberBean loginuser = (MemberBean) m.getAttribute("loginuser");
		List<BrowseRecordBean> list = loginService.getBrowserRecord(loginuser.getUserid());
		List<String> list1 = new ArrayList<String>();
		List<String> list2 = new ArrayList<String>();
		List<String> list3 = new ArrayList<String>();
		int data = 3;
		if (list.size() == 0) {
			data = 0;
		} else if (list.size() == 1) {
			data = 1;
		} else if (list.size() == 2) {
			data = 2;
		} else {
			data = 3;
		}
		map.put("list", list);
		for (int i = 0; i < data; i++) {
			if (list.get(i).getCategory().equals("hotel")) {
				list1.add(hotelRepo.findByName(list.get(i).getBrowserecord()).get(0).getAddress());
				list2.add(hotelRepo.findByName(list.get(i).getBrowserecord()).get(0).getPic());
				list3.add("./rooms?name=" + hotelRepo.findByName(list.get(i).getBrowserecord()).get(0).getId());
			} else if (list.get(i).getCategory().equals("group")) {
				list1.add(loginService.getGroupByName(list.get(i).getBrowserecord()).get(0).getDestination());
				list2.add(loginService.getGroupByName(list.get(i).getBrowserecord()).get(0).getImage());
				list3.add(req.getContextPath() + "groupConfirm/"
						+ loginService.getGroupByName(list.get(i).getBrowserecord()).get(0).getId());
			}
		}
		map.put("list1", list1);
		map.put("list2", list2);
		map.put("list3", list3);
		map.put("countt", data);
		return map;
	}

	@GetMapping("/browserrecordpages/{key}")
	@ResponseBody
	public Map<String, Object> browserrecordAction(@PathVariable("key") int page, Model m, HttpServletRequest req) {

		Map<String, Object> map = new HashMap<String, Object>();
		MemberBean loginuser = (MemberBean) m.getAttribute("loginuser");
		List<BrowseRecordBean> list = loginService.getBrowserRecord(loginuser.getUserid());
		/* 圖片 */
		List<String> list1 = new ArrayList<String>();
		/* 紀錄 */
		List<String> list2 = new ArrayList<String>();
		/* 地址 */
		List<String> list3 = new ArrayList<String>();
		/* 時間 */
		List<String> list4 = new ArrayList<String>();
		/* 網址 */
		List<String> list5 = new ArrayList<String>();
		/* 數量 */
		int init = page * 3 - 3;
		int last = page * 3;
		int total = 3;
		if (last >= list.size()) {
			total = list.size() % 3;
			if (total == 0) {
				total = 3;
			}
		}

		if (last > list.size()) {
			last = list.size();
		}
		for (int i = init; i < last; i++) {
			if (list.get(i).getCategory().equals("hotel")) {
				list1.add(hotelRepo.findByName(list.get(i).getBrowserecord()).get(0).getPic());
				list2.add(list.get(i).getBrowserecord());
				list3.add(hotelRepo.findByName(list.get(i).getBrowserecord()).get(0).getAddress());
				list4.add(list.get(i).getBrowsetime());
				list5.add("./rooms?name=" + hotelRepo.findByName(list.get(i).getBrowserecord()).get(0).getId());
			} else if (list.get(i).getCategory().equals("group")) {
				list1.add(loginService.getGroupByName(list.get(i).getBrowserecord()).get(0).getImage());
				list2.add(list.get(i).getBrowserecord());
				list3.add(loginService.getGroupByName(list.get(i).getBrowserecord()).get(0).getDestination());
				list4.add(list.get(i).getBrowsetime());
				list5.add(req.getContextPath() + "groupConfirm/"
						+ loginService.getGroupByName(list.get(i).getBrowserecord()).get(0).getId());
			}
		}

		map.put("list1", list1);
		map.put("list2", list2);
		map.put("list3", list3);
		map.put("list4", list4);
		map.put("list5", list5);
		map.put("total", total);

		return map;
	}

	@GetMapping("/logout")
	public String logoutAction(HttpSession session, SessionStatus sessionStatus, Model m, HttpServletResponse response,
			HttpServletRequest request) {
		LoginInfBean loginrecord = (LoginInfBean) m.getAttribute("loginrecord");
		MemberBean loginuserid = (MemberBean) m.getAttribute("loginuser");
		loginrecord.setLogout_time(sdf.format(new Date()));
		loginuserid.setLast_logintime(sdf.format(new Date()));

		loginrecordService.updateLogout(loginrecord);
		loginService.updatLast_logintime(loginuserid);

		sessionStatus.setComplete();
		session.invalidate();
		Cookie cUser = new Cookie("loginuser", "");
		cUser.setPath("/");
		cUser.setMaxAge(0);
		response.addCookie(cUser);

		return "redirect:/";
	}

	// 亂數產生密碼
	private String getRandomPassword() {
		int z;
		StringBuilder sb = new StringBuilder();
		int i;
		sb.append((int) ((Math.random() * 10) + 48));
		sb.append((char) (((Math.random() * 26) + 65)));
		sb.append(((char) ((Math.random() * 26) + 97)));
		for (i = 0; i < 5; i++) {
			z = (int) ((Math.random() * 7) % 3);
			if (z == 1) { // 放數字
				sb.append((int) ((Math.random() * 10) + 48));
			} else if (z == 2) { // 放大寫英文
				sb.append((char) (((Math.random() * 26) + 65)));
			} else {// 放小寫英文
				sb.append(((char) ((Math.random() * 26) + 97)));
			}
		}
		return sb.toString();
	}

}