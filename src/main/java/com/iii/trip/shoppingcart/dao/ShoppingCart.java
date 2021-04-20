package com.iii.trip.shoppingcart.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.iii.trip.shoppingcart.model.TravelRollsProduct;

public interface ShoppingCart extends JpaRepository<TravelRollsProduct, Integer> {
}
