package com.use.first.member;

import java.util.List;

import com.use.first.paging.Criteria;


public interface UserDAO {
	public List<UserVO> memList(Criteria cri);
	public UserVO memInfo(String m_id);
	public int memUpdate(UserVO user);
	public int countMemListTotal(Criteria cri);	

	
	// 8/10 : 성훈 추가
	public int duplicateCheckId(String m_id);
}
