package com.scder.system.webcase.dao;

import java.util.List;

import com.scder.system.webcase.model.WebCase;

public interface WebCaseDao{
public List<WebCase> getWebCaseListBySql(String sql) throws Exception;
}
