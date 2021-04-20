package com.iii.trip.shoppingcart.dao;

import java.util.List;
import com.iii.trip.member.model.MemberBean;
import com.iii.trip.shoppingcart.model.ProductShopping;
import com.iii.trip.shoppingcart.model.ShoppingOrder;
import com.iii.trip.shoppingcart.model.TrainTicket;
import com.iii.trip.shoppingcart.model.TravelRollsProduct;
import com.iii.trip.trainandhotel.repository.Room;


public interface ShoppingCarDao {
	
	//收尋會員購物車內商品
	public List<TravelRollsProduct> queryProduct(MemberBean menber);
	//新增商品加入至購物車
	public boolean insertProduct(TravelRollsProduct car);
    //收尋商品詳細
	public Room queryRoom(String room_id);
	//收尋以購買商品資訊
	public TravelRollsProduct queryProduct(TravelRollsProduct tNrane);
	
	//刪除全部商品
	public Integer productRemoveAll(TravelRollsProduct tBean);
	//更新商品數量
	public boolean updateQuery(String id,String query);
	
	
	public List<Room> room(String city_id);
	public ProductShopping shoppingProduct(Integer id);
	public ProductShopping shoppingProductUpdate(ProductShopping p);
	public void removeHotel(Integer pk);
	public Integer shoppingOrderFound(ShoppingOrder addOrder);
	public List<ShoppingOrder>  serachOrder(MemberBean member);
//	public AttractionsBean att();
	public TravelRollsProduct serachOrder(MemberBean member, TrainTicket trainTicket);
	public TravelRollsProduct findById(MemberBean member);
	public ProductShopping findremoveById(Integer id);
	

}
