package com.iii.trip.attractions.model;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.EntityListeners;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.springframework.data.jpa.domain.support.AuditingEntityListener;
import org.springframework.stereotype.Component;

@Component("travel_group")
@Entity
@Table(name = "travel_group")
@EntityListeners(AuditingEntityListener.class)
public class TravelGroupBean {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	private String name;
	private Integer price;
	private String origin;
	private String destination;
	private Integer day;
	private String feature;
	private String image;
	private Integer count;
	
	@OneToMany(cascade= { CascadeType.ALL})
	@JoinColumn(name="fk_TravelGroupBean_id",  nullable = true)
	private List<TravelGroupDateBean> travelGroupBeanId = new ArrayList<TravelGroupDateBean>();	
	
	public TravelGroupBean() {
		super();
	}

	public TravelGroupBean(String name, Integer price, String origin, String destination, Integer day, String feature,
			String image) {
		super();
		this.name = name;
		this.price = price;
		this.origin = origin;
		this.destination = destination;
		this.day = day;
		this.feature = feature;
		this.image = image;
	}

	public TravelGroupBean(Integer id, String name, Integer price, String origin, String destination, Integer day,
			String feature, String image) {
		super();
		this.id = id;
		this.name = name;
		this.price = price;
		this.origin = origin;
		this.destination = destination;
		this.day = day;
		this.feature = feature;
		this.image = image;
	}
	
	public Integer getCount() {
		return count;
	}

	public void setCount(Integer count) {
		this.count = count;
	}

	public List<TravelGroupDateBean> getTravelGroupBeanId() {
		return travelGroupBeanId;
	}

	public void setTravelGroupBeanId(List<TravelGroupDateBean> travelGroupBeanId) {
		this.travelGroupBeanId = travelGroupBeanId;
	}

	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Integer getPrice() {
		return price;
	}
	public void setPrice(Integer price) {
		this.price = price;
	}
	public String getOrigin() {
		return origin;
	}
	public void setOrigin(String origin) {
		this.origin = origin;
	}
	public String getDestination() {
		return destination;
	}
	public void setDestination(String destination) {
		this.destination = destination;
	}
	public Integer getDay() {
		return day;
	}
	public void setDay(Integer day) {
		this.day = day;
	}
	public String getFeature() {
		return feature;
	}
	public void setFeature(String feature) {
		this.feature = feature;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}

	
	
}
