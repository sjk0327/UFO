package com.use.first.rent;

import java.sql.Date;

public class WishListVO {
	private int w_id;
	private String w_mid;
	private String w_pid;
	private Date w_date;
	private String p_name;
	private int p_price;
	private int p_canbuy;
	private int p_canrent;
	private String p_category;
	private String p_mainimg;
	private String p_subimg;
	
	
	public int getW_id() {
		return w_id;
	}
	public void setW_id(int w_id) {
		this.w_id = w_id;
	}
	public String getW_mid() {
		return w_mid;
	}
	public void setW_mid(String w_mid) {
		this.w_mid = w_mid;
	}
	public String getW_pid() {
		return w_pid;
	}
	public void setW_pid(String w_pid) {
		this.w_pid = w_pid;
	}
	public Date getW_date() {
		return w_date;
	}
	public void setW_date(Date w_date) {
		this.w_date = w_date;
	}
	public String getP_name() {
		return p_name;
	}
	public void setP_name(String p_name) {
		this.p_name = p_name;
	}
	public int getP_price() {
		return p_price;
	}
	public void setP_price(int p_price) {
		this.p_price = p_price;
	}
	public int getP_canbuy() {
		return p_canbuy;
	}
	public void setP_canbuy(int p_canbuy) {
		this.p_canbuy = p_canbuy;
	}
	public int getP_canrent() {
		return p_canrent;
	}
	public void setP_canrent(int p_canrent) {
		this.p_canrent = p_canrent;
	}
	public String getP_category() {
		return p_category;
	}
	public void setP_category(String p_category) {
		this.p_category = p_category;
	}
	public String getP_mainimg() {
		return p_mainimg;
	}
	public void setP_mainimg(String p_mainimg) {
		this.p_mainimg = p_mainimg;
	}
	public String getP_subimg() {
		return p_subimg;
	}
	public void setP_subimg(String p_subimg) {
		this.p_subimg = p_subimg;
	}
	@Override
	public String toString() {
		return "WishListVO [w_id=" + w_id + ", w_mid=" + w_mid + ", w_pid=" + w_pid + ", w_date=" + w_date + ", p_name="
				+ p_name + ", p_price=" + p_price + ", p_canbuy=" + p_canbuy + ", p_canrent=" + p_canrent
				+ ", p_category=" + p_category + ", p_mainimg=" + p_mainimg + ", p_subimg=" + p_subimg + "]";
	}
	
	

	}
	
	






