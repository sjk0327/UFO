package com.use.first.qna;

import java.sql.Date;

public class QnaVO {
	private int q_id;
	private String q_mid;
	private String q_mname;
	private String q_type;
	private String q_title;
	private String q_content;
	private Date q_date;
	private int q_readCount;
	private int q_reference;
	private boolean q_answer;
	
	public int getQ_id() {
		return q_id;
	}
	public void setQ_id(int q_id) {
		this.q_id = q_id;
	}
	public String getQ_mid() {
		return q_mid;
	}
	public void setQ_mid(String q_mid) {
		this.q_mid = q_mid;
	}
	public String getQ_mname() {
		return q_mname;
	}
	public void setQ_mname(String q_mname) {
		this.q_mname = q_mname;
	}
	
	public String getQ_type() {
		return q_type;
	}
	public void setQ_type(String q_type) {
		this.q_type = q_type;
	}
	public String getQ_title() {
		return q_title;
	}
	public void setQ_title(String q_title) {
		this.q_title = q_title;
	}
	public String getQ_content() {
		return q_content;
	}
	public void setQ_content(String q_content) {
		this.q_content = q_content;
	}
	public Date getQ_date() {
		return q_date;
	}
	public void setQ_date(Date q_date) {
		this.q_date = q_date;
	}
	public int getQ_readCount() {
		return q_readCount;
	}
	public void setQ_readCount(int q_readCount) {
		this.q_readCount = q_readCount;
	}
	public int getQ_reference() {
		return q_reference;
	}
	public void setQ_reference(int q_reference) {
		this.q_reference = q_reference;
	}
	public boolean getQ_answer() {
		return q_answer;
	}
	public void setQ_answer(boolean q_answer) {
		this.q_answer = q_answer;
	}
	@Override
	public String toString() {
		return "QnaVO [q_id=" + q_id + ", q_mid=" + q_mid + ", q_mname=" + q_mname + ", q_type=" + q_type + ", q_title="
				+ q_title + ", q_content=" + q_content + ", q_date=" + q_date + ", q_readCount=" + q_readCount
				+ ", q_reference=" + q_reference + ", q_answer=" + q_answer + "]";
	}
	

	
	
}
