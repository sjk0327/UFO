package com.use.first.member;

import java.util.List;


public interface UserDAO {
	public List<UserVO> memList();
	public UserVO memInfo(String m_id);
	public int memUpdate(UserVO user);

}
