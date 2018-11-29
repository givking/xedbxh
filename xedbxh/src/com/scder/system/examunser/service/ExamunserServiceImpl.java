package com.scder.system.examunser.service;

import java.util.List;

import javax.annotation.Resource;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.scder.common.BaseDao;
import com.scder.common.BaseServiceSupport;
import com.scder.system.examunser.dao.ExamunserDao;
import com.scder.system.examunser.model.ExamUnser;
import com.scder.system.examunser.model.UnserContent;
@Service("examunserservice")
@Transactional
public class ExamunserServiceImpl extends BaseServiceSupport implements ExamunserService {
 
	ExamunserDao examunserdao;
	@Override
	@Resource(name="examunserdao")
	public void setBasedao(BaseDao basedao) {
		this.basedao = basedao;
		examunserdao = (ExamunserDao)basedao;
		
	}
	@Override
	public List<ExamUnser> getUnserList(String sql) throws Exception {
		
		return examunserdao.getUnserList(sql);
	}
	@Override
	public void deleteBySql(String sql) throws Exception {
		examunserdao.deleteBySql(sql);
		
	}
	@Override
	public ExamUnser getExamUnserById(Integer id) throws Exception {
		
		return examunserdao.getExamUnserById(id);
	}
	@Override
	public void updateExamUnser(ExamUnser examunser) throws Exception {
		examunserdao.updateExamUnser(examunser);
		
	}
	@Override
	public void addUnserContent(UnserContent uncontent) throws Exception {
		examunserdao.addUnserContent(uncontent);
		
	}
	@Override
	public List<UnserContent> getUnserContentList(String sql) throws Exception {
		
		return examunserdao.getUnserContentList(sql);
	}
	@Override
	public List<Object> getModelViewList(String sql) throws Exception {
		
		return examunserdao.getModelViewList(sql);
	}

}
