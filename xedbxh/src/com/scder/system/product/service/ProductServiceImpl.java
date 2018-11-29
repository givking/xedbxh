package com.scder.system.product.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.scder.common.BaseDao;
import com.scder.common.BaseServiceSupport;
import com.scder.system.article.model.Article;
import com.scder.system.product.dao.ProductDao;
import com.scder.system.product.model.Product;
@Service("productservice")
@Transactional
public class ProductServiceImpl extends BaseServiceSupport implements ProductService {
   ProductDao productdao;
	@Override
	@Resource(name="productdao")
	public void setBasedao(BaseDao basedao) {
	  this.basedao = basedao;
	  productdao = (ProductDao)basedao;
		
	}
	
	
	@Override
	public void updateShowid(Product product) throws Exception {
		productdao.updateShowid(product);
		
	}
	@Override
	public List<Object> getModelViewList(String sql) throws Exception {
		
		return productdao.getModelViewList(sql);
	}
	@Override
	public List<Product> getProductList(String sql) throws Exception {
		
		return productdao.getProductList(sql);
	}

	
}
