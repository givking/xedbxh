package com.scder.system.webtable.service;

import java.util.List;

import com.scder.system.webtable.model.WebTable;

public interface WebTableService {
	public List<Object> getModelViewList(String sql) throws Exception;
	public void updateShowid(WebTable webtable) throws Exception;

}
