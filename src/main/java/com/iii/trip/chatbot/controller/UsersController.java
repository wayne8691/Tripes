package com.iii.trip.chatbot.controller;

import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import com.iii.trip.chatbot.model.MessageModel;
import com.iii.trip.chatbot.storage.UserStorage;

@RestController
@CrossOrigin
public class UsersController {
	
	@Autowired
	private SimpMessagingTemplate simpMessagingTemplate;
	
    @GetMapping("/registration/{userName}")
    public ResponseEntity<Void> register(@PathVariable String userName) {
        System.out.println("handling register user request: " + userName);
        UserStorage.getInstance().clearUsers(userName);
        UserStorage.getInstance().clearUsers("robot");
        
        try {
        	UserStorage.getInstance().setUser("robot");
            UserStorage.getInstance().setUser(userName);
        } catch (Exception e) {
            return ResponseEntity.badRequest().build();
        }
        return ResponseEntity.ok().build();
    }

    @GetMapping("/fetchAllUsers")
    public Set<String> fetchAll() {
        return UserStorage.getInstance().getUsers();
    }
    
    @GetMapping("/clearAllUsers/{userName}")
    public void clearAll(@PathVariable String userName) {
        UserStorage.getInstance().clearUsers(userName);
    }
    
    @GetMapping("/hello/{userName}")
    public void hello(@PathVariable String userName) {
    	welcomeMessage1(userName);
    }
    
    public void welcomeMessage1(String userid) {
		MessageModel message = new MessageModel();
		String to = userid;
		message.setMessage("歡迎使用TripWebRobot!　　　請輸入欲使用功能：　　" + "1.若要查詢熱門飯店請輸入『熱門飯店』。　　　" + "2.若要查詢熱門景點請輸入『熱門景點』。　" + "3.若要查詢熱門餐廳請輸入『熱門餐廳』。　4.更多功能請點選左下角按鈕。");
		message.setFromLogin("robot");
		boolean isExists = UserStorage.getInstance().getUsers().contains(to);
		if (isExists) {
			simpMessagingTemplate.convertAndSend("/topic/messages/" + to, message);
			System.out.println("456");
		}
		System.out.println(message);
	}
}
