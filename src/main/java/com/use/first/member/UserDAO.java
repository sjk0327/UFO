package com.use.first.member;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.use.first.paging.Criteria;



public interface UserDAO {
	public List<UserVO> memList(Criteria cri);
	public UserVO memInfo(String m_id);
	public UserVO userInfo(String m_id);
	public List<AlertVO> messageByMid(@Param("a_mid") String a_mid);	
	public int memUpdate(UserVO user);
	public int userUpdate(UserVO user);
	public int userDelete(UserVO user);
	public int userDeleteUpdateCa(UserVO user);
	public int userDeleteUpdateWi(UserVO user);
	public int userDeleteUpdateAl(UserVO user);
	public int userDeleteUpdateRev(UserVO user);
	public int userDeleteUpdateBuy(UserVO user);
	public int userDeleteUpdateRental(UserVO user);
	public int countMemListTotal(Criteria cri);	
	public int kakaoJoin(UserVO user);
	public int naverJoin(UserVO user);


	
	// 8/10 : 성훈 추가

	public int duplicateCheckId(String m_id);
	public int memJoin(UserVO user);

}
