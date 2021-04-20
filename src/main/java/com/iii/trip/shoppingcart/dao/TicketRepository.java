package com.iii.trip.shoppingcart.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.iii.trip.trainandhotel.repository.Train;

public interface TicketRepository extends JpaRepository<Train, Integer> {
	
	
	public Train findByStartAndDest(String star,String end);
	
	
	
	
	
	

}
