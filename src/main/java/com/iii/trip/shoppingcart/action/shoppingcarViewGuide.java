package com.iii.trip.shoppingcart.action;

import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.iii.trip.member.model.MemberBean;
import com.iii.trip.shoppingcart.model.PaymentType;
import com.iii.trip.shoppingcart.model.ShoppingOrder;
import com.iii.trip.shoppingcart.model.TravelRollsProduct;
import com.iii.trip.shoppingcart.service.ShoppingCartService;
import com.iii.trip.shoppingcart.service.TicketService;
import com.iii.trip.shoppingcart.service.serviceImpl.ProductService;
import com.iii.trip.trainandhotel.repository.Hotel;
import com.iii.trip.trainandhotel.repository.RoomOrder;

import ecpay.payment.integration.AllInOne;
import ecpay.payment.integration.domain.AioCheckOutALL;

@Controller
public class shoppingcarViewGuide {

	@Autowired
	private ShoppingCartService hotelservice;
	final String username = "eeit12601@gmail.com";
	final String password = "eeit123456";
	@Autowired
	private TicketService ticketService;
	@Autowired
	private ProductService pS;
	@Autowired
	private ShoppingCartService hoteltservice;

	@GetMapping("/shoppingcart/car")
	public String shoppingcart(HttpSession session, HttpServletRequest request, Model m,
			@SessionAttribute("loginuser") MemberBean member) {

		List<TravelRollsProduct> sBean = hoteltservice.queryProduct(member);

		session = request.getSession();
		String pd = (String) session.getAttribute("pd");
		if (sBean.size() != 0) {
			if (sBean.get(0).getRoom_id().size() != 0 && "hotel".equals(pd)) {
				session.setAttribute("pd", "hotel");
				System.out.println("a");

			} else if (sBean.get(0).getTrain().size() != 0 && "train".equals(pd)) {
				System.out.println("b");
				session.setAttribute("pd", "train");

			} else if (sBean.get(0).getTravel().size() != 0 && "travel".equals(pd)) {
				System.out.println("c");
				session.setAttribute("pd", "travel");

			}
		}

		return "shoppingCart/shoppingcart";
	}

	@GetMapping("/shoppingMember.controller")
	public String checkMember(HttpSession session) {

		MemberBean memberBean = (MemberBean) session.getAttribute("loginuser");

		try {
			if (memberBean.getUserid() != "") {
				return "shoppingCart/shoppingcart";
			}

		} catch (NullPointerException e) {

			return "member/login";
		}

		return "member/login";

	}

	@GetMapping("/shoppingProductView.controller/{key}")
	public String shoppingProductView(@PathVariable String key, Model model) {

		char[] c = key.toCharArray();
		StringBuilder sb = new StringBuilder();

		for (int i = 3; i < c.length - 3; i++) {

			sb.append(c[i]);

		}
		String str_cos = sb.toString();

		System.out.println(str_cos);

		Integer cos = Integer.valueOf(str_cos) / 9;

		model.addAttribute("id", cos);

		return "shoppingCart/shoppingProduct";

	}

	@PostMapping("/shoppingBuy.controller")
	public @ResponseBody String shoppingBuy(HttpSession session, HttpServletRequest request,
			@SessionAttribute("loginuser") MemberBean mb, @RequestParam("pk") Integer pk, Model m) {
		System.out.println("-------------------------------------------" + pk);
		m.addAttribute("pk", pk);
		Map<String, String> map = new HashMap<String, String>();

		session = request.getSession();
		map.put("name", mb.getName());
		map.put("Email", mb.getEmail());
		map.put("phone", mb.getPhone());
		map.put("address", mb.getA_address());

		m.addAttribute("mem", map);
		session.setAttribute("pk", pk);
		session.setAttribute("mem", map);
		return "shoppingCart/buyInformation";
	}

	@GetMapping("/shoppingGoToInf.controller")
	public String shoppingGoToInf() {

		return "shoppingCart/buyInformation";

	}

//	@PostMapping(value = "/shoppingBuyOrder.controller", produces = "text/plain;charset=UTF-8")
	public Integer shoppingBuyOrder(HttpServletRequest request, String lastname, String name, String PaymentType,
			String address, String phone, String mail, MemberBean member, TravelRollsProduct tProduct) {

		HttpSession session = request.getSession();
		// 購買資料建立
		String names = lastname + name;
		PaymentType pType = new PaymentType(PaymentType, address, phone, names, mail);

		// 建立訂單
		String pattern = "yyyy-MM-dd";
		SimpleDateFormat sdf = new SimpleDateFormat(pattern);
		String now = "";
		Date date = new Date();
		now = sdf.format(date);

		ShoppingOrder addOrder = new ShoppingOrder(tProduct, pType, member.getUserid(), now, tProduct.getPrice(), 0);

		// 房間訂單
		RoomOrder[] roomOrders = new RoomOrder[addOrder.getShoppingcar_id().getRoom_id().size()];
		RoomOrder roomOrder;
		for (int i = 0; i < roomOrders.length; i++) {
			roomOrder = new RoomOrder();
			roomOrder.setCity(addOrder.getShoppingcar_id().getRoom_id().get(i).getHotel_id().getCity());
			roomOrder.setRoom(addOrder.getShoppingcar_id().getRoom_id().get(i).getHotel_id());
			roomOrder.setHotel(addOrder.getShoppingcar_id().getRoom_id().get(i).getHotel_id().getHotel());

			DateTimeFormatter lk = DateTimeFormatter.ofPattern("yyyy-MM-dd");
			LocalDate stardate = LocalDate.parse(addOrder.getShoppingcar_id().getRoom_id().get(i).getStarday(), lk);
			LocalDate enddate = LocalDate.parse(addOrder.getShoppingcar_id().getRoom_id().get(i).getEndday(), lk);
			roomOrder.setStartDate(stardate);
			roomOrder.setEndDate(enddate);
			roomOrders[i] = roomOrder;
		}

		for (int i = 0; i < roomOrders.length; i++) {
			hotelservice.roomOrderS(roomOrders[i]);

		}

		// 購物車訂單
		hotelservice.shoppingOrderFound(addOrder);
		session.removeAttribute("pk");
		session.removeAttribute("mem");
		return tProduct.getPrice();
	}

	public void toMail(ShoppingOrder order, PaymentType pType) {

		String tomail = "wayne869191@gmail.com";
		String frommail = "wayne869191@gmail.com";
		String host = "smtp.gmail.com";
		Properties props = new Properties();

		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.starttls.enable", "true");
		props.put("mail.smtp.host", host);
		props.put("mail.smtp.port", "587");

		// 創建一個連線物件
		Session session = Session.getInstance(props, new javax.mail.Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(username, password);
			}
		});
		String hotelname = order.getShoppingcar_id().getRoom_id().get(0).getHotel_id().getHotel().getName();
		String date = order.getDate();

		String room = order.getShoppingcar_id().getRoom_id().get(0).getHotel_id().getCapacity();
		String name = pType.getName();
		try {
			// 創建一個訊息物件
			Message message = new MimeMessage(session);

			message.setFrom(new InternetAddress(frommail));
			// 要寄送的mail
			message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(tomail));//
			// 送出的文字
			message.setSubject("Test");

			message.setText(name + "先生/小姐您好感謝您的購買,您在" + date + "日訂購了" + hotelname + "大飯店" + room + "人房一間,住您旅途愉快!");
			// 送出
			Transport.send(message);
		} catch (MessagingException e) {
			throw new RuntimeException(e);
		}

	}

	@GetMapping("/ShoppingOrder.controller")
	public String serachOrderGuidue(HttpSession session) {
		MemberBean member = (MemberBean) session.getAttribute("loginuser");
		try {
			if (member.getUserid() != "") {
				return "shoppingCart/searchOrder";
			}

		} catch (NullPointerException e) {
			return "member/login";
		}

		return "member/login";

	}

	@GetMapping(value = "/checkout") // 導向至購物車結帳頁面
	@SuppressWarnings("unused")
	public String checkOuter(Model model) {
//		System.out.println("checkout function initialized");
//		System.out.println("id=" + purchaseInfo);
//		System.out.println("totalValue=" + totalValue);
//		String[] allItemQuantity = purchaseInfo.split(",");
//		Map<Integer, Integer> list = new HashMap<Integer, Integer>();
//		for (String s : allItemQuantity) {
//			s.split(":");
//			list.put(Integer.parseInt(s.split(":")[0]), Integer.parseInt(s.split(":")[1]));
//		}
//
//		if (list == null) {
//			return "cart/cart";
//		} else {
//			model.addAttribute("itemQuantity", list);
//			model.addAttribute("itemTotalValue", totalValue);
		return "shoppingCart/checkout";
//		}
	}

	@PostMapping(value = "/creditCardCheckOut.concroller") // 結帳
	public @ResponseBody String genAioCheckOutAll(@RequestParam("pk") Integer pk, Model model,
			@RequestParam() String lastname, @RequestParam("name") String name, @RequestParam() String PaymentType,
			@RequestParam() String phone, @RequestParam() String mail, @RequestParam() String address,
			@SessionAttribute("loginuser") MemberBean member, HttpServletRequest request) {

		// 購物車建立
		TravelRollsProduct tProduct = new TravelRollsProduct();
		tProduct.setNumber_id(pk);
		System.out.println("-+-------" + pk);
		tProduct = hotelservice.queryProduct(tProduct);

		Integer priceInteger = shoppingBuyOrder(request, lastname, name, PaymentType, address, phone, mail, member,
				tProduct);

		StringBuilder sb = new StringBuilder();
		for (int i = 0; i < tProduct.getRoom_id().size(); i++) {
			String hitelname = tProduct.getRoom_id().get(i).getHotel_id().getHotel().getName();
			String roomname = tProduct.getRoom_id().get(i).getHotel_id().getName();
			sb.append(hitelname + roomname + tProduct.getRoom_id().get(i).getQuantity() + "#");

		}

		for (int i = 0; i < tProduct.getTrain().size(); i++) {
			String star = tProduct.getTrain().get(i).getTrain().getStart();
			String end = tProduct.getTrain().get(i).getTrain().getDest();
			sb.append(star + "出發-" + end + "到站X" + tProduct.getTrain().get(i).getQutity() + "#");
		}
		for (int i = 0; i < tProduct.getTravel().size(); i++) {
			String travelname = tProduct.getTravel().get(i).getTravelGroup().getName();

			sb.append(travelname + "#");
		}

		System.out.println(sb.toString());
		// 綠介
		AllInOne all = new AllInOne("");
		AioCheckOutALL obj = new AioCheckOutALL();
		System.out.println();

//		String amount=(String)model.getAttribute("totalValue");
		System.out.println("amount=" + (String) model.getAttribute("totalValue"));

		int romInteger = (int) (Math.random() * 999999) + 100000;
//		System.out.println("TripsdheyADEF"+romInteger);

//		obj.setRedeem("66");
		if (priceInteger <= 0) {

			priceInteger++;
		}
		obj.setMerchantTradeNo("TripsdheyADEF" + romInteger);
		obj.setMerchantTradeDate("2021/01/24 22:40:18");

		obj.setTotalAmount(String.valueOf(priceInteger));
		obj.setTradeDesc("TRIP CheckOut");
		obj.setItemName(sb.toString());

		obj.setReturnURL("http://211.23.128.214:5000");

		obj.setNeedExtraPaidInfo("N");

		obj.setClientBackURL("http://localhost:8080/");

		String form = all.aioCheckOut(obj, null);
		return form;
	}

	@PostMapping("/checkourhotel")
	public @ResponseBody String checkOuthotel(@SessionAttribute("loginuser") MemberBean member,
			@RequestParam("id") Integer id, @RequestParam("message") String message) {

		System.out.println("id=" + id);
		pS.checkOuthotel(id, message, member);

		return "shoppingCart/searchOrder";

	}

	@GetMapping("/train/tickets")
	public String Tickets() {

		return "trainandhotel/train/ticket";
	}

	@GetMapping("/home.Main")
	public String goHome() {

		return "trainandhotel/hotel/hotel";
	}

}
