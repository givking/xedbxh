package com.scder.system.webcase.service;

import java.util.List;

import javax.annotation.Resource;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.scder.common.BaseDao;
import com.scder.common.BaseServiceSupport;
import com.scder.system.webcase.dao.WebCaseDao;
import com.scder.system.webcase.model.WebCase;
@Service("webcaseservice")
@Transactional
public class WebCaseServiceImpl extends BaseServiceSupport implements WebCaseService{
 WebCaseDao webcasedao;
	@Override
	@Resource(name="webcasedao")
	public void setBasedao(BaseDao basedao) {
		this.basedao = basedao;
		webcasedao = (WebCaseDao)basedao;
	}
	@Override
	public List<WebCase> getWebCaseListBySql(String sql) throws Exception {
		
		return webcasedao.getWebCaseListBySql(sql);
	}

}
