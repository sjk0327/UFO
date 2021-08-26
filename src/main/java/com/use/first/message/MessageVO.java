package com.use.first.message;


import java.util.Date;

public class MessageVO {
	private int a_id;
	private int a_rid;
	private String a_mid;
	private String a_title;
	private String a_content;
	private Date a_date;
	public int getA_id() {
		return a_id;
	}
	public void setA_id(int a_id) {
		this.a_id = a_id;
	}

	public int getA_rid() {
		return a_rid;
	}
	public void setA_rid(int a_rid) {
		this.a_rid = a_rid;
	}
	public String getA_mid() {
		return a_mid;
	}
	public void setA_mid(String a_mid) {
		this.a_mid = a_mid;
	}
	public String getA_title() {
		return a_title;
	}
	public void setA_title(String a_title) {
		this.a_title = a_title;
	}
	public String getA_content() {
		return a_content;
	}
	public void setA_content(String a_content) {
		this.a_content = a_content;
	}
	public Date getA_date() {
		return a_date;
	}
	public void setA_date(Date a_date) {
		this.a_date = a_date;
	}
	@Override
	public String toString() {
		return "MessageVO [a_id=" + a_id + ", a_rid=" + a_rid + ", a_mid=" + a_mid + ", a_title=" + a_title
				+ ", a_content=" + a_content + ", a_date=" + a_date + "]";
	}
	
	
	
	
	
}





