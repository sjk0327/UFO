package com.use.first.rent;

import java.util.List;



import org.apache.ibatis.annotations.Param;

import com.use.first.paging.Criteria;



public interface RentDAO {
	public List<RentVO> rentList(RentVO vo);
	public List<RentVO> returnList();
	public RentVO rentInfo(String r_id);
	public int rentInsert(RentVO rentVO);
	public int rentUpdate(RentVO rentVO);
	public void rentReturn(String r_id);
	public List<RentVO> rentList(Criteria cri);
	public int getRentTotalCount(Criteria cri);

		
	// 성훈 시작
	   public List<RentVO> rentListByMid(@Param("r_mid") String r_mid, @Param("r_state") String r_state);
	   public List<RentVO> purchaseListByMid(@Param("r_mid") String r_mid, @Param("r_state") String r_state);
	   // 성훈 끝
	
	
	
	
}
