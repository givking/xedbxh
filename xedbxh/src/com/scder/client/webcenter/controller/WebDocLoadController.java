package com.scder.client.webcenter.controller;

import java.util.List;

import com.scder.system.webtable.service.WebTableService;
import com.scder.utils.BookPage;

public class WebDocLoadController {
	
	public List<Object> getShowTableList(WebTableService webtableservice,Integer menu_id,String orderby,Integer limit) throws Exception{
		String sql = "select o.*,d.id d_id,d.filename filename,d.filepath filepath,d.filetype filetype,d.loadcount loadcount,d.relate_id relate_id from alecms_webtable o left join alecms_document d on o.id = d.relate_id where o.showid = 1 and o.menu_id = "+menu_id+" "+orderby+" limit 0,"+limit;
		return webtableservice.getModelViewList(sql);
	}
	
	public List<Object> getTableList(WebTableService webtableservice,BookPage page,Integer menu_id,String orderby) throws Exception{
		
		String sql = "select o.*,d.id d_id,d.filename filename,d.filepath filepath,d.filetype filetype,d.loadcount loadcount,d.relate_id relate_id from alecms_webtable o left join alecms_document d on o.id = d.relate_id where o.showid = 1 and o.menu_id = "+menu_id;
		page.setResultcount(webtableservice.getModelViewList(sql).size());
		
		return webtableservice.getModelViewList(sql+" "+orderby+" limit "+page.getCurentpagecount()+","+page.getPagelistcount());
		
	}

}
