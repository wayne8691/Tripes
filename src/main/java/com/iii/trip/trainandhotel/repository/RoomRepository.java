package com.iii.trip.trainandhotel.repository;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface RoomRepository extends JpaRepository<Room, String> {

	List<Room> findByNameAndHotel(String name, Hotel hotel);

	List<Room> findByHotel(Hotel hotel);
	
	Optional<Room> findById(String id);
	
	Optional<Room> findByName(String name);

	List<Room> findByCity(City city);

	@Query(value="SELECT * FROM room WHERE hotel_id = ?1 and name like ?2% ORDER BY price DESC", nativeQuery=true)
	List<Room> findByHotelIdAndType(String hotelId, String roomType);

	List<Room> findByCityAndCapacity(City city, String cap);

	List<Room> findByHotelId(String hotelId);

	List<Room> findByCapacity(String cap);
	
	@Query(value="SELECT * FROM room WHERE hotel_id = ?1 and capacity = ?2 ORDER BY price ASC", nativeQuery=true)
	List<Room> findByHotelIdAndCapOrderByPriceASC(String hotelId, String cap);
	
	@Query(value="select * from room where hotel_id = ?1 and name like ?2", nativeQuery = true)
	List<Room> findAllByHotelIdAndNameContaining(String hotelId, String string);
	
	@Query(value="SELECT * FROM room WHERE hotel_id = ?1 ORDER BY price ASC", nativeQuery=true)
	List<Room> findByHotelIdOrderByPriceASC(String hotelId);

}
