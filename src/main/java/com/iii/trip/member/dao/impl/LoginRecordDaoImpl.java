package com.iii.trip.member.dao.impl;

import java.util.List;

import javax.persistence.EntityManager;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.iii.trip.member.dao.LoginRecordDao;
import com.iii.trip.member.model.LoginInfBean;

@Repository
public class LoginRecordDaoImpl implements LoginRecordDao {

	@Autowired
	EntityManager en;


	@Override
	public void saveLoginRecord(LoginInfBean loginInfBean) {
		
		en.persist(loginInfBean);
	}

	@Override
	public void updateLogout(LoginInfBean loginrecord) {
		
		en.merge(loginrecord);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<LoginInfBean> getAllRecord(String userid) {
		String hql = "FROM LoginInfBean where userid = :userid";
		
		List<LoginInfBean> record = en.createQuery(hql).setParameter("userid", userid).getResultList();

		return record;
	}

}
