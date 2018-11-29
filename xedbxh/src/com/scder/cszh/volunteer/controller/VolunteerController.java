package com.scder.cszh.volunteer.controller;

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
import com.scder.cszh.volunteer.model.Volunteer;
import com.scder.cszh.volunteer.service.VolunteerService;
import com.scder.utils.AleTools;
@Controller
@RequestMapping("/volunteer")
public class VolunteerController extends BaseController<Volunteer> {
	VolunteerService volunteerService;
	@Override
	@Resource(name="volunteerService")
	public void setBaseservice(BaseService baseservice) {
		// TODO Auto-generated method stub
		this.baseservice = baseservice;
		volunteerService = (VolunteerService)baseservice;
	}
	@Override
	public void onAdd(Volunteer entity, HttpServletRequest req) {
		/*if(entity.getDonor()==null||entity.getDonor().trim().equals("")){
			throw new RuntimeException("lack of standardization");
		}*/
		if(entity.getCreatetime()==null||entity.getCreatetime().trim().equals("")){
			
			entity.setCreatetime(AleTools.getCurrentSystemDateTimeToString("yyyy-MM-dd"));
		}
	}
	@RequestMapping("/checkident")
	@ResponseBody
	public String checkident(HttpServletRequest req) throws Exception {
		String ident=req.getParameter("ident");
		String result="fail";
		List<Volunteer> varlist = new ArrayList<Volunteer>();
		String sql = "select o.* from cs_volunteer o where ident="+ident;
		varlist =volunteerService.getVolunteerList(sql);
		if(varlist.size()==0){
			result="success";
		}
		return result;
	}
}
