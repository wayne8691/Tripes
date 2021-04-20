package com.iii.trip.trainandhotel.repository;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;
import org.springframework.stereotype.Component;

@Entity(name="hotel_facility_relation")
@Table(name="hotel_facility_relation")
@Component
public class HotelFacilityRelation {
	
	@Id
	@GeneratedValue(generator = "id")
	@GenericGenerator(name = "id",strategy = "com.iii.trip.trainandhotel.utility.IdGenerator")
	private String id;
	private String hotelId;
	private String hotelFacilityId;
	
	public HotelFacilityRelation() {
		super();
	}
	public HotelFacilityRelation(String hotelId, String hotelFacilityId) {
		this.hotelId = hotelId;
		this.hotelFacilityId = hotelFacilityId;
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
	public String getHotelFacilityId() {
		return hotelFacilityId;
	}
	public void setHotelFacilityId(String hotelFacilityId) {
		this.hotelFacilityId = hotelFacilityId;
	}
	
	
}
