package com.iii.trip.trainandhotel.repository;

import java.io.Serializable;
import java.time.LocalDateTime;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.GenericGenerator;
import org.hibernate.annotations.UpdateTimestamp;
import org.json.JSONObject;
import org.springframework.stereotype.Component;

import com.iii.trip.trainandhotel.utility.Const;

@Entity(name="hotel")
@Table(name="hotel")
@Component
public class Hotel implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(generator = "id")
	@GenericGenerator(name = "id",strategy = "com.iii.trip.trainandhotel.utility.IdGenerator")
	private String id;
	private String name;
	@ManyToOne
	@JoinColumn(referencedColumnName="id")
	private City city;
	private String address;
	@Column(columnDefinition = "text")
	private String intro;
	@Column(columnDefinition = "text")
	private String pic;
	private String phone;
	private String permission;
	private String userId;
	private int clickCount;
	private String type;
    @Column(columnDefinition = "DATE")
    @CreationTimestamp
	private LocalDateTime createDateTime;
    @Column(columnDefinition = "DATE")
    @UpdateTimestamp
	private LocalDateTime updateDateTime;
	
	public JSONObject toJson() {
		JSONObject json = new JSONObject();
		json.put("id", id);
		json.put("name", name);
		json.put("address", address);
		json.put("intro", intro);
		json.put("phone", phone);
		json.put("city", city.toJson());
		return json;
	}
	
	public Hotel() {
		super();
	}	
	
	public Hotel(String name, City city, String address, String intro,String pic,
				 String phone, String permission, String userId,int clickCount,String type) {
		this.name = name;
		this.city = city;
		this.address = address;
		this.intro = intro;
		this.pic = pic;
		this.phone = phone;
		this.permission = permission;
		this.userId = userId;
		this.clickCount = clickCount;
		this.type = type;
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
	
	public City getCity() {
		return city;
	}
	
	public void setCity(City city) {
		this.city = city;
	}
	
	public String getAddress() {
		return address;
	}
	
	public void setAddress(String address) {
		this.address = address;
	}
	
	public String getIntro() {
		return intro;
	}
	
	public void setIntro(String intro) {
		this.intro = intro;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getPermission() {
		return permission;
	}

	public void setPermission(String permission) {
		this.permission = permission;
	}

	public void setPic(String pic) {
		this.pic = pic;
	}

	public String getPic() {
		if (pic != null) {
			try {
				return "data:image/jpg;base64," + pic;
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return Const.DEFAULT_IMAGE;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public int getClickCount() {
		return clickCount;
	}

	public void setClickCount(int clickCount) {
		this.clickCount = clickCount;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public LocalDateTime getCreateDate() {
		return createDateTime;
	}

	public LocalDateTime getUpdateDate() {
		return updateDateTime;
	}
	
	
}
