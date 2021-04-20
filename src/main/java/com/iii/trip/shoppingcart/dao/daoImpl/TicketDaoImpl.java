package com.iii.trip.shoppingcart.dao.daoImpl;

import javax.persistence.EntityManager;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.iii.trip.shoppingcart.dao.TicketDao;
import com.iii.trip.trainandhotel.repository.Train;

@Repository
@Transactional
public class TicketDaoImpl implements TicketDao {
	
//	private SessionFactory sessFactory;
	@Autowired
	EntityManager en;
	
	
	
	@Override
	public Train seachTeain(String id) {

		Train train = en.find(Train.class, id);
		return train ;
	}

}
