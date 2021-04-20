package com.iii.trip.shoppingcart.service.serviceImpl;

import java.util.Optional;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.ResponseBody;

import com.iii.trip.attractions.model.TravelGroupBean;
import com.iii.trip.attractions.model.TravelGroupDateBean;
import com.iii.trip.shoppingcart.dao.GroupDateRepository;
import com.iii.trip.shoppingcart.dao.HotelCar;
import com.iii.trip.shoppingcart.dao.TicketDao;
import com.iii.trip.shoppingcart.dao.TicketRepository;
import com.iii.trip.shoppingcart.dao.TrainKetReopsitory;
import com.iii.trip.shoppingcart.dao.TricketDao;
import com.iii.trip.shoppingcart.dao.TrivelDao;
import com.iii.trip.shoppingcart.model.TrainTicket;
import com.iii.trip.shoppingcart.service.TicketService;
import com.iii.trip.trainandhotel.repository.Hotel;
import com.iii.trip.trainandhotel.repository.Train;

@Transactional
@Service
public class TicketServiceImpl implements TicketService{
	@Autowired
    private TicketDao tickdao;
	@Autowired
	private TricketDao tDao;
	@Autowired 
    private HotelCar hotelcar;
	@Autowired
	private TrivelDao tD;
	@Autowired
	private TicketRepository tR;
	@Autowired
	private TrainKetReopsitory treainRepository;
	@Autowired
	private GroupDateRepository  groupDateRepository;
	@Override
	public Train seachTeain(String id) {
		
		return tickdao.seachTeain(id);
	}
	
	public TravelGroupBean  findById(Integer id) {
		
		
		 Optional<TravelGroupBean> findById = tDao.findById(id);
		 
		 
		 return findById.get();
	}
	 
	public java.util.List<Hotel> findByHotelAll() {
	       	
		
		
		return hotelcar.findAll();
		
	}

	@Override
	public void findByTeavelReomve(Integer id) {
		tD.deleteById(id);
	}

	@Override
	public @ResponseBody Train findByTrainPrice(String strar, String end,Integer quantitys) {
		 Train findByStartAndDest = tR.findByStartAndDest(strar, end);
		 Integer quantity = findByStartAndDest.getQuantity();
		 quantity-=quantitys;
		 findByStartAndDest.setQuantity(quantity);
		 
		 
		return findByStartAndDest;
	}

	@Override
	public void findByTrainIdRomove(Integer id) {
		 Optional<TrainTicket> findById = treainRepository.findById(id);
		 treainRepository.delete(findById.get());
		 
		 
		
	}
    //查詢火車
	@Override
	public Train findByTrainPriceSeach(String star, String end) {
		
		return tR.findByStartAndDest(star, end);
	}
	@Override
	public void groupDateRemainig(Integer id) {
		
		Optional<TravelGroupDateBean> findById = groupDateRepository.findById(id);
		
		TravelGroupDateBean travelGroupDateBean = findById.get();
		
		Integer remaining = travelGroupDateBean.getRemaining();
		remaining--;
		
		travelGroupDateBean.setRemaining(remaining);
		
		
		
	}
	
	

}
