package com.iii.trip.trainandhotel.repository;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface HotelRepository extends JpaRepository<Hotel, String> {
	
	@Query(value= "select * from hotel where city_id = ?1",nativeQuery= true)
	List<Hotel> findByCityId(String cityId);

	List<Hotel> findByName(String name);
		
	Optional<Hotel> findById(String id);

	@Query(value= "select * from hotel where permission = ?1" ,nativeQuery= true)
	List<Hotel> findByNoPermit(String n);
	
	@Query(value= "select * from hotel where permission = ?1", nativeQuery = true)
	List<Hotel> findByPermit(String y);
	
	@Query(value= "select * from hotel where user_id = ?1", nativeQuery = true)
	List<Hotel> findByUserId(String userId);

	List<Hotel> findByCity(City city);

	@Query(value="select * from hotel where user_id = ?1 and name like ?2", nativeQuery = true)
	List<Hotel> findAllByUserIdAndNameContaining(String userId, String key);

	List<Hotel> findByType(String string);

	@Query(value="select * from hotel where user_id !=?1", nativeQuery = true)
	List<Hotel> findAllByUserIdNotEquals(String string);

	@Query(value="select * from hotel where name like ?1", nativeQuery = true)
	List<Hotel> findAllByNameContaining(String string);
	
	List<Hotel> findByCityAndPermission(City city, String string);
	
	List<Hotel> findAllByOrderByClickCountDesc();

	List<Hotel> findAllByOrderByIdDesc();

	List<Hotel> findAllByUserId(String string);
	
}
