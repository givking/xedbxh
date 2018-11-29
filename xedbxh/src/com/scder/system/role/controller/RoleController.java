package com.scder.system.role.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.scder.common.BaseController;
import com.scder.common.BaseService;
import com.scder.system.role.model.Role;
import com.scder.system.role.service.RoleService;
import com.scder.utils.AleTools;
@Controller
@RequestMapping("/role")
public class RoleController extends BaseController<Role> {
    RoleService roleservice;
	@Resource(name = "roleservice")
	public void setBaseservice(BaseService baseservice) {
		this.baseservice = baseservice;
		roleservice = (RoleService)baseservice;
	}
	@Override
	public void onAdd(Role entity, HttpServletRequest req) {
		if(entity.getRole_name()==null||entity.getRole_name().trim().equals("")){
			throw new RuntimeException("lack of standardization");
		}
		entity.setCreate_time(AleTools.getCurrentSystemDateTimeToString("yyyy-MM-dd"));
	}
	@Override
	public void onUpdate(Role entity, HttpServletRequest req) {
		if(entity.getRole_name()==null||entity.getRole_name().trim().equals("")){
			throw new RuntimeException("lack of standardization");
		}
		entity.setCreate_time(AleTools.getCurrentSystemDateTimeToString("yyyy-MM-dd"));
	}

	
	
}
