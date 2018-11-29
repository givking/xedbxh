package com.scder.system.mailunser.service;

import java.util.List;

import com.scder.system.mailunser.model.MailUnser;

public interface MailUnserService {
	public List<MailUnser> getMailUnserList(String sql) throws Exception;
	public void deleteBySql(String sql) throws Exception;

}
