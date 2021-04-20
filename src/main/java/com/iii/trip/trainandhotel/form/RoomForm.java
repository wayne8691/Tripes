package com.iii.trip.trainandhotel.form;

import java.time.LocalDateTime;

import org.springframework.web.multipart.MultipartFile;

public class RoomForm {
	
	// id
	private String id;
	
	// 名稱
	private String name;
	
	// 
	private double price;
	
	// 
	private String cap;
	
	// 
	private String bed;
	
	// 圖片
	private MultipartFile pic;
	
	// 旅館ID
	private String hotelId;
	
	// 城市ID
	private String cityId;
	
	// 
	private String[] roomFacility = {};
	
	// 創建時間
	private LocalDateTime createDateTime;

	// 更新時間
	private LocalDateTime updateDateTime;

	public RoomForm() {
		super();
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	public String getCap() {
		return cap;
	}

	public void setCap(String cap) {
		this.cap = cap;
	}

	public String getBed() {
		return bed;
	}

	public void setBed(String bed) {
		this.bed = bed;
	}

	public MultipartFile getPic() {
		return pic;
	}

	public void setPic(MultipartFile pic) {
		this.pic = pic;
	}

	public String getHotelId() {
		return hotelId;
	}

	public void setHotelId(String hotelId) {
		this.hotelId = hotelId;
	}

	public String getCityId() {
		return cityId;
	}

	public void setCityId(String cityId) {
		this.cityId = cityId;
	}

	public String[] getRoomFacility() {
		return roomFacility;
	}

	public void setRoomFacility(String[] roomFacility) {
		this.roomFacility = roomFacility;
	}

	public LocalDateTime getCreateDateTime() {
		return createDateTime;
	}

	public LocalDateTime getUpdateDateTime() {
		return updateDateTime;
	}

}
