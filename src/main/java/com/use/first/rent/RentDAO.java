package com.use.first.rent;


import java.sql.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.use.first.paging.Criteria;



public interface RentDAO {
	public List<RentVO> rentList(RentVO vo);
	public List<RentVO> returnList();
	public List<RentVO> lateList();
	public RentVO rentInfo(int r_id);
	public int rentInsert(RentVO rentVO);
	public int rentUpdate(RentVO rentVO);
	public void rentReturn(int r_id);
	public List<RentVO> rentList(Criteria cri);
	public int getRentTotalCount(Criteria cri);
	public List<WishListVO> getWishList(String userId, Criteria cri);
	public List<WishListVO> getWishListAll(String userId);
	//public int getWishTotalCount(Criteria cri);
	public void deleteWishList(String w_id);
	public void deleteWishAll(String userId);
	public List<CartVO> getCartList(String userId);
	public void insertCartList(CartVO cartVO);
	public void deleteCartList(String c_id);
	public void deleteCartAll(String userId);
	public void updateCart(BuyInfoVO buyInfoVo);
	public int rentSelect();
	public int getWishTotalCount(String userId, Criteria cri);
	public List<RentVO> rentListNow();
	public int checkCart(CartVO cartVO);
	public int rentRefund(RentVO rentVO);
	public void rentlateUpdate(RentVO rentVO);
	public void rentBuyInsert(RentVO rentVO);
	public List<RentVO> rentbuyListByMid(String userId);
	public List<RentVO> rentToBuyList();
	public RentVO rentToBuyListByrid(int r_rid);
	public void rentUpdaterid(int r_id);
	public List<RentVO> rentListNowBypid(@Param("rentdate") Date rentdate, @Param("p_id") String p_id);
	public int countCart(String userId);
	// 성훈 시작
	   public List<RentVO> rentListByMid(@Param("r_mid") String r_mid, @Param("r_state") String r_state);
	   public List<RentVO> purchaseListByMid(@Param("r_mid") String r_mid, @Param("r_state") String r_state);
	   public List<RentVO> rentListByMidAndSearch(Criteria cri, String r_mid, String r_state);
	   public List<RentVO> purchaseListByMidAndSearch(Criteria cri, String r_mid, String r_state);
	   public int getMyRentTotalCount(Criteria cri, String r_mid, String r_state);
	   public int getMyBuyTotalCount(Criteria cri, String r_mid, String r_state);
	   // 성훈 끝
	   
	   //승빈
	   public RentVO rentMessageInfo(@Param("a_rid") int a_rid);
	   //승빈끝

}