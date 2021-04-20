package com.iii.trip.trainandhotel.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.transaction.annotation.Transactional;

public interface RoomFacilityRelationRepository extends JpaRepository<RoomFacilityRelation, String> {

	@Query(value= "select room_facility_id from room_facility_relation where room_id = ?1",nativeQuery= true)
	List<String> findFacilityIdsByRoomId(String roomId);

	@Transactional
	@Modifying
	@Query(value= "delete from room_facility_relation where room_id =?1" ,nativeQuery = true)
	void deleteByRoomId(String roomId);

}
