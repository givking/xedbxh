package com.scder.system.examination.dao;

import java.util.List;

import javax.persistence.Query;

import org.springframework.stereotype.Component;

import com.scder.common.BaseDaoSupport;
import com.scder.system.examination.model.Examination;
@Component("examinationdao")
public class ExaminationDaoImpl extends BaseDaoSupport implements ExaminationDao {

	@Override
	public List<Examination> getExaminList(String sql) throws Exception {
		Query q = em.createNativeQuery(sql, Examination.class);
		return q.getResultList();
	}

}
