package com.iii.trip.shoppingcart.service.serviceImpl;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.iii.trip.member.model.MemberBean;
import com.iii.trip.shoppingcart.dao.ProductRepository;
import com.iii.trip.shoppingcart.dao.ShoppingCart;
import com.iii.trip.shoppingcart.model.ProductShopping;
import com.iii.trip.shoppingcart.model.TravelRollsProduct;

@Service
@Transactional
public class ProductService {
	@Autowired
	private ProductRepository productRepository;
	private ShoppingCart shoppingCart;
	
	
	
	public void removeProduct(Integer id) {
		
		productRepository.deleteById(id);
		
	}
	public TravelRollsProduct Ticket(TravelRollsProduct car) {
		
		return shoppingCart.saveAndFlush(car);
		
		
		
	}
	public void checkOuthotel(Integer id,String message,MemberBean member) {
		
		Optional<ProductShopping> findById = productRepository.findById(id);	
		ProductShopping hotel =findById.get();
		hotel.setCheckout(1);		  
		hotel.setReason(message);
		hotel.setMember(member.getUserid());
		hotel.setRoomout(0);;		
	}
	
	

}
