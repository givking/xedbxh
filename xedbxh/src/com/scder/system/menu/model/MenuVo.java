package com.scder.system.menu.model;

import java.util.List;

public class MenuVo {
	
	private Menu menu;
	private List<Menu> sublist;
	public Menu getMenu() {
		return menu;
	}
	public void setMenu(Menu menu) {
		this.menu = menu;
	}
	public List<Menu> getSublist() {
		return sublist;
	}
	public void setSublist(List<Menu> sublist) {
		this.sublist = sublist;
	}
	
	

}
