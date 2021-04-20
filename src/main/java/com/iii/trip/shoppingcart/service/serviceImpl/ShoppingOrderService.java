package com.iii.trip.shoppingcart.service.serviceImpl;

import java.util.List;
import java.util.Optional;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.iii.trip.shoppingcart.dao.ProductRepository;
import com.iii.trip.shoppingcart.dao.ShoppingCart;
import com.iii.trip.shoppingcart.dao.ShoppingOrders;
import com.iii.trip.shoppingcart.model.ProductShopping;
import com.iii.trip.shoppingcart.model.ShoppingOrder;
import com.iii.trip.shoppingcart.model.TravelRollsProduct;

@Service
@Transactional
public class ShoppingOrderService {
	@Autowired
	private ShoppingOrders order;
	@Autowired
	private ProductRepository productRepository;
	@Autowired
	private ShoppingCart shoppingCart;
	public List<ShoppingOrder> findByMember(String name) {

		return order.findByName(name);

	}

	public List<TravelRollsProduct> findshoppingCartAll() {

		List<TravelRollsProduct> findAll = shoppingCart.findAll();

		return findAll;
	}
	
	public List<ShoppingOrder> findAll() {

		List<ShoppingOrder> findAll = order.findAll();

		return findAll;
	}

	public ShoppingOrder findByProductId(Integer id) {
     
		Optional<ShoppingOrder> findById = order.findById(id);

		return findById.get();
	}
	public void checkOut(Integer id,String checkout) {
	     
		Optional<ProductShopping> findById = productRepository.findById(id);
		ProductShopping checked =findById.get();
		if("Hotelout".equals(checkout)) {
			
			productRepository.deleteById(id);
			
		}else if("NotHotelout".equals(checkout)) {
			checked.setRoomout(1);
		}
	}
	
	
	
	

}
