package com.use.first.product;

import java.util.List;

public interface ProductDAO {
	
	public List<ProductVO> productList();
	public ProductVO productInfo(String p_id);
	public int productInsert(ProductVO productVO);
	public int productUpdate(ProductVO productVO);
	public int productDelete(String p_id);
	
}
