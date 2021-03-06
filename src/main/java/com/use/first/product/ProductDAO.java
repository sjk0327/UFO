package com.use.first.product;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.use.first.paging.Criteria;
import com.use.first.rec.RecVO;
import com.use.first.rent.CartVO;
import com.use.first.rent.RentVO;
import com.use.first.rent.WishListVO;

public interface ProductDAO {
	

	public List<ProductVO> productList(Criteria cri);
	public ProductVO productInfo(String p_id);
	public int productInsert(ProductVO productVO);
	public int productUpdate(ProductVO productVO);
	public int productDelete(String p_id);
	public int countProductListTotal(Criteria cri);
	public int countProductListTotalPage(Criteria cri);
	public int countProductListTotalPageRecommand(Criteria cri);
	public int countProductListTotalBySearchKeyword(Criteria cri);	
	public int countProductListTotalBySearchType(Criteria cri);	
	public ProductVO productInfo2();
	public void deleteById(String id);
	//삭제기능
	public int productUpdate2(ProductVO productVO);
	public int countProductListCategory();	
	public List<ProductVO> productSmartPhoneList(Criteria cri);
	public ProductVO productSmartPhoneList();
	public int countSmartPhone();public int countLaptop();
	public int countCamera();public int countWatch();public int countTablet();
	public List<ProductVO> productSortLow(Criteria cri);
	public List<ProductVO> productSortHigh(Criteria cri);
	public List<ProductVO> productRecommand(Criteria cri);
	public List<ProductVO> productMenubarPriceSearch(String minPrice, String maxPrice);
	public List<ProductVO> pictogramSearch(String p_category);
	//조회수 증가
	public int productReadUpdate(String p_id);
	
	public List<ProductVO> productKeywordList(Criteria cri);
	public List<ProductVO> productKeywordSearchTypeList(Criteria cri);
	public List<ProductVO> productsearchTypeList(Criteria cri, String searchType);
	public List<ProductVO> productSearchTypeList(Criteria cri);
	public List<ProductVO> productMenubarPriceSearchRent(String minPrice, String maxPrice);
	public List<ProductVO> productSelectColor(Criteria cri);
	public int colorTotal(Criteria cri, String p_categoryColor);
	public ProductVO adminRead();		
	
			
	//정노추가
		public int productUpdatebuy(int b_amount1, int b_amount2, String b_pid);
	//수정추가		
		public List<ProductVO> productBestList(String maxcate);
		public List<String> productReviewBest(String id);
		public List<ProductVO> productNametoIndex(String category);
			//위시리스트추가,삭제
			public int wishListInsert(WishListVO wishListVO);
			public int wishListDelete(WishListVO wishListVO);
			//장바구니추가
			public int cartListInsert(CartVO cartVO);
			//위시리스트 체크
			public WishListVO checkWishList(String w_pid, String w_mid);
			
			public int recommendCount(String r_pid);
			
			//리뷰 리스트
			public List<RecVO> reviewList(Criteria cri, String v_pid);
			public int countReviewListTotal(Criteria cri, String v_pid);
		//리뷰 리스트조회 페이지 눌렀을 때꺼
			public List<RecVO> reviewPagingList(Criteria cri, String v_pid);
			public int countReviewListPagingTotal(Criteria cri, String v_pid);
		//리뷰 등록
			public int reviewInsert(RecVO recVO);
		//리뷰 개수
			public int reviewCount(String v_pid);
		//특정 리뷰
			public List<RecVO> oneReview(@Param("v_pid") String v_pid, @Param("userId") String userId);
		//리뷰 등록
			public int reviewUpdate(RecVO recVO);
		//리뷰 삭제
			public int reviewDelete(String v_mid, String v_pid);
			public List<ProductVO> productSmartPhoneList(String maxcate);
		//렌탈 리스트 
		public List<RentVO> selectedRentalList(String r_pid);
		//장바구니에 추가된게 있는지 확인
			public CartVO checkCart(@Param("c_pid") String c_pid, @Param("c_mid") String c_mid);
		


			
			}			



