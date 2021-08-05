package com.use.first.buy;

import java.sql.Date;

public class BuyVO {
	private int b_id;
	private String b_mid;
	private String b_pid;
	private Date b_buydate;
	private int b_amount;
	private String b_how;
	private String b_state;
	private int b_purchase;
	public int getB_id() {
		return b_id;
	}
	public void setB_id(int b_id) {
		this.b_id = b_id;
	}
	public String getB_mid() {
		return b_mid;
	}
	public void setB_mid(String b_mid) {
		this.b_mid = b_mid;
	}
	public String getB_pid() {
		return b_pid;
	}
	public void setB_pid(String b_pid) {
		this.b_pid = b_pid;
	}
	public Date getB_buydate() {
		return b_buydate;
	}
	public void setB_buydate(Date b_buydate) {
		this.b_buydate = b_buydate;
	}
	public int getB_amount() {
		return b_amount;
	}
	public void setB_amount(int b_amount) {
		this.b_amount = b_amount;
	}
	public String getB_how() {
		return b_how;
	}
	public void setB_how(String b_how) {
		this.b_how = b_how;
	}
	public String getB_state() {
		return b_state;
	}
	public void setB_state(String b_state) {
		this.b_state = b_state;
	}
	public int getB_purchase() {
		return b_purchase;
	}
	public void setB_purchase(int b_purchase) {
		this.b_purchase = b_purchase;
	}
	@Override
	public String toString() {
		return "BuyVO [b_id=" + b_id + ", b_mid=" + b_mid + ", b_pid=" + b_pid + ", b_buydate=" + b_buydate
				+ ", b_amount=" + b_amount + ", b_how=" + b_how + ", b_state=" + b_state + ", b_purchase=" + b_purchase
				+ "]";
	}
	
	
	
	
	
	
}
