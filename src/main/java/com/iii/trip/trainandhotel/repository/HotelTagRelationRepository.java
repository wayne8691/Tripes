package com.iii.trip.trainandhotel.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.transaction.annotation.Transactional;

public interface HotelTagRelationRepository extends JpaRepository<HotelTagRelation, String> {

	@Transactional
	@Modifying 
	@Query(value= "delete from hotel_tag_relation where hotel_id =?1" ,nativeQuery = true)
	void deleteByHotelId(String hotelId);
	
	@Query(value="select tag_id from hotel_tag_relation where hotel_id=?1" ,nativeQuery = true)
	List<String> findTagIdsByHotelId(String hotelId);

	@Query(value="select hotel_id from hotel_tag_relation where tag_id=?1" , nativeQuery = true)
	List<String> findHotelIdBytagId(String tagId);

}
