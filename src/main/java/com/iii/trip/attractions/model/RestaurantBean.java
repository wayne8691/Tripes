package com.iii.trip.attractions.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EntityListeners;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.springframework.data.jpa.domain.support.AuditingEntityListener;
import org.springframework.stereotype.Component;

@Component("restaurant")
@Entity
@Table(name = "restaurant")
@EntityListeners(AuditingEntityListener.class)
public class RestaurantBean {
	// 餐廳
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "re_id")
	private Integer pk;

	@Column(name = "re_name")
	private String nameRe;
	@Column(name = "re_counties")
	private String countiesRe;
	@Column(name = "re_address")
	private String addressRe;
	@Column(name = "re_hours")
	private String hoursRe;
	@Column(name = "re_phone")
	private String phoneRe;
	@Column(name = "re_category")
	private String categoryRe;
	@Column(name = "re_image", columnDefinition = "nvarchar(max)")
	private String imageRe;
	@Column(name = "re_introduction")
	private String introductionRe;
	@Column(name = "re_count")
	private Integer countRe;
	
	public RestaurantBean() {
		super();
	}

	public RestaurantBean(String pNameRe, String pCountiesRe, String pAddressRe, String pHoursRe, String pPhoneRe,
			String pCategoryRe, String pImageRe, String pIntroductionRe) {
		super();
		this.nameRe = pNameRe;
		this.countiesRe = pCountiesRe;
		this.addressRe = pAddressRe;
		this.hoursRe = pHoursRe;
		this.phoneRe = pPhoneRe;
		this.categoryRe = pCategoryRe;
		this.imageRe = pImageRe;
		this.introductionRe = pIntroductionRe;
	}

	public RestaurantBean(Integer pk, String pNameRe, String pCountiesRe, String pAddressRe, String pHoursRe,
			String pPhoneRe, String pCategoryRe, String pImageRe, String pIntroductionRe, Integer countRe) {
		super();
		this.pk = pk;
		this.nameRe = pNameRe;
		this.countiesRe = pCountiesRe;
		this.addressRe = pAddressRe;
		this.hoursRe = pHoursRe;
		this.phoneRe = pPhoneRe;
		this.categoryRe = pCategoryRe;
		this.imageRe = pImageRe;
		this.introductionRe = pIntroductionRe;
		this.countRe = countRe;
	}

	public RestaurantBean(Integer ipk) {
		this.pk = ipk;
	}

	public Integer getPk() {
		return pk;
	}

	public void setPk(Integer pk) {
		this.pk = pk;
	}

	public String getNameRe() {
		return nameRe;
	}

	public void setNameRe(String pNameRe) {
		this.nameRe = pNameRe;
	}

	public String getCountiesRe() {
		return countiesRe;
	}

	public void setCountiesRe(String pCountiesRe) {
		this.countiesRe = pCountiesRe;
	}

	public String getAddressRe() {
		return addressRe;
	}

	public void setAddressRe(String pAddressRe) {
		this.addressRe = pAddressRe;
	}

	public String getHoursRe() {
		return hoursRe;
	}

	public void setHoursRe(String pHoursRe) {
		this.hoursRe = pHoursRe;
	}

	public String getPhoneRe() {
		return phoneRe;
	}

	public void setPhoneRe(String pPhoneRe) {
		this.phoneRe = pPhoneRe;
	}

	public String getCategoryRe() {
		return categoryRe;
	}

	public void setCategoryRe(String pCategoryRe) {
		this.categoryRe = pCategoryRe;
	}

	public String getImageRe() {
		return imageRe;
	}

	public void setImageRe(String pImageRe) {
		this.imageRe = pImageRe;
	}

	public String getIntroductionRe() {
		return introductionRe;
	}

	public void setIntroductionRe(String pIntroductionRe) {
		this.introductionRe = pIntroductionRe;
	}

	public Integer getCountRe() {
		return countRe;
	}

	public void setCountRe(Integer countRe) {
		this.countRe = countRe;
	}
	

}
