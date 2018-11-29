package com.scder.system.document.dao;

import javax.persistence.Query;

import org.springframework.stereotype.Component;

import com.scder.common.BaseDaoSupport;
@Component("documentdao")
public class DocumentDaoImpl extends BaseDaoSupport implements DocumentDao {

	@Override
	public void deletedoc(String sql) throws Exception {
		Query q = em.createNativeQuery(sql);
		q.executeUpdate();
	}

}
