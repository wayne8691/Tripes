package com.iii.trip.shoppingcart.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.iii.trip.trainandhotel.repository.Hotel;

public interface HotelCar extends JpaRepository<Hotel,Integer> {

}
