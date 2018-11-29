package com.scder.system.document.controller;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.io.OutputStream;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.scder.common.BaseController;
import com.scder.common.BaseService;

import com.scder.system.document.model.Document;
import com.scder.system.document.service.DocumentService;
@Controller
@RequestMapping("/document")
public class DocumentController extends BaseController<Document> {
  DocumentService documentservice;
	@Override
	@Resource(name="documentservice")
	public void setBaseservice(BaseService baseservice) {
		this.baseservice = baseservice;
		documentservice = (DocumentService)baseservice;
	}

	
	
	@RequestMapping("/fileload")
	public void FileLoad(Integer file_id,HttpServletRequest req,HttpServletResponse resp){
		boolean flag=false;

		try{
			if(file_id!=null){
				Document doc=this.findById(file_id);
				String path=doc.getFilepath();
				String realpath=req.getRealPath(path);
		
				File file=new File(realpath);
				   InputStream fis = new BufferedInputStream(new FileInputStream(file));
		            byte[] buffer = new byte[fis.available()];
		            fis.read(buffer);
		            fis.close();
		            // 清空response
		            resp.reset();
		            // 设置response的Header
		     
		            resp.addHeader("Content-Disposition", "attachment;filename=" +new String(doc.getFilename().getBytes("utf-8"),"ISO-8859-1")+"."+doc.getFiletype());
		            
		            resp.addHeader("Content-Length", "" + file.length());
		            resp.setCharacterEncoding("utf-8");  
		            OutputStream toClient = new BufferedOutputStream(resp.getOutputStream());
		            resp.setContentType("application/octet-stream");
		            toClient.write(buffer);
		            toClient.flush();
		            toClient.close();
			}
			}
			
	  catch(Exception e){
		  e.printStackTrace();
		  
	  }
		
	}
	/**
	 * 删除附件
	 * @param rt_id
	 * @param typename
	 * @param req
	 */
	@RequestMapping("/deletefile")
	@ResponseBody
	public boolean delFile(Integer file_id,HttpServletRequest req){
		boolean flag = false;
		try{
			if(file_id!=null){
				Document doc=this.findById(file_id);
				this.delete(String.valueOf(file_id));
				String realpath=req.getRealPath(doc.getFilepath());
				delRealFile(realpath);
				flag =true;
			}
	}
	catch(Exception e){
	e.printStackTrace();
	return flag;
	}
	return flag;
  }
	
public Boolean delRealFile(String frpath){
	Boolean	flag=false;
	File f=new File(frpath);
	
	if(!f.exists()){
		return flag;
		
	}
	else{
		
		return f.delete();
	}
	
}

public void deletdoc(String ids){
	try{
		String sql = "delete o.*  from  alecms_document o where o.relate_id =";
		if(ids!=null && !ids.equals("")){
			String[] idarr = ids.split(",");
			for(String id:idarr){
				documentservice.deletedoc(sql+id);
			}
		}
		
	}catch(Exception e){
		
		e.printStackTrace();
	}
	
}
	
}
