package com.use.first.rent;

import java.sql.Date;

public class BuyInfoVO {
   private String productId;
   private String productName;
   private String buyType;
   private int proamount;
   private Date rentdate;
   private int cartId;
   private int productPrice;
   private String productImg;
   
   
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
   public Date getRentdate() {
      return rentdate;
   }
   public void setRentdate(Date rentdate) {
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
   @Override
   public String toString() {
      return "BuyInfoVO [productId=" + productId + ", productName=" + productName + ", buyType=" + buyType
            + ", proamount=" + proamount + ", rentdate=" + rentdate + ", cartId=" + cartId + ", productPrice="
            + productPrice + ", productImg=" + productImg + "]";
   }
   
   
   
   
}