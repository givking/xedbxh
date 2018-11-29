package com.scder.system.article.service;

import java.util.List;

import com.scder.system.article.model.Article;

public interface ArticleService {
	public void updateShowid(Article article) throws Exception;
	public List<Object> getModelViewList(String sql) throws Exception;
	public List<Article> getArticleList(String sql) throws Exception;
}
