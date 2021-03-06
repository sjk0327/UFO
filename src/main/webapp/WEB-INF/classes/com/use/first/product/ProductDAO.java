package com.use.first.product;

import java.util.HashMap;
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
	public int countSmartPhone();
	public int countLaptop();
	public int countCamera();
	public int countWatch();
	public int countTablet();
	public List<ProductVO> productSortLow(Criteria cri);
	public List<ProductVO> productSortHigh(Criteria cri);
	public List<ProductVO> productRecommand(Criteria cri);
	public List<ProductVO> productMenubarPriceSearch(String minPrice, String maxPrice);
	public List<ProductVO> pictogramSearch(String p_category);
	
	
		
		
		public List<ProductVO> productKeywordList(Criteria cri);
		public List<ProductVO> productKeywordSearchTypeList(Criteria cri);
		public List<ProductVO> productsearchTypeList(Criteria cri, String searchType);
		public List<ProductVO> productSearchTypeList(Criteria cri);
		
		//위시리스트추가,삭제
				public int wishListInsert(WishListVO wishListVO);
				public int wishListDelete(WishListVO wishListVO);
			//장바구니추가
				public int cartListInsert(CartVO cartVO);
			//위시리스트 체크
				public WishListVO checkWishList(String w_pid, String w_mid);
			//조아요 추가,삭제,체크
				public int recommendInsert(RecommendVO recommendVO);
				public int recommendDelete(RecommendVO recommendVO);
				public RecommendVO checkRecommend(String r_pid, String r_mid);
				public int recommendCount(String r_pid);
		
	

}
