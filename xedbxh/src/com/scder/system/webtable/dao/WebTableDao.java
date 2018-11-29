package com.scder.system.webtable.dao;

import java.util.List;

import com.scder.system.webtable.model.WebTable;


public interface WebTableDao {
	public void updateShowid(WebTable webtable) throws Exception;
	public List<Object> getModelViewList(String sql) throws Exception;

}
