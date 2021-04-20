package com.iii.trip.trainandhotel.repository;

import java.time.LocalDate;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface RoomOrderRepository extends JpaRepository<RoomOrder, String> {

	@Query("FROM room_order WHERE (start_date>?1 and start_date>?2)and(end_date>?1 and end_date>?2)")
	List<RoomOrder> findAfterStartDateAndEndDate(LocalDate startDate, LocalDate endDate);
	
	@Query("FROM room_order WHERE (start_date<?1 and start_date<?2)and(end_date<?1 and end_date<?2)")
	List<RoomOrder> findBeforeStartDateAndEndDate(LocalDate startDate, LocalDate endDate);

	RoomOrder findByHotel(Hotel hotel);

	List<RoomOrder> findByStartDateAfter(LocalDate today);

	List<RoomOrder> findByHotelAndStartDateAfter(Hotel hotel, LocalDate now);

	List<RoomOrder> findByRoomIdAndStartDateAfter(String id, LocalDate now);

	List<RoomOrder> findAllByHotel(Hotel hotel);
		

}
