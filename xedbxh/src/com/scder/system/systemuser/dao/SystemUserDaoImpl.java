package com.scder.system.systemuser.dao;

import java.util.List;

import javax.persistence.Query;

import org.springframework.stereotype.Component;

import com.scder.common.BaseDaoSupport;
import com.scder.system.systemuser.model.SystemUser;
@Component("systemuserdao")
public class SystemUserDaoImpl extends BaseDaoSupport implements SystemUserDao{

	@Override
	public List<SystemUser> getSystemUserList(String sql) throws Exception {
		Query q = em.createNativeQuery(sql, SystemUser.class);
		return q.getResultList();
	}

}
