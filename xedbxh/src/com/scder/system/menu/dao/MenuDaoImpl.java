package com.scder.system.menu.dao;

import java.util.List;

import javax.persistence.Query;

import org.springframework.stereotype.Component;

import com.scder.common.BaseDaoSupport;
import com.scder.system.menu.model.Menu;

@Component("menudao")
public class MenuDaoImpl extends BaseDaoSupport implements MenuDao{

	@Override
	public List<Menu> getMenuList(String sql) throws Exception {
		Query q = em.createNativeQuery(sql, Menu.class);
		return q.getResultList();
	}

}
