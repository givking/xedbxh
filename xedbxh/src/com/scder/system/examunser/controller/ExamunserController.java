package com.scder.system.examunser.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.scder.common.BaseController;
import com.scder.common.BaseService;
import com.scder.system.examunser.model.ExamUnser;
import com.scder.system.examunser.service.ExamunserService;
@Controller
@RequestMapping("/examunser")
public class ExamunserController extends BaseController<ExamUnser>{
  ExamunserService examunserservice;
	@Override
	@Resource(name="examunserservice")
	public void setBaseservice(BaseService baseservice) {
		this.baseservice = baseservice;
		examunserservice = (ExamunserService)baseservice;
		
	}
    @RequestMapping("/findunserlist")
    @ResponseBody
	public List<ExamUnser> findUnserList(Integer id){
	 try{
			if(id!=null){
			String sql = "select o.* from alecms_examunser o where o.exam_id = "+id;	
				return examunserservice.getUnserList(sql+" order by o.id asc");
			}
			
		}catch(Exception e){
			e.printStackTrace();
		}
		return null;
	}
	
}
