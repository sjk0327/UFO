package com.use.first.member;

import java.util.List;


public interface UserDAO {
	public List<UserVO> memberList();
	public UserVO memInfo(String m_id);


}
