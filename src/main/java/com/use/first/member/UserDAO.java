package com.use.first.member;

import java.util.List;

import com.use.first.paging.Criteria;


public interface UserDAO {
	public List<UserVO> memList(Criteria cri);
	public UserVO memInfo(String m_id);
	public UserVO userInfo(String m_id);
	public int memUpdate(UserVO user);
	public int countMemListTotal(Criteria cri);	
	public int kakaoJoin(UserVO user);
	public int naverJoin(UserVO user);


	
	// 8/10 : 성훈 추가

	public int duplicateCheckId(String m_id);
	public int memJoin(UserVO user);
	
	// 8/16 : 정노 추가
	public void memUpdateBuy(String m_id, String m_point, String m_tel, String m_addr);

}
