package com.scder.system.paper.service;

import java.util.List;

import javax.annotation.Resource;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.scder.common.BaseDao;
import com.scder.common.BaseServiceSupport;
import com.scder.system.paper.dao.PaperDao;
import com.scder.system.paper.model.Paper;
@Service("paperservice")
@Transactional
public class PaperServiceImpl extends BaseServiceSupport implements PaperService{
   PaperDao paperdao;
	@Override
	@Resource(name="paperdao")
	public void setBasedao(BaseDao basedao) {
		this.basedao = basedao;
		paperdao = (PaperDao)basedao;
	}
	@Override
	public Paper getPaperById(Integer id) throws Exception {
		
		return paperdao.getPaperById(id);
	}
	@Override
	public List<Paper> getPaperList(String sql) throws Exception {
		
		return paperdao.getPaperList(sql);
	}

}
