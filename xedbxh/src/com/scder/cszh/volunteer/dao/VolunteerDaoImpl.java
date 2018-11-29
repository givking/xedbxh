package com.scder.cszh.volunteer.dao;

import java.util.List;

import javax.persistence.Query;

import org.springframework.stereotype.Component;

import com.scder.common.BaseDaoSupport;
import com.scder.cszh.volunteer.model.Volunteer;
import com.scder.system.menu.model.Menu;

@Component("volunteerdao")
public class VolunteerDaoImpl extends BaseDaoSupport implements VolunteerDao{

	@Override
	public List<Volunteer> getVolunteerList(String sql) throws Exception {
		Query q = em.createNativeQuery(sql, Volunteer.class);
		return q.getResultList();
	}


}
