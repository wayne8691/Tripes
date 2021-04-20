package com.iii.trip.shoppingcart.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.iii.trip.shoppingcart.model.Travel;

public interface TrivelDao extends JpaRepository<Travel, Integer> {
	

}
