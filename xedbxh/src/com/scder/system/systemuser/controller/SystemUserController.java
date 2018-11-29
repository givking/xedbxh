package com.scder.system.systemuser.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.security.authentication.encoding.Md5PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.scder.common.BaseController;
import com.scder.common.BaseService;
import com.scder.system.systemuser.model.SystemUser;
import com.scder.system.systemuser.service.SystemUserService;
import com.scder.utils.AleTools;

@Controller
@RequestMapping("/systemuser")
public class SystemUserController extends BaseController<SystemUser> {
	SystemUserService systemuserservice;
	@Override
	@Resource(name="systemuserservice")
	public void setBaseservice(BaseService baseservice) {
		super.baseservice = baseservice;
		systemuserservice = (SystemUserService)baseservice;
	}
	@Override
	public void onAdd(SystemUser entity, HttpServletRequest req) {
		entity.setCreatetime(AleTools.getCurrentSystemDateTimeToString("yyyy-MM-dd"));
		if(entity.getAccount()==null||entity.getAccount().trim().equals("")){
			throw new RuntimeException("lack of standardization");
		}
		
		Md5PasswordEncoder encode = new Md5PasswordEncoder(); 
		String pass = encode.encodePassword(entity.getPassword(), entity.getAccount());
		entity.setPassword(pass);
	}
	@Override
	public void onUpdate(SystemUser entity, HttpServletRequest req) {
		entity.setCreatetime(AleTools.getCurrentSystemDateTimeToString("yyyy-MM-dd"));
		if(entity.getId()==null||entity.getAccount().trim().equals("")){
			throw new RuntimeException("lack of standardization");
		}
		
		Md5PasswordEncoder encode = new Md5PasswordEncoder(); 
		String pass = encode.encodePassword(entity.getPassword(), entity.getAccount());
		entity.setPassword(pass);
	}
	
	
@RequestMapping("setrole")	
@ResponseBody
public String setRole(Integer user_id,Integer role_id,HttpServletRequest req){
	
	try{
		if(user_id!=null && role_id!=null){
			SystemUser systemuser = super.findById(user_id);
			systemuser.setRole_id(role_id);
			super.update(systemuser, req);
		}
		
		return AleTools.result(true, null);
	}catch(Exception e){
		e.printStackTrace();
		return AleTools.result(false, e.getMessage());
	}
}

	
}
