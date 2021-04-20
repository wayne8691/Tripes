package com.iii.trip.shoppingcart.model;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import com.iii.trip.attractions.model.TravelGroupBean;


@Entity
@Table(name = "travel")
public class Travel {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	@OneToOne(cascade= {CascadeType.PERSIST,CascadeType.REFRESH},fetch = FetchType.EAGER)
    @JoinColumn(name="FK_TravelGroupBean_id")
	private TravelGroupBean  travelGroup;
	private Integer quantity;
	private Integer price;
	private String  date;
	public Travel() {
		
	}

	public String getDate() {
		return date;
	}


	public void setDate(String date) {
		this.date = date;
	}











	public Integer getPrice() {
		return price;
	}






	public void setPrice(Integer price) {
		this.price = price;
	}






	public Integer getQuantity() {
		return quantity;
	}






	public void setQuantity(Integer quantity) {
		this.quantity = quantity;
	}






	public Travel(TravelGroupBean travelGroup) {
		this.travelGroup = travelGroup;
	}


	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public TravelGroupBean getTravelGroup() {
		return travelGroup;
	}
	public void setTravelGroup(TravelGroupBean travelGroup) {
		this.travelGroup = travelGroup;
	}
	
	
	
	
	


	
	
	
}
