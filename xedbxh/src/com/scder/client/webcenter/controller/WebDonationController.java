package com.scder.client.webcenter.controller;

import java.util.List;

import com.scder.cszh.donation.model.Donation;
import com.scder.cszh.donation.service.DonationService;
import com.scder.system.article.model.Article;
import com.scder.system.article.service.ArticleService;
import com.scder.utils.BookPage;

public class WebDonationController {
	
	public List<Donation> getShowDonationList(DonationService donationservice,String orderby,Integer limit) throws Exception{
		String sql = "select o.* from cs_donation o  "+orderby+" limit 0,"+limit;
		return donationservice.getDonationList(sql);
	}
	public  List<Donation> getDonationList(DonationService donationservice,BookPage page,String orderby) throws Exception{
		
		String sql = "select o.* from cs_donation o";
		page.setResultcount(donationservice.getDonationList(sql).size());
		List<Donation> donlist = donationservice.getDonationList(sql+" "+orderby+" limit "+page.getCurentpagecount()+","+page.getPagelistcount());
		return donlist;
	}
	public Donation getDonationById(DonationService donationservice,Integer id) throws Exception{
		String sql = "select o.* from cs_donation o where o.id = "+id;
          List<Donation> alist = donationservice.getDonationList(sql);
		if(alist!=null&&alist.size()>0){
			
			return alist.get(0);
		}
		return null;
	}
}
