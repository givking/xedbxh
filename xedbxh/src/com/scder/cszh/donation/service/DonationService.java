package com.scder.cszh.donation.service;

import java.util.List;

import com.scder.cszh.donation.model.Donation;

public interface DonationService {
	
	public List<Donation> getDonationList(String sql) throws Exception;
	public List<Donation> getSelfDonationList() throws Exception;
}
