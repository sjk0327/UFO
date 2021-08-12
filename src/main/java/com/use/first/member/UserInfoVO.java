package com.use.first.member;

public class UserInfoVO {
	
	private String m_id;

	private String m_name;
	
	public UserInfoVO() {}
	
	public UserInfoVO(String m_id, String m_name) {
		this.m_id = m_id;
		this.m_name = m_name;
	}

	public String getM_id() {
		return m_id;
	}

	public void setM_id(String m_id) {
		this.m_id = m_id;
	}

	public String getM_name() {
		return m_name;
	}

	public void setM_name(String m_name) {
		this.m_name = m_name;
	}

	@Override
	public String toString() {
		return "UserInfoVO [m_id=" + m_id + ", m_name=" + m_name + "]";
	}
	
	

}
