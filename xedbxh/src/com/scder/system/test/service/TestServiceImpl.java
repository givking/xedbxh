package com.scder.system.test.service;


import java.util.List;

import javax.annotation.Resource;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.scder.common.BaseDao;
import com.scder.common.BaseServiceSupport;
import com.scder.system.test.dao.TestDao;
import com.scder.system.test.model.Test;

@Service("testService")
@Transactional
public class TestServiceImpl extends BaseServiceSupport implements TestService {
	TestDao testdao;
	@Override
	@Resource(name="testdao")
	public void setBasedao(BaseDao basedao) {
		this.basedao = basedao;
		testdao = (TestDao)basedao;
	}
	@Override
	public List<Test> getTestList(String sql) throws Exception {
		
		return testdao.getTestList(sql);
	}


}
