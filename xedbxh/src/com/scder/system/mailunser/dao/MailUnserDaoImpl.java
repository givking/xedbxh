package com.scder.system.mailunser.dao;

import java.util.List;

import javax.persistence.Query;

import org.springframework.stereotype.Component;

import com.scder.common.BaseDaoSupport;
import com.scder.system.mailunser.model.MailUnser;
@Component("mailunserdao")
public class MailUnserDaoImpl extends BaseDaoSupport implements MailUnserDao {

	@Override
	public List<MailUnser> getMailUnserList(String sql) throws Exception {
		Query q = em.createNativeQuery(sql, MailUnser.class);
		return q.getResultList();
	}

	@Override
	public void deleteBySql(String sql) throws Exception {
		Query q = em.createNativeQuery(sql);
		q.executeUpdate();
	}

}
