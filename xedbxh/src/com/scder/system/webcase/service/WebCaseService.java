package com.scder.system.webcase.service;

import java.util.List;

import com.scder.system.webcase.model.WebCase;

public interface WebCaseService {
	public List<WebCase> getWebCaseListBySql(String sql) throws Exception;

}
