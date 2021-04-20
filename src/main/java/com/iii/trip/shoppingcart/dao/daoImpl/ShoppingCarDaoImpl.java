package com.iii.trip.shoppingcart.dao.daoImpl;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.iii.trip.member.model.MemberBean;
import com.iii.trip.shoppingcart.dao.ShoppingCarDao;
import com.iii.trip.shoppingcart.dao.hql.ShoppingcarHQL;
import com.iii.trip.shoppingcart.model.ProductShopping;
import com.iii.trip.shoppingcart.model.ShoppingOrder;
import com.iii.trip.shoppingcart.model.TrainTicket;
import com.iii.trip.shoppingcart.model.TravelRollsProduct;
import com.iii.trip.trainandhotel.repository.City;
import com.iii.trip.trainandhotel.repository.Room;

@Repository
@Transactional
public class ShoppingCarDaoImpl implements ShoppingCarDao {
	@Autowired
	EntityManager en;

	@Override
	public List<TravelRollsProduct> queryProduct(MemberBean mBean) {

		

		@SuppressWarnings("unchecked")
		List<TravelRollsProduct> sBean = en.createQuery(ShoppingcarHQL.queryProduct).setParameter("mem", mBean)
				.setParameter("sion", "0").getResultList();
		if (sBean.size() != 0) {
			System.out.println(sBean.get(0).getTrain().size());
			System.out.println("aaaaaaaaaaaaaaaaaaa"+sBean.get(0).getTravel().size());
		}

		return sBean;
	}

	public ProductShopping shoppingProduct(Integer id) {

		
		ProductShopping productShopping = en.find(ProductShopping.class, id);

		return productShopping;

	}

	@Override
	public TravelRollsProduct queryProduct(TravelRollsProduct tNrane) {

		

		TravelRollsProduct sBean = en.find(TravelRollsProduct.class, tNrane.getNumber_id());
		sBean.getRoom_id().size();
		return sBean;
	}

	@Override
	public boolean insertProduct(TravelRollsProduct car) {
		
		TravelRollsProduct cars = (TravelRollsProduct) en.merge(car);

		if (cars != null) {
			return true;
		}
		return false;
	}

	@Override
	public Room queryRoom(String room_id) {
		
		Room room = (Room) en.find(Room.class, room_id);
		return room;
	}

	@Override
	public Integer productRemoveAll(TravelRollsProduct tBean) {
		

		en.remove(tBean);
		return 1;
	}

	@Override
	public boolean updateQuery(String id, String query) {
		
		System.out.println(id);
		System.out.println(query);
		int ids = Integer.valueOf(id);
		int q = Integer.valueOf(query);

		ProductShopping pBean = en.find(ProductShopping.class, ids);

		pBean.setQuantity(q);
		ProductShopping pBeans = (ProductShopping) en.merge(pBean);

		if (pBeans != null) {
			return true;
		}

		return false;
	}

	public List<Room> room(String city_id) {

		System.out.println("DAO=" + city_id);

		
		City citys = en.find(City.class, city_id);

		@SuppressWarnings("unchecked")
		List<Room> rooms = en.createQuery(ShoppingcarHQL.queryroom).setParameter("ct", citys).getResultList();

		return rooms;
	}

	@Override
	public ProductShopping shoppingProductUpdate(ProductShopping p) {
		
		ProductShopping hotel = en.find(ProductShopping.class, p.getId());
		hotel.setQuantity(p.getQuantity());
		en.merge(hotel);

		return hotel;
	}

	@Override
	public void removeHotel(Integer pk) {

		

		ProductShopping p = en.find(ProductShopping.class, pk);
		en.remove(p);

	}

	@Override
	public Integer shoppingOrderFound(ShoppingOrder addOrder) {
		
//		Integer upInteger = en.createQuery(ShoppingcarHQL.updateShooingcart).setParameter("buy", "1").setParameter("id", id).executeUpdate();
		addOrder.getShoppingcar_id().setSituation("1");
		
		en.persist(addOrder);

		return 1;
	}

	@SuppressWarnings({ "unused", "unchecked" })
	@Override
	public List<ShoppingOrder> serachOrder(MemberBean member) {
		
		List<ShoppingOrder> memberOrder = en.createQuery(ShoppingcarHQL.serachOrder)
				.setParameter("mem", member.getUserid()).getResultList();
		List<ShoppingOrder> memberOrder2 = new ArrayList<ShoppingOrder>();
		if (memberOrder.size() != 0) {
			for (int i = 0; i < memberOrder.size(); i++) {
				System.out.println("jjjjjjjjjjjjjjjjjjjjjjjj" + memberOrder.size());
				memberOrder.get(i).getShoppingcar_id();
				memberOrder.get(i).getShoppingcar_id().getRoom_id().size();
				System.out
						.println("trrrrrrrrrrrrrrrrrrrrrrr" + memberOrder.get(i).getShoppingcar_id().getTrain().size());
				System.out
						.println("ttttttttttttttttttttte" + memberOrder.get(i).getShoppingcar_id().getTravel().size());
				System.out.println("55555555555555555");
			}
			return memberOrder;
		}

		return memberOrder2;
	}

	@Override
	public TravelRollsProduct serachOrder(MemberBean member, TrainTicket trainTicket) {
		List<TravelRollsProduct> tt = queryProduct(member);
		tt.get(0).getTrain().add(trainTicket);

		TravelRollsProduct tr = tt.get(0);
		return tr;
	}

	@Override
	public TravelRollsProduct findById(MemberBean member) {
		return null;
	}

	@Override
	public ProductShopping findremoveById(Integer id) {
		

		ProductShopping productShopping = en.find(ProductShopping.class, id);
		en.remove(productShopping);
		return productShopping;
	}

//	public AttractionsBean att() {
//		en en =sessFactory.getCurrenten();
//		
//		
//		AttractionsBean atts =en.get(AttractionsBean.class,1);
//		
//		
//		
//		return atts;
//	}
//	

}
