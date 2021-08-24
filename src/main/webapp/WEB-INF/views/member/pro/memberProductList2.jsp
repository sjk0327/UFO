 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <div class="row mb-5" >
	 <c:forEach var="list" items="${productList}" begin="0" end="10" step="1" varStatus="status">                      
             <div class="col-sm-6 col-lg-4 mb-4" id="listClick" onClick="productReadUpdate('${list.p_id}')" data-aos="fade-up" onclick="location.href='/member/pro/productDetail/${list.p_id}'">  
                     
                <div  class="block-4 text-center border">
                  <figure class="block-4-image">
                    <a href="/member/pro/productDetail/${list.p_id}"><img src="/resources/img/iPad.jpg" alt="상품 사진" class="img-fluid"></a>
                  </figure>
                  <div class="block-4-text p-4">                    
                    <p class="mb-0">상품명 : ${list.p_name }</p>
                    <p class="text-primary font-weight-bold" >카테고리 : ${list.p_category }</p>
                    <p class="text-primary font-weight-bold"id="textdeco" >상품 가격  : <fmt:formatNumber value="${list.p_price}" pattern="###,###,###" />원</p>
                    <p class="text-primary font-weight-bold" >대여 가격  : <fmt:formatNumber value="${list.p_price*0.05}" pattern="###,###,###" />원</p>
                    <p class="text-primary font-weight-bold" >즉시 구매 가격  : <fmt:formatNumber value="${list.p_price*0.95}" pattern="###,###,###" />원</p>
                  </div>
                </div>
              </div>
              
             </c:forEach> 
	</div>