package com.scder.system.examination.service;

import java.util.List;

import javax.annotation.Resource;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.scder.common.BaseDao;
import com.scder.common.BaseServiceSupport;
import com.scder.system.examination.dao.ExaminationDao;
import com.scder.system.examination.model.Examination;
@Service("examinationservice")
@Transactional
public class ExaminationServiceImpl extends BaseServiceSupport implements ExaminationService{

	ExaminationDao examinationdao;
	@Override
	@Resource(name="examinationdao")
	public void setBasedao(BaseDao basedao) {
		this.basedao = basedao;
		examinationdao = (ExaminationDao)basedao;
	}
	@Override
	public List<Examination> getExaminList(String sql) throws Exception {
		
		return examinationdao.getExaminList(sql);
	}

}
