package com.iii.trip.shoppingcart.service;

import java.util.List;

import com.iii.trip.attractions.model.TravelGroupBean;
import com.iii.trip.shoppingcart.model.TrainTicket;
import com.iii.trip.trainandhotel.repository.Hotel;
import com.iii.trip.trainandhotel.repository.Train;

public interface TicketService {
	public Train seachTeain(String id);
	public  TravelGroupBean  findById(Integer id);
	List<Hotel> findByHotelAll();
	public void findByTeavelReomve(Integer id);
	public Train findByTrainPrice(String strar,String end,Integer quantitys);
	public void findByTrainIdRomove(Integer id);
	public Train findByTrainPriceSeach(String star, String end);
	public void groupDateRemainig(Integer id);
}
