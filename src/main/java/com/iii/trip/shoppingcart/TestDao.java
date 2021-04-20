package com.iii.trip.shoppingcart;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.iii.trip.attractions.model.AttractionsBean;
@Repository
@Transactional
public class TestDao {
	@Autowired
	 SessionFactory sessionFactory;

	
	
}
