package com.scder.system.resource.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.scder.common.BaseController;
import com.scder.common.BaseService;
import com.scder.system.resource.model.Resource;
import com.scder.system.resource.service.ResourceService;
import com.scder.system.roleres.model.RoleRes;
import com.scder.utils.AleTools;
import com.scder.utils.FileCurrentUp;

@Controller
@RequestMapping("/resource")
public class ResourceController extends BaseController<Resource>{
	ResourceService resourceservice;
	@Override
	@javax.annotation.Resource(name="resourceservice")
	public void setBaseservice(BaseService baseservice) {
		this.baseservice = baseservice;
		resourceservice = (ResourceService)baseservice;
	}
	@Override
	public void onAddAsFile(Resource entity, MultipartFile[] files,
			HttpServletRequest req) {
		try{
			if(entity.getTitle()==null||entity.getTitle().trim().equals("")){
				throw new RuntimeException("lack of standardization");
			}
			req.setAttribute("dir", "/resource");
	if(files!=null && files.length>0){	
		for(MultipartFile upfile:files){
		   FileCurrentUp.fileUpLoad(upfile, req);
		   entity.setIcon(req.getAttribute("fpa").toString());
		}
	}
		entity.setCreate_time(AleTools.getCurrentSystemDateTimeToString("yyyy-MM-dd"));
		}catch(Exception e){
			e.printStackTrace();
		}
		
	}
	@Override
	public void onUpdateAsFile(Resource entity, MultipartFile[] files,
			HttpServletRequest req) {
		try{
			if(entity.getTitle()==null||entity.getTitle().trim().equals("")){
				throw new RuntimeException("lack of standardization");
			}
			req.setAttribute("dir", "/resource");
			if(files!=null && files.length>0){	
				for(MultipartFile upfile:files){
				   FileCurrentUp.fileUpLoad(upfile, req);
				   entity.setIcon(req.getAttribute("fpa").toString());
				}
			}
			entity.setCreate_time(AleTools.getCurrentSystemDateTimeToString("yyyy-MM-dd"));
			}catch(Exception e){
				e.printStackTrace();
			}
		
	}
	@Override
	public List<Resource> getResultListAll(HttpServletRequest req) {
		try{
			Resource resource = new Resource();
			resource.setId(0);
			resource.setParent_id(0);
			resource.setTitle("¶¥¼¶×ÊÔ´");
			List<Resource> rlist = this.onGetResultListAll(req);
			rlist.add(resource);
			return rlist;
		}	
			
		catch(Exception e){
			e.printStackTrace();
		}
		return null;
	}
	@Override
	public void onDelAsFile(Class<Resource> entityClass, String ids) {
		// TODO Auto-generated method stub
		super.onDelAsFile(entityClass, ids);
	}
	
	@RequestMapping("rolereslist")
	@ResponseBody
	public List<RoleRes> getRoleResList(Integer role_id){
		
	try{
		if(role_id!=null){
			String sql = "select o.* from alecms_role_res o where o.role_id="+role_id;
			return resourceservice.getRoleResList(sql);
		}
	}catch(Exception e){
		e.printStackTrace();
	}	
		return null;
	}
	@RequestMapping("addroleres")
	@ResponseBody
	public String addRoleRes(String res_arr,String role_id){
		try{
			
			if(res_arr!=null && !res_arr.equals("") && role_id!=null){
				String sql = "select o.* from alecms_role_res o where o.role_id="+role_id;
				List<RoleRes> reslist = resourceservice.getRoleResList(sql);
				if(reslist!=null && reslist.size()>0){
					for(RoleRes res:reslist){
						
						resourceservice.deleteRoleRes(res.getId());
					};
				}
				
				String[] resarr = res_arr.split(",");
				for(String res_id:resarr){
					RoleRes roleres = new RoleRes();
					roleres.setRes_id(Integer.parseInt(res_id));
					roleres.setRole_id(Integer.parseInt(role_id));
					resourceservice.saveRoleRes(roleres);
				}
				return  AleTools.result(true, null);
			}
			
		}catch(Exception e){
			e.printStackTrace();
			return AleTools.result(false, e.getMessage());
		}
		
		return null;
	}
	

}
