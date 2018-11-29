package com.scder.system.webtable.controller;

import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.Enumeration;

import java.util.List;


import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.scder.common.BaseController;
import com.scder.common.BaseService;
import com.scder.common.PageNation;
import com.scder.system.document.controller.DocumentController;
import com.scder.system.document.model.Document;
import com.scder.system.systemuser.model.SystemUser;
import com.scder.system.webtable.model.WebTable;
import com.scder.system.webtable.service.WebTableService;
import com.scder.utils.AleSql;
import com.scder.utils.AleTools;
import com.scder.utils.FileCurrentUp;
@Controller
@RequestMapping("/webtable")
public class WebTableController extends BaseController<WebTable> {
	WebTableService webtableservice;
	@Resource DocumentController doccontoller;
	@Override
	@Resource(name="webtableservice")
	public void setBaseservice(BaseService baseservice) {
		this.baseservice = baseservice;
		webtableservice  = (WebTableService)baseservice;
	}
	@Override
	public void onAddAsFile(WebTable entity, MultipartFile[] files,
			HttpServletRequest req) {
		try{
			if(entity.getTitle()==null||entity.getTitle().trim().equals("")){
				throw new RuntimeException("lack of standardization");
			}	
			req.setAttribute("dir", "/webtable");
		SystemUser u = (SystemUser)req.getSession().getAttribute("user");
		entity.setAnthor(u.getPersonname());
	if(entity.getCreatetime()==null||entity.getCreatetime().trim().equals("")){
			
			entity.setCreatetime(AleTools.getCurrentSystemDateTimeToString("yyyy-MM-dd"));
		}
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	@Override
	public void afterAddAsFile(WebTable entity, MultipartFile[] files,
			HttpServletRequest req) {
	try{
		req.setAttribute("dir", "/webtable");
		if(files!=null && files.length>0){	
			for(MultipartFile upfile:files){
				if(!upfile.getOriginalFilename().trim().equals("")){
				Document doc = new Document();
			   FileCurrentUp.fileUpLoad(upfile, req);
			   doc.setFilepath(req.getAttribute("fpa").toString());
			   doc.setFilename(req.getAttribute("fname").toString());
			   doc.setFiletype(req.getAttribute("ftype").toString());
			   doc.setLoadcount("0");
			   doc.setRelate_type("table_webtable");
			   doc.setRelate_id(entity.getId());
			   doccontoller.add(doc, req);
			  }
			}		
		}
		
	}
	
	catch(Exception e){
		 e.printStackTrace();
	 }
	
	
}
	@Override
	public void onUpdateAsFile(WebTable entity, MultipartFile[] files,
			HttpServletRequest req) {
		
		try{
			if(entity.getTitle()==null||entity.getTitle().trim().equals("")){
				throw new RuntimeException("lack of standardization");
			}	
		SystemUser u = (SystemUser)req.getSession().getAttribute("user");
		entity.setAnthor(u.getPersonname());
	if(entity.getCreatetime()==null||entity.getCreatetime().trim().equals("")){
			
			entity.setCreatetime(AleTools.getCurrentSystemDateTimeToString("yyyy-MM-dd"));
		}
		}catch(Exception e){
			e.printStackTrace();
		}
		
	}
	
	@Override
	public void afterUpdateAsFile(WebTable entity, MultipartFile[] files,
			HttpServletRequest req) {
		
		
		try{
			req.setAttribute("dir", "/webtable");
			if(files!=null && files.length>0){	
				for(MultipartFile upfile:files){
					if(!upfile.getOriginalFilename().trim().equals("")){
					Document doc = new Document();
				   FileCurrentUp.fileUpLoad(upfile, req);
				   doc.setFilepath(req.getAttribute("fpa").toString());
				   doc.setFilename(req.getAttribute("fname").toString());
				   doc.setFiletype(req.getAttribute("ftype").toString());
				   doc.setLoadcount("0");
				   doc.setRelate_type("table_webtable");
				   doc.setRelate_id(entity.getId());
				   doccontoller.add(doc, req);
				}
			}
		}
			
		}
		
		catch(Exception e){
			 e.printStackTrace();
		 }
		
		
		
	}
@RequestMapping("/findmodelviewlist")
@ResponseBody
 public PageNation<Object> findModelViewList(HttpServletRequest req){
	 
	 try{
		 PageNation pagenation = new PageNation<Object>();
		 Integer page = Integer.parseInt(req.getParameter("page")!=null&&!req.getParameter("page").trim().equals("")?req.getParameter("page"):"1");
			Integer rows = Integer.parseInt(req.getParameter("rows")!=null&&!req.getParameter("rows").trim().equals("")?req.getParameter("rows"):"10");
			String titlekey = req.getParameter("titlekey")!=null&&!req.getParameter("titlekey").trim().equals("")?req.getParameter("titlekey"):"";
			List<String> whereList = new ArrayList<String>();
			Integer firstResult=null;
			Integer currentPage=null;
			Integer lastPage = null;
			Integer pageCount = null;
			
			String sql = "select o.*,m.id m_id,m.title menuname,d.id d_id,d.filename filename,d.filepath filepath,d.filetype filetype,d.loadcount loadcount,d.relate_id relate_id from alecms_webtable o left join alecms_menu m on o.menu_id = m.id left join alecms_document d on o.id = d.relate_id";
			if(titlekey!=null&&!titlekey.equals("")){
				String tkey = AleTools.getChinaChar(titlekey);
				whereList.add("o.title like '%"+tkey+"%'");
			}
			
			if(whereList.size()>0){
				sql=sql+" where "+AleSql.createSql(whereList, "and").toString();
				}

			if(page!=null&&rows!=null){
				currentPage=page;
				firstResult=(page-1)*rows;
				pageCount = webtableservice.getModelViewList(sql).size();
				lastPage = pageCount%rows==0?pageCount/rows:pageCount/rows+1;
		    
			}
			pagenation.setPagecount(lastPage);
			String pagesql = sql+" order by o.id desc"+" "+"limit "+firstResult+","+rows;
			pagenation.setDatas(webtableservice.getModelViewList(pagesql));
		 return pagenation;
		 
	 }catch(Exception e){
		 
		 e.printStackTrace();
     }
	 
	 return null;
	 
 }
@RequestMapping("/download")	
public void downLoad(Integer id,HttpServletRequest req,HttpServletResponse resp){
	
    try{
    	
    	if(id!=null){
    		doccontoller.FileLoad(id, req, resp);
    		
    	}

    }catch(Exception e){
    	e.printStackTrace();
    }
	
}	
	
@RequestMapping("/updateshowid")
@ResponseBody
public String updateShowid(Integer a_id,String showid){
	
	try{
		if(a_id!=null && showid!=null){
			WebTable wt = this.findById(a_id);
			if(showid.equals("1")){
			wt.setShowid("0");	
			}else{
				wt.setShowid("1");
			}
			webtableservice.updateShowid(wt);
			return AleTools.result(true, null);
		}
		
	}catch(Exception e){
		e.printStackTrace();
		return AleTools.result(false, e.getMessage());
	}
	
	return null;
}
@Override
public void afterDelete(Class<WebTable> entityClass, String ids) {
	
	doccontoller.deletdoc(ids);
}	
	
	
}
