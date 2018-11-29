package com.scder.system.resource.service;

import java.util.List;

import javax.annotation.Resource;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.scder.common.BaseDao;
import com.scder.common.BaseServiceSupport;
import com.scder.system.resource.dao.ResourceDao;
import com.scder.system.roleres.model.RoleRes;
@Service("resourceservice")
@Transactional
public class ResourceServiceImpl extends BaseServiceSupport implements ResourceService {
  ResourceDao resourcedao;
	@Override
	@Resource(name="resourcedao")
	public void setBasedao(BaseDao basedao) {
		this.basedao = basedao;
		resourcedao = (ResourceDao)basedao;
	}
	@Override
	public List<RoleRes> getRoleResList(String sql) throws Exception {
	
		return resourcedao.getRoleResList(sql);
	}
	@Override
	public void saveRoleRes(RoleRes roleres) throws Exception {
		resourcedao.saveRoleRes(roleres);
		
	}
	@Override
	public RoleRes findById(Integer id) throws Exception {
		
		return resourcedao.findById(id);
	}
	@Override
	public void deleteRoleRes(Integer id) throws Exception {
		resourcedao.deleteRoleRes(id);
		
	}
	@Override
	public com.scder.system.resource.model.Resource findByResourceId(Integer id)
			throws Exception {
		// TODO Auto-generated method stub
		return null;
	}
	@Override
	public List<com.scder.system.resource.model.Resource> getResList(String sql)
			throws Exception {
		
		return resourcedao.getResList(sql);
	}


}
