package com.use.first.product;

import java.util.List;

import com.use.first.paging.Criteria;

public interface ProductDAO {
	
	public List<ProductVO> productList(Criteria cri);
	public ProductVO productInfo(String p_id);
	public int productInsert(ProductVO productVO);
	public int productUpdate(ProductVO productVO);
	public int productDelete(String p_id);
	public int countProductListTotal(Criteria cri);	
	public ProductVO productInfo2();
	public void deleteById(String id);
	public int productUpdate2(ProductVO productVO);
	public int countProductListCategory();
	
	public List<ProductVO> productSmartPhoneList(String p_category);
	public ProductVO productSmartPhoneList();
	public int countSmartPhone(Criteria cri);
	public int countLaptop(Criteria cri);
	public int countCamera(Criteria cri);
	public int countWatch(Criteria cri);
	public int countTablet(Criteria cri);
	public List<ProductVO> productSortP();
	public List<ProductVO> productSortR();
	
	//위시리스트추가
		//public int wishListInsert(WishListVO wishListVO);
		//장바구니추가
		//public int cartListInsert(CartVO cartVO);
	

}
