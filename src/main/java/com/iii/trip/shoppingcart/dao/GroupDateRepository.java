package com.iii.trip.shoppingcart.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.iii.trip.attractions.model.TravelGroupDateBean;

public interface GroupDateRepository extends JpaRepository<TravelGroupDateBean, Integer> {

}
