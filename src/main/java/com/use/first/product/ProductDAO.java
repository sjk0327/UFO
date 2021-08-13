package com.use.first.product;

import java.util.List;

import com.use.first.paging.Criteria;
import com.use.first.rent.CartVO;
import com.use.first.rent.WishListVO;

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
	public List<ProductVO> productSortLow(Criteria cri);
	public List<ProductVO> productSortHigh(Criteria cri);
	public List<ProductVO> productRecommand(Criteria cri);
	
	//위시리스트추가
		public int wishListInsert(WishListVO wishListVO);
		public int wishListDelete(WishListVO wishListVO);
	//장바구니추가
		public int cartListInsert(CartVO cartVO);
	//위시리스트 체크
		public WishListVO checkWishList(String w_pid, String w_mid);
	

}
