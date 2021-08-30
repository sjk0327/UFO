package com.use.first.member;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.use.first.paging.Criteria;


public interface UserDAO {
	public List<UserVO> memList(Criteria cri);
	public UserVO memInfo(String m_id);
	public UserVO userInfo(String m_id);
	public int memUpdate(UserVO user);
	public int userUpdate(UserVO user);
	public int userDelete(UserVO user);
	public int userDeleteUpdateCart(@Param("c_mid") String c_mid);
	public int userDeleteUpdateAlert(@Param("a_mid") String a_mid);
	public int userDeleteUpdateWish(@Param("w_mid") String w_mid);
	public int userDeleteUpdateBuy(@Param("b_mid") String b_mid);
	public int userDeleteUpdateRental(@Param("r_mid") String r_mid);
	public int userDeleteUpdateReview(@Param("v_mid") String v_mid);
	
	public int userConfirm(@Param("r_mid") String r_mid);
	
	
	public int countMemListTotal(Criteria cri);	
	public int kakaoJoin(UserVO user);
	public int naverJoin(UserVO user);
	

	public UserVO selectMember(String m_id);
	public int pwUpdate_M(UserVO user);

	public int pwUpdateId(String id, String pw);

	public String selectId(UserVO user);
	

	
	// 8/10 : 성훈 추가


	public int duplicateCheckId(String m_id);
	public int memJoin(UserVO user);
	
	public int loginCheck(String id, String pw);
	
	// 8/16 : 정노 추가
	public void memUpdateBuy(String m_id, String m_point);
	
	

}
