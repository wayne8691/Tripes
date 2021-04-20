package com.iii.trip.trainandhotel.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

public interface TrainRepository extends JpaRepository<Train, String> {

	List<Train> findByStart(String start);

	List<Train> findByStartAndDest(String start, String dest);

	
}
