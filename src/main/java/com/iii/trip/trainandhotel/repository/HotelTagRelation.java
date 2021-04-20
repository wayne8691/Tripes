package com.iii.trip.trainandhotel.repository;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;
import org.springframework.stereotype.Component;

@Entity(name="hotel_tag_relation")
@Table(name="hotel_tag_relation")
@Component
public class HotelTagRelation {
	
	@Id
	@GeneratedValue(generator = "id")
	@GenericGenerator(name = "id",strategy = "com.iii.trip.trainandhotel.utility.IdGenerator")
	private String id;
	private String hotelId;
	private String tagId;
	
	

	public HotelTagRelation() {
		super();
	}

	public HotelTagRelation(String hotelId,String tagId) {
		this.hotelId = hotelId;
		this.tagId = tagId;
	}
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getHotelId() {
		return hotelId;
	}
	public void setHotelId(String hotelId) {
		this.hotelId = hotelId;
	}
	public String getTagId() {
		return tagId;
	}
	public void setTagId(String tagId) {
		this.tagId = tagId;
	}
	
	
}
