package com.scder.system.advertisement.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.scder.common.BaseController;
import com.scder.common.BaseService;
import com.scder.system.advertisement.model.Advertisement;
import com.scder.system.advertisement.service.AdvertisementService;
import com.scder.system.systemuser.model.SystemUser;
import com.scder.utils.AleTools;
import com.scder.utils.FileCurrentUp;

@Controller
@RequestMapping("/advertisement")
public class AdvertisementController extends BaseController<Advertisement> {
AdvertisementService advertisementservice;
	@Override
	@Resource(name="advertisementservice")
	public void setBaseservice(BaseService baseservice) {
		this.baseservice = baseservice;
		this.advertisementservice = (AdvertisementService)baseservice;
	}
	@Override
	public void onAddAsFile(Advertisement entity, MultipartFile[] files,
			HttpServletRequest req) {
		
		try{
			if(entity.getTitle()==null||entity.getTitle().trim().equals("")){
				throw new RuntimeException("lack of standardization");
			}	
			req.setAttribute("dir", "/adver");
			if(files!=null && files.length>0){	
				for(MultipartFile upfile:files){
					if(!upfile.getOriginalFilename().trim().equals("")){
				   FileCurrentUp.fileUpLoad(upfile, req);
				   entity.setImagepath(req.getAttribute("fpa").toString());
					}
				}
			}

	if(entity.getCreatetime()==null||entity.getCreatetime().trim().equals("")){
			
			entity.setCreatetime(AleTools.getCurrentSystemDateTimeToString("yyyy-MM-dd"));
		}
	
		}catch(Exception e){
			e.printStackTrace();
		}
		
		
	}
	@Override
	public void onUpdateAsFile(Advertisement entity, MultipartFile[] files,
			HttpServletRequest req) {
		
		try{
			if(entity.getTitle()==null||entity.getTitle().trim().equals("")){
				throw new RuntimeException("lack of standardization");
			}	
			req.setAttribute("dir", "/adver");
			if(files!=null && files.length>0){	
				for(MultipartFile upfile:files){
					if(!upfile.getOriginalFilename().trim().equals("")){
						  FileCurrentUp.fileUpLoad(upfile, req);
						   entity.setImagepath(req.getAttribute("fpa").toString());
						
					}
				}
			}

	if(entity.getCreatetime()==null||entity.getCreatetime().trim().equals("")){
			
			entity.setCreatetime(AleTools.getCurrentSystemDateTimeToString("yyyy-MM-dd"));
		}
		
		}catch(Exception e){
			e.printStackTrace();
		}
		
		
	}

	

}
