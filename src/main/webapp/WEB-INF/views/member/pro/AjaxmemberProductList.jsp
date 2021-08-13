 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <div class="row mb-5" >
	<c:forEach var="list" items="${productList}" begin="0" end="10" step="1" varStatus="status">
	
	<div class="col-sm-6 col-lg-4 mb-4" data-aos="fade-up"onclick="location.href='/member/pro/productDetail/${list.p_id}'">             
	  <div class="block-4 text-center border">
	    <figure class="block-4-image">
	      <a href="/member/pro/productDetail/${list.p_id}"><img src="/resources/img/iPad.jpg" alt="상품 사진" class="img-fluid"></a>
	    </figure>
	    <div class="block-4-text p-4">
	      <p> 상품코드  : <a href="/member/pro/productDetail/${list.p_id}">${list.p_id }</a></p>
	      <p class="mb-0">${list.p_name }</p>
	      <p class="text-primary font-weight-bold" >${list.p_category }</p>
	      <p class="text-primary font-weight-bold" >상품가격  : <fmt:formatNumber value="${list.p_price}" pattern="###,###,###" />원</p>
	    </div>
	  </div>
	</div>
	</c:forEach> 
	
	
	</div>