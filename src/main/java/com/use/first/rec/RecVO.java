package com.use.first.rec;

import java.sql.Date;

public class RecVO {
	private int v_id;
	private String m_img;
	private String p_mainimg;
	private String v_mid;
	private String v_pid;
	private String p_name;
	private String v_content;
	private String v_like;	
	private Date v_date;
	public int getV_id() {
		return v_id;
	}
	public void setV_id(int v_id) {
		this.v_id = v_id;
	}
	public String getM_img() {
		return m_img;
	}
	public void setM_img(String m_img) {
		this.m_img = m_img;
	}
	public String getP_mainimg() {
		return p_mainimg;
	}
	public void setP_mainimg(String p_mainimg) {
		this.p_mainimg = p_mainimg;
	}
	public String getV_mid() {
		return v_mid;
	}
	public void setV_mid(String v_mid) {
		this.v_mid = v_mid;
	}
	public String getV_pid() {
		return v_pid;
	}
	public void setV_pid(String v_pid) {
		this.v_pid = v_pid;
	}
	public String getP_name() {
		return p_name;
	}
	public void setP_name(String p_name) {
		this.p_name = p_name;
	}
	public String getV_content() {
		return v_content;
	}
	public void setV_content(String v_content) {
		this.v_content = v_content;
	}
	public String getV_like() {
		return v_like;
	}
	public void setV_like(String v_like) {
		this.v_like = v_like;
	}
	public Date getV_date() {
		return v_date;
	}
	public void setV_date(Date v_date) {
		this.v_date = v_date;
	}
	@Override
	public String toString() {
		return "RecVO [v_id=" + v_id + ", m_img=" + m_img + ", p_mainimg=" + p_mainimg + ", v_mid=" + v_mid + ", v_pid="
				+ v_pid + ", p_name=" + p_name + ", v_content=" + v_content + ", v_like=" + v_like + ", v_date="
				+ v_date + "]";
	}
	
	
}	
	