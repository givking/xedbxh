package com.scder.system.examunser.service;

import java.util.List;

import com.scder.system.examunser.model.ExamUnser;
import com.scder.system.examunser.model.UnserContent;

public interface ExamunserService {
	public List<ExamUnser> getUnserList(String sql) throws Exception; 
	public void deleteBySql(String sql) throws Exception;
	public ExamUnser getExamUnserById(Integer id) throws Exception;
	public void updateExamUnser(ExamUnser examunser) throws Exception;
	public void addUnserContent(UnserContent uncontent) throws Exception;
	public List<UnserContent> getUnserContentList(String sql) throws Exception;
	public List<Object> getModelViewList(String sql) throws Exception;
}
