

<%@page import="java.util.Date"%>
<%@page import="org.aspectj.weaver.reflect.Java14GenericSignatureInformationProvider"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
       <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8"/>
<title>Insert title here</title>
<%@ include file="/WEB-INF/views/customerHeader.jsp" %>
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="/ind-script/optimizer.php?filename=tZVBUgQhDEX33W49R8pZeAb3ngDodJMSCEWCztxepnWhzsbqgSWp5IX6IR_wHBGeTgVy4a2YCAWFa3EITgTWwknBcYycHlrgEf6Tj24SDlWJ02T5fLCwqh5tGswFy7FSNTbgj1J0cxUsAhYTKUcjig1WbSA3e40BZMF5QaEtgbxROj3v5MhLDQjxIp4zfJD4QKIdwGu78Z2YJg9XBWuE3M68GXAX6legN7UNqx1wqjSKrMxBKY_CewzD2O2RL9UN0zybjZJRHKa8saPQN3bSl_7L5XprEoYJ3tLcKPZfE77TSb_7xNp28-qpr55yprR17-A4vTdI-wyy6w4XbesTeON17c9GU5x_QbMM0P16Z-XduD4B&type=css&k=89a12bf899430c5c696ea12eadc518ef948738e3&t=1627622406" />
<link rel="stylesheet" type="text/css" href="/ind-script/optimizer.php?filename=rczLDcMgEEXRAsjWdTwpizThKvi8GBRgImZQ5O5t1-Bsr3QPsjSC0U3lUAT2YtK8Gge-M9QSXbZWoYkuUcvWoZ_Sny9EVcTsh63cfzLS4wwLbnFbD39QmqRZiep3mYa3yLld7AE&type=css&k=04827dcf247ed9d72d23c4e72d4402951c293c7b&t=1627969594" />
<link rel="stylesheet" type="text/css" href="/resources/assets/css/admincommon.css">
<style type="text/css">
.hidden {
          display: none;
        }
@media only screen and (min-width: 768px){
.col-md-10 {
    flex: 0 0 78.33333%;
}
}
table {
    width: 100%;
    border: 0;
    border-spacing: 0;
    border-collapse: collapse;
    display: table;
    box-sizing: border-box;
    text-indent: initial;
}
.tablebody{
border-top: 1px solid;
border-top-color: black;
}

td, th{
border-left : none;
border-right : none;
padding : 10px;
}
td{
border-top:none;
border-bottom:none;
}
tr{
border-bottom:1px solid;
border-color: #d3d3d3;
}
.wrapper {
    width: 1280px;
}


#button2{
background-color: #7971ea;
color: white;
}

#deletecart{
background-color: #4e5a72;
color: white;
border-color: #4e5a72;
}

/* 이미지 캐러셀 크기 설정 */
.img-fluid{
	height: 180px;
	width: 300px;
}
/* 캐러셀 이미지 내부 캡션 영역 */
.innerCarouselCaption{
	float: left;
	background-color: rgba(0,0,0,0.8);
}
.item_section {
	float: left;
	position: relative;
	width: 100px;
	height: 310px;
	margin-left: 27px;
	background: #fff;
	-webkit-box-shadow: 3px 4px 5px 0 rgba(2, 2, 2, .2);
	box-shadow: 3px 4px 5px 0 rgba(2, 2, 2, .2);
	text-align: center;
}
#total{
height: 120px;
border-bottom:1px solid;
border-bottom-color: #dee2e6!important;
border-top:1px solid;
border-top-color: #dee2e6!important;

}

@media only screen and (max-width:600px) {

tr{
display : block;
border-bottom: solid;
float: right;
border-color: #d3d3d3;
border-collapse: collapse; 
}

.checkth, .prhth, .pohth, .imgboxth, .totalprth, .shipth, .shipprth, .selth {
display: none;
}


.check{
width:33px;
border-color: #d3d3d3;
border-collapse: collapse; 
}
.imgbox{
width:297px;
border-color: #d3d3d3;
border-collapse: collapse; 
}
.info{
width:330px;
display:block;
border: 0;
border-spacing: 0;
border-collapse: collapse; 
}

.totalpr{
float:left;

width:330px;
border-color: #d3d3d3;
border: 0;
border-spacing: 0;
}

.ship{
float:left;
width :165px;
border-top: 0;

}

.shippr{
float:left;
width :165px;
border-top: 0;

}

.prh{
width :165px;
border-collapse: collapse; 


}

.poh{
width :165px;
border-collapse: collapse; 

}

.sel{
width : 330px;
text-align: center;
padding-left: 20px;

}

.img-fluid{
	height: 229px;
	width: 290px;
}

.updatecart{
width:300px;
position: relative;
font-size: 15pt !important;
padding-right: 0px;

}

.carttobuy{
width:300px;
position: relative;
font-size: 15pt !important;
margin-right: 0px;
}

.deletecart{
width:300px;
position: relative;
font-size: 15pt !important;
margin-right: 0px;
}

.checkpro{
margin-left: 10px;
}

.allpro{
margin-top : 10px;
margin-right: 25px;
}
}


* {padding: 0;margin: 0;}
body, html {height: 100%;}
.modal .btn{cursor: pointer;border: 1px solid #999999;text-align: center;border-radius: 5px;outline: none;font-weight: 500;}
.dimLayer{display: block;width: 100%;background-color: rgba(0, 0, 0, 0.3);position: fixed;left: 0;top: 0px;margin: 0;padding: 0;z-index: 9998;}
.modal{width: 600px;height: 252px;border-radius: 10px;padding: 80px 24px;box-sizing: border-box;text-align: center;}
.modal-section{background: #ffffff;box-sizing: border-box;display: none;position: sticky; top: 50%;left: 50%;-webkit-transform: translate(-50%, -50%);-ms-transform: translate(-50%, -50%);-moz-transform: translate(-50%, -50%);-o-transform: translate(-50%, -50%);transform: translate(-50%, -50%);display: none;z-index: 9999;}
.menu_msg{font-size: 21px;font-weight: 500;}
.enroll_box p{padding-bottom: 56px;}
.gray_btn {width: 90px;background: #ffffff;color: #999999;height: 36px; transition: 0.5s;font-size: 17px;}
.pink_btn {width: 90px;background: #7971ea;color: #fff;height: 36px; transition: 0.5s;font-size: 17px;border: none;}
</style>

</head>
<body>
<!-- 남은 수량 계산위한 rentalList -->
	<c:forEach var="rentalList" items="${rentalListNow}">
	<input id="rentalIdNow" type="hidden" value="${rentalList.r_pid}">
	<input id="rentaldateNow" type="hidden" value="${rentalList.r_sdate}">
	<input id="rentalamountNow" type="hidden" value="${rentalList.r_rent}">
	</c:forEach>
	<!-- 남은 수량 계산위한 rentalList end script로! -->
	
    <div class="py-3" style="background-color: #f4f4f4;">
      <div class="container">
        <div class="row">
          <div class="col-md-12 mb-0"><span class="mx-2 mb-0"></span></div>
        </div>
      </div>
    </div>
    
<br>
    <div class="titleArea" style="text-align: center;">
        <h2>MY CART</h2>
    </div>

<div class="container col-md-9">

<div>
<br>
               
<table border="1" summary="" class="" >

<thead style="text-align: center;"><tr>
<th class="checkth"><input type="checkbox" id="allCheck" name="RowCheck" onclick="allChk(this);"/></th>
                    <th class="imgboxth col-md-2">이미지</th>
                    <th class="info col-md-4" style="font-size: 12pt;">상품정보</th>
                    <th  class="prhth col-md-2">판매가</th>
                    <th class="pohth col-md-1">포인트</th>
                    <th class="shipprth col-md-1">배송비</th>
                    <th class="totalprth col-md-2">합계</th>
                    <th class="selth col-md-1">선택</th>
                </tr></thead>
                
                <tbody class="tablebody" style="border-top: 0; border-bottom: 0">
                <c:if test="${!empty cartList}">
               <c:forEach var="cartInfo" items="${cartList}">
              
              	<form id="zerodelete">
                <input id="cartId" name="cartId" type="hidden" value="${cartInfo.c_id}"></form>
                <input id="originprice" type="hidden" value="${cartInfo.p_price}">
                
                <tr class="" style="text-align: center;">
                 <form:form id="proInfo">
                 
                <td class="check" onclick="event.cancelBubble=true">
                
                 <c:if test="${cartInfo.c_state eq '대여'}">
                        
						 <input id="checkBox" type="checkbox" name="RowCheck" value="${cartInfo.c_id }">
					
						</c:if>
                       
                       <c:if test="${cartInfo.c_state eq '구매'}">
						
						<c:choose>
						<c:when test="${cartInfo.p_canbuy eq 0}">
						  <input id="checkBox" type="checkbox" name="RowCheck" value="${cartInfo.c_id }" disabled="disabled">
						</c:when>
						<c:otherwise>
						 <input id="checkBox" type="checkbox" name="RowCheck" value="${cartInfo.c_id }">
						</c:otherwise>
						</c:choose>
						</c:if>
                
                    </td>
                    
                    <td class="imgbox thumb" style="padding : 0;"><a href="/member/pro/productDetail/${cartInfo.c_pid}">
                   
   
    <div id="recipeCarousel" class="carousel slide" data-ride="carousel">
        <div class="carousel-inner">
            
            <div class="carousel-item row no-gutters active">
                <div class="float-left">
               		<img class="img-fluid" src="/resources/Images/${cartInfo.p_mainimg}.jpg">
                </div>
              
            </div>
            
            <div class="carousel-item row no-gutters">
                <div class="float-left">
                	<img class="img-fluid" src="/resources/Images/${cartInfo.p_subimg}.jpg">
                </div>
                
               
            </div>
        
               
            </div>
       
        <a class="carousel-control-prev" href="#recipeCarousel" role="button" data-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="sr-only">Previous</span>
        </a>
        <a class="carousel-control-next" href="#recipeCarousel" role="button" data-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="sr-only">Next</span>
        </a>
    </div>

</a></td>
                       
                    <td class="info left" style="text-align: left;">
                        <div class="info name"><a href="/member/pro/productDetail/${cartInfo.c_pid}" class="product-name">
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color: #505050; font-weight: bold;">[${cartInfo.p_category}] ${cartInfo.p_name}</span>
                     
                        </a></div>
                        <input id="cartId" name="cartId" type="hidden" value="${cartInfo.c_id}">
                        <input id="productId" name="productId" type="hidden" value="${cartInfo.c_pid}">
                        <div>
                        <div style="margin-top: 3pt;">
                       &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;구매정보&nbsp;
                        <select id="buyType" name="buyType" style="margin-top: 8pt;">
                        
                        <c:if test="${cartInfo.c_state eq '대여'}">
                        
						<option value="대여" selected="selected">대여</option>
						
						
						<c:choose>
						<c:when test="${cartInfo.p_canbuy <=5 and cartInfo.p_canbuy ne 0}"> 
						<option value="구매">구매(남은 수량 : ${cartInfo.p_canbuy})</option>
						 </c:when>
						<c:when test="${cartInfo.p_canbuy eq 0}">
						<option value="구매" disabled="disabled">구매(구매 품절)</option>
						</c:when>
						<c:otherwise>
						<option value="구매">구매</option>
						</c:otherwise>
						</c:choose>
						</c:if>
						
						<c:if test="${cartInfo.c_state eq '구매'}">
                        
						<option value="대여">대여</option>
						
						
						<c:choose>
						<c:when test="${cartInfo.p_canbuy <=5 and cartInfo.p_canbuy ne 0}"> 
						<option value="구매" selected="selected">구매(남은 수량 : ${cartInfo.p_canbuy})</option>
						 </c:when>
						<c:when test="${cartInfo.p_canbuy eq 0}">
						<option value="구매" selected="selected" disabled="disabled">구매(구매 품절)</option>
						</c:when>
						<c:otherwise>
						<option value="구매" selected="selected">구매</option>
						</c:otherwise>
						</c:choose>
						</c:if>
	
                        </select>
                        </div>
                        <div style="margin-top: 3pt;">
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;수량&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        
                        <input type="hidden" id="canrent" value="${cartInfo.p_canrent}">
                        <input type="hidden" id="canbuy" value="${cartInfo.p_canbuy}">
                        <c:if test="${cartInfo.c_state eq '대여'}">
                        <c:if test="${cartInfo.p_canrent<cartInfo.c_amount}">
						<input id="proamount" name="proamount" type="number" style="width:56.67px; height: 30px" min="0" max="${cartInfo.p_canrent}" value="${cartInfo.p_canrent}">
						<div class="msg" id="msg" style="font-weight: bold; font-size: 6pt; color: red; text-align: center;">※ 지정 수량 ${cartInfo.c_amount}개보다 재고가 부족합니다!</div>
						</c:if>
						 <c:if test="${cartInfo.p_canrent>=cartInfo.c_amount}">
						<input id="proamount" name="proamount" type="number" style="width:56.67px; height: 30px" min="0" max="${cartInfo.p_canrent}" value="${cartInfo.c_amount}">
						<div class="msg" id="msg"></div>
						</c:if>
						</c:if>
						
						<c:if test="${cartInfo.c_state eq '구매'}">
						
						<c:choose>
						<c:when test="${cartInfo.p_canbuy eq 0}">
						<input id="proamount" name="proamount" type="number" style="width:56.67px; height: 30px" min="0" max="${cartInfo.p_canbuy}" value="${cartInfo.c_amount}" disabled="disabled">
						</c:when>
						<c:otherwise>
						 <c:if test="${cartInfo.p_canbuy<cartInfo.c_amount}">
						<input id="proamount" name="proamount" type="number" style="width:56.67px; height: 30px" min="0" max="${cartInfo.p_canbuy}" value="${cartInfo.p_canbuy}">
						<div class="msg" id="msg" style="font-weight: bold; font-size: 6pt; color: red; text-align: center;">※ 지정 수량 ${cartInfo.c_amount}개보다 재고가 부족합니다!</div>
						</c:if>
						 <c:if test="${cartInfo.p_canbuy>=cartInfo.c_amount}">
						<input id="proamount" name="proamount" type="number" style="width:56.67px; height: 30px" min="0" max="${cartInfo.p_canbuy}" value="${cartInfo.c_amount}">
						<div class="msg" id="msg"></div>
						</c:if>
						</c:otherwise>
						</c:choose>
						</c:if>
	
                        
                        </div>
                        
                        <fmt:parseDate var="tempToday" value="${cartInfo.c_date}" pattern="yyyy-MM-dd"/>
  						<fmt:parseNumber var="cdate" value="${tempToday.time / (1000*60*60*24)}" integerOnly="true"/>
   						<c:set var="now" value="<%=new java.util.Date()%>" />
   						<c:set var="todaydate"><fmt:formatDate value="${now}" pattern="yyyy-MM-dd" /></c:set>
    					<fmt:parseNumber var="today" value="${now.time / (1000*60*60*24)}" integerOnly="true"/>
    					
                        <c:choose>
						<c:when test="${cartInfo.c_state eq '대여'}">
						<div class="rdate" style="margin-top: 3pt;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;대여날짜
						<c:if test="${cdate >= today }">
						<input id="rentdate" name="rentdate" type="date" min="${todaydate }" value="${cartInfo.c_date}"></c:if>
						<c:if test="${cdate < today }">
						<input id="rentdate" name="rentdate" type="date" min="${todaydate }" value="${todaydate}"></c:if>
						
						</div>
						</c:when>
						<c:otherwise>
						<div class="rdate" style="margin-top: 3pt;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;대여날짜
						<input id="rentdate" name="rentdate" type="date" value="" disabled="disabled">
						<input id="rentdatehidden" name="rentdate" type="hidden" value="${todaydate }"></div>
						</c:otherwise>
						</c:choose>
                        
                        </div>
                        <br>
 
</td>
                    <td  class="price right prh">
                    <fmt:parseNumber var="rentprice" value="${cartInfo.p_price*0.05*cartInfo.c_amount}" />
					<fmt:parseNumber var="buyprice" value="${cartInfo.p_price*0.95*cartInfo.c_amount}" />
					<fmt:formatNumber var="rentp" value="${rentprice}" type="number"></fmt:formatNumber>
					<fmt:formatNumber var="buyp" value="${buyprice}" type="number"></fmt:formatNumber>
					
					
					
				
					<c:if test="${cartInfo.c_state eq '대여' }">
                    <input type=text id="price" value="${rentp}" style="width: 100px;" disabled="disabled">원					
					</c:if>
					<c:if test="${cartInfo.c_state eq '구매' }">
                    <input type=text id="price" value="${buyp}" style="width: 100px;" disabled="disabled">원					
					</c:if>

</td>
<fmt:parseNumber var="rentpoint" value="${rentprice*0.01}" integerOnly="true" />
<fmt:parseNumber var="buypoint" value="${buyprice*0.01}" integerOnly="true" />
<fmt:formatNumber var="rentpo" value="${rentpoint}" type="number"></fmt:formatNumber>
<fmt:formatNumber var="buypo" value="${buypoint}" type="number"></fmt:formatNumber>
                    <td class="poh">
                    
                    
                    <span class="txtInfo"><span id="span_mileage_text"><img src="/resources/Images/icon_cash.gif" alt="적립금" style="margin-bottom:2px;"/>포인트
                    <c:if test="${cartInfo.c_state eq '대여' }">
                     <span id="point">${rentpo }</span>					
					</c:if>
					<c:if test="${cartInfo.c_state eq '구매' }">
                    <span id="point">${buypo }</span>			
					</c:if>      
                    </span>(1%)</span><br/>
                  </td>
                
                    <td class="shippr">
<span class="">2,500원</span></td>
				<fmt:formatNumber var="totalrentp" value="${rentprice+2500}" type="number"></fmt:formatNumber>
				<fmt:formatNumber var="totalbuyp" value="${buyprice+2500}" type="number"></fmt:formatNumber>
                    <td class="totalpr price right" style="font-weight: bold;">
                    <c:if test="${cartInfo.c_state eq '대여' }">
                    <span id="totalprice">${totalrentp }</span>원					
					</c:if>
					<c:if test="${cartInfo.c_state eq '구매' }">
                   <span id="totalprice">${totalbuyp }</span>원		
					</c:if>
                    
                    
                    </td>
                    <td class="button sel">
                   <c:if test="${cartInfo.c_state eq '대여'}">
                        
						 <input type="button" id="button2" class="btn btn-outline-primary btn-sm btn-block carttobuy" value="결제"></input>
						
						</c:if>
                       
                       <c:if test="${cartInfo.c_state eq '구매'}">
						
						<c:choose>
						<c:when test="${cartInfo.p_canbuy eq 0}">
						 <input type="button" id="button2" class="btn btn-outline-primary btn-sm btn-block carttobuy" disabled="disabled" value="결제"></input>
						</c:when>
						<c:otherwise>
						 <input type="button" id="button2" class="btn btn-outline-primary btn-sm btn-block carttobuy" value="결제"></input>
						</c:otherwise>
						</c:choose>
						</c:if>
                       
                       
                         <c:if test="${cartInfo.c_state eq '대여'}">
                        
						<input type="button" id="button" class="btn btn-outline-primary btn-sm btn-block updatecart" style="margin-top: 8pt;" value="옵션 수정"></input>
						
						</c:if>
						
						<c:if test="${cartInfo.c_state eq '구매'}">
						
						<c:choose>
						<c:when test="${cartInfo.p_canbuy eq 0}">
						<input type="button" id="button" class="btn btn-outline-primary btn-sm btn-block updatecart" disabled="disabled" style="margin-top: 8pt;" value="옵션 수정"></input>
						</c:when>
						<c:otherwise>
						<input type="button" id="button" class="btn btn-outline-primary btn-sm btn-block updatecart" style="margin-top: 8pt;" value="옵션 수정"></input>
						</c:otherwise>
						</c:choose>
						</c:if>
                     </form:form>
                        <form id="deleteSepForm" method="post">
                        <input type="hidden" Id="cartId" name="cartId" value="${cartInfo.c_id}">
                        <input type="button" id="button" class="btn btn-outline-primary btn-sm btn-block deletecart" style="margin-top: 8pt;" value="삭제"></input></form>
                    </td>
                </tr>
                </c:forEach>
                </c:if>
              
</tbody>

</table>
<c:if test="${empty cartList }">
<p style="text-align: center; font-weight: bold;">
<br>
등록된 위시리스트 상품이 없습니다!
</p>

</c:if>

<c:if test="${!empty cartList }">
<br>
<div id="total" class="row" style="padding-top: 25px;">
<div class="col-md-6" style="text-align: center;">
<div class="row" style="top:10px;">
<div class="col-md-3"></div>
<input type="hidden" id="cartselectTotal" value="0">
<div class="col-md-4" style="font-weight: bold; font-size: 15pt;"><div>총 상품 금액</div><div><span id="cartselecttotal">0</span><span>원</span></div></div>
<div class="col-md-1" style="padding-top: 20px;"><i class="fas fa-plus"></i></div>
<div class="col-md-3" style="font-weight: bold; font-size: 15pt;">배송비<br>2,500원</div>
</div>

</div>
<div class="col-md-1" style="text-align: center; padding-top: 20px;"><i class="fas fa-equals"></i></div>
<div class="col-md-5" style="text-align: center;">
<div style="font-weight: bold; font-size: 15pt;">총 주문 금액</div>
<input type="hidden" id="cartselectPlus" value="0">
<div style="font-weight: bold; font-size: 15pt; color: #7971ea;"><span id="cartselectplus">0</span><span>원</span></div>

</div>
</div><br>



 <span style="float: left;">
 <div class="row checkpro">
    		<span style="font-weight: bold;">선택상품을</span>
    		<form id="form">
           	<span style="margin-left: 3pt;"><input type="button" id="deletecart" class="btn btn-outline-primary" onclick="cartcheckboxArr();" value="삭제하기"></input></span>
           	<input type="hidden" id="arrayParam" name="arrayParam">
           	</form>
           	
           	<form id="selectBuy" method="post">
            <span style="margin-left: 3pt;"><input type="button" id="button" class="btn btn-outline-primary" onclick="selectBuy();" value="주문하기"></input></span>
       		
   
       		<input type="hidden" id="productIdArray" name="productIdArray">
       		<input type="hidden" id="buyTypeArray" name="buyTypeArray">
       		<input type="hidden" id="proamountArray" name="proamountArray">
       		<input type="hidden" id="rentdateArray" name="rentdateArray">
           	</form>
        </div>
        </span>
      
 
<span style="float: right;">
 <div class="row allpro"><form id="allBuy" method="post">
            <span><input type="button" id="button2" class="btn btn-outline-primary" onclick="allBuy();" value="전체 상품 주문"></input></span>   
        
       		<input type="hidden" id="productIdArrayAll" name="productIdArray">
       		<input type="hidden" id="buyTypeArrayAll" name="buyTypeArray">
       		<input type="hidden" id="proamountArrayAll" name="proamountArray">
       		<input type="hidden" id="rentdateArrayAll" name="rentdateArray">
       		
            </form>
            <span>
            <form id="deleteAllform" action="/member/rent/deleteCartAll" method="post">
            <input type="hidden" id="userID" name="userID" value="${userInfo.m_id }"/>
            <span style="margin-left: 3pt;"><input type="button" id="deletecart" class="btn btn-outline-primary deletecartAll" value="장바구니 비우기"></input></span>
            </form></span>
            </div>
     </span>  
                                
       
                 
                 
      </c:if>                         
        </div>
       
        <!-- confirm 모달을 쓸 페이지에 추가 start-->
        <section class="modal modal-section type-confirm">
            <div class="enroll_box">
                <p class="menu_msg"></p>
            </div>
            <div class="enroll_btn">
                <button class="btn pink_btn btn_ok">확인</button>
                <button id="cancel" class="btn gray_btn modal_close">취소</button>
            </div>
        </section>
        <!-- confirm 모달을 쓸 페이지에 추가 end-->
        
        

        <!-- alert 모달을 쓸 페이지에 추가 start-->
        <section class="modal modal-section type-alert">
            <div class="enroll_box">
                <p class="menu_msg"></p>
            </div>
            <div class="enroll_btn">
                <button class="btn pink_btn modal_close">확인</button>
            </div>
        </section>
        <!-- alert 모달을 쓸 페이지에 추가 end-->                 
</div> 



<%@ include file="/WEB-INF/views/customerFooter.jsp" %>
<script type="text/javascript">



$(document).ready(function() {
	$('#myCarousel').carousel('cycle');
	$('#myCarousel2').carousel('cycle');
});



$('.deletecartAll').click(function() {
	action_popup.confirm("장바구니를 모두 비우시겠습니까?",function(res){
		if(res){
			action_popup.alert("장바구니를 모두 비웠습니다!");
			 $(".modal_close").on("click", function () {
				 $("#deleteAllform").submit();
			    });

	  }else{   
		 event.preventDefault();
       event.stopPropagation();

	  };	
})
});


function cartcheckboxArr() { 
	var array = new Array(); // 배열 선언
	$('input:checkbox[name=RowCheck]:checked').each(function() { // 체크된 체크박스의 value 값을 가지고 온다.	    
		
		array.push(this.value);
	});
				
	$("#arrayParam").val(array);
	action_popup.confirm("선택한 상품들을 장바구니에서 삭제하시겠습니까?",function(res){
		if(res){
			action_popup.alert("선택한 상품들이 장바구니에서 삭제되었습니다!");
			 $(".modal_close").on("click", function () {
		$("#form").attr("action", "/member/rent/deleteCartList2");  
		$("#form").submit();
			 });
	  }else{   
		 event.preventDefault();
     event.stopPropagation();
	  };	
});
}

function allChk(obj){
    var chkObj = document.getElementsByName("RowCheck");
    var rowCnt = chkObj.length - 1;
    var check = obj.checked;
    if (check) {﻿
        for (var i=0; i<=rowCnt; i++){
         if(chkObj[i].type == "checkbox")
             chkObj[i].checked = true;
        }
    	} else {
        	for (var i=0; i<=rowCnt; i++) {
        	 if(chkObj[i].type == "checkbox"){
             chkObj[i].checked = false;
         }
        }
    }
} 

		var amountList=document.querySelectorAll("#proamount");
		var amountLength = amountList.length;
		var stateList=document.querySelectorAll("#buyType");
		var originpriceList=document.querySelectorAll("#originprice");
		var priceList=document.querySelectorAll("#price");
		var pointList=document.querySelectorAll("#point");
		var totalpriceList=document.querySelectorAll("#totalprice");
		var productIdList=document.querySelectorAll("#productId");
		var rentamountList=document.querySelectorAll("#canrent");
		var buyamountList=document.querySelectorAll("#canbuy");
		var rentdateList=document.querySelectorAll("#rentdate");
		var rdateList=document.querySelectorAll(".rdate");
		var updatecartList=document.querySelectorAll(".updatecart");
		var carttobuyList=document.querySelectorAll(".carttobuy");
		var proInfoList=document.querySelectorAll("#proInfo");
		var checkBoxList=document.querySelectorAll("#checkBox");
		var deletecartList=document.querySelectorAll(".deletecart");
		var deleteSepFormList=document.querySelectorAll("#deleteSepForm");
		var zerodeleteFormList=document.querySelectorAll("#zerodelete");
		var msgList=document.querySelectorAll("#msg");
		//rental table
		var rentalIdNowList=document.querySelectorAll("#rentalIdNow");
		var rentalIdNowListLength = rentalIdNowList.length;
		var rentaldateNowList=document.querySelectorAll("#rentaldateNow");
		var rentalamountNowList=document.querySelectorAll("#rentalamountNow");
		
		
		
		
		
		
		function AddComma(num)
		{
		var regexp = /\B(?=(\d{3})+(?!\d))/g;
		return num.toString().replace(regexp, ',');
		}

		for(var i=0; i < amountLength; i++){
			amountList[i].addEventListener('input',onIncreaseCountHandler)};
			
			for(var i=0; i < amountLength; i++){
				stateList[i].addEventListener('input',onStateCountHandler)};
	for(var i=0; i < amountLength; i++){
		updatecartList[i].addEventListener('click',updateInfo)};
		for(var i=0; i < amountLength; i++){
			carttobuyList[i].addEventListener('click',cartToBuyForm)};
			for(var i=0; i < amountLength; i++){
				deletecartList[i].addEventListener('click',deleteCartList)};
			
						
		function onIncreaseCountHandler(event) {
			var count=-1;
			for(var i=0; i< amountLength;i++){
				if(event.target==amountList[i]){
					if(amountList[i].value==0){
						count=i;
							
						
				}
					else{
						if(stateList[i].value=="대여"){
					priceList[i].value=originprice[i].value*amountList[i].value*0.05;
					pointList[i].innerText=AddComma(priceList[i].value*0.01);
					totalpriceList[i].innerText=AddComma(priceList[i].value*1+2500);
					priceList[i].value=AddComma(priceList[i].value);
						}
						if(stateList[i].value=="구매"){
							priceList[i].value=originprice[i].value*amountList[i].value*0.95;
							pointList[i].innerText=AddComma(priceList[i].value*0.01);
							totalpriceList[i].innerText=AddComma(priceList[i].value*1+2500);
							priceList[i].value=AddComma(priceList[i].value);
						}
					
					}
				}
			}
		if(count!=-1){
			action_popup.confirm("해당 상품을 장바구니에서 삭제하시겠습니까?",function(res){
				if(res){
					action_popup.alert("상품이 장바구니에서 삭제되었습니다!");
					 $(".modal_close").on("click", function () {
						 zerodeleteFormList[count].setAttribute("action", "/member/rent/deleteCartList");
						 zerodeleteFormList[count].setAttribute("method", "POST");
						 zerodeleteFormList[count].submit();
							
					 });
			  }

				
		});
			
			amountList[count].value=1;	
		}
			
		}
		
function onStateCountHandler(ev) {
			
			for(var i=0; i< amountLength;i++){
				if(ev.target==stateList[i]){
					
						if(stateList[i].value=="대여"){
							for(var k=0; k< i;k++){
								if(productIdList[i].value==productIdList[k].value&&stateList[k].value=="대여"){
									action_popup.alert('해당 상품의 해당 옵션이 이미 존재합니다!');
									stateList[i].value="구매"
									return;
									ev.preventDefault();
								     ev.stopPropagation();
								}
							}
							for(var k=i+1;k<amountLength;k++){
								if(productIdList[i].value==productIdList[k].value&&stateList[k].value=="대여"){
									action_popup.alert('해당 상품의 해당 옵션이 이미 존재합니다!');
									stateList[i].value="구매"
										return;
									ev.preventDefault();
								     ev.stopPropagation();
								}
							}
							
					rentdateList[i].removeAttribute('disabled');
					rentdateList[i].value=new Date().toISOString().substring(0, 10);
					rentdateList[i].setAttribute('min',new Date().toISOString().substring(0, 10));
					msgList[i].classList.add('hidden');
					
							var canRental=0;
							var count=0;
							for(var k=0;k<rentalIdNowListLength;k++){
								var rentdate=new Date(rentdateList[i].value);
								rentdate.setDate(rentdate.getDate() + 2);
								var rentdatenow=new Date(rentaldateNowList[k].value);
							if(productIdList[i].value==rentalIdNowList[k].value && rentdate<rentdatenow){
								count+=rentalamountNowList[k].value*1
							}}
							canRental=rentamountList[i].value*1+count;
							
							amountList[i].setAttribute('max',canRental);
							amountList[i].value=1;
					

					priceList[i].value=originprice[i].value*amountList[i].value*0.05;
					pointList[i].innerText=AddComma(priceList[i].value*0.01);
					totalpriceList[i].innerText=AddComma(priceList[i].value*1+2500);
					priceList[i].value=AddComma(priceList[i].value);
					
						if(rentamountList[i].value==0){
							amountList[i].disabled=true;
						}
						else{
							amountList[i].disabled=false;
							updatecartList[i].disabled=false;
							carttobuyList[i].disabled=false;
							checkBoxList[i].disabled=false;
							if(amountList[i].value>rentamountList[i].value){
								amountList[i].value=rentamountList[i].value
							}
							
						}
						
						
						
				}
					
						if(stateList[i].value=="구매"){
							
							for(var k=0; k< i;k++){
								if(productIdList[i].value==productIdList[k].value&&stateList[k].value=="구매"){
									action_popup.alert('해당 상품의 해당 옵션이 이미 존재합니다!');
									stateList[i].value="대여"
									return;
									ev.preventDefault();
								     ev.stopPropagation();
								}
							}
							for(var k=i+1;k<amountLength;k++){
								if(productIdList[i].value==productIdList[k].value&&stateList[k].value=="구매"){
									action_popup.alert('해당 상품의 해당 옵션이 이미 존재합니다!');
									stateList[i].value="대여"
										return;
									ev.preventDefault();
								     ev.stopPropagation();
								}
							}
							
							msgList[i].classList.add('hidden');
							amountList[i].setAttribute('max',buyamountList[i].value);
							amountList[i].value=1;
							priceList[i].value=originprice[i].value*amountList[i].value*0.95;
							rentdateList[i].value="";
							rentdateList[i].setAttribute('disabled','disabled');
							pointList[i].innerText=AddComma(priceList[i].value*0.01);
							totalpriceList[i].innerText=AddComma(priceList[i].value*1+2500);
							priceList[i].value=AddComma(priceList[i].value);
							
							
							if(buyamountList[i].value==0){
								amountList[i].disabled=true;
							}
							else{
								amountList[i].disabled=false;
								updatecartList[i].disabled=false;
								carttobuyList[i].disabled=false;
								checkBoxList[i].disabled=false;
								if(amountList[i].value>buyamountList[i].value){
									amountList[i].value=buyamountList[i].value
								}
								
								
							}
						}
						
					}
				}
			}
			

function selectBuy() { 
	var array = new Array();
	var array1 = new Array();
	var array2 = new Array();
	var array3 = new Array();
	var array4 = new Array();
	for(var i=0; i< amountLength;i++){
		if(checkBoxList[i].checked==true){
		
			
			array1.push(productIdList[i].value);
			array2.push(stateList[i].value);
			array3.push(amountList[i].value);
			array4.push(rentdateList[i].value);
	
			
		}
	}
	$("#productIdArray").val(array1);
	$("#buyTypeArray").val(array2);
	$("#proamountArray").val(array3);
	$("#rentdateArray").val(array4);
	
	
	action_popup.confirm("선택한 상품들의 결제를 진행하시겠습니까?",function(res){
		if(res){
			$("#selectBuy").attr("action", "/member/rent/buySelect");  
			$("#selectBuy").submit();
			 
	  }	
});
	
	
	};
	
	
	function allBuy() { 
		
		var array1 = new Array();
		var array2 = new Array();
		var array3 = new Array();
		var array4 = new Array();

		
		
		for(var i=0; i< amountLength;i++){
			if(carttobuyList[i].disabled==false){
				array1.push(productIdList[i].value);
				array2.push(stateList[i].value);
				array3.push(amountList[i].value);
				array4.push(rentdateList[i].value);
			}
		}
		
		$("#productIdArrayAll").val(array1);
		$("#buyTypeArrayAll").val(array2);
		$("#proamountArrayAll").val(array3);
		$("#rentdateArrayAll").val(array4);
		
		
		action_popup.confirm("모든 상품들의 결제를 진행하시겠습니까?",function(res){
			if(res){
				$("#allBuy").attr("action", "/member/rent/buySelect");  
				$("#allBuy").submit();
				 
		  }	
	});
		
	
		};
		
function updateInfo(e) { 
	var count=0;
	for(var i=0; i< amountLength;i++){
		if(e.target==updatecartList[i]){
			count=i;
			}	
	
		}
			action_popup.confirm("옵션을 수정하시겠습니까?",function(res){
				if(res){
				proInfoList[count].setAttribute("action", "/member/rent/cartUpdate");  
				proInfoList[count].submit();
				}
		});
};   

function cartToBuyForm(e) { 
	var count=0;
	for(var i=0; i< amountLength;i++){
		if(e.target==carttobuyList[i]){
			count=i;
		}
	}
	

	action_popup.confirm("해당 상품의 결제를 진행하시겠습니까?",function(res){
		if(res){
		proInfoList[count].setAttribute("action", "/member/rent/buy");  
		proInfoList[count].submit();
		}
});
	
} ;  



function deleteCartList(e) { 
	var count=0;
	for(var i=0; i< amountLength;i++){
		if(e.target==deletecartList[i]){
			count=i;
		}
	}
		
	action_popup.confirm("해당 상품을 장바구니에서 삭제하시겠습니까?",function(res){
		if(res){
		action_popup.alert("상품이 장바구니에서 삭제되었습니다!");
		 $(".modal_close").on("click", function () {
		deleteSepFormList[count].setAttribute("action", "/member/rent/deleteCartList");  
		deleteSepFormList[count].submit();
		 })
		}
		});
	
	
}; 


//선택된 상품들 총 가격 구하는 메소드
for(var i=0; i < amountLength; i++){
	checkBoxList[i].addEventListener('change',selectcart)};
for(var i=0; i < amountLength; i++){
	stateList[i].addEventListener('input',selectcart)};
for(var i=0; i < amountLength; i++){
	amountList[i].addEventListener('input',selectcart)};
document.getElementById('allCheck').addEventListener('change',selectcart);	
	
	function selectcart(e) { 
		var total=0;
		var arraycheck=new Array();
		for(var i=0; i < amountLength; i++){
		if(checkBoxList[i].checked==true){
			arraycheck.push(arraycheck.value);
		}
		}
		
		
		if(arraycheck.length!=0){
		for(var i=0; i < amountLength; i++){
		if(checkBoxList[i].checked==true || (e.target==stateList[i]||e.target==amountList[i])){
			
			if(stateList[i].value=="대여"){
				total+=(originprice[i].value*amountList[i].value*0.05);
				document.getElementById('cartselectTotal').value=total;
				document.getElementById('cartselecttotal').innerText=AddComma(document.getElementById('cartselectTotal').value);
				document.getElementById('cartselectPlus').value=total+2500;
				document.getElementById('cartselectplus').innerText=AddComma(document.getElementById('cartselectPlus').value);
			}
			else if(stateList[i].value=="구매"){
				total+=(originprice[i].value*amountList[i].value*0.95);

				document.getElementById('cartselectTotal').value=total;
				document.getElementById('cartselecttotal').innerText=AddComma(document.getElementById('cartselectTotal').value);
				document.getElementById('cartselectPlus').value=total+2500;
				document.getElementById('cartselectplus').innerText=AddComma(document.getElementById('cartselectPlus').value);
			}
					}
			
		}}
		else{
			document.getElementById('cartselectTotal').value=0;
			document.getElementById('cartselecttotal').innerText=AddComma(document.getElementById('cartselectTotal').value);
			document.getElementById('cartselectPlus').value=0;
			document.getElementById('cartselectplus').innerText=AddComma(document.getElementById('cartselectPlus').value);
		}
		};

		
		
//남은 수량 계산


	for(var i=0; i < amountLength; i++){
		rentdateList[i].addEventListener('input',calCanRent)};
		
		
	function calCanRent(e){
		for(var i=0; i < amountLength; i++){
			var canRental=0;
		if(stateList[i].value=="대여"){		
			if(e.target==rentdateList[i]){
				var count=0;
				for(var k=0;k<rentalIdNowListLength;k++){
					var rentdate=new Date(rentdateList[i].value);
					rentdate.setDate(rentdate.getDate() + 2);
					var rentdatenow=new Date(rentaldateNowList[k].value);
				if(productIdList[i].value==rentalIdNowList[k].value && rentdate<rentdatenow){
					count+=rentalamountNowList[k].value*1
				}}
				canRental=rentamountList[i].value*1+count;
				
				amountList[i].setAttribute('max',canRental);
				amountList[i].value=1;
		}
	}	
}
};
	
	
	$(document).ready(function() {
		for(var i=0; i < amountLength; i++){
			var canRental=0;
		if(stateList[i].value=="대여"){		
				var count=0;
				for(var k=0;k<rentalIdNowListLength;k++){
					var rentdate=new Date(rentdateList[i].value);
					rentdate.setDate(rentdate.getDate() + 2);
					var rentdatenow=new Date(rentaldateNowList[k].value);
				if(productIdList[i].value==rentalIdNowList[k].value && rentdate<rentdatenow){
					count+=rentalamountNowList[k].value*1
					
				
				}}
				canRental=rentamountList[i].value*1+count;

				if(canRental<=0){
					amountList[i].disabled=true;
					updatecartList[i].disabled=true;
					carttobuyList[i].disabled=true;
					checkBoxList[i].disabled=true;
					
				}else{
					
					amountList[i].disabled=false;
					updatecartList[i].disabled=false;
					carttobuyList[i].disabled=false;
					amountList[i].setAttribute('max',canRental);
					
				}
		}
	}		
});	
	
	//수량 구하기 끝
	

/**
 *  alert, confirm 대용 팝업 메소드 정의 <br/>
 *  timer : 애니메이션 동작 속도 <br/>
 *  alert : 경고창 <br/>
 *  confirm : 확인창 <br/>
 *  open : 팝업 열기 <br/>
 *  close : 팝업 닫기 <br/>
 */ 
var action_popup = {
    timer: 500,
    confirm: function (txt, callback) {
        if (txt == null || txt.trim() == "") {
            console.warn("confirm message is empty.");
            return;
        } else if (callback == null || typeof callback != 'function') {
            console.warn("callback is null or not function.");
            return;
        } else {
            $(".type-confirm .btn_ok").on("click", function () {
                $(this).unbind("click");
                callback(true);
                action_popup.close(this);
            });
            this.open("type-confirm", txt);
        }
    },

    alert: function (txt) {
        if (txt == null || txt.trim() == "") {
            console.warn("confirm message is empty.");
            return;
        } else {
            this.open("type-alert", txt);
        }
    },

    open: function (type, txt) {
        var popup = $("." + type);
        popup.find(".menu_msg").text(txt);
        $("body").append("<div class='dimLayer'></div>");
        $(".dimLayer").css('height', $(document).height()).attr("target", type);
        popup.fadeIn(this.timer);
    },

    close: function (target) {
        var modal = $(target).closest(".modal-section");
        var dimLayer;
        if (modal.hasClass("type-confirm")) {
            dimLayer = $(".dimLayer[target=type-confirm]");
        } else if (modal.hasClass("type-alert")) {
            dimLayer = $(".dimLayer[target=type-alert]")
        } else {
            console.warn("close unknown target.")
            return;
        }
        modal.fadeOut(this.timer);
        setTimeout(function () {
            dimLayer != null ? dimLayer.remove() : "";
        }, this.timer);
    }
}
			



	    $(".modal_close").on("click", function () {
	        action_popup.close(this);
	    });

 
 
 
</script>
</body>
</html>