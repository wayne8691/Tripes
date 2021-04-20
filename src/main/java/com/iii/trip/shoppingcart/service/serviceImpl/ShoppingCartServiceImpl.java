package com.iii.trip.shoppingcart.service.serviceImpl;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.iii.trip.member.model.MemberBean;
import com.iii.trip.shoppingcart.dao.RoomOrderRepostotry;
import com.iii.trip.shoppingcart.dao.ShoppingCarDao;
import com.iii.trip.shoppingcart.dao.ShoppingCart;
import com.iii.trip.shoppingcart.model.ProductShopping;
import com.iii.trip.shoppingcart.model.ShoppingOrder;
import com.iii.trip.shoppingcart.model.TrainTicket;
import com.iii.trip.shoppingcart.model.TravelRollsProduct;
import com.iii.trip.shoppingcart.service.ShoppingCartService;
import com.iii.trip.trainandhotel.repository.Room;
import com.iii.trip.trainandhotel.repository.RoomOrder;


@Service
public class ShoppingCartServiceImpl implements ShoppingCartService {
	@Autowired
	private ShoppingCarDao dao;
	@Autowired
	private ShoppingCart shoppingCart;
    @Autowired
    private RoomOrderRepostotry roomOrdererORepostotry;
    

	public List<TravelRollsProduct> queryProduct(MemberBean member) {
		
		
		
		
		return dao.queryProduct(member);
	}

	
	@Override
	public boolean insertProduct(TravelRollsProduct car) {
		shoppingCart.saveAndFlush(car);
		
		return true;	
	}
	@Override
	public Room queryRoom(String room_id) {
		return dao.queryRoom(room_id);
	}
	
	@Override
	public TravelRollsProduct queryProduct(TravelRollsProduct tNrane) {
		TravelRollsProduct PkConfuse=dao.queryProduct(tNrane);
		
		
		return PkConfuse;
	}


	@Override
	public Integer productRemoveAll(TravelRollsProduct tBean) {
		
		return dao.productRemoveAll(tBean);
	}


	@Override
	public boolean updateQuery(String id, String query) {
	
		return dao.updateQuery(id, query);
	}
	
	
	@Override
	public List<Room> room(String city_id) {
		
		return dao.room(city_id);
	}


	@Override
	public ProductShopping shoppingProduct(Integer id) {
		
		return dao.shoppingProduct(id);
	}


	

	@Override
	public ProductShopping shoppingProductUpdate(ProductShopping p) {
		
		return dao.shoppingProductUpdate(p);
	}


	@Override
	public void removeHotel(Integer pk) {
		dao.removeHotel(pk);
		
	}
	
	
	public void roomOrderS(RoomOrder roomOrder) {
		
		RoomOrder roomOrder2 = roomOrder;
		roomOrdererORepostotry.save(roomOrder2);
		
		
	}


	@Override
	public Integer shoppingOrderFound(ShoppingOrder addOrder) {
		
		
		return dao.shoppingOrderFound(addOrder);
	}


	@Override
	public List<ShoppingOrder>  serachOrder(MemberBean member) {
		
		return dao.serachOrder(member);
	}


	@Override
	public TravelRollsProduct addTrain(MemberBean member, TrainTicket trainTicket) {
		
		return dao.serachOrder(member,trainTicket);
	}


	@Override
	public TravelRollsProduct queryCar(MemberBean member) {
		// TODO Auto-generated method stub
		return dao.findById(member);
	}


	@Override
	public ProductShopping removeproduct(Integer id) {
		
		return dao.findremoveById(id);
	}
	
//	public AttractionsBean att() {
//		
//		
//		return dao.att();
//		
//	}
	

}
