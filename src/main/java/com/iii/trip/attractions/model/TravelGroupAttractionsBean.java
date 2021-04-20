package com.iii.trip.attractions.model;

import javax.persistence.Entity;
import javax.persistence.EntityListeners;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.springframework.data.jpa.domain.support.AuditingEntityListener;
import org.springframework.stereotype.Component;

@Component("attractions_itinerary")
@Entity
@Table(name = "attractions_itinerary")
@EntityListeners(AuditingEntityListener.class)
public class TravelGroupAttractionsBean {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	private Integer name;
	private Integer day;
	private String time;
	private Integer attractions;
	
	
	public TravelGroupAttractionsBean() {

	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getName() {
		return name;
	}
	public void setName(Integer name) {
		this.name = name;
	}
	public Integer getDay() {
		return day;
	}
	public void setDay(Integer day) {
		this.day = day;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public Integer getAttractions() {
		return attractions;
	}
	public void setAttractions(Integer attractions) {
		this.attractions = attractions;
	}
	
	

}
