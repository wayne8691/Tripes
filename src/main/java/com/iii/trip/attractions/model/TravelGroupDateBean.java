package com.iii.trip.attractions.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.springframework.stereotype.Component;


@Component("travel_group_date")
@Entity
@Table(name = "travel_group_date")
public class TravelGroupDateBean {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	private String setoffday;	
	private Integer sum;
	private Integer remaining;
	
	
	
	
	 
	
	
	public TravelGroupDateBean() {
		
	}
	public TravelGroupDateBean(String setoffday, Integer sum, Integer remaining) {
		super();
		this.setoffday = setoffday;
		this.sum = sum;
		this.remaining = remaining;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	
	public String getSetoffday() {
		return setoffday;
	}
	public void setSetoffday(String setoffday) {
		this.setoffday = setoffday;
	}
	public Integer getRemaining() {
		return remaining;
	}
	public void setRemaining(Integer remaining) {
		this.remaining = remaining;
	}

	public Integer getSum() {
		return sum;
	}
	public void setSum(Integer sum) {
		this.sum = sum;
	}	
	

}
