package com.scder.system.webcase.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.scder.common.BaseController;
import com.scder.common.BaseService;
import com.scder.system.webcase.model.WebCase;
import com.scder.system.webcase.service.WebCaseService;
import com.scder.utils.AleTools;
@Controller
@RequestMapping("/webcase")
public class WebCaseController extends BaseController<WebCase>{
 WebCaseService webcaseservice;
	@Override
	@Resource(name="webcaseservice")
	public void setBaseservice(BaseService baseservice) {
		this.baseservice = baseservice;
		webcaseservice = (WebCaseService)baseservice;
	}
	@Override
	public void onAdd(WebCase entity, HttpServletRequest req) {
		if(entity.getTitle()==null||entity.getTitle().trim().equals("")){
			throw new RuntimeException("lack of standardization");
		}
		if(entity.getCreatetime()==null||entity.getCreatetime().trim().equals("")){
			
			entity.setCreatetime(AleTools.getCurrentSystemDateTimeToString("yyyy-MM-dd"));
		}
		
	}
	@Override
	public void onUpdate(WebCase entity, HttpServletRequest req) {
		if(entity.getTitle()==null||entity.getTitle().trim().equals("")){
			throw new RuntimeException("lack of standardization");
		}
if(entity.getCreatetime()==null||entity.getCreatetime().trim().equals("")){
			
			entity.setCreatetime(AleTools.getCurrentSystemDateTimeToString("yyyy-MM-dd"));
		}
	}
	
	

}
