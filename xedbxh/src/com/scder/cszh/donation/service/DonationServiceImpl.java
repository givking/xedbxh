package com.scder.cszh.donation.service;


import java.util.List;

import javax.annotation.Resource;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.scder.common.BaseDao;
import com.scder.common.BaseServiceSupport;
import com.scder.cszh.donation.dao.DonationDao;
import com.scder.cszh.donation.model.Donation;

@Service("donationService")
@Transactional
public class DonationServiceImpl extends BaseServiceSupport implements DonationService {
	DonationDao donationdao;
	@Override
	@Resource(name="donationdao")
	public void setBasedao(BaseDao basedao) {
		this.basedao = basedao;
		donationdao = (DonationDao)basedao;
	}
	@Override
	public List<Donation> getDonationList(String sql) throws Exception {
		
		return donationdao.getDonationList(sql);
	}
	@Override
	public List<Donation> getSelfDonationList() throws Exception {
		// TODO Auto-generated method stub
		return donationdao.getSelfDonationList();
	}


}
