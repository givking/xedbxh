package com.scder.client.webcenter.controller;

import java.util.ArrayList;
import java.util.List;

import com.scder.system.menu.model.Menu;
import com.scder.system.menu.model.MenuVo;
import com.scder.system.menu.model.ResourceVo;
import com.scder.system.menu.service.MenuService;



public class WebNavController {
	
	public List<MenuVo> topNav(MenuService menuservice) throws Exception{
	List<MenuVo> mvlist = new ArrayList<MenuVo>();	
	String sql = "select o.* from alecms_menu o where o.state = 1 and o.parent_id = 0 order by o.no asc";
	String subsql = "select o.* from alecms_menu o where o.state = 1 and o.parent_id = ";
	   List<Menu> plist = menuservice.getMenuList(sql);
	   if(plist!=null && plist.size()>0){
		   
		   for(Menu m:plist){
			   MenuVo mv = new MenuVo();
			   List<Menu> sublist = menuservice.getMenuList(subsql+m.getId()+"  order by o.no asc");
			   mv.setMenu(m);
			   mv.setSublist(sublist);
			   mvlist.add(mv);
		   }
		   
		   
	   }
	   
		
		return mvlist;
	}
	
	
	public List<Menu> getMenuList(MenuService menuservice,Integer pid,String orderby) throws Exception{
		
		String sql = "select o.* from alecms_menu o where o.state = 1 and o.parent_id = "+pid+" "+orderby;
		
		return menuservice.getMenuList(sql);
	}
	
	public MenuVo getLeftMenuvo(MenuService menuservice,Integer id,String orderby) throws Exception{
		
		MenuVo mv = new MenuVo();
		if(id!=null){
			String byid = "select o.* from alecms_menu o where   o.id ="; 
			String sql = "select o.* from alecms_menu o where  o.parent_id ="; 
			
			List<Menu> mlist  = menuservice.getMenuList(sql+id+" "+orderby);
			if(mlist!=null && mlist.size()>0){
				mv.setMenu(menuservice.getMenuList(byid+id+" "+orderby).get(0));
				mv.setSublist(mlist);
			}else{
				Menu menu = menuservice.getMenuList(byid+id+" "+orderby).get(0);
				if(menu.getParent_id()!=0){
					mv.setMenu(menuservice.getMenuList(byid+menu.getParent_id()+" "+orderby).get(0));
					mv.setSublist(menuservice.getMenuList(sql+menu.getParent_id()+" "+orderby));
				}else{
					mv.setMenu(menu);
				}
			}
			
			
		}
		
		return mv;
	}
	
	
	public Menu getMenuById(MenuService menuservice,Integer id) throws Exception{
		
		String sql = "select o.* from alecms_menu o where o.id = "+id;
		
		return menuservice.getMenuList(sql).get(0);
	}
	

}
