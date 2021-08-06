package com.use.first.rent;

import java.util.List;

import com.use.first.member.Criteria1;
import com.use.first.paging.Criteria;


public interface RentDAO {
//	public List<RentVO> rentList(RentVO vo);
	public List<RentVO> rentList(Criteria cri);
	public RentVO rentInfo(String r_id);
	public int rentInsert(RentVO rentVO);
	public int rentUpdate(RentVO rentVO);
	public int getRentTotalCount(Criteria cri);

}
