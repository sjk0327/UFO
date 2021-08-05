package com.use.first.rent;

import java.util.List;

import com.use.first.buy.BuyVO;


public interface RentDAO {
	public List<RentVO> rentList(RentVO vo);
	public RentVO rentInfo(String r_id);
	public int rentInsert(RentVO rentVO);
	public int rentUpdate(RentVO rentVO);

}
