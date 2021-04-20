package com.iii.trip.shoppingcart.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.iii.trip.attractions.model.TravelGroupBean;

public interface TricketDao extends JpaRepository<TravelGroupBean, Integer> {

}
