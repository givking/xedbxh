package com.scder.common;

import java.util.List;
import java.util.Map;

public interface BaseService {
	void save(Object entity) throws Exception;

	<T> void remove(Class<T> entityClass, Integer entityId) throws Exception;

	void update(Object entity) throws Exception;

	<T> T find(Class<T> entityClass, Integer entityId) throws Exception;

	<T> List<T> resultList(Integer fistResult, Integer maxResult, String jpql,
			String whereSql, Object[] params, Map<String, String> orderBy)
			throws Exception;
	<T> List<T> resultListAll(String jpql,
			String whereSql, Object[] params, Map<String, String> orderBy)
			throws Exception;
	Integer count(String jpql,String whereSql, Object[] params, Map<String, String> orderBy)
			throws Exception;
}
