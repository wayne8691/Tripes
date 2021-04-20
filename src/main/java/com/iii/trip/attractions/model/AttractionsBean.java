package com.iii.trip.attractions.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EntityListeners;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.springframework.data.jpa.domain.support.AuditingEntityListener;
import org.springframework.stereotype.Component;

@Component("attractions")
@Entity
@Table(name = "attractions")
@EntityListeners(AuditingEntityListener.class)
public class AttractionsBean {
	// 景點
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "at_id")
	private int pk;
	@Column(name = "at_name")
	private String name;
	@Column(name = "at_counties")
	private String counties;
	@Column(name = "at_address")
	private String address;
	@Column(name = "at_image", columnDefinition = "nvarchar(max)")
	private String image;
	@Column(name = "at_introduction")
	private String introduction;
	@Column(name = "at_count")
	private Integer count;
	
	public AttractionsBean() {
	}

	public AttractionsBean(String name, String counties, String address, String image, String introduction) {
		super();
		this.name = name;
		this.counties = counties;
		this.address = address;
		this.image = image;
		this.introduction = introduction;
	}

	public AttractionsBean(int pk, String name, String counties, String address, String image,
			String introduction,Integer count) {
		super();
		this.pk = pk;
		this.name = name;
		this.counties = counties;
		this.address = address;
		this.image = image;
		this.introduction = introduction;
		this.count = count;
	}

//	this.userid = userid;
	@Override
	public String toString() {
		return "AttractionsBean [pk=" + pk + ", name=" + name + ", counties=" + counties + ", address=" + address
				+ ", image=" + image + ", introduction=" + introduction + "]";
	}

	public Integer getPk() {
		return pk;
	}

	public void setPk(int pk) {
		this.pk = pk;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getCounties() {
		return counties;
	}

	public void setCounties(String counties) {
		this.counties = counties;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public String getIntroduction() {
		return introduction;
	}

	public void setIntroduction(String introduction) {
		this.introduction = introduction;
	}

	public Integer getCount() {
		return count;
	}

	public void setCount(Integer count) {
		this.count = count;
	}

//	public String getUserid() {
//		return userid;
//	}
//
//	public void setUserid(String userid) {
//		this.userid = userid;
//	}

}