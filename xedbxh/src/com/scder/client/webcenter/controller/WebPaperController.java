package com.scder.client.webcenter.controller;

import java.util.ArrayList;
import java.util.List;

import com.scder.system.examination.model.Examination;
import com.scder.system.examination.model.ExaminationVo;
import com.scder.system.examination.service.ExaminationService;
import com.scder.system.examunser.model.ExamUnser;
import com.scder.system.examunser.service.ExamunserService;
import com.scder.system.paper.model.Paper;
import com.scder.system.paper.model.PaperVo;
import com.scder.system.paper.service.PaperService;
import com.scder.utils.BookPage;


public class WebPaperController {
	
public List<Paper> getWebPaperList(PaperService paperservice,BookPage page,String orderby) throws Exception{
	
	String sql = "select o.* from alecms_paper o where o.state = 1";
	page.setResultcount(paperservice.getPaperList(sql).size());
	List<Paper> plist = paperservice.getPaperList(sql+" "+orderby+" limit "+page.getCurentpagecount()+","+page.getPagelistcount());
	return plist;
}	

	public PaperVo getPaperVo(PaperService paperservice,ExaminationService examinationservice,ExamunserService examunserservice,Integer id) throws Exception{
		
		if(id!=null){
    		PaperVo pvo = new PaperVo();
    		List<ExaminationVo> evolist = new ArrayList<ExaminationVo>();
    		String sql="select o.* from alecms_examination o where o.paper_id = "+id;
    		List<Examination> examinlist = examinationservice.getExaminList(sql+" order by o.id asc");
    		
    		if(examinlist!=null && examinlist.size()>0){
    			
    			for(Examination examin:examinlist){
    				ExaminationVo evo = new ExaminationVo();
    				if(examin.getType()!=3){
	    				String subsql = "select o.* from alecms_examunser o where o.exam_id = "+examin.getId();
	    				evo.setExamunlist(examunserservice.getUnserList(subsql+" order by o.id asc"));
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
    		
    	   return pvo;
    	}
    		
    	return null;	
		
	}
	
	public void webExamunser(ExamunserService examunserservice,Integer id) throws Exception{
		
		ExamUnser exun = examunserservice.getExamUnserById(id);
		Integer count = Integer.parseInt(exun.getCheckcount())+1;
		exun.setCheckcount(String.valueOf(count));
		examunserservice.updateExamUnser(exun);
	}

	public List<Paper> getShowWebPaperList(PaperService paperservice,String orderby,Integer limit) throws Exception{
		
		String sql = "select o.* from alecms_paper o where o.state = 1";
		List<Paper> plist = paperservice.getPaperList(sql+" "+orderby+" limit 0,"+limit);
		return plist;
	}	

	
	
	
}
