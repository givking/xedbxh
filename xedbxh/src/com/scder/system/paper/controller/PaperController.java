package com.scder.system.paper.controller;


import java.util.ArrayList;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;


import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.scder.common.BaseController;
import com.scder.common.BaseService;
import com.scder.common.PageNation;
import com.scder.system.examination.model.Examination;
import com.scder.system.examination.model.ExaminationVo;
import com.scder.system.examination.service.ExaminationService;
import com.scder.system.examunser.service.ExamunserService;
import com.scder.system.paper.model.Paper;
import com.scder.system.paper.model.PaperVo;
import com.scder.system.paper.service.PaperService;

import com.scder.utils.AleSql;
import com.scder.utils.AleTools;
@Controller
@RequestMapping("/paper")
public class PaperController extends BaseController<Paper> {
  PaperService paperservice;
  @Resource ExaminationService examinationservice;
  @Resource ExamunserService examunserservice;
	@Override
	@Resource(name = "paperservice")
	public void setBaseservice(BaseService baseservice) {
		this.baseservice = baseservice;
		paperservice = (PaperService)baseservice;
	}
	@Override
	public void onAdd(Paper entity, HttpServletRequest req) {
		if(entity.getTitle()==null||entity.getTitle().trim().equals("")){
			throw new RuntimeException("lack of standardization");
		}
	if(entity.getCreatetime()==null||entity.getCreatetime().trim().equals("")){
			
			entity.setCreatetime(AleTools.getCurrentSystemDateTimeToString("yyyy-MM-dd"));
		}
		
	}
	@Override
	public void onUpdate(Paper entity, HttpServletRequest req) {
		if(entity.getTitle()==null||entity.getTitle().trim().equals("")){
			throw new RuntimeException("lack of standardization");
		}
	if(entity.getCreatetime()==null||entity.getCreatetime().trim().equals("")){
			
			entity.setCreatetime(AleTools.getCurrentSystemDateTimeToString("yyyy-MM-dd"));
		}
	}
	@RequestMapping("/getonepage")
    public String getOnePaper(Integer id,HttpServletRequest req,ModelMap mp){
    	
    	try{
    		if(id!=null){
    		PaperVo pvo = new PaperVo();
    		List<ExaminationVo> evolist = new ArrayList<ExaminationVo>();
    		String sql="select o.* from alecms_examination o where o.paper_id = "+id;
    		List<Examination> examinlist = examinationservice.getExaminList(sql);
    		
    		if(examinlist!=null && examinlist.size()>0){
    			
    			for(Examination examin:examinlist){
    				ExaminationVo evo = new ExaminationVo();
    				String subsql = "select o.* from alecms_examunser o where o.exam_id = "+examin.getId();
    				evo.setExamunlist(examunserservice.getUnserList(subsql));
    				evo.setExamin(examin);
    				evolist.add(evo);
    			}
    			
    		}
    		
    		pvo.setPaper(this.findById(id));
    		pvo.setExamvolist(evolist);	
    		mp.put("p_id", id);
    		mp.put("pvo", pvo);
    	}
    		
    		
    		
    }catch(Exception e){
    		e.printStackTrace();
    	}
    	
    	return "/jspclient/systempaper";
    } 
	@RequestMapping("/lookresult")
	public String lookResult(Integer id,HttpServletRequest req,ModelMap mp){
		
		try{
			
			if(id!=null){
	    		PaperVo pvo = new PaperVo();
	    		List<ExaminationVo> evolist = new ArrayList<ExaminationVo>();
	    		String sql="select o.* from alecms_examination o where o.paper_id = "+id;
	    		List<Examination> examinlist = examinationservice.getExaminList(sql);
	    		
	    		if(examinlist!=null && examinlist.size()>0){
	    			
	    			for(Examination examin:examinlist){
	    				ExaminationVo evo = new ExaminationVo();
	    				if(examin.getType()!=3){
		    				String subsql = "select o.* from alecms_examunser o where o.exam_id = "+examin.getId();
		    				evo.setExamunlist(examunserservice.getUnserList(subsql));
	    				}else{
	    					String ctsql = "select o.* from alecms_unsercontent o where o.exam_id = "+examin.getId();
	    					evo.setCount(examunserservice.getUnserContentList(ctsql).size());
	    				}

	    				evo.setExamin(examin);
	    				evolist.add(evo);
	    			}
	    			
	    		}
	    		
	    		pvo.setPaper(paperservice.getPaperById(id));
	    		pvo.setExamvolist(evolist);	
	    		
	    	  mp.put("pvo", pvo);
	    	}
			
			
			
			
		}catch(Exception e){
			e.printStackTrace();
		}
		
		 return "/jspclient/systemresult";
	}
	

	
	
	@RequestMapping("/findmodelviewlist")
	@ResponseBody
	 public PageNation<Object> findModelViewList(HttpServletRequest req){
		 
		 try{
			 PageNation pagenation = new PageNation<Object>();
			 Integer page = Integer.parseInt(req.getParameter("page")!=null&&!req.getParameter("page").trim().equals("")?req.getParameter("page"):"1");
				Integer rows = Integer.parseInt(req.getParameter("rows")!=null&&!req.getParameter("rows").trim().equals("")?req.getParameter("rows"):"10");
				String selkey = req.getParameter("selkey")!=null&&!req.getParameter("selkey").trim().equals("")?req.getParameter("selkey"):"";
				List<String> whereList = new ArrayList<String>();
				Integer firstResult=null;
				Integer currentPage=null;
				Integer lastPage = null;
				Integer pageCount = null;
				String key = AleTools.getChinaChar(selkey);
				String sql = "select o.*,e.title e_title,p.title p_title from alecms_unsercontent o left join alecms_examination e on o.exam_id = e.id left join alecms_paper p on e.paper_id = p.id";
				
				if(key!=null&&!key.equals("")){
					whereList.add("p.title like '%"+key+"%'");
					
				}
				
				if(whereList.size()>0){
				sql=sql+" where "+AleSql.createSql(whereList, "and").toString();
				}
				if(page!=null&&rows!=null){
					currentPage=page;
					firstResult=(page-1)*rows;
					pageCount = examunserservice.getModelViewList(sql).size();
					lastPage = pageCount%rows==0?pageCount/rows:pageCount/rows+1;
			    
				}
				
				
				pagenation.setPagecount(lastPage);
				String pagesql = sql+" "+"order by o.id desc "+"limit "+firstResult+","+rows;
				pagenation.setDatas(examunserservice.getModelViewList(pagesql));
			 return pagenation;
			 
		 }catch(Exception e){
			 
			 e.printStackTrace();
	     }
		 
		 return null;
		 
	 }
	@RequestMapping("/overchange")
	@ResponseBody
	public String overChange(Integer id,HttpServletRequest req){
		
		try{
			
			if(id!=null){
				Paper p = this.findById(id);
				
				if(p.getOver()==0){
					p.setOver(1);
				}else{
					p.setOver(0);
					
				}
				this.update(p, req);
			}
			
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return "true";
	}
	
	
}
