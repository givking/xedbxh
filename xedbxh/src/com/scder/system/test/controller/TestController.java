package com.scder.system.test.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.scder.common.BaseController;
import com.scder.common.BaseService;
import com.scder.system.test.model.Test;
import com.scder.system.test.service.TestService;
import com.scder.system.webcase.model.WebCase;
import com.scder.system.webcase.service.WebCaseService;
import com.scder.utils.AleTools;
@Controller
@RequestMapping("/test")
public class TestController extends BaseController<Test> {
	TestService testService;
	@Override
	@Resource(name="testService")
	public void setBaseservice(BaseService baseservice) {
		// TODO Auto-generated method stub
		this.baseservice = baseservice;
		testService = (TestService)baseservice;
	}
	@Override
	public void onAdd(Test entity, HttpServletRequest req) {
		if(entity.getTitle()==null||entity.getTitle().trim().equals("")){
			throw new RuntimeException("lack of standardization");
		}
		if(entity.getCreatetime()==null||entity.getCreatetime().trim().equals("")){
			
			entity.setCreatetime(AleTools.getCurrentSystemDateTimeToString("yyyy-MM-dd"));
		}
	}
}
