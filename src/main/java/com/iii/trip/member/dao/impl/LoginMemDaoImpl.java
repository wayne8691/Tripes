package com.iii.trip.member.dao.impl;

import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.text.SimpleDateFormat;
import java.util.Base64;
import java.util.Base64.Encoder;
import java.util.Date;
import java.util.List;

import javax.persistence.EntityManager;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.iii.trip.attractions.model.AttractionsBean;
import com.iii.trip.attractions.model.RestaurantBean;
import com.iii.trip.attractions.model.TravelGroupBean;
import com.iii.trip.member.dao.LoginMemDao;
import com.iii.trip.member.model.BrowseRecordBean;
import com.iii.trip.member.model.CitytownBean;
import com.iii.trip.member.model.MemberBean;
import com.iii.trip.trainandhotel.repository.Hotel;

@Repository
public class LoginMemDaoImpl implements LoginMemDao {

//	@Autowired
//	SessionFactory factory;
	@Autowired
	EntityManager en;

	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

	@SuppressWarnings("unchecked")
	@Override
	public MemberBean getBaseData(String userid) {
//		Session session = factory.getCurrentSession();

		String hql = "From MemberBean m Where m.userid = :id";
		List<MemberBean> mblist = en.createQuery(hql).setParameter("id", userid).getResultList();
		MemberBean userinf = new MemberBean();

		userinf.setPassword(mblist.get(0).getPassword());
		userinf.setStatus(mblist.get(0).getStatus());
		userinf.setUserid(mblist.get(0).getUserid());
		userinf.setSalt(mblist.get(0).getSalt());
		userinf.setFail_count(mblist.get(0).getFail_count());
		userinf.setFail_time(mblist.get(0).getFail_time());
		userinf.setEmail(mblist.get(0).getEmail());
		return userinf;
	}

	@SuppressWarnings("unchecked")
	@Override
	public MemberBean getLoginInf(MemberBean memberBean) {
//		Session session = factory.getCurrentSession();

		String hql0 = "UPDATE MemberBean AS e SET e.last_logintime =  :last_logintime ,e.login_status = :login_status"
				+ " WHERE e.userid = :userid";// 先更新;
		en.createQuery(hql0).setParameter("last_logintime", sdf.format(new Date())).setParameter("login_status", 1)
				.setParameter("userid", memberBean.getUserid()).executeUpdate();

		String hql = "From MemberBean m Where m.userid = :id";
		List<MemberBean> mblist = en.createQuery(hql).setParameter("id", memberBean.getUserid()).getResultList();
		MemberBean userinf = new MemberBean();

		userinf.setUsernumber(mblist.get(0).getUsernumber());
		userinf.setBirthday(mblist.get(0).getBirthday());
		userinf.setEmail(mblist.get(0).getEmail());
		userinf.setImage(mblist.get(0).getImage());
		userinf.setA_address(mblist.get(0).getA_address());
		userinf.setB_address(mblist.get(0).getB_address());
		userinf.setC_address(mblist.get(0).getC_address());
		userinf.setName(mblist.get(0).getName());
		userinf.setPassword(mblist.get(0).getPassword());
		userinf.setPhone(mblist.get(0).getPhone());
		userinf.setRegistertime(mblist.get(0).getRegistertime());
		userinf.setStatus(mblist.get(0).getStatus());
		userinf.setUserid(mblist.get(0).getUserid());
		userinf.setSalt(mblist.get(0).getSalt());
		userinf.setFail_count(mblist.get(0).getFail_count());
		userinf.setFail_time(mblist.get(0).getFail_time());
		userinf.setLast_logintime(mblist.get(0).getLast_logintime());

		String string = new String(userinf.getImage());
		userinf.setImage1(string);

		return userinf;
	}

	@SuppressWarnings("unchecked")
	@Override
	public MemberBean forgetPassword(String userid, String password) {
//		Session session = factory.getCurrentSession();
		MemberBean forgetmb = new MemberBean();

		// 查詢使用者信箱
		String hql = "From MemberBean m Where m.userid = :id";
		List<MemberBean> mblist = en.createQuery(hql).setParameter("id", userid).getResultList();

		try {
			String salt = getRandomsalt();
			MessageDigest md = MessageDigest.getInstance("SHA-256");
			Encoder encoder = Base64.getEncoder();
			String salted = password + salt;
			md.update(salted.getBytes("UTF-8"));
			byte[] digest = md.digest();
			forgetmb.setUserid(mblist.get(0).getUserid());
			forgetmb.setEmail(mblist.get(0).getEmail());
			// 送更新後密碼
			String hql1 = "UPDATE MemberBean AS e SET e.password =  :pwd ,e.salt = :salt "
					+ " WHERE e.userid = :userid";// 先更新;
			en.createQuery(hql1).setParameter("pwd", encoder.encodeToString(digest)).setParameter("salt", salt)
					.setParameter("userid", userid).executeUpdate();
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}

		return forgetmb;

	}

	@Override
	public void upadatePersonal(MemberBean memberBean) {
//		Session session = factory.getCurrentSession();
		String hql = "UPDATE MemberBean " + " SET name  =  :name, " + " phone =  :phone, " + " a_address =  :a_address, "
				+ " b_address =  :b_address, " + " c_address =  :c_address " + " WHERE userid = :userid ";
		en.createQuery(hql).setParameter("name", memberBean.getName()).setParameter("phone", memberBean.getPhone())
				.setParameter("a_address", memberBean.getA_address()).setParameter("b_address", memberBean.getB_address())
				.setParameter("c_address", memberBean.getC_address()).setParameter("userid", memberBean.getUserid())
				.executeUpdate();
	}

	@Override
	public void saveImage(String userid, byte[] b) {
//		Session session = factory.getCurrentSession();
		String hql = "UPDATE MemberBean " + " SET image  =  :image " + " WHERE userid = :userid ";
		en.createQuery(hql).setParameter("image", b).setParameter("userid", userid).executeUpdate();

	}

	@Override
	public void updatePwd(String userid, String password) {
//		Session session = factory.getCurrentSession();

		try {
			String salt = getRandomsalt();
			MessageDigest md = MessageDigest.getInstance("SHA-256");
			Encoder encoder = Base64.getEncoder();
			String salted = password + salt;
			md.update(salted.getBytes("UTF-8"));
			byte[] digest = md.digest();
			String hql = "UPDATE MemberBean " + " SET password  =  :pwd ,salt = :salt " + " WHERE userid = :userid ";
			en.createQuery(hql).setParameter("pwd", encoder.encodeToString(digest)).setParameter("salt", salt)
					.setParameter("userid", userid).executeUpdate();
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<CitytownBean> searchTown(String city) {
		String hql = "FROM CitytownBean where i_county = :i_county";
//		Session session = factory.getCurrentSession();
		List<CitytownBean> citytownBeans = en.createQuery(hql).setParameter("i_county", city).getResultList();
		return citytownBeans;
	}

	@Override
	public void updatLast_logintime(MemberBean loginuserid) {
//		Session session = factory.getCurrentSession();
		String hql = "UPDATE MemberBean " + " SET  last_logintime =  :last_logintime,login_status = :login_status "
				+ " WHERE userid = :userid ";
		en.createQuery(hql).setParameter("last_logintime", loginuserid.getLast_logintime())
				.setParameter("login_status", 0).setParameter("userid", loginuserid.getUserid()).executeUpdate();
	}

	@Override
	public void updateAddress(MemberBean loginuser) {
//		Session session = factory.getCurrentSession();
		String hql = "UPDATE MemberBean " + " SET A_address = :A_address, B_address = :B_address, "
				+ " C_address = :C_address WHERE userid = :userid ";
		en.createQuery(hql).setParameter("A_address", loginuser.getA_address())
				.setParameter("B_address", loginuser.getB_address()).setParameter("C_address", loginuser.getC_address())
				.setParameter("userid", loginuser.getUserid()).executeUpdate();
	}

	@Override
	public void updateFailCount(MemberBean userinf) {
//		Session session = factory.getCurrentSession();
		String hql = "UPDATE MemberBean " + " SET fail_count = :fail_count, fail_time = :fail_time "
				+ " WHERE userid = :userid ";
		en.createQuery(hql).setParameter("fail_count", userinf.getFail_count() + 1)
				.setParameter("fail_time", sdf.format(new Date())).setParameter("userid", userinf.getUserid())
				.executeUpdate();
	}

	@Override
	public void resetFail(String userid) {
//		Session session = factory.getCurrentSession();
		String hql = "UPDATE MemberBean " + " SET fail_count = :fail_count " + " WHERE userid = :userid ";
		en.createQuery(hql).setParameter("fail_count", 0).setParameter("userid", userid).executeUpdate();
	}
	
	@Override
	public void browserrecord(BrowseRecordBean browseRecordBean) {
		en.persist(browseRecordBean);
	}
	
	@Override
	public List<BrowseRecordBean> getBrowserRecord(String userid) {
		String hql = "FROM BrowseRecordBean where userid = :userid order by browsetime desc";
		@SuppressWarnings("unchecked")
		List<BrowseRecordBean> browserrecord = en.createQuery(hql).setParameter("userid", userid).getResultList();
		return browserrecord;
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<TravelGroupBean> getGroupByName(String name) {
		String hql = "FROM TravelGroupBean where name = :name ";
		List<TravelGroupBean> list = en.createQuery(hql).setParameter("name", name).getResultList();
		return list;
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<Hotel> gethotHotel() {
		String hql = "FROM hotel order by click_count desc";
		List<Hotel> list = en.createQuery(hql).getResultList();
		return list;
	}
	

	@SuppressWarnings("unchecked")
	@Override
	public List<AttractionsBean> gethotAttraction() {
		String hql = "FROM AttractionsBean order by at_count desc";
		List<AttractionsBean> list = en.createQuery(hql).getResultList();
		return list;
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<RestaurantBean> gethotRestaurant() {
		String hql = "FROM RestaurantBean order by re_count desc";
		List<RestaurantBean> list = en.createQuery(hql).getResultList();
		return list;
	}
	
	// 亂數產生密碼
	private String getRandomsalt() {
		int z;
		StringBuilder sb = new StringBuilder();
		int i;

		for (i = 0; i < 5; i++) {
			z = (int) ((Math.random() * 7) % 3);
			if (z == 1) { // 放數字
				sb.append((int) ((Math.random() * 10) + 48));
			} else if (z == 2) { // 放大寫英文
				sb.append((char) (((Math.random() * 26) + 65)));
			} else {// 放小寫英文
				sb.append(((char) ((Math.random() * 26) + 97)));
			}
		}
		return sb.toString();
	}

	


}
