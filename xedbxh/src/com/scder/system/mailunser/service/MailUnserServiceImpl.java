package com.scder.system.mailunser.service;

import java.util.List;

import javax.annotation.Resource;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.scder.common.BaseDao;
import com.scder.common.BaseServiceSupport;
import com.scder.system.mailunser.dao.MailUnserDao;
import com.scder.system.mailunser.model.MailUnser;
@Service("mailunserservice")
@Transactional
public class MailUnserServiceImpl extends BaseServiceSupport implements MailUnserService{
 MailUnserDao mailunserdao;
	@Override
	@Resource(name = "mailunserdao")
	public void setBasedao(BaseDao basedao) {
		this.basedao = basedao;
		mailunserdao = (MailUnserDao)basedao;
	}
	@Override
	public List<MailUnser> getMailUnserList(String sql) throws Exception {
		
		return mailunserdao.getMailUnserList(sql);
	}
	@Override
	public void deleteBySql(String sql) throws Exception {
		mailunserdao.deleteBySql(sql);
		
	}

}
