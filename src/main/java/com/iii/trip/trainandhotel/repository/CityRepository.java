package com.iii.trip.trainandhotel.repository;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;

public interface CityRepository extends JpaRepository<City, String> {
	
	Optional<City> findById(String id);
	
	City findByName(String string);

	City findAllByNameContaining(String string);
	


}
