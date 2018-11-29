package com.scder.system.menu.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.scder.common.BaseController;
import com.scder.common.BaseService;
import com.scder.system.menu.model.Menu;
import com.scder.system.menu.service.MenuService;
import com.scder.utils.AleTools;
import com.scder.utils.FileCurrentUp;
@Controller
@RequestMapping("/menu")
public class MenuController extends BaseController<Menu>{
 MenuService menuservice;
	@Override
	@Resource(name="menuservice")
	public void setBaseservice(BaseService baseservice) {
		this.baseservice = baseservice;
		menuservice = (MenuService)baseservice;
		
	}
	@Override
	public void onAddAsFile(Menu entity, MultipartFile[] files,
			HttpServletRequest req) {
		try{
			if(entity.getTitle()==null||entity.getTitle().trim().equals("")){
				throw new RuntimeException("lack of standardization");
			}	
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
	public void onUpdateAsFile(Menu entity, MultipartFile[] files,
			HttpServletRequest req) {
		try{
			if(entity.getTitle()==null||entity.getTitle().trim().equals("")){
				throw new RuntimeException("lack of standardization");
			}
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
	public List<Menu> getResultListAll(HttpServletRequest req) {
		
	   try{
		   
		Menu menu = new Menu();
		menu.setId(0);
		menu.setLevel(0);
		menu.setParent_id(-1);
		menu.setTitle("¶¥¼¶²Ëµ¥");
		List<Menu> mulist = this.onGetResultListAll(req);
		mulist.add(menu);
		return mulist;
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return null;
	}

	
	
	
}
