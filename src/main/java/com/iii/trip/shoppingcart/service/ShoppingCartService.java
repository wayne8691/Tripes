package com.iii.trip.shoppingcart.service;

import java.util.List;

import com.iii.trip.attractions.model.AttractionsBean;
import com.iii.trip.member.model.MemberBean;
import com.iii.trip.shoppingcart.model.ProductShopping;
import com.iii.trip.shoppingcart.model.ShoppingOrder;
import com.iii.trip.shoppingcart.model.TrainTicket;
import com.iii.trip.shoppingcart.model.TravelRollsProduct;
import com.iii.trip.trainandhotel.repository.Room;
import com.iii.trip.trainandhotel.repository.RoomOrder;

public interface ShoppingCartService {
	//飯店
	public List<TravelRollsProduct> queryProduct(MemberBean member);
	public boolean insertProduct(TravelRollsProduct car);
	public Room queryRoom(String room_id);
	public TravelRollsProduct queryProduct(TravelRollsProduct tNrane);
	public Integer productRemoveAll(TravelRollsProduct tBean);
	
	public boolean updateQuery(String id,String query);
	
	public List<Room> room(String city_id);
	public ProductShopping shoppingProduct(Integer id);
	public ProductShopping shoppingProductUpdate(ProductShopping p);
	public void removeHotel(Integer pk);
	public Integer shoppingOrderFound(ShoppingOrder addOrder);
	public List<ShoppingOrder>  serachOrder(MemberBean member);
	public TravelRollsProduct addTrain(MemberBean member,TrainTicket trainTicket);
	public TravelRollsProduct queryCar(MemberBean member);
	public ProductShopping removeproduct(Integer id);
	public void roomOrderS(RoomOrder roomOrder);
	
	
	
//	public AttractionsBean att();
}
