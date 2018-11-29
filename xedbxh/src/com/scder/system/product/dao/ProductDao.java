package com.scder.system.product.dao;

import java.util.List;

import com.scder.system.product.model.Product;

public interface ProductDao {
	public void updateShowid(Product product) throws Exception;
	public List<Object> getModelViewList(String sql) throws Exception;
	public List<Product> getProductList(String sql) throws Exception;

}
