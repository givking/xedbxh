package com.scder.system.menu.service;

import java.util.List;

import com.scder.system.menu.model.Menu;

public interface MenuService {
	
	public List<Menu> getMenuList(String sql) throws Exception;

}
