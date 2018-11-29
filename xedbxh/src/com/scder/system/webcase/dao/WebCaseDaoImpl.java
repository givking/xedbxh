package com.scder.system.webcase.dao;

import java.util.List;

import javax.persistence.Query;

import org.springframework.stereotype.Component;

import com.scder.common.BaseDaoSupport;
import com.scder.system.webcase.model.WebCase;
@Component("webcasedao")
public class WebCaseDaoImpl extends BaseDaoSupport implements WebCaseDao {

	@Override
	public List<WebCase> getWebCaseListBySql(String sql) throws Exception {
		Query q = em.createNativeQuery(sql, WebCase.class);
		return q.getResultList();
	}

}
