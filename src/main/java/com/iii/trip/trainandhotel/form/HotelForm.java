package com.iii.trip.trainandhotel.form;

import java.time.LocalDateTime;

import org.springframework.web.multipart.MultipartFile;

public class HotelForm {
	
	// id
	private String id;
	
	// 名稱
	private String name;
	
	// 地址
	private String address;
	
	// 介紹
	private String intro;
	
	// 電話
	private String phone;
	
	// 類型
	private String type;
	
	// 圖片
	private MultipartFile pic;
	
	// 城市ID
	private String cityId;
	
	
	private String[] hotelFacility = {};
	

	private String[] hotelTags = {};
	
	// 創建時間
	private LocalDateTime createDateTime;

	// 更新時間
	private LocalDateTime updateDateTime;

	public HotelForm() {
		super();
	}

	public String getId() {
		return id;
	}

	public void setId(final String id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(final String name) {
		this.name = name;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(final String address) {
		this.address = address;
	}

	public String getIntro() {
		return intro;
	}

	public void setIntro(final String intro) {
		this.intro = intro;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(final String phone) {
		this.phone = phone;
	}

	public String getType() {
		return type;
	}

	public void setType(final String type) {
		this.type = type;
	}

	public MultipartFile getPic() {
		return pic;
	}

	public void setPic(final MultipartFile pic) {
		this.pic = pic;
	}

	public String getCityId() {
		return cityId;
	}

	public void setCityId(final String cityId) {
		this.cityId = cityId;
	}

	public String[] getHotelFacility() {
		return hotelFacility;
	}

	public void setHotelFacility(final String[] hotelFacility) {
		this.hotelFacility = hotelFacility;
	}

	public String[] getHotelTags() {
		return hotelTags;
	}

	public void setHotelTags(final String[] hotelTags) {
		this.hotelTags = hotelTags;
	}

	public LocalDateTime getCreateDateTime() {
		return createDateTime;
	}

	public LocalDateTime getUpdateDateTime() {
		return updateDateTime;
	}

}
