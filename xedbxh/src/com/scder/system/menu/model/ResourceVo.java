package com.scder.system.menu.model;

import java.util.ArrayList;
import java.util.List;

import com.scder.system.resource.model.Resource;

public class ResourceVo {
	private Resource resource;
	private List<Resource> sublist = new ArrayList<Resource>();
	public Resource getResource() {
		return resource;
	}
	public void setResource(Resource resource) {
		this.resource = resource;
	}
	public List<Resource> getSublist() {
		return sublist;
	}
	public void setSublist(List<Resource> sublist) {
		this.sublist = sublist;
	}
	
	

}
