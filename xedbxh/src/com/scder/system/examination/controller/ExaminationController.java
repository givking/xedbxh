package com.scder.system.examination.controller;

import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.scder.common.BaseController;
import com.scder.common.BaseService;
import com.scder.common.PageNation;
import com.scder.system.examination.model.Examination;
import com.scder.system.examination.service.ExaminationService;
import com.scder.system.examunser.service.ExamunserService;
import com.scder.utils.AleSql;
import com.scder.utils.AleTools;
@Controller
@RequestMapping("/examination")
public class ExaminationController extends BaseController<Examination> {

	ExaminationService examinationservice;
	@Resource ExamunserService examunserservice;;
	@Override
	@Resource(name="examinationservice")
	public void setBaseservice(BaseService baseservice) {
		this.baseservice = baseservice;
		examinationservice = (ExaminationService)baseservice;
		
	}
	
	@Override
	public void onAdd(Examination entity, HttpServletRequest req) {
		if(entity.getTitle()==null||entity.getTitle().trim().equals("")){
			throw new RuntimeException("lack of standardization");
		}
		entity.setCreatetime(AleTools.getCurrentSystemDateTimeToString("yyyy-MM-dd"));
	}
	@Override
	public void onUpdate(Examination entity, HttpServletRequest req) {
		if(entity.getTitle()==null||entity.getTitle().trim().equals("")){
			throw new RuntimeException("lack of standardization");
		}
		entity.setCreatetime(AleTools.getCurrentSystemDateTimeToString("yyyy-MM-dd"));
	}
	@RequestMapping("/setexams")
	@ResponseBody
    public String setExams(String exids,Integer id,HttpServletRequest req){
    	
    	try{
    		if(id!=null&&exids!=null&&!exids.equals("")){
    			String sql = "select o.* from alecms_examination o where o.paper_id = "+id;
    			List<Examination> examinlist = examinationservice.getExaminList(sql);
    			String[] idarr = exids.split(",");
    			
    			 if(examinlist!=null && examinlist.size()>0){
					  
						for(Examination examin:examinlist){
							
							examin.setPaper_id(null);
							this.update(examin, req);
							
						}
					  
					  
				  }
    			
				for(String ex_id:idarr){
					
						Examination ex = this.findById(Integer.parseInt(ex_id));
						ex.setPaper_id(id);
						this.update(ex, req);
					  
	
				}
    			
    		}
    		
    		return AleTools.result(true, null);
    		
    	}catch(Exception e){
    		e.printStackTrace();
    		return AleTools.result(false, e.getMessage());
    	}
    	
    
    }

	@Override
	public void onDelete(Class<Examination> entityClass, String ids) {
		try{
		String sql = "delete o.* from alecms_examunser o where o.exam_id = ";
		String sqlcont = "delete o.* from alecms_unsercontent o where o.exam_id = ";
		if(ids!=null && !ids.equals("")){
			String[] idarr = ids.split(",");
			for(String id:idarr){
				examunserservice.deleteBySql(sql+id);
				examunserservice.deleteBySql(sqlcont+id);
			}
		}
	}catch(Exception e){
		e.printStackTrace();
	}	 	
 }
	@RequestMapping("/findexamlist")
	@ResponseBody
	public PageNation<Examination> findExamList(Integer p_id, HttpServletRequest req){
		
		try{
			PageNation pagenation = new PageNation<Examination>();
			Integer page = Integer.parseInt(req.getParameter("page")!=null&&!req.getParameter("page").trim().equals("")?req.getParameter("page"):"1");
			Integer rows = Integer.parseInt(req.getParameter("rows")!=null&&!req.getParameter("rows").trim().equals("")?req.getParameter("rows"):"10");
			List<String> whereList = new ArrayList<String>();
			List<Object> paramlist = new ArrayList<Object>();
			Integer firstResult=null;
			Integer currentPage=null;
			Integer lastPage = null;
			Integer pageCount = null;
			
			String jpql = "select o from Examination o";
			
			if(p_id!=null){
				whereList.add("paper_id = ? or paper_id is null");
				paramlist.add(p_id);
			}else{
				
				return null;
			}
		
			Map<String,String> oderby = new HashMap<String, String>();
			if(req.getParameter("orderby")!=null){
				
				oderby.put("o."+req.getParameter("orderby").toString(), "asc");
			}else{
			oderby.put("o.id", "desc");
			}
			if(page!=null&&rows!=null){
				currentPage=page;
				firstResult=(page-1)*rows;
				pageCount = baseservice.count(jpql, AleSql.createSql(whereList, "and").toString(), paramlist.toArray(), oderby);
				lastPage = pageCount%rows==0?pageCount/rows:pageCount/rows+1;
		    
			}
			pagenation.setPagecount(lastPage);
			pagenation.setDatas(baseservice.resultList(firstResult, rows, jpql, AleSql.createSql(whereList, "and").toString(), paramlist.toArray(), oderby));
			return pagenation;
			
			
			
			
		}catch(Exception e){
			e.printStackTrace();
			
		}
		return null;
	}
	
	

}
