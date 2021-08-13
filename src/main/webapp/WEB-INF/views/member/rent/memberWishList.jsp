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
    margin: auto;
}


#button2{
background-color: #7971ea;
color: white;
}

#deleteWish{
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
    
    
<div class="wrapper">
<br>
    <div class="titleArea" style="text-align: center;">
        <h2>WISHLIST</h2>
    </div>

<div>
<br>
               
<table border="1" summary="" class="" >
            <colgroup>
<col style="width:50px;"/>
<col style="width:180px"/>
<col style="width:auto"/>
<col style="width:150px"/>
<col style="width:120px"/>

<col style="width:115px"/>
</colgroup>
<thead style="text-align: center;"><tr>
<th scope="col"><input type="checkbox" name="RowCheck" onclick="allChk(this);"/></th>
                    <th scope="col">이미지</th>
                    <th scope="col">상품정보</th>
                    <th scope="col">판매가</th>
                    <th scope="col">포인트</th>

                  
                    <th scope="col">선택</th>
                </tr></thead>
                
                <tbody class="tablebody" >
                <c:if test="${!empty wishList}">
               <c:forEach var="wishInfo" items="${wishList}">
                
                
                <tr class="" style="text-align: center;">
                <td onclick="event.cancelBubble=true">
                     <input type="checkbox" name="RowCheck" value="${wishInfo.w_id }"></td>
                    <td class="thumb" style="padding : 0;"><a href="">
                    <div class="container text-center my-3">
   
    <div id="recipeCarousel" class="carousel slide" data-ride="carousel">
        <div class="carousel-inner">
            
            <div class="carousel-item row no-gutters active">
                <div class="float-left">
               		<img class="img-fluid" src="/resources/Images/${wishInfo.p_mainimg}.jpg">
                </div>
              
            </div>
            
            <div class="carousel-item row no-gutters">
                <div class="float-left">
                	<img class="img-fluid" src="/resources/Images/${wishInfo.p_subimg}.jpg">
                </div>
                
               
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
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color: #505050; font-weight: bold;">${wishInfo.p_name}</span>
                        
                        </a></div><br>
                        <ul class="xans-element- xans-myshop xans-myshop-optionall option">
                        <c:if test="${wishInfo.p_canrent <=5 and wishInfo.p_canrent ne 0}">
                        <div class="displaynone" style="color: red;"><span style="font-weight: bold;">!</span>곧 대여 품절 예정인 상품입니다<span style="font-weight: bold;">!</span></div>
                        </c:if>
                        <c:if test="${wishInfo.p_canrent eq 0}">
                        <div class="displaynone" style="color: gray;">대여 품절된 상품입니다.</div>
                        </c:if>
                        <c:if test="${wishInfo.p_canbuy <=5 and wishInfo.p_canbuy ne 0}">
                        <div class="displaynone" style="color: red;"><span style="font-weight: bold;">!</span>곧 구매 품절 예정인 상품입니다<span style="font-weight: bold;">!</span></div>
                        </c:if>
                        <c:if test="${wishInfo.p_canbuy eq 0}">
                        <div class="displaynone" style="color: gray;">구매 품절된 상품입니다.</div>
                        </c:if>

                          
</ul>
</td>
                    <td class="price right">
<strong class="" style="text-decoration: line-through;">원가 : <fmt:formatNumber value="${wishInfo.p_price}" pattern="###,###,###" />원<br/></strong>
<fmt:parseNumber var="rentprice" value="${wishInfo.p_price*0.05}" integerOnly="true" />
<fmt:parseNumber var="buyprice" value="${wishInfo.p_price*0.95}" integerOnly="true" />
<strong class="">대여가<br><span style="font-weight: bold;"><fmt:formatNumber value="${rentprice }" pattern="###,###,###" />원</span><br/></strong><br/>
<strong class="">즉시구매가<span style="font-weight: bold;"><fmt:formatNumber value="${buyprice }" pattern="###,###,###" />원</span><br/></strong>
</td>
<fmt:parseNumber var="rentpoint" value="${wishInfo.p_price*0.05*0.05}" integerOnly="true" />
<fmt:parseNumber var="buypoint" value="${wishInfo.p_price*0.95*0.05}" integerOnly="true" />
                    <td><span class="txtInfo"><span id="span_mileage_text"><img src="/resources/Images/icon_cash.gif" alt="적립금" style="margin-bottom:2px;"/>대여포인트 <fmt:formatNumber value="${rentpoint}" pattern="###,###,###" /></span>(5%)</span><br/>
                    <span class="txtInfo"><span id="span_mileage_text"><img src="/resources/Images/icon_cash.gif" alt="적립금" style="margin-bottom:2px;"/>구매포인트 <fmt:formatNumber value="${buypoint}" pattern="###,###,###" /></span>(5%)</span></td>
                   
                   
        
                    <td class="button">
                   
                    	<span class="row">
                    	&nbsp;&nbsp;
                    	
                    	
                    	 <c:if test="${wishInfo.p_canrent eq 0}">
                        <span><button id="button2" class="btn btn-outline-primary btn-sm btn-block" disabled="disabled">대여</button></span>
                        </c:if>
                        <c:if test="${wishInfo.p_canrent ne 0}">
                        <span><button id="button2" class="btn btn-outline-primary btn-sm btn-block">대여</button></span>
                        </c:if>
                        
                         <c:if test="${wishInfo.p_canbuy eq 0}">
                        <span><button id="button2" class="btn btn-outline-primary btn-sm btn-block" style="margin-left: 2pt;" disabled="disabled">구매</button></span>
                        </c:if>
                        <c:if test="${wishInfo.p_canbuy ne 0}">
                        <span><button id="button2" class="btn btn-outline-primary btn-sm btn-block" style="margin-left: 2pt;">구매</button></span>
                        </c:if>
                       
                       
                      
                        </span>
                        <button id="button" href="" class="btn btn-outline-primary btn-sm btn-block" style="margin-top: 8pt;">장바구니 담기</button>
                        <form action="/customer/rent/deleteWishList" method="post">
                        <input type="hidden" name="w_id" value="${wishInfo.w_id}">
                        <button id="button" class="btn btn-outline-primary btn-sm btn-block deleteWish" style="margin-top: 8pt;" onclick="">삭제</button>
                   </form>
                    </td>
                </tr>
                </c:forEach>
                </c:if>
              
</tbody>

</table>
<c:if test="${empty wishList }">
<p style="text-align: center; font-weight: bold;">
<br>
등록된 위시리스트 상품이 없습니다!
</p>

</c:if>

<c:if test="${!empty wishList }">
<br>

 <span style="float: left;">
 <div class="row">
    		<span style="font-weight: bold;">선택상품을</span>
    		<form id="form">
           	<span style="margin-left: 3pt;"><button id="deleteWish" href="" class="btn btn-outline-primary" onclick="wishcheckboxArr();">삭제하기</button></span>
           	<input type="hidden" id="arrayParam" name="arrayParam"/>
           	</form>
            <span style="margin-left: 3pt;"><button id="button" href="" class="btn btn-outline-primary">장바구니 담기</button></span>
        </div>
        </span>
      
<span style="float: right;">
 <div class="row">
            <span><button id="button2" href="" class="btn btn-outline-primary">전체 상품 주문</button></span>
            <span>
            <form id="form" action="/customer/rent/deleteWishAll" method="post">
            <input type="hidden" id="userID" name="userID" value="crystal"/>
            <span style="margin-left: 3pt;"><button id="deleteWish" class="btn btn-outline-primary deleteWishAll">위시리스트 비우기</button></span>
            </form></span>
            </div>
     </span>  
                                
        </div>
       
                 <div id = "paging-div">
                              <ul class="btn-group pagination">
                                 <c:if test="${pageMaker.prev }">
                                    <li><a href='<c:url value="/admin/pro/productList${pageMaker.makeQuery(pageMaker.startPage-1)}"/>'>
                                       <span style="font-weight: bold;">&nbsp;[이전]&nbsp;</span></a></li><span class="col-md-1"></span>
                                 </c:if>
                                 <c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="pageNum">
                                    <c:if test="${pageNum eq pageMaker.cri.page}"><li><a href='<c:url value="/admin/pro/productList${pageMaker.makeQuery(pageNum)}"/>'>
                                    <span id="pagingCur" style="background-color: #7971ea; display:inline-block; height: 30px; width: 30px; border-radius: 50%; font-weight: bold; color: white; padding : 5px;">&nbsp;${pageNum}&nbsp;</span></a></li><span class="col-md-1"></span></c:if>
                                    <c:if test="${pageNum ne pageMaker.cri.page}"><li><a href='<c:url value="/admin/pro/productList${pageMaker.makeQuery(pageNum)}"/>'>
                                    <span>&nbsp;${pageNum}&nbsp;</span></a></li><span class="col-md-1">   </span></c:if>
                                    
                                 </c:forEach>
                                 <c:if test="${pageMaker.next && pageMaker.endPage >0 }">
                                    <li><a href='<c:url value="/admin/pro/productList${pageMaker.makeQuery(pageMaker.endPage+1)}"/>'>
                                       <span style="font-weight: bold;">&nbsp;[다음]&nbsp;</span></a></li><span class="col-md-1"></span></a></li>
                                 </c:if>
                              </ul>
                              </div>
                              <!-- 페이징 end -->
                 
      </c:if>                         
                             
</div>

<%@ include file="/WEB-INF/views/customerFooter.jsp" %>
<script type="text/javascript">
$(document).ready(function() {
	$('#myCarousel').carousel('cycle');
	$('#myCarousel2').carousel('cycle');
});

$('.deleteWish').click(function() {
	
	if (confirm("해당 상품을 위시리스트에서 삭제하시겠습니까?") == true){   

	  }else{   
		 event.preventDefault();
       event.stopPropagation();

	  };	
});

$('.deleteWishAll').click(function() {
	
	if (confirm("위시리스트를 모두 비우시겠습니까?") == true){   
		
	  }else{   
		 event.preventDefault();
       event.stopPropagation();

	  };	
});


function wishcheckboxArr() { 
	var array = new Array(); // 배열 선언
	$('input:checkbox[name=RowCheck]:checked').each(function() { // 체크된 체크박스의 value 값을 가지고 온다.	    
		array.push(this.value);
	});
				
	$("#arrayParam").val(array);
	if (confirm("선택한 상품들을 위시리스트에서 삭제하시겠습니까?") == true){   
		$("#form").attr("action", "/customer/rent/deleteWishList2");  
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

</script>
</body>
</html>