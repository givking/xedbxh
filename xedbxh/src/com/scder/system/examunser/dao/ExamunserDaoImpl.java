package com.scder.system.examunser.dao;

import java.util.List;

import javax.persistence.Query;

import org.hibernate.SQLQuery;
import org.hibernate.transform.Transformers;
import org.springframework.stereotype.Component;

import com.scder.common.BaseDaoSupport;
import com.scder.system.examunser.model.ExamUnser;
import com.scder.system.examunser.model.UnserContent;
@Component("examunserdao")
public class ExamunserDaoImpl extends BaseDaoSupport implements ExamunserDao {

	@Override
	public List<ExamUnser> getUnserList(String sql) throws Exception {
		Query q = em.createNativeQuery(sql, ExamUnser.class);
		return q.getResultList();
	}

	@Override
	public void deleteBySql(String sql) throws Exception {
		Query q = em.createNativeQuery(sql, ExamUnser.class);
		q.executeUpdate();
	}

	@Override
	public ExamUnser getExamUnserById(Integer id) throws Exception {
		
		return em.find(ExamUnser.class, id);
	}
	@Override
	public void updateExamUnser(ExamUnser examunser) throws Exception {
		em.merge(examunser);
		
	}

	@Override
	public void addUnserContent(UnserContent uncontent) throws Exception {
		em.persist(uncontent);
		
	}

	@Override
	public List<UnserContent> getUnserContentList(String sql) throws Exception {
		Query q = em.createNativeQuery(sql, UnserContent.class);
		return q.getResultList();
	}

	@Override
	public List<Object> getModelViewList(String sql) throws Exception {
		Query q =  em.createNativeQuery(sql);
		q.unwrap(SQLQuery.class).setResultTransformer(Transformers.ALIAS_TO_ENTITY_MAP);
		return q.getResultList();
	}

}
