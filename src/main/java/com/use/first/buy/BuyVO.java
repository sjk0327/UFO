package com.use.first.buy;

import java.sql.Date;
import java.util.Arrays;
import java.util.List;

public class BuyVO {
	private int b_id;
	private int b_rid;
	private String b_mid;
	private String b_pid;
	private String b_mname;
	private String b_maddr;
	private String b_mtel;
	private Date b_buydate;
	private String b_amount;
	private String b_how;
	private String b_state;
	private String b_purchase;
	private String b_message;
	
	public int getB_id() {
		return b_id;
	}
	public void setB_id(int b_id) {
		this.b_id = b_id;
	}
	public int getB_rid() {
		return b_rid;
	}
	public void setB_rid(int b_rid) {
		this.b_rid = b_rid;
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
	public String getB_mname() {
		return b_mname;
	}
	public void setB_mname(String b_mname) {
		this.b_mname = b_mname;
	}
	public String getB_maddr() {
		return b_maddr;
	}
	public void setB_maddr(String b_maddr) {
		this.b_maddr = b_maddr;
	}
	public String getB_mtel() {
		return b_mtel;
	}
	public void setB_mtel(String b_mtel) {
		this.b_mtel = b_mtel;
	}
	public Date getB_buydate() {
		return b_buydate;
	}
	public void setB_buydate(Date b_buydate) {
		this.b_buydate = b_buydate;
	}
	public String getB_amount() {
		return b_amount;
	}
	public void setB_amount(String b_amount) {
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
	public String getB_purchase() {
		return b_purchase;
	}
	public void setB_purchase(String b_purchase) {
		this.b_purchase = b_purchase;
	}
	public String getB_message() {
		return b_message;
	}
	public void setB_message(String b_message) {
		this.b_message = b_message;
	}
	@Override
	public String toString() {
		return "BuyVO [b_id=" + b_id + ", b_rid=" + b_rid + ", b_mid=" + b_mid + ", b_pid=" + b_pid + ", b_mname="
				+ b_mname + ", b_maddr=" + b_maddr + ", b_mtel=" + b_mtel + ", b_buydate=" + b_buydate + ", b_amount="
				+ b_amount + ", b_how=" + b_how + ", b_state=" + b_state + ", b_purchase=" + b_purchase + ", b_message="
				+ b_message + "]";
	}

}
