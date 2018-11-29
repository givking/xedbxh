package com.scder.system.test.service;

import java.util.List;

import com.scder.system.test.model.Test;

public interface TestService {
	
	public List<Test> getTestList(String sql) throws Exception;

}
