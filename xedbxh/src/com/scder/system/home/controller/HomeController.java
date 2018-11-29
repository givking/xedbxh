package com.scder.system.home.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.scder.system.menu.model.ResourceVo;
import com.scder.system.resource.model.Resource;
import com.scder.system.resource.service.ResourceService;
import com.scder.system.roleres.model.RoleRes;
import com.scder.system.systemuser.model.SystemUser;

@Controller
@RequestMapping("/")
public class HomeController {
	@javax.annotation.Resource ResourceService resourceservice;
	@RequestMapping("/home")
	public String home(HttpServletRequest req,ModelMap mp){
		
		
		return "jspsystem/main";
	}
   
   public List<Resource> loadRes(HttpServletRequest req){
	   
	try{
	   SystemUser su = (SystemUser)req.getSession().getAttribute("user");
	   StringBuffer sbf = new StringBuffer();
	   if(su.getRole_id()!=null){
		   
	   String sql = "select o.* from alecms_role_res o where o.role_id = "+su.getRole_id();
	   List<RoleRes> rlist = resourceservice.getRoleResList(sql);
	   if(rlist!=null && rlist.size()>0){
		   for(int i=0;i<rlist.size();i++){
			   if(i==0){
				   sbf.append(" o.id = ").append(rlist.get(i).getRes_id());
				   
			   }else{
				   
				   sbf.append(" or o.id = ").append(rlist.get(i).getRes_id());
			   }
			   
		   }
		   String resql = "select o.* from alecms_resource o where (o.type = 0 or o.type = 1) and ("+sbf.toString()+") order by o.no asc";   
		   
		   return resourceservice.getResList(resql);
	  }
	 
	  
  }
	   
}catch(Exception e){
		e.printStackTrace();
} 
	 
	return null;
 }
   
   
   public List<ResourceVo> getMvlist(List<Resource> reslist){
	   
	   List<ResourceVo> mvlist = new ArrayList<ResourceVo>();
	   
	   for(int i = 0;i<reslist.size();i++){
		   
		   if(reslist.get(i).getParent_id()==0){
			   ResourceVo mv =new ResourceVo();
			   mv.setResource(reslist.get(i));
			   for(int j=0;j<reslist.size();j++){
				   
				   if(reslist.get(i).getId()==reslist.get(j).getParent_id()){mv.getSublist().add(reslist.get(j));}
				   
			   }
			   mvlist.add(mv);
		   }
		   
	   }
	   
	   return mvlist;
   }
   
   @RequestMapping("/loadleft")
   public String loadLeft(HttpServletRequest req,ModelMap mp){
	   List<Resource> reslist = this.loadRes(req);
		List<ResourceVo> mvlist = null;
		if(reslist!=null && reslist.size()>0){
		 mvlist = this.getMvlist(reslist);
			
		}
		mp.put("mvlist", mvlist);
	   return "jspsystem/left";
   }
	
}
