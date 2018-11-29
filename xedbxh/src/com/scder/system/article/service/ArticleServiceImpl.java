package com.scder.system.article.service;

import java.util.List;

import javax.annotation.Resource;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.scder.common.BaseDao;
import com.scder.common.BaseServiceSupport;
import com.scder.system.article.dao.ArticleDao;
import com.scder.system.article.model.Article;
@Service("articleservice")
@Transactional
public class ArticleServiceImpl extends BaseServiceSupport implements ArticleService{
 ArticleDao articledao;
	@Override
	@Resource(name="articledao")
	public void setBasedao(BaseDao basedao) {
		this.basedao = basedao;
		articledao = (ArticleDao)basedao;
	}
	@Override
	public void updateShowid(Article article) throws Exception {
		articledao.updateShowid(article);
		
	}
	@Override
	public List<Object> getModelViewList(String sql) throws Exception {
		
		return articledao.getModelViewList(sql);
	}
	@Override
	public List<Article> getArticleList(String sql) throws Exception {
		
		return articledao.getArticleList(sql);
	}

}
