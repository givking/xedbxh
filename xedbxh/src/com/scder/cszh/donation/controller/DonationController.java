package com.scder.cszh.donation.controller;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.scder.common.BaseController;
import com.scder.common.BaseService;
import com.scder.cszh.donation.model.Donation;
import com.scder.cszh.donation.service.DonationService;
import com.scder.utils.AleTools;
@Controller("donationcontroller")
@RequestMapping("/donation")
public class DonationController extends BaseController<Donation> {
	DonationService donationService;
	@Override
	@Resource(name="donationService")
	public void setBaseservice(BaseService baseservice) {
		// TODO Auto-generated method stub
		this.baseservice = baseservice;
		donationService = (DonationService)baseservice;
	}
	@Override
	public void onAdd(Donation entity, HttpServletRequest req) {
		if(entity.getDonor()==null||entity.getDonor().trim().equals("")){
			throw new RuntimeException("lack of standardization");
		}
		if(entity.getCreatetime()==null||entity.getCreatetime().trim().equals("")){
			
			entity.setCreatetime(AleTools.getCurrentSystemDateTimeToString("yyyy-MM-dd"));
		}
	}
	@RequestMapping("/totalamount")
	@ResponseBody
	public Integer totalamount() throws Exception {
		List<Donation> varlist = new ArrayList<Donation>();
		String sql = "select o.* from cs_donation o";
		varlist =donationService.getDonationList(sql);
		Integer sum=0;
		for(Donation var : varlist){
			sum+=var.getAmount();
		}
		return sum;
	}
	@RequestMapping("/ontimeamount")
	@ResponseBody
	public Integer ontimeamount(HttpServletRequest req,String jmyyear) throws Exception {
		String myyear = req.getParameter("myyear");
		List<Donation> varlist = new ArrayList<Donation>();
		String sql = "select o.* from cs_donation o where createtime like '%"+myyear+"%'";
		if(jmyyear!=null){
			sql = "select o.* from cs_donation o where createtime like '%"+jmyyear+"%'";
		}
		varlist =donationService.getDonationList(sql);
		Integer sum=0;
		if(varlist.size()!=0){
		for(Donation var : varlist){
			sum+=var.getAmount();
		}
		return sum;
		}else{
			sum=0;
			return sum;
		}
	}
}
