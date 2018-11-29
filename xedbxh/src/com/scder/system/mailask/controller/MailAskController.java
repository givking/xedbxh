package com.scder.system.mailask.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.scder.common.BaseController;
import com.scder.common.BaseService;
import com.scder.common.PageNation;
import com.scder.system.mailask.model.MailAsk;
import com.scder.system.mailask.service.MailAskService;
import com.scder.utils.AleTools;
@Controller
@RequestMapping("/mailask")
public class MailAskController extends BaseController<MailAsk>{
  MailAskService mailaskservice;
	@Override
	@Resource(name = "mailaskservice")
	public void setBaseservice(BaseService baseservice) {
		this.baseservice = baseservice;
		mailaskservice = (MailAskService)baseservice;
	}
	@Override
	public void onAdd(MailAsk entity, HttpServletRequest req) {
		if(entity.getName()==null||entity.getName().trim().equals("")){
			throw new RuntimeException("lack of standardization");
		}
		
		entity.setShowid(0);
		entity.setCreatetime(AleTools.getCurrentSystemDateTimeToString("yyyy-MM-dd"));
		entity.setState(0);
	}
	@RequestMapping("/updateshowid")
	@ResponseBody
	public String updateShowid(Integer m_id,String showid){
		
		try{
			if(m_id!=null && showid!=null){
				MailAsk ma = this.findById(m_id);
				if(showid.equals("1")){
				ma.setShowid(0);	
				}else{
					ma.setShowid(1);
				}
				mailaskservice.updateShowid(ma);
				return AleTools.result(true, null);
			}
			
		}catch(Exception e){
			e.printStackTrace();
			return AleTools.result(false, e.getMessage());
		}
		
		return null;
	}
	@Override
	public List<MailAsk> onGetResultList(PageNation<MailAsk> pagenation,
			HttpServletRequest req) throws Exception {
		req.setAttribute("orderby", "createtime");
		return super.onGetResultList(pagenation, req);
	}
	
	
}
