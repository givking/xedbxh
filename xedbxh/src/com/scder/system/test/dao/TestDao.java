package com.scder.system.test.dao;

import java.util.List;

import com.scder.system.test.model.Test;

public interface TestDao {
public List<Test> getTestList(String sql) throws Exception;

}
