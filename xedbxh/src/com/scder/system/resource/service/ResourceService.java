package com.scder.system.resource.service;

import java.util.List;

import com.scder.system.resource.model.Resource;
import com.scder.system.roleres.model.RoleRes;

public interface ResourceService {
	public List<RoleRes> getRoleResList(String sql) throws Exception;
	public void saveRoleRes(RoleRes roleres) throws Exception;
	public RoleRes findById(Integer id) throws Exception;
    public void deleteRoleRes(Integer id) throws Exception; 
    public Resource findByResourceId(Integer id) throws Exception; 
    public List<Resource> getResList(String sql) throws Exception;
}
