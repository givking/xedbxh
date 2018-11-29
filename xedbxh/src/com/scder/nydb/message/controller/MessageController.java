package com.scder.nydb.message.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.scder.common.BaseController;
import com.scder.common.BaseService;
import com.scder.nydb.message.model.Message;
import com.scder.nydb.message.service.MessageService;
import com.scder.utils.AleTools;


@Controller("messagecontroller")
@RequestMapping("/message")
public class MessageController extends BaseController<Message> {

	MessageService messageService;
	@Override
	@Resource(name="messageService")
	public void setBaseservice(BaseService baseservice) {
		// TODO Auto-generated method stub
		this.baseservice = baseservice;
		messageService = (MessageService)baseservice;
	}
	
	@RequestMapping("/savemessage")
	@ResponseBody
	public  Boolean saveMessage(String name,String phone,String email,String content) throws Exception{
		//response.setContentType("text/html;charset=utf-8");
		Message mess=new Message();
		mess.setContent(content);
		mess.setName(name);
		mess.setPhone(phone);
		mess.setEmail(email);
		mess.setCreatetime(AleTools.getCurrentSystemDateTimeToString("yyyy-MM-dd"));
		messageService.SavaMessage(mess); 
		return true;
	}
	
	

}
