package com.scder.system.menu.service;


import java.util.List;

import javax.annotation.Resource;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.scder.common.BaseDao;
import com.scder.common.BaseServiceSupport;
import com.scder.system.menu.dao.MenuDao;
import com.scder.system.menu.model.Menu;

@Service("menuservice")
@Transactional
public class MenuServiceImpl extends BaseServiceSupport implements MenuService {
	MenuDao menudao;
	@Override
	@Resource(name="menudao")
	public void setBasedao(BaseDao basedao) {
		this.basedao = basedao;
		menudao = (MenuDao)basedao;
	}
	@Override
	public List<Menu> getMenuList(String sql) throws Exception {
		
		return menudao.getMenuList(sql);
	}


}
