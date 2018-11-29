package com.scder.system.paper.dao;

import java.util.List;

import javax.persistence.Query;

import org.springframework.stereotype.Component;

import com.scder.common.BaseDaoSupport;
import com.scder.system.paper.model.Paper;
@Component("paperdao")
public class PaperDaoImpl extends BaseDaoSupport implements PaperDao{

	@Override
	public Paper getPaperById(Integer id) throws Exception {
		
		return em.find(Paper.class, id);
	}

	@Override
	public List<Paper> getPaperList(String sql) throws Exception {
		Query q = em.createNativeQuery(sql, Paper.class);
		return q.getResultList();
	}

}
