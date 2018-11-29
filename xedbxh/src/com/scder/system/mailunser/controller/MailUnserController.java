package com.scder.system.mailunser.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.scder.common.BaseController;
import com.scder.common.BaseService;
import com.scder.system.mailask.model.MailAsk;
import com.scder.system.mailask.service.MailAskService;
import com.scder.system.mailunser.model.MailUnser;
import com.scder.system.mailunser.service.MailUnserService;
import com.scder.utils.AleTools;
@Controller
@RequestMapping("/mailunser")
public class MailUnserController extends BaseController<MailUnser> {
	@Resource MailAskService mailaskservice;
  MailUnserService mailunserservice;
	@Override
	@Resource(name = "mailunserservice")
	public void setBaseservice(BaseService baseservice) {
		this.baseservice = baseservice;
		mailunserservice = (MailUnserService)baseservice;
	}
    
	@RequestMapping("/getmailunserlist")
	@ResponseBody
	public List<MailUnser> getMailUnserList(Integer ask_id){
		
   try{
		if(ask_id!=null){
			String sql = "select o.* from alecms_mailunser o where o.ask_id = "+ask_id;
			return mailunserservice.getMailUnserList(sql);
		}
     }catch(Exception e){
    	 e.printStackTrace();
     }	
		return null;
	}
	@RequestMapping("/addaskunser")
	@ResponseBody
	public String addAskUnser(Integer a_id,String name,String createtime,String title,String content,Integer u_id,String ucontent,HttpServletRequest req){
	
		try{
			
			if(a_id!=null){
			MailAsk mailask = mailaskservice.findMailAskById(a_id);
			if(ucontent!=null&&!ucontent.trim().equals("")){
				mailask.setState(1);
			}
			mailask.setName(name);
			mailask.setCreatetime(createtime);
			mailask.setTitle(title);
			mailask.setContent(content);
			mailaskservice.updateMailAsk(mailask);
			
			if(u_id!=null){
				MailUnser mu = this.findById(u_id);
				mu.setUcontent(ucontent);
				this.update(mu, req);
			}else if(ucontent!=null&&!ucontent.trim().equals("")){
				MailUnser mailunser = new MailUnser();
				mailunser.setAsk_id(a_id);
				mailunser.setCreatetime(AleTools.getCurrentSystemDateTimeToString("yyyy-MM-dd"));
				mailunser.setUcontent(ucontent);
				this.add(mailunser, req);
			}
			
			return AleTools.result(true, null);
	}
				
			
  }catch(Exception e){
			e.printStackTrace();
			return AleTools.result(false, e.getMessage());
		}
		
		return null;
  }
	@RequestMapping("/deleteaskunser")
	@ResponseBody
	public String deleteAskUnser(String ids){
	
		try{
			
			if(ids!=null && !ids.equals("")){
				String[] idarr = ids.split(",");
				for(String id:idarr){
					String asql = "delete a.*  from alecms_mailask a where a.id = "+id;
					String usql = "delete u.* from alecms_mailunser u where u.ask_id = "+id;
					mailunserservice.deleteBySql(asql);
					mailunserservice.deleteBySql(usql);
				}
			}
			return AleTools.result(true, null);
		}catch(Exception e){
			e.printStackTrace();
			return AleTools.result(false, e.getMessage());
		}
		
	 
	}
}
