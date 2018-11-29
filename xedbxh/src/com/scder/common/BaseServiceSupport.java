package com.scder.common;

import java.util.List;
import java.util.Map;

import org.springframework.transaction.annotation.Transactional;
@Transactional
public abstract  class BaseServiceSupport implements BaseService{
    public BaseDao basedao;
	@Override
	public void save(Object entity) throws Exception {
		basedao.save(entity);
		
	}

	@Override
	public <T> void remove(Class<T> entityClass, Integer entityId)
			throws Exception {
		basedao.remove(entityClass, entityId);
		
	}

	@Override
	public void update(Object entity) throws Exception {
		basedao.update(entity);
		
	}

	@Override
	public <T> T find(Class<T> entityClass, Integer entityId) throws Exception {
		
		return basedao.find(entityClass, entityId);
	}

	@Override
	public <T> List<T> resultList(Integer fistResult, Integer maxResult,
			String jpql, String whereSql, Object[] params,
			Map<String, String> orderBy) throws Exception {
		
		return basedao.resultList(fistResult, maxResult, jpql, whereSql, params, orderBy);
	}

	@Override
	public <T> List<T> resultListAll(String jpql, String whereSql,
			Object[] params, Map<String, String> orderBy) throws Exception {
		
		return basedao.resultListAll(jpql, whereSql, params, orderBy);
	}

	@Override
	public Integer count(String jpql, String whereSql, Object[] params,
			Map<String, String> orderBy) throws Exception {
		
		return basedao.count(jpql, whereSql, params, orderBy);
	}

	public abstract void setBasedao(BaseDao basedao);


}
