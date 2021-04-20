package com.iii.trip.trainandhotel.repository;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;
import org.springframework.stereotype.Component;

@Entity(name="train")
@Table(name="train")
@Component
public class Train {
	@Id
	@GeneratedValue(generator = "id" )
	@GenericGenerator(name = "id",strategy = "com.iii.trip.trainandhotel.utility.IdGenerator")
	private String id;
	private String start;
	private String dest;
	private Double price;
	private Integer quantity;
	
	public Train() {
		super();
	}
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getStart() {
		return start;
	}
	public void setStart(String start) {
		this.start = start;
	}
	public String getDest() {
		return dest;
	}
	public void setDest(String dest) {
		this.dest = dest;
	}
	public Double getPrice() {
		return price;
	}
	public void setPrice(Double price) {
		this.price = price;
	}

	public Integer getQuantity() {
		return quantity;
	}

	public void setQuantity(Integer quantity) {
		this.quantity = quantity;
	}
	
	
	
}
