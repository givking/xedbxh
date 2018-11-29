package com.scder.system.systemuser.service;

import java.util.List;

import com.scder.system.systemuser.model.SystemUser;

public interface SystemUserService {
	public List<SystemUser> getSystemUserList(String sql) throws Exception;

}
