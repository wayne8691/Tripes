package com.iii.trip.member.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.springframework.stereotype.Component;

@Component("loginuser")
@Entity
@Table(name = "UserData")

public class MemberBean {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	// 會員序號
	private Integer usernumber;
	// 會員id
	private String userid;
	// 會員密碼
	private String password;
	// 密碼加密用
	private String salt;
	// 會員名字
	private String name;
	// 會員電話
	private String phone;
	// 會員信箱
	private String email;
	// 會員生日
	private String birthday;
	// 住址縣市
	private String a_address;
	// 住址地區
	private String b_address;
	// 地址
	private String c_address;
	// 會員權限
	private String status;
	// 註冊時間
	private String registertime;
	// 密碼錯誤次數
	private Integer fail_count;
	// 密碼錯誤最後時間
	private String fail_time;
	// 最後登入時間
	private String last_logintime;
	// 登入狀態
	private Integer login_status;

	@Column(columnDefinition = "varbinary(MAX)")
	private byte[] image;
	@Transient
	private String image1;

	public Integer getLogin_status() {
		return login_status;
	}

	public void setLogin_status(Integer login_status) {
		this.login_status = login_status;
	}

	public String getLast_logintime() {
		return last_logintime;
	}

	public void setLast_logintime(String last_logintime) {
		this.last_logintime = last_logintime;
	}

	public String getImage1() {
		return image1;
	}

	public String getSalt() {
		return salt;
	}

	public void setSalt(String salt) {
		this.salt = salt;
	}

	public Integer getFail_count() {
		return fail_count;
	}

	public void setFail_count(Integer fail_count) {
		this.fail_count = fail_count;
	}

	public String getFail_time() {
		return fail_time;
	}

	public void setFail_time(String fail_time) {
		this.fail_time = fail_time;
	}

	public void setImage1(String image1) {
		this.image1 = image1;
	}

	public Integer getUsernumber() {
		return usernumber;
	}

	public void setUsernumber(Integer usernumber) {
		this.usernumber = usernumber;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getA_address() {
		return a_address;
	}

	public void setA_address(String a_address) {
		this.a_address = a_address;
	}

	public String getB_address() {
		return b_address;
	}

	public void setB_address(String b_address) {
		this.b_address = b_address;
	}

	public String getC_address() {
		return c_address;
	}

	public void setC_address(String c_address) {
		this.c_address = c_address;
	}

	public String getBirthday() {
		return birthday;
	}

	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getRegistertime() {
		return registertime;
	}

	public void setRegistertime(String registertime) {
		this.registertime = registertime;
	}

	public byte[] getImage() {
		return image;
	}

	public void setImage(byte[] image) {
		this.image = image;
	}

}