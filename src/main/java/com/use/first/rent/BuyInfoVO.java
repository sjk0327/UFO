package com.use.first.rent;


import java.sql.Date;
import java.util.ArrayList;


public class BuyInfoVO {

	private String productId;
	private String productName;
	private String buyType;
	private int proamount;
	private String rentdate;
	private int cartId;
	private int productPrice;
	private String productImg;
	private int rid;
	private ArrayList<BuyInfoVO> buyInfoList;
	public String getProductId() {
		return productId;
	}
	public void setProductId(String productId) {
		this.productId = productId;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public String getBuyType() {
		return buyType;
	}
	public void setBuyType(String buyType) {
		this.buyType = buyType;
	}
	public int getProamount() {
		return proamount;
	}
	public void setProamount(int proamount) {
		this.proamount = proamount;
	}
	public String getRentdate() {
		return rentdate;
	}
	public void setRentdate(String rentdate) {
		this.rentdate = rentdate;
	}
	public int getCartId() {
		return cartId;
	}
	public void setCartId(int cartId) {
		this.cartId = cartId;
	}
	public int getProductPrice() {
		return productPrice;
	}
	public void setProductPrice(int productPrice) {
		this.productPrice = productPrice;
	}
	public String getProductImg() {
		return productImg;
	}
	public void setProductImg(String productImg) {
		this.productImg = productImg;
	}
	public int getRid() {
		return rid;
	}
	public void setRid(int rid) {
		this.rid = rid;
	}
	public ArrayList<BuyInfoVO> getBuyInfoList() {
		return buyInfoList;
	}
	public void setBuyInfoList(ArrayList<BuyInfoVO> buyInfoList) {
		this.buyInfoList = buyInfoList;
	}
	@Override
	public String toString() {
		return "BuyInfoVO [productId=" + productId + ", productName=" + productName + ", buyType=" + buyType
				+ ", proamount=" + proamount + ", rentdate=" + rentdate + ", cartId=" + cartId + ", productPrice="
				+ productPrice + ", productImg=" + productImg + ", rid=" + rid + ", buyInfoList=" + buyInfoList + "]";
	}
	
	
	
	

}
