package com.scder.system.webtable.dao;

import java.util.List;

import javax.persistence.Query;

import org.hibernate.SQLQuery;
import org.hibernate.transform.Transformers;
import org.springframework.stereotype.Component;

import com.scder.common.BaseDaoSupport;
import com.scder.system.webtable.model.WebTable;
@Component("webtabledao")
public class WebTableDaoImpl extends BaseDaoSupport implements WebTableDao{

	@Override
	public List<Object> getModelViewList(String sql) throws Exception {
		Query q =  em.createNativeQuery(sql);
		q.unwrap(SQLQuery.class).setResultTransformer(Transformers.ALIAS_TO_ENTITY_MAP);
		return q.getResultList();
	}

	@Override
	public void updateShowid(WebTable webtable) throws Exception {
		em.merge(webtable);
		
	}


}
