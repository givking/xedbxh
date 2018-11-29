package com.scder.cszh.donation.dao;

import java.util.List;

import javax.persistence.Query;

import org.springframework.stereotype.Component;

import com.scder.common.BaseDaoSupport;
import com.scder.cszh.donation.model.Donation;
import com.scder.system.menu.model.Menu;

@Component("donationdao")
public class DonationDaoImpl extends BaseDaoSupport implements DonationDao{

	@Override
	public List<Donation> getDonationList(String sql) throws Exception {
		Query q = em.createNativeQuery(sql, Donation.class);
		return q.getResultList();
	}
	//HQL·½·¨
	@Override
	public List<Donation> getSelfDonationList() throws Exception {
		//String sql = "select * from cs_donation ";
		Query q=em.createQuery(" from Donation");
		//Query q = em.createNativeQuery(sql);
		return q.getResultList();
	}

}
