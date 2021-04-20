package com.iii.trip.shoppingcart.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.iii.trip.shoppingcart.model.TrainTicket;

public interface TrainKetReopsitory extends JpaRepository<TrainTicket, Integer> {

}
