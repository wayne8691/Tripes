package com.iii.trip.trainandhotel.repository;

import java.io.Serializable;
import java.time.LocalDate;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;
import org.json.JSONObject;
import org.springframework.stereotype.Component;


@Entity(name="room_order")
@Table(name="room_order")
@Component
public class RoomOrder implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(generator = "id")
	@GenericGenerator(name = "id",strategy = "com.iii.trip.trainandhotel.utility.IdGenerator")
	private String id;
	@ManyToOne
	@JoinColumn(referencedColumnName="id")
	private City city; //city_id
	@ManyToOne
	@JoinColumn(referencedColumnName="id")
	private Hotel hotel; //room_id
	@ManyToOne
	@JoinColumn(referencedColumnName="id")
	private Room room; //room_id
	private LocalDate startDate;
	private LocalDate endDate;
	
	public JSONObject toJson() {
		JSONObject json = new JSONObject();
		json.put("id",id);
		json.put("room",room.toJson());
		json.put("hotel",hotel.toJson());
		json.put("city",city.toJson());
		json.put("startDate",startDate);
		json.put("endtDate",endDate);
		return json;
	}
		
	public RoomOrder() {
		super();
	}
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public Room getRoom() {
		return room;
	}
	public void setRoom(Room room) {
		this.room = room;
	}

	public City getCity() {
		return city;
	}

	public void setCity(City city) {
		this.city = city;
	}

	public LocalDate getStartDate() {
		return startDate;
	}

	public void setStartDate(LocalDate startDate) {
		this.startDate = startDate;
	}

	public LocalDate getEndDate() {
		return endDate;
	}

	public void setEndDate(LocalDate endDate) {
		this.endDate = endDate;
	}


	public Hotel getHotel() {
		return hotel;
	}


	public void setHotel(Hotel hotel) {
		this.hotel = hotel;
	}


	
	
	
}
