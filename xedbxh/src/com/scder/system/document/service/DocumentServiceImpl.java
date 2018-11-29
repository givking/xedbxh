package com.scder.system.document.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.scder.common.BaseDao;
import com.scder.common.BaseServiceSupport;
import com.scder.system.document.dao.DocumentDao;
@Service("documentservice")
@Transactional
public class DocumentServiceImpl extends BaseServiceSupport implements DocumentService {
 DocumentDao documentdao;
	@Override
	@Resource(name="documentdao")
	public void setBasedao(BaseDao basedao) {
		this.basedao = basedao;
		documentdao = (DocumentDao)basedao;
	}
	@Override
	public void deletedoc(String sql) throws Exception {
		documentdao.deletedoc(sql);
		
	}

}
