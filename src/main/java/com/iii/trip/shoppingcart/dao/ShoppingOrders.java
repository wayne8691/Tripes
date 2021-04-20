package com.iii.trip.shoppingcart.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.iii.trip.shoppingcart.model.ShoppingOrder;

public interface ShoppingOrders extends JpaRepository<ShoppingOrder, Integer> {  
	
	@Query(value ="from ShoppingOrder where member_id = :name ")
	List<ShoppingOrder> findByName(String name);
		
		
	
	

}
