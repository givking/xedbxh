package com.scder.cszh.volunteer.service;


import java.util.List;

import javax.annotation.Resource;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.scder.common.BaseDao;
import com.scder.common.BaseServiceSupport;
import com.scder.cszh.volunteer.dao.VolunteerDao;
import com.scder.cszh.volunteer.model.Volunteer;

@Service("volunteerService")
@Transactional
public class VolunteerServiceImpl extends BaseServiceSupport implements VolunteerService {
	VolunteerDao volunteerdao;
	@Override
	@Resource(name="volunteerdao")
	public void setBasedao(BaseDao basedao) {
		this.basedao = basedao;
		volunteerdao = (VolunteerDao)basedao;
	}
	@Override
	public List<Volunteer> getVolunteerList(String sql) throws Exception {
		
		return volunteerdao.getVolunteerList(sql);
	}


}
