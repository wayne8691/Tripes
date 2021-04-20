package com.iii.trip.shoppingcart.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "paymentType")
public class PaymentType {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer  paymentType_id;
	private String Payment_type;
	private String address;
	private String phone;
	private String name;
	private String 	mail;
	public PaymentType() {
		
	}
	public PaymentType(String payment_type, String address, String phone, String name, String mail) {
		
		Payment_type = payment_type;
		this.address = address;
		this.phone = phone;
		this.name = name;
		this.mail = mail;
	}
	public String getPayment_type() {
		return Payment_type;
	}
	public void setPayment_type(String payment_type) {
		Payment_type = payment_type;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getMail() {
		return mail;
	}
	public void setMail(String mail) {
		this.mail = mail;
	}
	
	
	

}
