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
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="/ind-script/optimizer.php?filename=tZVBUgQhDEX33W49R8pZeAb3ngDodJMSCEWCztxepnWhzsbqgSWp5IX6IR_wHBGeTgVy4a2YCAWFa3EITgTWwknBcYycHlrgEf6Tj24SDlWJ02T5fLCwqh5tGswFy7FSNTbgj1J0cxUsAhYTKUcjig1WbSA3e40BZMF5QaEtgbxROj3v5MhLDQjxIp4zfJD4QKIdwGu78Z2YJg9XBWuE3M68GXAX6legN7UNqx1wqjSKrMxBKY_CewzD2O2RL9UN0zybjZJRHKa8saPQN3bSl_7L5XprEoYJ3tLcKPZfE77TSb_7xNp28-qpr55yprR17-A4vTdI-wyy6w4XbesTeON17c9GU5x_QbMM0P16Z-XduD4B&type=css&k=89a12bf899430c5c696ea12eadc518ef948738e3&t=1627622406" />
<link rel="stylesheet" type="text/css" href="/ind-script/optimizer.php?filename=rczLDcMgEEXRAsjWdTwpizThKvi8GBRgImZQ5O5t1-Bsr3QPsjSC0U3lUAT2YtK8Gge-M9QSXbZWoYkuUcvWoZ_Sny9EVcTsh63cfzLS4wwLbnFbD39QmqRZiep3mYa3yLld7AE&type=css&k=04827dcf247ed9d72d23c4e72d4402951c293c7b&t=1627969594" />
<link rel="stylesheet" type="text/css" href="/resources/assets/css/admincommon.css">
<style type="text/css">
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

.wrapper {
    width: 1280px;
    margin-left: 70px;
    margin-right:0;
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
	width: 150px;
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
</style>

</head>
<body>

    <div class="bg-light py-3">
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
    <div class="row">
<div class="wrapper col-md-10">

<div>
<br>
               
<table border="1" summary="" class="" >
            <colgroup>
<col style="width:50px;"/>
<col style="width:150px"/>
<col style="width:270px"/>
<col style="width:120px"/>
<col style="width:120px"/>
<col style="width:100px"/>
<col style="width:85px"/>
<col style="width:105px"/>
<col style="width:150px"/>
</colgroup>
<thead style="text-align: center;"><tr>
<th scope="col"><input type="checkbox" name="RowCheck" onclick="allChk(this);"/></th>
                    <th scope="col">이미지</th>
                    <th scope="col">상품정보</th>
                    <th scope="col">판매가</th>
                    <th scope="col">포인트</th>
                    <th scope="col">배송구분</th>
                    <th scope="col">배송비</th>
                    <th scope="col">합계</th>
                    <th scope="col">선택</th>
                </tr></thead>
                
                <tbody class="tablebody" >
                <c:if test="${!empty cartList}">
               <c:forEach var="cartInfo" items="${cartList}">
              
              	<form id="zerodelete">
                <input id="cartId" name="cartId" type="hidden" value="${cartInfo.c_id}"></form>
                <input id="originprice" type="hidden" value="${cartInfo.p_price}">
                
                <tr class="" style="text-align: center;">
                <td onclick="event.cancelBubble=true">
                     <input type="checkbox" name="RowCheck" value="${cartInfo.c_id }"></td>
                    <td class="thumb" style="padding : 0;"><a href="">
                   
   
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
                    <td class="left" style="text-align: left;">
                        <div class="name"><a href="" class="product-name">
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color: #505050; font-weight: bold;">[${cartInfo.p_category}] ${cartInfo.p_name}</span>
                     
                        </a></div>
                        <div>
                        <div style="margin-top: 3pt;">
                       &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;구매정보&nbsp;
                        <select id="buyType" name="buyType">
                        
                        <c:if test="${cartInfo.c_state eq '대여'}">
                        <c:choose>
						<c:when test="${cartInfo.p_canrent <=5 and cartInfo.p_canrent ne 0}"> 
						<option value="대여" selected="selected">대여(남은 수량 : ${cartInfo.p_canrent})</option>
						 </c:when>
						<c:when test="${cartInfo.p_canrent eq 0}">
						<option value="대여" selected="selected" disabled="disabled">대여(대여 품절)</option>
						</c:when>
						<c:otherwise>
						<option value="대여" selected="selected">대여</option>
						</c:otherwise>
						</c:choose>
						
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
                        <c:choose>
						<c:when test="${cartInfo.p_canrent <=5 and cartInfo.p_canrent ne 0}"> 
						<option value="대여">대여(남은 수량 : ${cartInfo.p_canrent})</option>
						 </c:when>
						<c:when test="${cartInfo.p_canrent eq 0}">
						<option value="대여" disabled="disabled">대여(대여 품절)</option>
						</c:when>
						<c:otherwise>
						<option value="대여">대여</option>
						</c:otherwise>
						</c:choose>
						
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
                        <c:choose>
						<c:when test="${cartInfo.p_canrent eq 0}">
						<input id="proamount" name="amount" type="number" style="width:56.67px; height: 30px" min="0" max="${cartInfo.p_canrent}" value="${cartInfo.c_amount}" disabled="disabled">
						</c:when>
						<c:otherwise>
						<input id="proamount" name="amount" type="number" style="width:56.67px; height: 30px" min="0" max="${cartInfo.p_canrent}" value="${cartInfo.c_amount}">
						</c:otherwise>
						</c:choose>
						</c:if>
						
						<c:if test="${cartInfo.c_state eq '구매'}">
						
						<c:choose>
						<c:when test="${cartInfo.p_canbuy eq 0}">
						<input id="proamount" name="amount" type="number" style="width:56.67px; height: 30px" min="0" max="${cartInfo.p_canrent}" value="${cartInfo.c_amount}" disabled="disabled">
						</c:when>
						<c:otherwise>
						<input id="proamount" name="amount" type="number" style="width:56.67px; height: 30px" min="0" max="${cartInfo.p_canbuy}" value="${cartInfo.c_amount}">
						</c:otherwise>
						</c:choose>
						</c:if>
	
                        
                        </div>
                        </div>
                        <br>
 
</td>
                    <td  class="price right">
                    <input type=text id="price" value="1" style="width: 100px;">원

</td>
<fmt:parseNumber var="rentpoint" value="${cartInfo.p_price*0.05*0.05}" integerOnly="true" />
<fmt:parseNumber var="buypoint" value="${cartInfo.p_price*0.95*0.05}" integerOnly="true" />
                    <td>
                    
                    
                    <span class="txtInfo"><span id="span_mileage_text"><img src="/resources/Images/icon_cash.gif" alt="적립금" style="margin-bottom:2px;"/>포인트<span id="point">1</span></span>(5%)</span><br/>
                  </td>
                    <td><div class="txtInfo">기본배송</div></td>
                    <td>
<span class="">2,500원<br/></span> 조건</td>
                    <td class="price right" style="font-weight: bold;"><span id="totalprice">1</span></td>
                    <td class="button">
                   
                    	<span class="row">
                    	<span style="padding:0; margin-right: 1px;">
                    	&nbsp;&nbsp;
                    	 <c:if test="${cartInfo.p_canrent eq 0}">
                        <span><button id="button2" class="btn btn-outline-primary btn-sm" disabled="disabled">대여</button></span>
                        </c:if>
                        <c:if test="${cartInfo.p_canrent ne 0}">
                        <span><button id="button2" class="btn btn-outline-primary btn-sm">대여</button></span>
                        </c:if>
                        
                         <c:if test="${cartInfo.p_canbuy eq 0}">
                        <span><button id="button2" class="btn btn-outline-primary btn-sm" style="margin-left: 2pt;" disabled="disabled">구매</button></span>
                        </c:if>
                        <c:if test="${cartInfo.p_canbuy ne 0}">
                        <span><button id="button2" class="btn btn-outline-primary btn-sm" style="margin-left: 2pt;">구매</button></span>
                        </c:if>
                        </span>
                        </span>
                     <button id="button" class="btn btn-outline-primary btn-sm btn-block deletecart" style="margin-top: 8pt;" onclick="">옵션 수정</button>
                        <form action="/customer/rent/deleteCartList" method="post">
                        <input type="hidden" name="cartId" value="${cartInfo.c_id}">
                        <button id="button" class="btn btn-outline-primary btn-sm btn-block deletecart" style="margin-top: 8pt;" onclick="">삭제</button>
                   </form>
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

 <span style="float: left;">
 <div class="row">
    		<span style="font-weight: bold;">선택상품을</span>
    		<form id="form">
           	<span style="margin-left: 3pt;"><button id="deletecart" href="" class="btn btn-outline-primary" onclick="cartcheckboxArr();">삭제하기</button></span>
           	<input type="hidden" id="arrayParam" name="arrayParam">
           	</form>
            <span style="margin-left: 3pt;"><button id="button" href="" class="btn btn-outline-primary">주문하기</button></span>
        </div>
        </span>
      
<span style="float: right;">
 <div class="row">
            <span><button id="button2" href="" class="btn btn-outline-primary">전체 상품 주문</button></span>
            <span>
            <form id="form" action="/customer/rent/deletecartAll" method="post">
            <input type="hidden" id="userID" name="userID" value="crystal"/>
            <span style="margin-left: 3pt;"><button id="deletecart" class="btn btn-outline-primary deletecartAll">장바구니 비우기</button></span>
            </form></span>
            </div>
     </span>  
                                
       
                 
                 
      </c:if>                         
        </div>
                          
</div>
<div class="col-md-2">ddd</div>
</div>

<%@ include file="/WEB-INF/views/customerFooter.jsp" %>
<script type="text/javascript">
$(document).ready(function() {
	$('#myCarousel').carousel('cycle');
	$('#myCarousel2').carousel('cycle');
});

$('.deletecart').click(function() {
	
	if (confirm("해당 상품을 장바구니에서 삭제하시겠습니까?") == true){   

	  }else{   
		 event.preventDefault();
       event.stopPropagation();

	  };	
});

$('.deletecartAll').click(function() {
	
	if (confirm("위시리스트를 모두 비우시겠습니까?") == true){   
		
	  }else{   
		 event.preventDefault();
       event.stopPropagation();

	  };	
});


function cartcheckboxArr() { 
	var array = new Array(); // 배열 선언
	$('input:checkbox[name=RowCheck]:checked').each(function() { // 체크된 체크박스의 value 값을 가지고 온다.	    
		array.push(this.value);
	});
				
	$("#arrayParam").val(array);
	if (confirm("선택한 상품들을 위시리스트에서 삭제하시겠습니까?") == true){   
		$("#form").attr("action", "/customer/rent/deletecartList2");  
		$("#form").submit();
	  }else{   
		 event.preventDefault();
     event.stopPropagation();

	  };	
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
		var proIdList=document.querySelectorAll("#proId");
		var rentamountList=document.querySelectorAll("#canrent");
		var buyamountList=document.querySelectorAll("#canbuy");

	
		for(var i=0; i < amountLength; i++){
			amountList[i].addEventListener('input',onIncreaseCountHandler)};
			
			for(var i=0; i < amountLength; i++){
				stateList[i].addEventListener('input',onStateCountHandler)};
				
			
						
		function onIncreaseCountHandler(e) {
			
			for(var i=0; i< amountLength;i++){
				if(e.target==amountList[i]){
					if(amountList[i].value==0){
						if (confirm("해당 상품을 장바구니에서 삭제하시겠습니까?") == true){   
								$("#zerodelete").attr("action", "/customer/rent/deleteCartList");  
								$("#zerodelete").attr("method", "POST");  
								$("#zerodelete").submit();
								
						  }else{   
							 event.preventDefault();
					       event.stopPropagation();

						  };
						
					}
					else{
						if(stateList[i].value=="대여"){
					priceList[i].value=originprice[i].value*amountList[i].value*0.05;}
						if(stateList[i].value=="구매"){
							priceList[i].value=originprice[i].value*amountList[i].value*0.95;
						}
					pointList[i].innerText=String(priceList[i].value*0.05);
					totalpriceList[i].innerText=priceList[i].value*1+2500;
					}
				}
			}
		}
		
function onStateCountHandler(e) {
			
			for(var i=0; i< amountLength;i++){
				if(e.target==stateList[i]){
					
						if(stateList[i].value=="대여"){
					priceList[i].value=originprice[i].value*amountList[i].value*0.05;}
						if(rentamountList[i].value==0){
							amountList[i].disabled=true;
						}
						else{
							amountList[i].disabled=false;
							if(amountList[i].value>rentamountList[i].value){
								amountList[i].value=rentamountList[i].value
							}
							amountList[i].max(rentamountList[i].value);
						}
					
						if(stateList[i].value=="구매"){
							priceList[i].value=originprice[i].value*amountList[i].value*0.95;
							if(buyamountList[i].value==0){
								amountList[i].disabled=true;
							}
							else{
								amountList[i].disabled=false;
								if(amountList[i].value>buyamountList[i].value){
									amountList[i].value=buyamountList[i].value
								}
								amountList[i].max(buyamountList[i].value);
								
							}
						}
						pointList[i].innerText=String(priceList[i].value*0.05);
					totalpriceList[i].innerText=priceList[i].value*1+2500;
					}
				}
			}
			

		
		
    

		
</script>
</body>
</html>