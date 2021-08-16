package com.use.first.buy;

import java.util.List;

import org.apache.ibatis.annotations.Param;



public interface BuyDAO {

	
	public List<BuyVO> buyList(@Param("b_mid")String b_mid,@Param("b_pid")String b_pid);
	public BuyVO buyInfo(String b_id);
	public int buyInsert(BuyVO buyVO);
	public int buyUpdate(BuyVO buyVO);

}