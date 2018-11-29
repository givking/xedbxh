package com.scder.client.webcenter.controller;

import java.util.List;

import com.scder.system.article.model.Article;
import com.scder.system.article.service.ArticleService;
import com.scder.system.menu.model.Menu;
import com.scder.utils.BookPage;

public class WebAticleController {
	
	public List<Article> getShowArticleList(ArticleService articleservice,Integer menuid,String orderby,Integer limit) throws Exception{
		String sql = "select o.* from alecms_article o where o.state = 1 and o.showid = 1 and o.menu_id = "+menuid+" "+orderby+" limit 0,"+limit;
		
		return articleservice.getArticleList(sql);
	}
	
	public List<Article> getHotList(ArticleService articleservice,String orderby,Integer limit) throws Exception{
		
		String sql = "select o.* from alecms_article o where o.state = 1 and o.showid = 1 and o.level =1 "+orderby+" limit 0,"+limit;
		
	    return articleservice.getArticleList(sql);
	}
	
	public Article getArticleById(ArticleService articleservice,Integer id) throws Exception{
		String sql = "select o.* from alecms_article o where o.id = "+id;
          List<Article> alist = articleservice.getArticleList(sql);
		if(alist!=null&&alist.size()>0){
			
			return alist.get(0);
		}
		
		
		return null;
	}
	
	public  List<Article> getArticleList(ArticleService articleservice,BookPage page,Integer menu_id,String orderby) throws Exception{
		
		String sql = "select o.* from alecms_article o where o.state = 1 and o.menu_id = " +menu_id;
		page.setResultcount(articleservice.getArticleList(sql).size());
		List<Article> artlist = articleservice.getArticleList(sql+" "+orderby+" limit "+page.getCurentpagecount()+","+page.getPagelistcount());
		return artlist;
	}
	//获取主栏目下所有文章
public  List<Article> getTopAllArticleList(ArticleService articleservice,List<Menu> mlist,String orderby,Integer limit) throws Exception{
		
		StringBuffer sbf= new StringBuffer("select o.* from alecms_article o where o.state = 1");
		if(mlist!=null){
		sbf.append(" and (");
		for(int i = 0;i<mlist.size();i++){
			
			if(mlist.size()-1 != i){
				sbf.append("o.menu_id = ").append(mlist.get(i).getId()).append(" or ");
			}else{
				
				sbf.append("o.menu_id = ").append(mlist.get(i).getId());
			}
		}
		sbf.append(")");
		List<Article> artlist = articleservice.getArticleList(sbf.toString()+" "+orderby+" limit 0,"+limit);
		return artlist;
		}else{
			return null;
		}
	}
//获取上/下一篇文章
public  List<Article> getNextArticleList(ArticleService articleservice,List<Menu> mlist,String orderby,Integer id,String type,Integer menu_id) throws Exception{
	StringBuffer sbf= new StringBuffer();	
		if(type=="before"){
			sbf.append("select o.* from alecms_article o where o.state = 1 and o.id>"+id);
		}else if(type=="next"){
			sbf.append("select o.* from alecms_article o where o.state = 1 and o.id<"+id);
		}
		if(mlist!=null){
		sbf.append(" and (");
		for(int i = 0;i<mlist.size();i++){
			
			if(mlist.size()-1 != i){
				sbf.append("o.menu_id = ").append(mlist.get(i).getId()).append(" or ");
			}else{
				
				sbf.append("o.menu_id = ").append(mlist.get(i).getId());
			}
		}
		sbf.append(")");
		}else if(mlist==null){
			sbf.append(" and o.menu_id="+menu_id);
		}
		List<Article> artlist = articleservice.getArticleList(sbf.toString()+" "+orderby+" limit 0,1");
		return artlist;
	}
//获取主栏目下所有文章（分页）
	public  List<Article> getTopArticleList(ArticleService articleservice,BookPage page,List<Menu> mlist,String orderby) throws Exception{
		
		StringBuffer sbf= new StringBuffer("select o.* from alecms_article o where o.state = 1");
		if(mlist!=null){
		sbf.append(" and (");
		for(int i = 0;i<mlist.size();i++){
			
			if(mlist.size()-1 != i){
				sbf.append("o.menu_id = ").append(mlist.get(i).getId()).append(" or ");
			}else{
				
				sbf.append("o.menu_id = ").append(mlist.get(i).getId());
			}
		}
		
		sbf.append(")");
		
		page.setResultcount(articleservice.getArticleList(sbf.toString()).size());
		List<Article> artlist = articleservice.getArticleList(sbf.toString()+" "+orderby+" limit "+page.getCurentpagecount()+","+page.getPagelistcount());
		return artlist;
		}else{
			page.setResultcount(1);
			return null;
		}
	}
	
	public Article getArticleAbout(ArticleService articleservice,Integer menu_id) throws Exception{
		String sql = "select o.* from alecms_article o where o.menu_id = "+menu_id;
		  List<Article> alist = articleservice.getArticleList(sql);
		if(alist!=null&&alist.size()>0){
			
			return alist.get(0);
		}
		return null;
	}
	
	public List<Article> getSelWebArticle(ArticleService articleservice,String title) throws Exception{
		
		String sql = "select o.* from alecms_article o where o.state = 1 and o.title like '%"+title+"%'";
		
		return articleservice.getArticleList(sql);
	}

	public List<Article> getAllArticleList(ArticleService articleservice,Integer menu_id,String orderby,Integer limit) throws Exception{
		String sql = "select o.* from alecms_article o where o.state = 1 "+orderby+" limit 0,"+limit;
		
		if(menu_id!=null){
			
			sql = "select o.* from alecms_article o where o.state = 1 and o.menu_id = "+menu_id+" "+orderby+" limit 0,"+limit;
		}
		
		return articleservice.getArticleList(sql);
	}
	
	public List<Article> getPicList(ArticleService articleservice,Integer menuid,String orderby,Integer limit) throws Exception{
		
      String sql = "select o.* from alecms_article o where o.state = 1 and o.showid = 1 and o.imgpath != 'no' and o.menu_id = "+menuid+" "+orderby+" limit 0,"+limit;
		
		return articleservice.getArticleList(sql);
		
	}
	//所有文章图片
	public List<Article> getAllPicList(ArticleService articleservice,String orderby,Integer limit) throws Exception{
		
	      String sql = "select o.* from alecms_article o where o.state = 1 and o.showid = 1 and o.imgpath != 'no'"+" "+orderby+" limit 0,"+limit;
			
			return articleservice.getArticleList(sql);
			
		}
	//所有最新消息文章（分页）
	public List<Article> getPageArticleList(ArticleService articleservice,String orderby,BookPage page) throws Exception{
		String sql = "select o.* from alecms_article o where o.state = 1 ";
		page.setResultcount(articleservice.getArticleList(sql).size());
		List<Article> artlist = articleservice.getArticleList(sql+" "+orderby+" limit "+page.getCurentpagecount()+","+page.getPagelistcount());
		return artlist;
	}
	//搜索（分页）
	public List<Article> getSearchWebArticle(ArticleService articleservice,String title,String orderby,BookPage page) throws Exception{
		
		String sql = "select o.* from alecms_article o where o.state = 1 and o.title like '%"+title+"%'";
		page.setResultcount(articleservice.getArticleList(sql).size());
		List<Article> artlist = articleservice.getArticleList(sql+" "+orderby+" limit "+page.getCurentpagecount()+","+page.getPagelistcount());
		return artlist;
	}
	
}
