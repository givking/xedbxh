package com.scder.nydb.download.controller;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.scder.common.BaseController;
import com.scder.common.BaseService;
import com.scder.nydb.download.model.Download;
import com.scder.nydb.download.service.DownloadService;
import com.scder.system.article.model.Article;
import com.scder.system.systemuser.model.SystemUser;
import com.scder.utils.AleTools;
import com.scder.utils.FileCurrentUp;
@Controller("downloadcontroller")
@RequestMapping("/download")
public class DownloadController extends BaseController<Download> {
	DownloadService downloadService;
	@Override
	@Resource(name="downloadService")
	public void setBaseservice(BaseService baseservice) {
		// TODO Auto-generated method stub
		this.baseservice = baseservice;
		downloadService = (DownloadService)baseservice;
	}
	@Override
	public void onAdd(Download entity, HttpServletRequest req) {
		
		if(entity.getCreate_time()==null||entity.getCreate_time().trim().equals("")){
			
			entity.setCreate_time(AleTools.getCurrentSystemDateTimeToString("yyyy-MM-dd"));
		}
	}
	@Override
	public void onAddAsFile(Download entity, MultipartFile[] files,
			HttpServletRequest req) {
		
		try{
			/*if(entity.getFilename()==null||entity.getFilename().trim().equals("")){
				throw new RuntimeException("lack of standardization");
			}*/	
			req.setAttribute("dir", "/filecenter");
			if(files!=null && files.length>0){	
				for(MultipartFile upfile:files){
					if(!upfile.getOriginalFilename().trim().equals("")){
				   FileCurrentUp.fileUpLoad(upfile, req);
				   entity.setFilepath(req.getAttribute("realfpa").toString());
				   entity.setFile_type(req.getAttribute("ftype").toString());
				   if(entity.getFilename()==null||entity.getFilename().trim().equals("")){
					   entity.setFilename(upfile.getOriginalFilename().substring(0,upfile.getOriginalFilename().lastIndexOf('.')));
				   }
					}
				}
			}
			if(entity.getCreate_time()==null||entity.getCreate_time().trim().equals("")){
					entity.setCreate_time(AleTools.getCurrentSystemDateTimeToString("yyyy-MM-dd"));
			}
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	@Override
	public void onDelAsFile(Class<Download> entityClass,String ids){
		Integer id = Integer.valueOf(ids);
		Download file = new Download();
		try {
			file=this.baseservice.find(entityClass, id);
			if(file!=null){
				String filename = file.getFilename();
				String filepath= file.getFilepath();
				FileCurrentUp.delfile(filename, filepath);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	/*ÎÄ¼þÏÂÔØ*/
	@RequestMapping("/downfile")
	@ResponseBody
	public void downFile(String ids,HttpServletResponse response){
		Integer id = Integer.valueOf(ids);
		Download file = new Download();
		try{
			file=this.baseservice.find(Download.class, id);
			String filename = file.getFilename();
			String filepath = file.getFilepath();
			String filetype = file.getFile_type();
			FileCurrentUp.downfile(filepath,filename,filetype,response);
		}catch(Exception e){
				e.printStackTrace();
			}
	}
	
}
