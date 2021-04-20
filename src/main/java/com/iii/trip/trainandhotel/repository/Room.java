package com.iii.trip.trainandhotel.repository;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;
import org.json.JSONObject;
import org.springframework.stereotype.Component;

import com.iii.trip.trainandhotel.utility.ConstRoom;

@Entity(name="room")
@Table(name="room")
@Component
public class Room implements Serializable {
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
	private City city;//cityID
	@ManyToOne
	@JoinColumn(referencedColumnName="id")
	private Hotel hotel;//hotelID
	private Double price;
	private String capacity;
	@Column(columnDefinition = "text")
	private String pic;
	private String bed;
	
	
	public JSONObject toJson() {
		JSONObject json = new JSONObject();
		json.put("id", id);
		json.put("name", name);
		json.put("price", price);
		json.put("capacity", capacity);
		json.put("bed", bed);
		json.put("hotel", hotel.toJson());
		return json;
	}
	
	
	
	public Room() {
		super();
	}



	public Room(String name, City city, Hotel hotel, Double price, String capacity, String pic, String bed) {
		this.name = name;
		this.city = city;
		this.hotel = hotel;
		this.price = price;
		this.capacity = capacity;
		this.pic = pic;
		this.bed = bed;
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
	
	public Hotel getHotel() {
		return hotel;
	}
	public void setHotel(Hotel hotel) {
		this.hotel = hotel;
	}
	public Double getPrice() {
		return price;
	}
	public void setPrice(Double price) {
		this.price = price;
	}

	public String getPic() {
		if (pic != null) {
			try {
				return "data:image/jpg;base64," + pic;
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return ConstRoom.DEFAULT_IMAGE;
	}

	public void setPic(String pic) {
		this.pic = pic;
	}

	public String getCapacity() {
		return capacity;
	}
	public void setCapacity(String capacity) {
		this.capacity = capacity;
	}

	public String getBed() {
		return bed;
	}

	public void setBed(String bed) {
		this.bed = bed;
	}

	public City getCity() {
		return city;
	}

	public void setCity(City city) {
		this.city = city;
	}
	
}
