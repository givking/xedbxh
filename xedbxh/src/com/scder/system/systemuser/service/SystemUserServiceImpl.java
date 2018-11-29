package com.scder.system.systemuser.service;

import java.util.List;

import javax.annotation.Resource;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.scder.common.BaseDao;
import com.scder.common.BaseServiceSupport;
import com.scder.system.systemuser.dao.SystemUserDao;
import com.scder.system.systemuser.model.SystemUser;
@Service("systemuserservice")
@Transactional
public class SystemUserServiceImpl extends BaseServiceSupport implements SystemUserService{
  SystemUserDao systemuserdao;
	@Override
	@Resource(name="systemuserdao")
	public void setBasedao(BaseDao basedao) {
		this.basedao=basedao;
		systemuserdao = (SystemUserDao)basedao;
		
	}
	@Override
	public List<SystemUser> getSystemUserList(String sql) throws Exception {
		
		return systemuserdao.getSystemUserList(sql);
	}
	
}
