package com.use.first.product;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

public class ProductVO {
	
	private String p_id;
	private String p_name;
	private int p_price;
	private int p_canBuy;
	private int p_canRent;
	private int p_soldCount;
	private String p_category;
	private String p_mainImg;
	private String p_subImg;
	private Date p_regdate;
	private int p_readCount;
	private String p_content;
	private MultipartFile mainFile;
	private MultipartFile subFile;
	private String searchCondition;
	private String searchKeyword;
	public String getP_id() {
		return p_id;
	}
	public void setP_id(String p_id) {
		this.p_id = p_id;
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
	public int getP_canBuy() {
		return p_canBuy;
	}
	public void setP_canBuy(int p_canBuy) {
		this.p_canBuy = p_canBuy;
	}
	public int getP_canRent() {
		return p_canRent;
	}
	public void setP_canRent(int p_canRent) {
		this.p_canRent = p_canRent;
	}
	public int getP_soldCount() {
		return p_soldCount;
	}
	public void setP_soldCount(int p_soldCount) {
		this.p_soldCount = p_soldCount;
	}
	public String getP_category() {
		return p_category;
	}
	public void setP_category(String p_category) {
		this.p_category = p_category;
	}
	public String getP_mainImg() {
		return p_mainImg;
	}
	public void setP_mainImg(String p_mainImg) {
		this.p_mainImg = p_mainImg;
	}
	public String getP_subImg() {
		return p_subImg;
	}
	public void setP_subImg(String p_subImg) {
		this.p_subImg = p_subImg;
	}
	public Date getP_regdate() {
		return p_regdate;
	}
	public void setP_regdate(Date p_regdate) {
		this.p_regdate = p_regdate;
	}
	public int getP_readCount() {
		return p_readCount;
	}
	public void setP_readCount(int p_readCount) {
		this.p_readCount = p_readCount;
	}
	public String getP_content() {
		return p_content;
	}
	public void setP_content(String p_content) {
		this.p_content = p_content;
	}
	public MultipartFile getMainFile() {
		return mainFile;
	}
	public void setMainFile(MultipartFile mainFile) {
		this.mainFile = mainFile;
	}
	public MultipartFile getSubFile() {
		return subFile;
	}
	public void setSubFile(MultipartFile subFile) {
		this.subFile = subFile;
	}
	public String getSearchCondition() {
		return searchCondition;
	}
	public void setSearchCondition(String searchCondition) {
		this.searchCondition = searchCondition;
	}
	public String getSearchKeyword() {
		return searchKeyword;
	}
	public void setSearchKeyword(String searchKeyword) {
		this.searchKeyword = searchKeyword;
	}
	@Override
	public String toString() {
		return "ProductVO [p_id=" + p_id + ", p_name=" + p_name + ", p_price=" + p_price + ", p_canBuy=" + p_canBuy
				+ ", p_canRent=" + p_canRent + ", p_soldCount=" + p_soldCount + ", p_category=" + p_category
				+ ", p_mainImg=" + p_mainImg + ", p_subImg=" + p_subImg + ", p_regdate=" + p_regdate + ", p_readCount="
				+ p_readCount + ", p_content=" + p_content + ", mainFile=" + mainFile + ", subFile=" + subFile
				+ ", searchCondition=" + searchCondition + ", searchKeyword=" + searchKeyword + "]";
	}
	
	
	
	
	
}