package com.iii.trip.member.dao.impl;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.iii.trip.attractions.model.AttractionsBean;
import com.iii.trip.attractions.model.RestaurantBean;
import com.iii.trip.attractions.model.TravelGroupBean;
import com.iii.trip.member.dao.ManageDao;
import com.iii.trip.member.model.MemberBean;
import com.iii.trip.trainandhotel.repository.Hotel;

@Repository
public class ManageDaoImpl implements ManageDao {
	@Autowired
	EntityManager en;

	@SuppressWarnings("unchecked")
	@Override
	public List<MemberBean> getAllmembers() {
		String hql = "FROM MemberBean order by status";

		List<MemberBean> members = en.createQuery(hql).getResultList();

		for (int i = 0; i < members.size(); i++) {
			String string = new String(members.get(i).getImage());
			members.get(i).setImage1(string);
		}

		return members;
	}

	@Override
	public void updateStatus(String userid, String status) {

		String hql = "UPDATE MemberBean " + " SET status  =  :status " + " WHERE userid = :userid ";
		en.createQuery(hql).setParameter("status", status).setParameter("userid", userid).executeUpdate();
	}

	@Override
	public List<MemberBean> findthisMember(String userid) {
		String hql = "FROM MemberBean where userid = :id";

		@SuppressWarnings("unchecked")
		List<MemberBean> members = en.createQuery(hql).setParameter("id", userid).getResultList();

		return members;

	}

	@SuppressWarnings("unchecked")
	@Override
	public List<MemberBean> getAllmembers1() {
		String hql = "FROM MemberBean order by registertime";

		List<MemberBean> members = en.createQuery(hql).getResultList();

		return members;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<MemberBean> getAllAdmin() {
		String hql = "FROM MemberBean where status = 'a_Admin'";

		List<MemberBean> members = en.createQuery(hql).getResultList();

		return members;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Integer> getStatus() {
		List<Integer> list0 = new ArrayList<Integer>();
		String hql1 = "FROM MemberBean where status = 'a_Admin'";
		List<MemberBean> list1 = en.createQuery(hql1).getResultList();
		String hql2 = "FROM MemberBean where status = 'b_Manager'";
		List<MemberBean> list2 = en.createQuery(hql2).getResultList();
		String hql3 = "FROM MemberBean where status = 'c_Member'";
		List<MemberBean> list3 = en.createQuery(hql3).getResultList();
		String hql4 = "FROM MemberBean where status = 'y_Notcertified'";
		List<MemberBean> list4 = en.createQuery(hql4).getResultList();
		String hql5 = "FROM MemberBean where status = 'z_Suspension'";
		List<MemberBean> list5 = en.createQuery(hql5).getResultList();
		list0.add(list1.size());
		list0.add(list2.size());
		list0.add(list3.size());
		list0.add(list4.size());
		list0.add(list5.size());

		return list0;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Integer> getArea() {
		List<Integer> list0 = new ArrayList<Integer>();
		String hql1 = "FROM MemberBean where a_address = '台北市' or a_address = '新北市'  or a_address = '基隆市' or a_address = '桃園市' or a_address = '新竹市' or a_address = '新竹縣' or a_address = '宜蘭縣' ";
		List<MemberBean> list1 = en.createQuery(hql1).getResultList();
		String hql2 = "FROM MemberBean where a_address = '苗栗縣' or a_address = '台中市'  or a_address = '彰化縣' or a_address = '南投縣' or a_address = '雲林縣' ";
		List<MemberBean> list2 = en.createQuery(hql2).getResultList();
		String hql3 = "FROM MemberBean where a_address = '嘉義市' or a_address = '嘉義縣'  or a_address = '台南市' or a_address = '高雄市' or a_address = '屏東縣' or a_address = '澎湖縣' ";
		List<MemberBean> list3 = en.createQuery(hql3).getResultList();
		String hql4 = "FROM MemberBean where a_address = '花蓮縣' or a_address = '台東縣' ";
		List<MemberBean> list4 = en.createQuery(hql4).getResultList();
		String hql5 = "FROM MemberBean where a_address = '金門縣' or a_address = '連江縣' ";
		List<MemberBean> list5 = en.createQuery(hql5).getResultList();
		list0.add(list1.size());
		list0.add(list2.size());
		list0.add(list3.size());
		list0.add(list4.size());
		list0.add(list5.size());

		return list0;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Integer> get7dayrecord() {
		List<Integer> list0 = new ArrayList<Integer>();
		String hql1 = "FROM LoginInfBean where  SUBSTRING(login_time, 1, 10) <= GETDATE() and SUBSTRING(login_time, 1, 10) > GETDATE()-1";
		List<MemberBean> list1 = en.createQuery(hql1).getResultList();
		String hql2 = "FROM LoginInfBean where  SUBSTRING(login_time, 1, 10) <= GETDATE()-1 and SUBSTRING(login_time, 1, 10) > GETDATE()-2";
		List<MemberBean> list2 = en.createQuery(hql2).getResultList();
		String hql3 = "FROM LoginInfBean where  SUBSTRING(login_time, 1, 10) <= GETDATE()-2 and SUBSTRING(login_time, 1, 10) > GETDATE()-3";
		List<MemberBean> list3 = en.createQuery(hql3).getResultList();
		String hql4 = "FROM LoginInfBean where  SUBSTRING(login_time, 1, 10) <= GETDATE()-3 and SUBSTRING(login_time, 1, 10) > GETDATE()-4";
		List<MemberBean> list4 = en.createQuery(hql4).getResultList();
		String hql5 = "FROM LoginInfBean where  SUBSTRING(login_time, 1, 10) <= GETDATE()-4 and SUBSTRING(login_time, 1, 10) > GETDATE()-5";
		List<MemberBean> list5 = en.createQuery(hql5).getResultList();
		String hql6 = "FROM LoginInfBean where  SUBSTRING(login_time, 1, 10) <= GETDATE()-5 and SUBSTRING(login_time, 1, 10) > GETDATE()-6";
		List<MemberBean> list6 = en.createQuery(hql6).getResultList();
		String hql7 = "FROM LoginInfBean where  SUBSTRING(login_time, 1, 10) <= GETDATE()-6 and SUBSTRING(login_time, 1, 10) > GETDATE()-7";
		List<MemberBean> list7 = en.createQuery(hql7).getResultList();

		list0.add(list1.size());
		list0.add(list2.size());
		list0.add(list3.size());
		list0.add(list4.size());
		list0.add(list5.size());
		list0.add(list6.size());
		list0.add(list7.size());

		return list0;
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<Integer> getAge() {
		List<Integer> list0 = new ArrayList<Integer>();
		String hql1 = "FROM MemberBean where DATEDIFF(YEAR,birthday,GETDATE())<14 ";
		List<MemberBean> list1 = en.createQuery(hql1).getResultList();
		String hql2 = "FROM MemberBean where DATEDIFF(YEAR,birthday,GETDATE())>=14 and DATEDIFF(YEAR,birthday,GETDATE())<=20 ";
		List<MemberBean> list2 = en.createQuery(hql2).getResultList();
		String hql3 = "FROM MemberBean where DATEDIFF(YEAR,birthday,GETDATE())>=21 and DATEDIFF(YEAR,birthday,GETDATE())<=30 ";
		List<MemberBean> list3 = en.createQuery(hql3).getResultList();
		String hql4 = "FROM MemberBean where DATEDIFF(YEAR,birthday,GETDATE())>=31 and DATEDIFF(YEAR,birthday,GETDATE())<=40 ";
		List<MemberBean> list4 = en.createQuery(hql4).getResultList();
		String hql5 = "FROM MemberBean where DATEDIFF(YEAR,birthday,GETDATE())>=41 and DATEDIFF(YEAR,birthday,GETDATE())<=50 ";
		List<MemberBean> list5 = en.createQuery(hql5).getResultList();
		String hql6 = "FROM MemberBean where DATEDIFF(YEAR,birthday,GETDATE())>=51 and DATEDIFF(YEAR,birthday,GETDATE())<=65 ";
		List<MemberBean> list6 = en.createQuery(hql6).getResultList();
		String hql7 = "FROM MemberBean where DATEDIFF(YEAR,birthday,GETDATE())>65  ";
		List<MemberBean> list7 = en.createQuery(hql7).getResultList();

		list0.add(list1.size());
		list0.add(list2.size());
		list0.add(list3.size());
		list0.add(list4.size());
		list0.add(list5.size());
		list0.add(list6.size());
		list0.add(list7.size());

		return list0;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<AttractionsBean> getAAttractions() {
		String hql = "FROM AttractionsBean order by at_count desc";
		List<AttractionsBean> list = en.createQuery(hql).getResultList();
		return list;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<RestaurantBean> getRestaurants() {
		String hql = "FROM RestaurantBean order by re_count desc";
		List<RestaurantBean> list = en.createQuery(hql).getResultList();
		return list;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Integer> getAttractionsArea() {
		List<Integer> list0 = new ArrayList<Integer>();
		String hql1 = "FROM AttractionsBean where at_counties = '台北市'  or at_counties = '新北市'  or at_counties = '基隆市'  or at_counties = '桃園市'  or at_counties = '新竹市'  or at_counties = '新竹縣'  or at_counties = '宜蘭縣' ";
		List<AttractionsBean> list1 = en.createQuery(hql1).getResultList();
		String hql2 = "FROM AttractionsBean where at_counties = '苗栗縣' or at_counties = '台中市'  or at_counties = '彰化縣' or at_counties = '南投縣' or at_counties = '雲林縣' ";
		List<AttractionsBean> list2 = en.createQuery(hql2).getResultList();
		String hql3 = "FROM AttractionsBean where at_counties = '嘉義市' or at_counties = '嘉義縣'  or at_counties = '台南市' or at_counties = '高雄市' or at_counties = '屏東縣' or at_counties = '澎湖縣' ";
		List<AttractionsBean> list3 = en.createQuery(hql3).getResultList();
		String hql4 = "FROM AttractionsBean where at_counties = '花蓮縣' or at_counties = '台東縣' ";
		List<AttractionsBean> list4 = en.createQuery(hql4).getResultList();
		String hql5 = "FROM AttractionsBean where at_counties = '金門縣' or at_counties = '連江縣' ";
		List<AttractionsBean> list5 = en.createQuery(hql5).getResultList();
		list0.add(list1.size());
		list0.add(list2.size());
		list0.add(list3.size());
		list0.add(list4.size());
		list0.add(list5.size());

		return list0;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Integer> getRestaurantsArea() {
		List<Integer> list0 = new ArrayList<Integer>();
		String hql1 = "FROM RestaurantBean where re_counties = '台北市'  or re_counties = '新北市'  or re_counties = '基隆市'  or re_counties = '桃園市'  or re_counties = '新竹市'  or re_counties = '新竹縣'  or re_counties = '宜蘭縣' ";
		List<RestaurantBean> list1 = en.createQuery(hql1).getResultList();
		String hql2 = "FROM RestaurantBean where re_counties = '苗栗縣' or re_counties = '台中市'  or re_counties = '彰化縣' or re_counties = '南投縣' or re_counties = '雲林縣' ";
		List<RestaurantBean> list2 = en.createQuery(hql2).getResultList();
		String hql3 = "FROM RestaurantBean where re_counties = '嘉義市' or re_counties = '嘉義縣'  or re_counties = '台南市' or re_counties = '高雄市' or re_counties = '屏東縣' or re_counties = '澎湖縣' ";
		List<RestaurantBean> list3 = en.createQuery(hql3).getResultList();
		String hql4 = "FROM RestaurantBean where re_counties = '花蓮縣' or re_counties = '台東縣' ";
		List<RestaurantBean> list4 = en.createQuery(hql4).getResultList();
		String hql5 = "FROM RestaurantBean where re_counties = '金門縣' or re_counties = '連江縣' ";
		List<RestaurantBean> list5 = en.createQuery(hql5).getResultList();
		list0.add(list1.size());
		list0.add(list2.size());
		list0.add(list3.size());
		list0.add(list4.size());
		list0.add(list5.size());

		return list0;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Integer> getatreSum() {
		List<Integer> list0 = new ArrayList<Integer>();
		
		String hql = "FROM AttractionsBean ";
		List<AttractionsBean> list = en.createQuery(hql).getResultList();
		String hql1 = "FROM RestaurantBean ";
		List<RestaurantBean> list1 = en.createQuery(hql1).getResultList();
		String hql2 = "FROM TravelGroupBean ";
		List<TravelGroupBean> list2 = en.createQuery(hql2).getResultList();
		String hql3 = "FROM hotel ";
		List<Hotel> list3 = en.createQuery(hql3).getResultList();
		list0.add(list.size());
		list0.add(list1.size());
		list0.add(list2.size());
		list0.add(list3.size());
		return list0;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Object[]> getTravel() {
		String sql = "SELECT fk_travel_group_bean_id,count(fk_travel_group_bean_id) as count FROM Travel group by fk_travel_group_bean_id  order by count desc";
		List<Object[]> list1 = en.createNativeQuery(sql).getResultList();
		return list1;
	}


	@SuppressWarnings("unchecked")
	@Override
	public List<TravelGroupBean> getbytrpk(int i) {
		String hql = "FROM TravelGroupBean where id = :id";
		List<TravelGroupBean> list = en.createQuery(hql).setParameter("id",i).getResultList();
		return list;
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<Object[]> getHotelnum() {
		String sql = "SELECT hotel_id,count(hotel_id) as count FROM room_order group by hotel_id  order by count desc";
		List<Object[]> list1 = en.createNativeQuery(sql).getResultList();
		return list1;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Hotel> getbyhtpk(String i) {
		String hql = "FROM hotel where id = :id";
		List<Hotel> list = en.createQuery(hql).setParameter("id",i).getResultList();
		return list;
	}

}
