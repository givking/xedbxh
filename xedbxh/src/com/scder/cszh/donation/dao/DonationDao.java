package com.scder.cszh.donation.dao;

import java.util.List;

import com.scder.cszh.donation.model.Donation;

public interface DonationDao {
public List<Donation> getDonationList(String sql) throws Exception;
public List<Donation> getSelfDonationList() throws Exception;
}
