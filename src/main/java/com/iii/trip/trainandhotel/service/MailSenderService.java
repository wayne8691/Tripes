package com.iii.trip.trainandhotel.service;

import java.time.LocalDate;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.stereotype.Service;

@Service
public class MailSenderService {

	final static String username = "eeit12601@gmail.com";
	final static String password = "eeit123456";
	
	public static void toMail(String userEmail,String title, String text) {

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
		
		try {
			// 創建一個訊息物件
			Message message = new MimeMessage(session);

			// 要寄送的mail
			message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(userEmail));//
			// 送出的文字
			message.setSubject(title);

			message.setText(text);
			// 送出
			Transport.send(message);
			System.out.print("a");
		} catch (MessagingException e) {
			throw new RuntimeException(e);
		}

	}
}
