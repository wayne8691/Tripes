package com.iii.trip.shoppingcart.model;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import net.bytebuddy.asm.Advice.ArgumentHandler.Factory;

@Entity
@Table(name = "shoppingorder")
public class ShoppingOrder {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer id;
	@OneToOne(cascade= {CascadeType.ALL,CascadeType.MERGE,CascadeType.REMOVE},fetch = FetchType.EAGER)
    @JoinColumn(name="FK_shoppingCar_id_id")
	private TravelRollsProduct shoppingcar_id;
	 @OneToOne(cascade= {CascadeType.ALL,CascadeType.MERGE,CascadeType.REMOVE})
	 @JoinColumn(name="FK_paymentType_id")
	private PaymentType paymenttype_id;
	private String member_id;
	private String date;
	private Integer sumPrice;
	private Integer situation;
	

	public ShoppingOrder() {
		
	}
	
	public ShoppingOrder(TravelRollsProduct shoppingCar_id, PaymentType paymentType_id, String member_id,
			 String date, Integer sumPrice, Integer situation) {
		super();
		this.shoppingcar_id = shoppingCar_id;
		this.paymenttype_id = paymentType_id;
		this.member_id = member_id;

		this.date = date;
		this.sumPrice = sumPrice;
		this.situation = situation;
	}







	







	
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public TravelRollsProduct getShoppingcar_id() {
		return shoppingcar_id;
	}

	public void setShoppingcar_id(TravelRollsProduct shoppingcar_id) {
		this.shoppingcar_id = shoppingcar_id;
	}

	public PaymentType getPaymenttype_id() {
		return paymenttype_id;
	}

	public void setPaymenttype_id(PaymentType paymenttype_id) {
		this.paymenttype_id = paymenttype_id;
	}

	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public Integer getSumPrice() {
		return sumPrice;
	}
	public void setSumPrice(Integer sumPrice) {
		this.sumPrice = sumPrice;
	}
	public Integer getSituation() {
		return situation;
	}
	public void setSituation(Integer situation) {
		this.situation = situation;
	}
	
	
	
	
	
	
	
	

}
