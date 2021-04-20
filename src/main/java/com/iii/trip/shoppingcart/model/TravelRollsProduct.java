package com.iii.trip.shoppingcart.model;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Set;
import java.util.TreeSet;

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



@Entity
@Table(name = "shoppingcarthotel")
@Component
public class TravelRollsProduct {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)	
	private Integer number_id;
	
	//關聯飯店
	@OneToMany(cascade= { CascadeType.ALL},fetch = FetchType.EAGER)
	@JoinColumn(name="fk_car_id", nullable = true)
	private List<ProductShopping> room_id = new ArrayList<ProductShopping>();
	//關聯車票
	@OneToMany(cascade= { CascadeType.ALL})
	@JoinColumn(name="fk_car_id", nullable = true)
	private List<TrainTicket> train = new ArrayList<TrainTicket>();
	
	//關聯自由行
	@OneToMany(cascade= { CascadeType.ALL})
	@JoinColumn(name="fk_car_id",  nullable = true)
	private List<Travel> travel = new ArrayList<Travel>();	
	//關聯會員
	@OneToOne(cascade= {CascadeType.REFRESH},fetch = FetchType.EAGER)
    @JoinColumn(name="FK_member_id")
	private MemberBean memberNumber;
	private String situation;
    private Integer price; 
	public TravelRollsProduct() {
	}

	
	
	
	
	





	

	public TravelRollsProduct(MemberBean memberNumber, String situation) {
		super();
		this.memberNumber = memberNumber;
		this.situation = situation;
	}













	public TravelRollsProduct(List<ProductShopping> room_id, MemberBean memberNumber, String situation) {
		super();
		this.room_id = room_id;
		this.memberNumber = memberNumber;
		this.situation = situation;
	}













	public void setMemberNumber(MemberBean memberNumber) {
		this.memberNumber = memberNumber;
	}













	public Integer getPrice() {
		return price;
	}


	public void setPrice(Integer price) {
		this.price = price;
	}













	public String getSituation() {
		return situation;
	}

	public void setSituation(String situation) {
		this.situation = situation;
	}

	

	public List<ProductShopping> getRoom_id() {
		return room_id;
	}



	public void setRoom_id(List<ProductShopping> room_id) {
		this.room_id = room_id;
	}







	public Integer getNumber_id() {
		return number_id;
	}








	public void setNumber_id(Integer number_id) {
		this.number_id = number_id;
	}













	public List<TrainTicket> getTrain() {
		return train;
	}





	public void setTrain(List<TrainTicket> train) {
		this.train = train;
	}





	public List<Travel> getTravel() {
		return travel;
	}





	public void setTravel(List<Travel> travel) {
		this.travel = travel;
	}


	public MemberBean getMemberNumber() {
		return memberNumber;
	}

	
}
