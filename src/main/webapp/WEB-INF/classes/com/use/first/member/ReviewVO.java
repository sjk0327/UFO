package com.use.first.member;

import java.util.Date;

public class ReviewVO {
	private int v_id;
	private String v_mid;
	private String v_pid;
	private String v_content;
	private Date v_date;
	public int getV_id() {
		return v_id;
	}
	public void setV_id(int v_id) {
		this.v_id = v_id;
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
	public String getV_content() {
		return v_content;
	}
	public void setV_content(String v_content) {
		this.v_content = v_content;
	}
	public Date getV_date() {
		return v_date;
	}
	public void setV_date(Date v_date) {
		this.v_date = v_date;
	}
	@Override
	public String toString() {
		return "ReviewVO [v_id=" + v_id + ", v_mid=" + v_mid + ", v_pid=" + v_pid + ", v_content=" + v_content
				+ ", v_date=" + v_date + "]";
	} 
	
	

}
