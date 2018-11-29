package com.scder.nydb.message.service;

import java.util.List;

import javax.annotation.Resource;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.scder.common.BaseDao;
import com.scder.common.BaseServiceSupport;
import com.scder.nydb.download.dao.DownloadDao;
import com.scder.nydb.message.dao.MessageDao;
import com.scder.nydb.message.model.Message;


@Service("messageService")
@Transactional
public class MessageServiceImpl extends BaseServiceSupport implements MessageService{
	MessageDao messagedao;
	@Override
	@Resource(name="messagedao")
	public void setBasedao(BaseDao basedao) {
		this.basedao = basedao;
		messagedao = (MessageDao)basedao;
	}

	@Override
	public void SavaMessage(Message mess) throws Exception {
		messagedao.SavaMessage(mess);
		
	}

	@Override
	public List<Message> getMessageList(String sql) throws Exception {
		
		return messagedao.getMessageList(sql);
	}

	
}
