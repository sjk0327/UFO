package com.use.first.rent;

import java.sql.Date;

public class CartVO {
	private int c_id;
	private String c_mid;
	private String c_pid;
	private String c_amount;
	private Date c_date;
	private String p_name;
	private int p_price;
	private int p_canbuy;
	private int p_canrent;
	private String p_category;
	private String p_mainimg;
	private String p_subimg;
	
	
	public int getC_id() {
		return c_id;
	}
	public void setC_id(int c_id) {
		this.c_id = c_id;
	}
	public String getC_mid() {
		return c_mid;
	}
	public void setC_mid(String c_mid) {
		this.c_mid = c_mid;
	}
	public String getC_pid() {
		return c_pid;
	}
	public void setC_pid(String c_pid) {
		this.c_pid = c_pid;
	}
	public String getC_amount() {
		return c_amount;
	}
	public void setC_amount(String c_amount) {
		this.c_amount = c_amount;
	}
	public Date getC_date() {
		return c_date;
	}
	public void setC_date(Date c_date) {
		this.c_date = c_date;
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
		return "CartVO [c_id=" + c_id + ", c_mid=" + c_mid + ", c_pid=" + c_pid + ", c_amount=" + c_amount + ", c_date="
				+ c_date + ", p_name=" + p_name + ", p_price=" + p_price + ", p_canbuy=" + p_canbuy + ", p_canrent="
				+ p_canrent + ", p_category=" + p_category + ", p_mainimg=" + p_mainimg + ", p_subimg=" + p_subimg
				+ "]";
	}
	
	
	
	
	
}
