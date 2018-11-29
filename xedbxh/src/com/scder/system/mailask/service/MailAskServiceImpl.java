package com.scder.system.mailask.service;

import java.util.List;

import javax.annotation.Resource;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.scder.common.BaseDao;
import com.scder.common.BaseServiceSupport;
import com.scder.system.mailask.dao.MailAskDao;
import com.scder.system.mailask.model.MailAsk;
@Service("mailaskservice")
@Transactional
public class MailAskServiceImpl extends BaseServiceSupport implements MailAskService {
   MailAskDao mailaskdao;
	@Override
	@Resource(name="mailaskdao")
	public void setBasedao(BaseDao basedao) {
		this.basedao = basedao;
		mailaskdao = (MailAskDao)basedao;
	}
	@Override
	public void updateShowid(MailAsk mailask) throws Exception {
		mailaskdao.updateShowid(mailask);
		
	}
	@Override
	public MailAsk findMailAskById(Integer id) throws Exception {
		
		return mailaskdao.findMailAskById(id);
	}
	@Override
	public void updateMailAsk(MailAsk mailask) throws Exception {
		mailaskdao.updateMailAsk(mailask);
	}
	@Override
	public List<MailAsk> getMailAskList(String sql) throws Exception {
		
		return mailaskdao.getMailAskList(sql);
	}
	@Override
	public void addMailAsk(MailAsk mailask) throws Exception {
		mailaskdao.addMailAsk(mailask);
		
	}

}
