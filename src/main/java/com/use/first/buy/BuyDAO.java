package com.use.first.buy;

import java.util.List;

import org.apache.ibatis.annotations.Param;

public interface BuyDAO {

	
	public List<BuyVO> buyList(int b_rid);
	public BuyVO buyInfo(String b_id);
	public int buyInsert(BuyVO buyVO);
	public int buyUpdate(BuyVO buyVO);

}