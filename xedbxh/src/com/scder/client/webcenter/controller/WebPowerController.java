package com.scder.client.webcenter.controller;

import java.util.List;

import com.scder.system.webcase.model.WebCase;
import com.scder.system.webcase.service.WebCaseService;
import com.scder.utils.BookPage;

public class WebPowerController {
	
	public List<WebCase> getShowWebCaseList(WebCaseService webcaseservice,String orderby,Integer limit) throws Exception{
		
		String sql = "select o.* from alecms_webcase o where o.state = 1 "+orderby+" limit 0,"+limit;
		return webcaseservice.getWebCaseListBySql(sql);
	}
	
	public List<WebCase> getWebCaseList(WebCaseService webcaseservice,BookPage page,String orderby) throws Exception{
		String sql = "select o.* from alecms_webcase o where o.state = 1";
		page.setResultcount(webcaseservice.getWebCaseListBySql(sql).size());
		List<WebCase> wtlist = webcaseservice.getWebCaseListBySql(sql+" "+orderby+" limit "+page.getCurentpagecount()+","+page.getPagelistcount());
		return wtlist;
	}

}
