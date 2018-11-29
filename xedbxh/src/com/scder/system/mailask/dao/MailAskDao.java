package com.scder.system.mailask.dao;

import java.util.List;

import com.scder.system.mailask.model.MailAsk;

public interface MailAskDao {
	public void updateShowid(MailAsk mailask) throws Exception; 
	public MailAsk findMailAskById(Integer id) throws Exception;
	public void updateMailAsk(MailAsk mailask) throws Exception;
	public List<MailAsk> getMailAskList(String sql) throws Exception;
	public void addMailAsk(MailAsk mailask) throws Exception;

}
