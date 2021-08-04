package com.use.first.product;

import java.util.List;

public interface ProductDAO {
	
	public List<ProductVO> list();
	public ProductVO info(String p_id);
	public int insert(ProductVO productVO);
	public int update(ProductVO productVO);
	public int delete(String p_id);
}
