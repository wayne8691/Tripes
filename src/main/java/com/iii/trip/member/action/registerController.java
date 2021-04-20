package com.iii.trip.member.action;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
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
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import com.iii.trip.member.model.MemberBean;
import com.iii.trip.member.service.RegisterService;

@Controller
@SessionAttributes({ "registeruser" })
public class registerController {
	@Autowired
	private RegisterService registerService;

	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

	// 確認註冊帳號是否存在
	@PostMapping(value = "/CheckedMemId", produces = { "application/json" })
	@ResponseBody
	public Map<String, Object> checkMemberId(@RequestParam("userid") String userid) {

		Map<String, Object> map = new HashMap<String, Object>();
		if (registerService.checkMemId(userid)) {
			map.put("msg", "已存在");
		} else {
			map.put("msg", "");
		}

		return map;
	}

	// 註冊帳號
	@PostMapping(value = "/RegisterMember")
	@ResponseBody
	public Map<String, Object> SaveMember(@RequestBody MemberBean memberBean, Model m, HttpServletRequest req,
			HttpServletResponse res) {

		Map<String, Object> map = new HashMap<String, Object>();

		String ckpwd = "^(?=.*[A-Za-z])(?=.*\\d)[A-Za-z\\d]{8,}$";
		String ckname = "^([\u4e00-\u9fa5]){2,}$";
		String ckemail = "(\\S)+[@]{1}(\\S)+[.]{1}(\\w)+";
		String ckbirthday = "^(\\d{4})(-|\\/)(\\d{1,2})\\2(\\d{1,2})$";

		if (memberBean.getUserid() == null || memberBean.getUserid().equals("")) {
			map.put("idError", "*請輸入使用者帳號");
		}

		if ((registerService.checkMemId(memberBean.getUserid()))) {
			map.put("idError", "*帳號重複");
		}

		if (!Pattern.matches(ckpwd, memberBean.getPassword())) {
			map.put("pwdError", "*(需含數字與大小寫英文,必須大於8個字)");
		}

		if (!Pattern.matches(ckname, memberBean.getName())) {
			map.put("nameError", "*(需含兩個中文字以上)");
		}

		if (!Pattern.matches(ckemail, memberBean.getEmail())) {
			map.put("emailError", "*(ex:12345678@gmail.com)");
		}

		if (!Pattern.matches(ckbirthday, memberBean.getBirthday())) {
			map.put("birthdayError", "*(YYYY-MM-DD)");
		}
		System.out.println(map.size());
		if (map.size() > 0) {
			return map;
		} else {
			byte[] sb = memberBean.getImage1().getBytes();
			memberBean.setImage(sb);
			memberBean.setRegistertime(sdf.format(new Date()));
			try {
				// 如果是第一位註冊的
				if (registerService.checkFirst()) {
					memberBean.setStatus("a_Admin");
				}
				// 一般註冊
				registerService.save(memberBean);
				map.put("success", "新增成功");
				if (!memberBean.getStatus().equals("y_Notcertified")) {
					map.put("url", req.getContextPath()+"/login.controller");
				} else {
					map.put("url", req.getContextPath()+"/emailcheck.controller");
				}
				m.addAttribute("registeruser", memberBean);
			} catch (Exception e) {
				map.put("fail", "新增失敗：" + e.getMessage());
			}

		}

		return map;
	}

	// 信箱驗證
	@PostMapping(value = "/emailCheck", produces = { "application/json" })
	@ResponseBody
	public Map<String, Object> emailCheck(@RequestParam("checknum") String checknum, Model m) {
		Map<String, Object> map = new HashMap<String, Object>();
		MemberBean registermb = (MemberBean) m.getAttribute("registeruser");
		String host = "smtp.gmail.com";
		int port = 587;
		final String username = "eeit12601@gmail.com";// 自己信箱帳號
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
			message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(registermb.getEmail()));
			message.setSubject("TripWeb信箱驗證");
			message.setText(" 驗證碼是" + checknum + "!");

			Transport transport = session.getTransport("smtp");
			transport.connect(host, port, username, password);

			Transport.send(message);

			System.out.println("寄送email結束.");
			map.put("msg", "已寄信");
		} catch (MessagingException e) {
			map.put("msg", "");
			throw new RuntimeException(e);
		}

		return map;
	}

	// 信箱驗證成功
	@PostMapping(value = "/verifysuccess", produces = { "application/json" })
	@ResponseBody
	public Map<String, Object> verifySuccess(HttpSession session, SessionStatus sessionStatus,
			HttpServletRequest request) {
		Map<String, Object> map = new HashMap<String, Object>();
		MemberBean registermb = (MemberBean) session.getAttribute("registeruser");
		registerService.updateStatus(registermb.getUserid());
		sessionStatus.setComplete();
		session.removeAttribute("registeruser");

		return map;
	}

}
