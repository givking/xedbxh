package com.scder.nydb.message.service;

import java.util.List;

import com.scder.nydb.message.model.Message;

public interface MessageService {
	
	public void SavaMessage(Message mess) throws Exception;
	
	public List<Message> getMessageList(String sql) throws Exception;

}
