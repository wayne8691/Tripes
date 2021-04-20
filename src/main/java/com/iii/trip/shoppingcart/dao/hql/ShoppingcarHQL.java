package com.iii.trip.shoppingcart.dao.hql;



public class ShoppingcarHQL {
	
	public static String queryProduct="from TravelRollsProduct where FK_member_id= :mem and situation= :sion";
	public static String queryroom="from room   where city_id= :ct";
	public static String serachOrder="from ShoppingOrder   where member_id= :mem";
	public static String updateShooingcart ="UPDATE TravelRollsProduct SET situation= :buy Where number_id= :id";
}
