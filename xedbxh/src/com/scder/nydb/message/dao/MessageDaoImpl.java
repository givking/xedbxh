package com.scder.nydb.message.dao;

import java.util.List;

import javax.persistence.Query;
import org.springframework.stereotype.Component;

import com.scder.common.BaseDaoSupport;
import com.scder.nydb.message.model.Message;

@Component("messagedao")
public class MessageDaoImpl extends BaseDaoSupport implements MessageDao{

	@Override
	public void SavaMessage(Message mess) throws Exception{
		em.persist(mess);
		
	}
	
	public List<Message> getMessageList(String sql) throws Exception {
		Query q = em.createNativeQuery(sql, Message.class);
		return q.getResultList();
	}

}
