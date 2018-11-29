package com.scder.system.product.dao;

import java.util.List;

import javax.persistence.Query;

import org.hibernate.SQLQuery;
import org.hibernate.transform.Transformers;
import org.springframework.stereotype.Component;

import com.scder.common.BaseDaoSupport;
import com.scder.system.product.model.Product;
@Component("productdao")
public class ProductDaoImpl extends BaseDaoSupport implements ProductDao{
	@Override
	public void updateShowid(Product product) throws Exception {
		em.merge(product);
		
	}

	@Override
	public List<Object> getModelViewList(String sql) throws Exception {
		Query q =  em.createNativeQuery(sql);
		q.unwrap(SQLQuery.class).setResultTransformer(Transformers.ALIAS_TO_ENTITY_MAP);
		return q.getResultList();
	}

	@Override
	public List<Product> getProductList(String sql) throws Exception {
		Query q =  em.createNativeQuery(sql,Product.class);
		return q.getResultList();
	}

}
