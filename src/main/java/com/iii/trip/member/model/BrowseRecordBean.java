package com.iii.trip.member.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.springframework.stereotype.Component;

@Component
@Entity
@Table(name="browserecord")
public class BrowseRecordBean {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer browsepk;
	private String browserecord;
	private String userid;
	private String browsetime;
	private String category;
	
	public  BrowseRecordBean() {
		super();
	}
	public  BrowseRecordBean(String browserecord,String userid,String browsetime,String category) {
		super();
		this.browserecord = browserecord;
		this.userid = userid;
		this.browsetime = browsetime;
		this.category = category;
	}
	
	
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public Integer getBrowsepk() {
		return browsepk;
	}
	public void setBrowsepk(Integer browsepk) {
		this.browsepk = browsepk;
	}
	public String getBrowserecord() {
		return browserecord;
	}
	public void setBrowserecord(String browserecord) {
		this.browserecord = browserecord;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getBrowsetime() {
		return browsetime;
	}
	public void setBrowsetime(String browsetime) {
		this.browsetime = browsetime;
	}
	
	
	

}
