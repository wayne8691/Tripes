package com.iii.trip.shoppingcart.model;



import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import org.springframework.stereotype.Component;

import com.iii.trip.member.model.MemberBean;
import com.iii.trip.trainandhotel.repository.Room;
@Entity
@Component
@Table(name = "productHotel")
public class ProductShopping {
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer id;
	@OneToOne(cascade= {CascadeType.PERSIST,CascadeType.REFRESH},fetch = FetchType.EAGER)
    @JoinColumn(name="FK_Hotel_id")
	private Room hotel_id;
	private String starday;
	private String endday;
	private Integer sumday;
	private Integer quantity;
	private Integer prices;
    private Integer roomout;
    private Integer checkout; 	
	private String  reason;
	private String member;
	
	
	
	
	
	
	
	
	
	public ProductShopping() {
		super();
	}
	public ProductShopping(Room hotel_id, String starDay, String endDay, Integer sumDay,
			Integer quantity, Integer prices) {
	
		this.hotel_id = hotel_id;
		this.starday = starDay;
		this.endday = endDay;
		this.sumday = sumDay;
		this.quantity = quantity;
		this.prices = prices;
	}
	
	
	
	
	public ProductShopping(Room hotel_id, String starday, String endday, Integer sumday, Integer quantity,
			Integer prices, Integer roomout, Integer checkout, String reason, String member) {
		super();
		this.hotel_id = hotel_id;
		this.starday = starday;
		this.endday = endday;
		this.sumday = sumday;
		this.quantity = quantity;
		this.prices = prices;
		this.roomout = roomout;
		this.checkout = checkout;
		this.reason = reason;
		this.member = member;
	}
	public String getMember() {
		return member;
	}
	public void setMember(String member) {
		this.member = member;
	}
	public String getReason() {
		return reason;
	}
	public void setReason(String reason) {
		this.reason = reason;
	}
	public Integer getRoomout() {
		return roomout;
	}
	public void setRoomout(Integer roomout) {
		this.roomout = roomout;
	}
	public Integer getCheckout() {
		return checkout;
	}
	public void setCheckout(Integer checkout) {
		this.checkout = checkout;
	}
	public Room getHotel_id() {
		return hotel_id;
	}
	public void setHotel_id(Room hotel_id) {
		this.hotel_id = hotel_id;
	}
	public Integer getQuantity() {
		return quantity;
	}
	public void setQuantity(Integer quantity) {
		this.quantity = quantity;
	}
	public Integer getPrices() {
		return prices;
	}
	public void setPrices(Integer prices) {
		this.prices = prices;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getStarday() {
		return starday;
	}
	public void setStarday(String starday) {
		this.starday = starday;
	}
	public String getEndday() {
		return endday;
	}
	public void setEndday(String endday) {
		this.endday = endday;
	}
	public Integer getSumday() {
		return sumday;
	}
	public void setSumday(Integer sumday) {
		this.sumday = sumday;
	}
	
	
	

	
	
	
	
	
	
}
