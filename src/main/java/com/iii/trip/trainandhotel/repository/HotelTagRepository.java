package com.iii.trip.trainandhotel.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

public interface HotelTagRepository extends JpaRepository<HotelTag, String> {

	HotelTag findByName(String tagName);

	List<HotelTag> findAllByOrderByClickCountDesc();

}
