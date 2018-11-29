package com.scder.system.webtable.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.scder.common.BaseDao;
import com.scder.common.BaseServiceSupport;
import com.scder.system.webtable.dao.WebTableDao;
import com.scder.system.webtable.model.WebTable;
@Service("webtableservice")
@Transactional
public class WebTableServiceImpl extends BaseServiceSupport implements WebTableService {
   WebTableDao webtabledao;
	@Override
	@Resource(name="webtabledao")
	public void setBasedao(BaseDao basedao) {
		this.basedao = basedao;
		webtabledao = (WebTableDao)basedao;
	}
	@Override
	public List<Object> getModelViewList(String sql) throws Exception {
		
		return webtabledao.getModelViewList(sql);
	}
	@Override
	public void updateShowid(WebTable webtable) throws Exception {
		webtabledao.updateShowid(webtable);	
	}

}
