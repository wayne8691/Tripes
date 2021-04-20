package com.iii.trip.member.model;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import org.springframework.stereotype.Component;

@Component("membercard")
@Entity
@Table(name="MemberCard")
public class MemberCardBean {
	@Id
	private String cardnumber = null;
	private String hostname;
	private String validityperiod;
	private String securitycode;
	private String userid;
	
	public String getCardnumber() {
		return cardnumber;
	}
	public void setCardnumber(String cardnumber) {
		this.cardnumber = cardnumber;
	}
	public String getHostname() {
		return hostname;
	}
	public void setHostname(String hostname) {
		this.hostname = hostname;
	}
	public String getValidityperiod() {
		return validityperiod;
	}
	public void setValidityperiod(String validityperiod) {
		this.validityperiod = validityperiod;
	}
	public String getSecuritycode() {
		return securitycode;
	}
	public void setSecuritycode(String securitycode) {
		this.securitycode = securitycode;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	

}
