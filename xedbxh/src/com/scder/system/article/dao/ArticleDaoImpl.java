package com.scder.system.article.dao;

import java.util.List;

import javax.persistence.Query;

import org.hibernate.SQLQuery;
import org.hibernate.transform.Transformers;
import org.springframework.stereotype.Component;

import com.scder.common.BaseDaoSupport;
import com.scder.system.article.model.Article;
@Component("articledao")
public class ArticleDaoImpl extends BaseDaoSupport implements ArticleDao {

	@Override
	public void updateShowid(Article article) throws Exception {
		em.merge(article);
		
	}

	@Override
	public List<Object> getModelViewList(String sql) throws Exception {
		Query q =  em.createNativeQuery(sql);
		q.unwrap(SQLQuery.class).setResultTransformer(Transformers.ALIAS_TO_ENTITY_MAP);
		return q.getResultList();
	}

	@Override
	public List<Article> getArticleList(String sql) throws Exception {
		Query q =  em.createNativeQuery(sql,Article.class);
		return q.getResultList();
	}

}
