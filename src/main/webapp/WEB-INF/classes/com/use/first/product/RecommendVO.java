package com.use.first.product;

import java.sql.Date;

public class RecommendVO {
	private int r_id;
	private String r_mid;
	private String r_pid;
	private Date r_date;
	
	public int getR_id() {
		return r_id;
	}
	public void setR_id(int r_id) {
		this.r_id = r_id;
	}
	public String getR_mid() {
		return r_mid;
	}
	public void setR_mid(String r_mid) {
		this.r_mid = r_mid;
	}
	public String getR_pid() {
		return r_pid;
	}
	public void setR_pid(String r_pid) {
		this.r_pid = r_pid;
	}
	public Date getR_date() {
		return r_date;
	}
	public void setR_date(Date r_date) {
		this.r_date = r_date;
	}
	@Override
	public String toString() {
		return "RecommendVO [r_id=" + r_id + ", r_mid=" + r_mid + ", r_pid=" + r_pid + ", r_date=" + r_date + "]";
	}
}
