package com.iii.trip.trainandhotel.repository;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;
import org.springframework.stereotype.Component;

@Entity(name="room_facility_relation")
@Table(name="room_facility_relation")
@Component
public class RoomFacilityRelation {
	
	@Id
	@GeneratedValue(generator = "id")
	@GenericGenerator(name = "id",strategy = "com.iii.trip.trainandhotel.utility.IdGenerator")
	private String id;
	private String roomId;
	private String roomFacilityId;
	
	
	public RoomFacilityRelation() {
		super();
	}
	
	public RoomFacilityRelation(String roomId, String roomFacilityId) {
		this.roomFacilityId = roomFacilityId;
		this.roomId = roomId;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getRoomId() {
		return roomId;
	}
	public void setRoomId(String roomId) {
		this.roomId = roomId;
	}
	public String getRoomFacilityId() {
		return roomFacilityId;
	}
	public void setRoomFacilityId(String roomFacilityId) {
		this.roomFacilityId = roomFacilityId;
	}
	
	
}
