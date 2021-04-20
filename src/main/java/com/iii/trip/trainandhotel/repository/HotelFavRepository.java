package com.iii.trip.trainandhotel.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface HotelFavRepository extends JpaRepository<HotelFav, String> {
	@Query(value="select * from hotelfav where hotel_id = ?1 and user_id = ?2", nativeQuery=true)
	HotelFav findByHotelIdAndUserId(String hotelId, String userId);
}