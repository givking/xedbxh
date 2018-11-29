package com.scder.system.role.service;

import javax.annotation.Resource;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.scder.common.BaseDao;
import com.scder.common.BaseServiceSupport;
import com.scder.system.role.dao.RoleDao;
@Service("roleservice")
@Transactional
public class RoleServiceImpl extends BaseServiceSupport implements RoleService{
   RoleDao  roledao;
	@Resource(name="roledao")
	public void setBasedao(BaseDao basedao) {
		this.basedao = basedao;
		roledao = (RoleDao)basedao;
	}

}
