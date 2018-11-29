package com.scder.system.paper.dao;

import java.util.List;

import com.scder.system.paper.model.Paper;

public interface PaperDao {

	public Paper getPaperById(Integer id) throws Exception;
	public List<Paper> getPaperList(String sql) throws Exception;
	
}
