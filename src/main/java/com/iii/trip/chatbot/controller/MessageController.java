package com.iii.trip.chatbot.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.handler.annotation.DestinationVariable;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.web.bind.annotation.RestController;

import com.iii.trip.attractions.model.AttractionsBean;
import com.iii.trip.attractions.model.RestaurantBean;
import com.iii.trip.chatbot.model.MessageModel;
import com.iii.trip.chatbot.storage.UserStorage;
import com.iii.trip.member.service.LoginService;
import com.iii.trip.trainandhotel.repository.Hotel;

@RestController
public class MessageController {

	@Autowired
	private SimpMessagingTemplate simpMessagingTemplate;
	@Autowired
	private LoginService loginService;

	@MessageMapping("/chat/{to}")
	public void sendMessage(@DestinationVariable String to, MessageModel message) {
		System.out.println("handling send message: " + message + " to: " + to);
		String to1 = "robot";
		// MemberBean loginuser = (MemberBean) session.getAttribute("loginuser");
		boolean isExists = UserStorage.getInstance().getUsers().contains(to1);
		if (isExists) {
			simpMessagingTemplate.convertAndSend("/topic/messages/" + to1, message);
		}

		System.out.println(message.getMessage());
		if (message.getMessage().trim().equals("熱門飯店")) {
			returnMessage2(to);
			returnMessage3(to);
			returnMessage4(to);
		} else if(message.getMessage().trim().equals("熱門景點")){
			returnMessage5(to);
			returnMessage6(to);
			returnMessage7(to);
		} else if(message.getMessage().trim().equals("熱門餐廳")){
			returnMessage8(to);
			returnMessage9(to);
			returnMessage10(to);
		} else if(message.getMessage().trim().equals("訂單查詢")){
			returnMessage11(to);
		} else if(message.getMessage().trim().equals("客服聯繫方式")){
			returnMessage12(to);
		} else if(message.getMessage().trim().equals("個人資料")){
			returnMessage13(to);
		} else {
			returnMessage1(to);
		}
	}

	public void returnMessage1(String userid) {
		MessageModel message = new MessageModel();
		String to = userid;
		message.setMessage("歡迎使用TripWebRobot!　　　請輸入欲使用功能：　　" + "1.若要查詢熱門飯店請輸入『熱門飯店』。　　　" + "2.若要查詢熱門景點請輸入『熱門景點』。　" + "3.若要查詢熱門餐廳請輸入『熱門餐廳』。　4.更多功能請點選左下角按鈕。");
		message.setFromLogin("robot");
		boolean isExists = UserStorage.getInstance().getUsers().contains(to);
		if (isExists) {
			simpMessagingTemplate.convertAndSend("/topic/messages/" + to, message);
		}
	}
	
	public void returnMessage2(String userid) {
		MessageModel message = new MessageModel();
		String to = userid;
		List<Hotel> list = loginService.gethotHotel();
		
		message.setMessage(list.get(0).getName() + "(" + list.get(0).getAddress() + ")" + "　http://localhost:8080/rooms?name=" + list.get(0).getId());
		message.setFromLogin("robot");
		boolean isExists = UserStorage.getInstance().getUsers().contains(to);
		if (isExists) {
			simpMessagingTemplate.convertAndSend("/topic/messages/" + to, message);
		}
	}
	
	public void returnMessage3(String userid) {
		MessageModel message = new MessageModel();
		String to = userid;
		List<Hotel> list = loginService.gethotHotel();
		message.setMessage(list.get(1).getName() + "(" + list.get(1).getAddress() + ")" + "　http://localhost:8080/rooms?name=" + list.get(1).getId());
		message.setFromLogin("robot");
		boolean isExists = UserStorage.getInstance().getUsers().contains(to);
		if (isExists) {
			simpMessagingTemplate.convertAndSend("/topic/messages/" + to, message);
		}
		System.out.println(message);
	}
	
	public void returnMessage4(String userid) {
		MessageModel message = new MessageModel();
		String to = userid;
		List<Hotel> list = loginService.gethotHotel();
		message.setMessage(list.get(2).getName() + "(" + list.get(2).getAddress() + ")" + "　http://localhost:8080/rooms?name=" + list.get(2).getId());
		message.setFromLogin("robot");
		boolean isExists = UserStorage.getInstance().getUsers().contains(to);
		if (isExists) {
			simpMessagingTemplate.convertAndSend("/topic/messages/" + to, message);
		}
		System.out.println(message);
	}
	
	public void returnMessage5(String userid) {
		MessageModel message = new MessageModel();
		String to = userid;
		List<AttractionsBean> list = loginService.gethotAttraction();
		message.setMessage(list.get(0).getName() + "(" + list.get(0).getAddress() + ")" + "　http://localhost:8080/userAtDisplay/" + list.get(0).getPk());
		message.setFromLogin("robot");
		boolean isExists = UserStorage.getInstance().getUsers().contains(to);
		if (isExists) {
			simpMessagingTemplate.convertAndSend("/topic/messages/" + to, message);
		}
		System.out.println(message);
	}
	
	public void returnMessage6(String userid) {
		MessageModel message = new MessageModel();
		String to = userid;
		List<AttractionsBean> list = loginService.gethotAttraction();
		message.setMessage(list.get(1).getName() + "(" + list.get(1).getAddress() + ")" + "　http://localhost:8080/userAtDisplay/" + list.get(1).getPk());
		message.setFromLogin("robot");
		boolean isExists = UserStorage.getInstance().getUsers().contains(to);
		if (isExists) {
			simpMessagingTemplate.convertAndSend("/topic/messages/" + to, message);
		}
		System.out.println(message);
	}
	
	public void returnMessage7(String userid) {
		MessageModel message = new MessageModel();
		String to = userid;
		List<AttractionsBean> list = loginService.gethotAttraction();
		message.setMessage(list.get(2).getName() + "(" + list.get(2).getAddress() + ")" + "　http://localhost:8080/userAtDisplay/" + list.get(2).getPk());
		message.setFromLogin("robot");
		boolean isExists = UserStorage.getInstance().getUsers().contains(to);
		if (isExists) {
			simpMessagingTemplate.convertAndSend("/topic/messages/" + to, message);
		}
		System.out.println(message);
	}
	
	public void returnMessage8(String userid) {
		MessageModel message = new MessageModel();
		String to = userid;
		List<RestaurantBean> list = loginService.gethotRestaurant();
		message.setMessage(list.get(0).getNameRe() + "(" + list.get(0).getAddressRe() + ")" + "　http://localhost:8080/userReDisplay/" + list.get(0).getPk());
		message.setFromLogin("robot");
		boolean isExists = UserStorage.getInstance().getUsers().contains(to);
		if (isExists) {
			simpMessagingTemplate.convertAndSend("/topic/messages/" + to, message);
		}
		System.out.println(message);
	}
	
	public void returnMessage9(String userid) {
		MessageModel message = new MessageModel();
		String to = userid;
		List<RestaurantBean> list = loginService.gethotRestaurant();
		message.setMessage(list.get(1).getNameRe() + "(" + list.get(1).getAddressRe() + ")" + "　http://localhost:8080/userReDisplay/" + list.get(1).getPk());
		message.setFromLogin("robot");
		boolean isExists = UserStorage.getInstance().getUsers().contains(to);
		if (isExists) {
			simpMessagingTemplate.convertAndSend("/topic/messages/" + to, message);
		}
		System.out.println(message);
	}
	
	public void returnMessage10(String userid) {
		MessageModel message = new MessageModel();
		String to = userid;
		List<RestaurantBean> list = loginService.gethotRestaurant();
		message.setMessage(list.get(0).getNameRe() + "(" + list.get(0).getAddressRe() + ")" + "　http://localhost:8080/userReDisplay/" + list.get(0).getPk());
		message.setFromLogin("robot");
		boolean isExists = UserStorage.getInstance().getUsers().contains(to);
		if (isExists) {
			simpMessagingTemplate.convertAndSend("/topic/messages/" + to, message);
		}
		System.out.println(message);
	}
	
	public void returnMessage11(String userid) {
		MessageModel message = new MessageModel();
		String to = userid;
		message.setMessage("您可以到此頁面查詢您訂購的商品，以及一些訂單的基本資訊。"+"http://localhost:8080/ShoppingOrder.controller");
		message.setFromLogin("robot");
		boolean isExists = UserStorage.getInstance().getUsers().contains(to);
		if (isExists) {
			simpMessagingTemplate.convertAndSend("/topic/messages/" + to, message);
		}
		System.out.println(message);
	}
	
	public void returnMessage12(String userid) {
		MessageModel message = new MessageModel();
		String to = userid;
		message.setMessage("您可以寄送郵件至eeit1260101@gmail，我們將以最快的速度回信給您。　　　　　(備註:信件內容須包含使用者帳號以及基本個人資料。)");
		message.setFromLogin("robot");
		boolean isExists = UserStorage.getInstance().getUsers().contains(to);
		if (isExists) {
			simpMessagingTemplate.convertAndSend("/topic/messages/" + to, message);
		}
		System.out.println(message);
	}
	
	public void returnMessage13(String userid) {
		MessageModel message = new MessageModel();
		String to = userid;
		message.setMessage("您可以到此頁面查詢以及修改個人資料。"+"http://localhost:8080/userprofile.controller");
		message.setFromLogin("robot");
		boolean isExists = UserStorage.getInstance().getUsers().contains(to);
		if (isExists) {
			simpMessagingTemplate.convertAndSend("/topic/messages/" + to, message);
		}
		System.out.println(message);
	}
	
	
	
}
