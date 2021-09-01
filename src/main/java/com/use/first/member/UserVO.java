package com.use.first.member;

import java.sql.Date;

import org.springframework.web.multipart.MultipartFile;

public class UserVO {

	private String m_id;

	private String m_name;

	private String m_pw;

	private String m_gender;

	private String m_addr;

	private String m_tel;

	private String m_email;

	private int m_point;

	private String m_img;

	private Date m_regdate;

	private String m_regtype;
	
	private boolean m_kakaolink;
	
	private boolean m_naverlink;

	private MultipartFile uploadFile;

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

	public String getM_pw() {
		return m_pw;
	}

	public void setM_pw(String m_pw) {
		this.m_pw = m_pw;
	}

	public String getM_gender() {
		return m_gender;
	}

	public void setM_gender(String m_gender) {
		this.m_gender = m_gender;
	}

	public String getM_addr() {
		return m_addr;
	}

	public void setM_addr(String m_addr) {
		this.m_addr = m_addr;
	}

	public String getM_tel() {
		return m_tel;
	}

	public void setM_tel(String m_tel) {
		this.m_tel = m_tel;
	}

	public String getM_email() {
		return m_email;
	}

	public void setM_email(String m_email) {
		this.m_email = m_email;
	}

	public int getM_point() {
		return m_point;
	}

	public void setM_point(int m_point) {
		this.m_point = m_point;
	}

	public String getM_img() {
		return m_img;
	}

	public void setM_img(String m_img) {
		this.m_img = m_img;
	}

	public Date getM_regdate() {
		return m_regdate;
	}

	public void setM_regdate(Date m_regdate) {
		this.m_regdate = m_regdate;
	}

	public MultipartFile getUploadFile() {
		return uploadFile;
	}

	public void setUploadFile(MultipartFile uploadFile) {
		this.uploadFile = uploadFile;
	}

	public String getM_regtype() {
		return m_regtype;
	}

	public void setM_regtype(String m_regtype) {
		this.m_regtype = m_regtype;
	}

	public boolean isM_kakaolink() {
		return m_kakaolink;
	}

	public void setM_kakaolink(boolean m_kakaolink) {
		this.m_kakaolink = m_kakaolink;
	}

	public boolean isM_naverlink() {
		return m_naverlink;
	}

	public void setM_naverlink(boolean m_naverlink) {
		this.m_naverlink = m_naverlink;
	}

	@Override
	public String toString() {
		return "UserVO [m_id=" + m_id + ", m_name=" + m_name + ", m_pw=" + m_pw + ", m_gender=" + m_gender + ", m_addr="
				+ m_addr + ", m_tel=" + m_tel + ", m_email=" + m_email + ", m_point=" + m_point + ", m_img=" + m_img
				+ ", m_regdate=" + m_regdate + ", m_regtype=" + m_regtype + ", m_kakaolink=" + m_kakaolink + ", m_naverlink="
				+ m_naverlink + ", uploadFile=" + uploadFile + "]";
	}

	

}