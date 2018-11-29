package com.scder.system.systemuser.dao;

import java.util.List;

import com.scder.system.systemuser.model.SystemUser;

public interface SystemUserDao {
	public List<SystemUser> getSystemUserList(String sql) throws Exception;
}
