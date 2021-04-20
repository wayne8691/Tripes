package com.iii.trip.trainandhotel.repository;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;
import org.springframework.stereotype.Component;

@Entity(name="hotel_tag")
@Table(name="hotel_tag")
@Component
public class HotelTag {
	
	@Id
	@GeneratedValue(generator = "id")
	@GenericGenerator(name = "id",strategy = "com.iii.trip.trainandhotel.utility.IdGenerator")
	private String id;
	private String name;
	private int clickCount;
	
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
	public int getClickCount() {
		return clickCount;
	}
	public void setClickCount(int clickCount) {
		this.clickCount = clickCount;
	}

}
