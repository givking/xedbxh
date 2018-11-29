package com.scder.system.mailask.dao;

import java.util.List;

import javax.persistence.Query;

import org.springframework.stereotype.Component;

import com.scder.common.BaseDaoSupport;
import com.scder.system.mailask.model.MailAsk;
@Component("mailaskdao")
public class MailAskDaoImpl extends BaseDaoSupport implements MailAskDao {

	@Override
	public void updateShowid(MailAsk mailask) throws Exception {
		em.merge(mailask);
		
	}

	@Override
	public MailAsk findMailAskById(Integer id) throws Exception {
		
		return em.find(MailAsk.class, id);
	}

	@Override
	public void updateMailAsk(MailAsk mailask) throws Exception {
		em.merge(mailask);
		
	}

	@Override
	public List<MailAsk> getMailAskList(String sql) throws Exception {
		Query q = em.createNativeQuery(sql, MailAsk.class);
		return q.getResultList();
	}

	@Override
	public void addMailAsk(MailAsk mailask) throws Exception {
		em.persist(mailask);
		
	}

}
