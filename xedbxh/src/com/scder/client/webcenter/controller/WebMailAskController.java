package com.scder.client.webcenter.controller;

import java.util.List;

import com.scder.system.mailask.model.MailAsk;
import com.scder.system.mailask.model.MailAskVo;
import com.scder.system.mailask.service.MailAskService;
import com.scder.system.mailunser.model.MailUnser;
import com.scder.system.mailunser.service.MailUnserService;
import com.scder.utils.BookPage;

public class WebMailAskController {
	
	public List<MailAsk> getShowWebMailList(MailAskService mailaskservice,MailUnserService mailunserservice,Integer menuid,String orderby,Integer limit) throws Exception{
		String unsql = "select o.* from alecms_mailunser o where o.ask_id = ";
		String sql = "select o.* from alecms_mailask o where o.state = 1 and o.showid = 1 and o.menu_id = "+menuid+" "+orderby+" limit 0,"+limit;
		List<MailAsk> malist = mailaskservice.getMailAskList(sql);
		
		for(MailAsk m:malist){
			MailUnser un = mailunserservice.getMailUnserList(unsql+m.getId()).get(0);
			m.setCreatetime(un.getCreatetime());
		}
		
		return malist;
	}
	
	public List<MailAsk> getWebMailList(MailAskService mailaskservice,MailUnserService mailunserservice,BookPage page,Integer menu_id,String orderby) throws Exception{
		String sql = "select o.* from alecms_mailask o where o.state = 1 and o.showid = 1 and o.menu_id = " +menu_id;
		String unsql = "select o.* from alecms_mailunser o where o.ask_id = ";
		page.setResultcount(mailaskservice.getMailAskList(sql).size());
		List<MailAsk> malist = mailaskservice.getMailAskList(sql+" "+orderby+" limit "+page.getCurentpagecount()+","+page.getPagelistcount());
		for(MailAsk mailask:malist){
			MailUnser mailunser = mailunserservice.getMailUnserList(unsql+mailask.getId()).get(0);
			mailask.setMenu_type(mailunser.getCreatetime());
		}
				
		return malist;
	}

	public MailAskVo getWebMvo(MailAskService mailaskservice,MailUnserService mailunserservice,Integer id) throws Exception{
		String sql = "select o.* from alecms_mailask  o where o.state = 1 and o.id = ";
		String unsql = "select o.* from alecms_mailunser o where o.ask_id = ";
		MailAskVo mvo = new MailAskVo();
		MailAsk mailask = mailaskservice.getMailAskList(sql+id).get(0);
		List<MailUnser> unlist = mailunserservice.getMailUnserList(unsql+id);
		mvo.setMailask(mailask);
		mvo.setUnlist(unlist);
		return mvo;
	}

}
