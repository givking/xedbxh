package com.scder.system.menu.dao;

import java.util.List;

import com.scder.system.menu.model.Menu;

public interface MenuDao {
public List<Menu> getMenuList(String sql) throws Exception;

}
