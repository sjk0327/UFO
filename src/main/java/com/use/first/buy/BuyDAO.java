package com.use.first.buy;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.annotations.Param;



public interface BuyDAO {

	
	public List<BuyVO> buyList(int b_rid);
	public BuyVO buyInfo(int b_id);
	public int buyInsert(BuyVO buyVO) throws SQLException;
	public int buyUpdate(BuyVO buyVO);

}