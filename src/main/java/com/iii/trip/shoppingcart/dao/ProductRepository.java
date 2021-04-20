package com.iii.trip.shoppingcart.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.iii.trip.shoppingcart.model.ProductShopping;

public interface ProductRepository extends JpaRepository<ProductShopping, Integer> {
	
	
	
	public List<ProductShopping> findByReasonAndCheckout(Integer rid,Integer cid);
	

}
