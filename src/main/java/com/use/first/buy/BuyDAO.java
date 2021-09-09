package com.use.first.buy;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.annotations.Param;



public interface BuyDAO {

	
	public List<BuyVO> buyList(int b_rid);
	public List<BuyVO> addrList(String userId);
	public BuyVO buyInfo(int b_id);
	public int buyInsert(BuyVO buyVO) throws SQLException;
	public int buyUpdate(BuyVO buyVO);
	public int purchaseRefund(BuyVO buyVO);
	public Integer totalPurchase();
	public List<BuyVO> threeMonthPurchase(String thisMonth, String monthago);
	public List<BuyVO> threeMonthRentPurchase(String thisMonth, String monthago);
	public List<BuyVO> threeMonthBuyPurchase(String thisMonth, String monthago);
	
	//신영 추가
		public List<BuyVO> buyManyList();
		public String buyPurchase(int i);
		public String countSep(String string, String string2);



	}