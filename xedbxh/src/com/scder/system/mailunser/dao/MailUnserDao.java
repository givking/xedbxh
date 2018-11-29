package com.scder.system.mailunser.dao;

import java.util.List;

import com.scder.system.mailunser.model.MailUnser;

public interface MailUnserDao {
	public List<MailUnser> getMailUnserList(String sql) throws Exception;
	public void deleteBySql(String sql) throws Exception;
}
