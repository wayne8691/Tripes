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

import com.iii.trip.trainandhotel.repository.Train;


@Entity
@Table(name = "trainTicket")
public class TrainTicket {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	@OneToOne(cascade= {CascadeType.PERSIST,CascadeType.REFRESH},fetch = FetchType.EAGER)
    @JoinColumn(name="FK_member_id")
	private Train train;
    private Integer qutity; 
    private Integer price; 
	
	
	
	
	public TrainTicket() {
		
	}
	
	
	
	public TrainTicket(Train train) {
	
		this.train = train;
	}



	public Integer getPrice() {
		return price;
	}



	public void setPrice(Integer price) {
		this.price = price;
	}



	public TrainTicket(Train train, Integer qutity) {
		
		this.train = train;
		this.qutity =qutity;
	}
	
	
	
	
	
	public Integer getQutity() {
		return qutity;
	}







	public void setQutity(Integer qutity) {
		this.qutity = qutity;
	}







	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Train getTrain() {
		return train;
	}
	public void setTrain(Train train) {
		this.train = train;
	}  

	
	
	
}
