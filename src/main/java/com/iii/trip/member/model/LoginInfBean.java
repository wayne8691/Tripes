package com.iii.trip.member.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.springframework.stereotype.Component;

@Component("logininf")
@Entity
@Table(name="LoginInf")
public class LoginInfBean {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer serialnumber;
	private String userid;
	private String login_time;
	private String logout_time;
	
	public  LoginInfBean() {
		super();
	}
	public  LoginInfBean(String userid,String login_time,String logout_time) {
		super();
		this.userid = userid;
		this.login_time = login_time;
		this.logout_time = logout_time;
	}
	
	
	public Integer getSerialnumber() {
		return serialnumber;
	}
	public void setSerialnumber(Integer serialnumber) {
		this.serialnumber = serialnumber;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getLogin_time() {
		return login_time;
	}
	public void setLogin_time(String login_time) {
		this.login_time = login_time;
	}
	public String getLogout_time() {
		return logout_time;
	}
	public void setLogout_time(String logout_time) {
		this.logout_time = logout_time;
	}
}