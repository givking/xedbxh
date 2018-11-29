package com.scder.system.test.dao;

import java.util.List;

import javax.persistence.Query;

import org.springframework.stereotype.Component;

import com.scder.common.BaseDaoSupport;
import com.scder.system.menu.model.Menu;
import com.scder.system.test.model.Test;

@Component("testdao")
public class TestDaoImpl extends BaseDaoSupport implements TestDao{

	@Override
	public List<Test> getTestList(String sql) throws Exception {
		Query q = em.createNativeQuery(sql, Menu.class);
		return q.getResultList();
	}

}
