package com.scder.system.userlogin;

import java.util.ArrayList;
import java.util.List;


import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Component;

import com.scder.system.resource.model.Resource;
import com.scder.system.resource.service.ResourceService;
import com.scder.system.roleres.model.RoleRes;
import com.scder.system.systemuser.model.SystemUser;
import com.scder.system.systemuser.service.SystemUserService;
import com.scder.utils.UserDetailsImpl;



@Component("userlogin")
public class UserLogin implements UserDetailsService,AuthenticationManager  {
@javax.annotation.Resource SystemUserService systemuserservice;
@javax.annotation.Resource ResourceService resourceservice;
	public SystemUser findbyusername(String username){
		 try {
			 String sql = "select o.* from alecms_system_user o where o.account=";
			 if(username!=null && !username.equals("")){
			 
				String uu=new String(username.getBytes("ISO-8859-1"),"UTF-8");
		         List<SystemUser> ulist = systemuserservice.getSystemUserList(sql+"'"+uu+"'");
			  if(ulist!=null&&ulist.size()!=0){
				  SystemUser u=(SystemUser)ulist.get(0);
				  return u;
			  }
			
			 }
			 
			} catch (Exception e) {
				
				e.printStackTrace();
			}
		
		return null;
	}
	
	  public List<Resource> auList(SystemUser systemuser){
		  try{
			  String sql = "select o.* from alecms_role_res o where o.role_id = "+systemuser.getRole_id();
		  List<Resource> reslist=new ArrayList<Resource>();
          List<RoleRes> role_reslist = resourceservice.getRoleResList(sql);
		
		    if(reslist!=null&&reslist.size()!=0){
		    for(RoleRes obj:role_reslist){	
		    	Resource r=resourceservice.findByResourceId(obj.getRes_id());
		    	reslist.add(r);
		    }
		    
		    
		     }
		    
		    return reslist;
		  }
		  
		  catch(Exception e){
			  
			  e.printStackTrace();
		  }
		  
		  return null;
	  }

	@Override
	public UserDetails loadUserByUsername(String username)
			throws UsernameNotFoundException {
        
		SystemUser us=this.findbyusername(username);
				
		if (us==null||us.getState()==null||us.getState().equals("0")){
			throw new UsernameNotFoundException("user:" + us + " not found!");
		}
		List<Resource> reslist=this.auList(us);

		UserDetails ud = new UserDetailsImpl(us,reslist);

	
			return ud;
	}

	@Override
	public Authentication authenticate(Authentication authentication)
			throws AuthenticationException {
		// TODO Auto-generated method stub
		return null;
	}
	  
}
