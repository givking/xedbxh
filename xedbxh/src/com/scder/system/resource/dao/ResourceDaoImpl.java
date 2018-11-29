package com.scder.system.resource.dao;

import java.util.List;

import javax.persistence.Query;

import org.springframework.stereotype.Component;

import com.scder.common.BaseDaoSupport;
import com.scder.system.resource.model.Resource;
import com.scder.system.roleres.model.RoleRes;
@Component("resourcedao")
public class ResourceDaoImpl extends BaseDaoSupport implements ResourceDao {

	@Override
	public List<RoleRes> getRoleResList(String sql) throws Exception {
		Query q = em.createNativeQuery(sql, RoleRes.class);
		return q.getResultList();
	}

	@Override
	public void saveRoleRes(RoleRes roleres) throws Exception {
		em.persist(roleres);
		
	}

	@Override
	public RoleRes findById(Integer id) throws Exception {
		
		return em.find(RoleRes.class, id);
	}

	@Override
	public void deleteRoleRes(Integer id) throws Exception {
		em.remove(this.findById(id));
		
	}

	@Override
	public Resource findByResourceId(Integer id) throws Exception {
		
		return em.find(Resource.class, id);
	}

	@Override
	public List<Resource> getResList(String sql) throws Exception {
		Query q = em.createNativeQuery(sql, Resource.class);
		
		return q.getResultList();
	}



}
