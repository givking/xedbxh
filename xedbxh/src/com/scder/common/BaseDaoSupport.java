package com.scder.common;

import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

public abstract class BaseDaoSupport implements BaseDao{
	@PersistenceContext
	public EntityManager em;
	@Override
	public void save(Object entity) throws Exception {
		em.persist(entity);
		
	}

	@Override
	public <T> void remove(Class<T> entityClass, Integer entityId)
			throws Exception {
	 em.remove(this.find(entityClass, entityId));
		
	}

	@Override
	public void update(Object entity) throws Exception {
		em.merge(entity);
		
	}

	@Override
	public <T> T find(Class<T> entityClass, Integer entityId) throws Exception {
		
		return em.find(entityClass, entityId);
	}

	@Override
	public <T> List<T> resultList(Integer fistResult, Integer maxResult,
			String jpql, String whereSql, Object[] params,
			Map<String, String> orderBy) throws Exception {
		
		Query q = this.getQuery(jpql, whereSql, params, orderBy);
	  if(fistResult!=null && fistResult!=null){
		q.setFirstResult(fistResult);
		q.setMaxResults(maxResult);
		
	  }	
		return q.getResultList();
	}

	@Override
	public Integer count(String jpql, String whereSql, Object[] params,
			Map<String, String> orderBy) throws Exception {
		Query q = this.getQuery(jpql, whereSql, params, orderBy);
		return q.getResultList().size();
	}



	public Query getQuery(String jpql, String whereSql, Object[] params,
			Map<String, String> orderBy){
		
		StringBuffer sbf = new StringBuffer();
		Boolean flag = false;
		sbf.append(jpql);
		if(whereSql!=null && !whereSql.trim().equals("")){
			sbf.append(" ").append("where").append(" ").append(whereSql);
			flag=true;
		}
		if(orderBy!=null && orderBy.size()==1){
			for(Entry<String, String> en:orderBy.entrySet()){
				sbf.append(" ").append("order by").append(" ").append(en.getKey()).append(" ").append(en.getValue());
			}
		}
		Query q=em.createQuery(sbf.toString());
		
		if(flag && params!=null && params.length>0){
			for(int i=0;i<params.length;i++){
				
				q.setParameter(i+1, params[i]);
			}
		}
		
		
		
		
		return q;
	}

	@Override
	public <T> List<T> resultListAll(String jpql, String whereSql,
			Object[] params, Map<String, String> orderBy) throws Exception {
		Query q = this.getQuery(jpql, whereSql, params, orderBy);
		return q.getResultList();
	}
	
}
