package com.iii.trip.member.dao.impl;

import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Base64;
import java.util.Base64.Encoder;
import java.util.List;

import javax.persistence.EntityManager;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.remoting.RemoteTimeoutException;
import org.springframework.stereotype.Repository;

import com.iii.trip.member.dao.RegisterMemDao;
import com.iii.trip.member.model.MemberBean;

@Repository
public class RegisterMemDaoImpl implements RegisterMemDao {

//	@Autowired
//	enFactory factory;
	@Autowired
	EntityManager en;

	@SuppressWarnings("unchecked")
	@Override
	public boolean checkFirst() {
		boolean first = false;

		String hql = "From MemberBean m ";
		List<MemberBean> mblist = en.createQuery(hql).getResultList();
		if (mblist.isEmpty()) {
			first = true;
		} else {
			first = false;
		}

		return first;
	}

	@SuppressWarnings("unchecked")
	@Override
	public boolean checkMemId(String userid) {
		boolean exist = false;

		String hql = "From MemberBean m Where m.userid = :id";
		List<MemberBean> mblist = en.createQuery(hql).setParameter("id", userid).getResultList();
		if (mblist.isEmpty()) {
			exist = false;
		} else {
			exist = true;
		}

		return exist;
	}

	@Override
	public void save(MemberBean memberBean) {
		String salt = getRandomsalt();
		try {
			MessageDigest md = MessageDigest.getInstance("SHA-256");
			Encoder encoder = Base64.getEncoder();
			String salted = memberBean.getPassword() + salt;
			md.update(salted.getBytes("UTF-8"));
			byte[] digest = md.digest();
			memberBean.setPassword(encoder.encodeToString(digest));
			memberBean.setSalt(salt);
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}

		if (checkMemId(memberBean.getUserid())) {
			throw new RemoteTimeoutException("此帳號已存在");
		}

		en.persist(memberBean);

	}


	@Override
	public void updateStatus(String userid) {
		String hql = "UPDATE MemberBean " + " SET status = :status  " + " WHERE userid = :userid ";
		en.createQuery(hql).setParameter("status", "c_Member").setParameter("userid", userid).executeUpdate();

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
