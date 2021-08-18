<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
       <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8"/>
<meta name="viewport" content="width=device-width,initial-scale=1">
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

#button2{
background-color: #7971ea;
color: white;
}
#keepgo:hover{ 
background-color:#7971ea;
color: white;
font-weight: bold;
border-color: #7971ea;
 }
#keepgo{
color: #455a64
}

#deleteWish{
background-color: #4e5a72;
color: white;
border-color: #4e5a72;
}

/* 이미지 캐러셀 크기 설정 */
.img-fluid{
	height: 200px;
	width: 200px;
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


        .modal {
          position: fixed;
          top: 0;
          left: 0;
          width: 100%;
          height: 100%;
          display: flex;
          justify-content: center;
          align-items: center;
        }

        .modal .bg {
          width: 100%;
          height: 100%;
          background-color: rgba(0, 0, 0, 0.6);
        }

        .modalBox {
          position: absolute;
          background-color: #fff;
          padding: 15px;
        }

        .hidden {
          display: none;
        }
        
@media only screen and (max-width:600px) {

tr{
display : block;
border-bottom: solid;
}
.check{
width:10%;
border-color: #d3d3d3;
}
.imgbox{
width:90%;
border-color: #d3d3d3;
}
.info{
width:100%;
display:block;
border: 0;
border-spacing: 0;
border-collapse: collapse; 
}



.prh{
width : 50%;
    padding-right: 40px;
    padding-left: 40px;
}

.poh{
    padding-left: 60px;
    padding-right: 60px;
}


.pr{
    width:50%;
    border-color: #d3d3d3;
    

}

.po{
    width:60%;
    padding-left: 60px;
    border-color: #d3d3d3;
    
}


.sel{
width : 100%;
display:block;
border: 0;
border-spacing: 0;
border-collapse: collapse; 
text-align: center;
}

.img-fluid{
	height: 229px;
	width: 400px;
}

.btnrent{
width:200%;
position: relative;
left : 20%;

}

.btnbuy{
width:200%;
position: relative;
left : 130%;
}

.checkpro{
margin-left: 10px;
}

.allpro{
margin-top : 10px;
margin-right: 25px;
}
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
        <h2>WISHLIST</h2>
    </div>


<div class="container col-md-8">


<div>
<br>
               
<table border="1" summary="" >
<thead style="text-align: center;"><tr class="tablehead">

<th class="check col-md-1">
<input type="checkbox" name="RowCheck" onclick="allChk(this);"/>
</th>
                    <th class="imgbox col-md-2">이미지</th>
              
                    <th class="info col-md-3" style="font-size: 12pt;">상품정보</th>
                
                    <th class="prh col-md-2">판매가</th>
                    <th class="poh col-md-2">포인트</th> 
                    <th class="sel col-md-1">선택</th>
                </tr></thead>
                
                <tbody class="tablebody" >
                <c:if test="${!empty wishList}">
               <c:forEach var="wishInfo" items="${wishList}">
               <input type="hidden" id="proName" value="${wishInfo.p_name}">
               <input type="hidden" id="proId" value="${wishInfo.w_pid}">
               <input type="hidden" id="proCategory" value="${wishInfo.p_category}">
               <input type="hidden" id="proCanbuy" value="${wishInfo.p_canbuy}">
               <input type="hidden" id="proCanrent" value="${wishInfo.p_canrent}">
               <input type="hidden" id="proPrice" value="${wishInfo.p_price}">
               <input type="hidden" id="proImg" value="${wishInfo.p_mainimg}">
               
               
               <!-- 모달창 시작 -->
                <div class="modal hidden">
  <div class="bg"></div>
  <div class="modalBox container">
  <h4 style="text-align: center">옵션 선택</h4>
  ${array.length }
 	<form:form id="buyform" method="post" commandName="BuyInfoVO">
    <input type="hidden" id="productId" name="productId" value="1">
     <input id="cartId" name="cartId" type="hidden" value="0"> 
    <div class="row" style="margin-top: 20px;">
    <div class="col-md-3" id="productImg"><img class="img-fluid" src="/resources/Images/${wishInfo.p_mainimg}.jpg" style="width:150px; height: 150px;"></div>
    <div class="col-md-3" id="productName" style="color: #505050; font-weight: bold;">${wishInfo.p_name}</div>
    <div class="col-md-6">
    <div>
    <div class="row">
    <div class="col-md-4">
      구매정보</div>
      <div class="col-md-8">
      <select id="buyType" name="buyType">
      <option value="선택">선택해주세요</option>
      <option value="대여">대여</option>
      <option value="구매">구매</option>
      </select>
      </div></div></div>
      <div>
      <div class="row" style="margin-top:8pt;">
       <div class="col-md-4">
       수량</div><div class="col-md-8">
        <input id="proamount" name="proamount" type="number" style="width:56.67px; height: 30px" min="1" max="100" value="1">               
			</div></div></div>
			  <div>
      <div class="row" style="margin-top:8pt;">
       <div class="col-md-4" id="rdate">
       날짜</div><div class="col-md-8">
        <input id="rentdate" name="rentdate" type="date" value="">            
			</div></div></div>
			<div>
      <div class="row" style="margin-top:3pt;">
       <div class="col-md-4">
       총 가격</div><div class="col-md-8">
        <input id="productPrice" name="productPrice" type="text" value="1" readonly="readonly" style="margin-right: 8pt;">               
			</div></div></div>
			
			
			</div></div>
		<div class="row" style="margin-top: 8pt;">	
		<div class="col-md-9"></div>
		<div class="col-md-3">
		<div class="row">
		<div class="col-md-6" style="padding-left: 50px;">	
    <button id="button" class="closeBtn btn btn-outline-primary btn-sm">취소</button></div>
    <div class="col-md-6" style="padding-left: 30px;">	
    <button id="keepgo" class="btn btn-outline-primary btn-sm"></button></div></div></div>
  </div>
  </form:form></div>	
</div>
<!-- 모달창 끝 -->
                
                <tr class="" style="text-align: center;">
                <td class="check" onclick="event.cancelBubble=true">
                     <input type="checkbox" name="RowCheck" value="${wishInfo.w_id }"></td>
                    <td class="imgbox" style="padding : 0;">
                    <a>
                   
   
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

</a></td>
                    <td class="left info" style="text-align: left;">
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



                    <td class="price pr right">
<strong class="" style="text-decoration: line-through;">원가 : <fmt:formatNumber value="${wishInfo.p_price}" pattern="###,###,###" />원<br/></strong>
<fmt:parseNumber var="rentprice" value="${wishInfo.p_price*0.05}" integerOnly="true" />
<fmt:parseNumber var="buyprice" value="${wishInfo.p_price*0.95}" integerOnly="true" />
<strong class="">대여가<br><span style="font-weight: bold;"><fmt:formatNumber value="${rentprice }" pattern="###,###,###" />원</span><br/></strong><br/>
<strong class="">즉시구매가<br><span style="font-weight: bold;"><fmt:formatNumber value="${buyprice }" pattern="###,###,###" />원</span><br/></strong>
</td>
<fmt:parseNumber var="rentpoint" value="${wishInfo.p_price*0.05*0.01}" integerOnly="true" />
<fmt:parseNumber var="buypoint" value="${wishInfo.p_price*0.95*0.01}" integerOnly="true" />
                    <td class="po"><span class="txtInfo"><span id="span_mileage_text"><img src="/resources/Images/icon_cash.gif" alt="적립금" style="margin-bottom:2px;"/>대여포인트 <br><fmt:formatNumber value="${rentpoint}" pattern="###,###,###" /></span>(1%)</span><br/>
                    <span class="txtInfo"><span id="span_mileage_text"><img src="/resources/Images/icon_cash.gif" alt="적립금" style="margin-bottom:2px;"/>구매포인트 <br><fmt:formatNumber value="${buypoint}" pattern="###,###,###" /></span>(1%)</span></td>
                   <td class="button sel">
                   
                    	<span class="btngroup row">
                    	&nbsp;&nbsp;&nbsp;
                    	
                    	
                    	 <c:if test="${wishInfo.p_canrent eq 0}">
                        <span><button id="button2" class="btn btn-outline-primary btn-sm btn-block btnrent" value="대여" disabled="disabled">대여</button></span>
                        </c:if>
                        <c:if test="${wishInfo.p_canrent ne 0}">
                        <span><button id="button2" class="btn btn-outline-primary btn-sm btn-block btnrent" value="대여">대여</button></span>
                        </c:if>
                        
                         <c:if test="${wishInfo.p_canbuy eq 0}">
                        <span><button id="button2" class="btn btn-outline-primary btn-sm btn-block btnbuy" value="구매" style="margin-left: 2pt;" disabled="disabled">구매</button></span>
                        </c:if>
                        <c:if test="${wishInfo.p_canbuy ne 0}">
                        <span><button id="button2" class="btn btn-outline-primary btn-sm btn-block btnbuy" value="구매" style="margin-left: 2pt;">구매</button></span>
                        </c:if>
   
                        </span>
                        
                        <button id="button" class="btn btn-outline-primary btn-sm btn-block btncart" style="margin-top: 8pt;">장바구니 담기</button>
                        <form action="/member/rent/deleteWishList" method="post">
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
 <div class="row checkpro">
    		<span style="font-weight: bold;">선택상품을</span>
    		<form id="form">
           	<span style="margin-left: 3pt;"><button id="deleteWish" href="" class="btn btn-outline-primary" onclick="wishcheckboxArr();">삭제하기</button></span>
           	<input type="hidden" id="arrayParam" name="arrayParam"/>
           	</form>
            <span style="margin-left: 3pt;"><form id="form"><button id="cartbutton" href="" class="btn btn-outline-primary">장바구니 담기</button>
            <input type="hidden" id="arrayParam2" name="arrayParam"/></form>
            
            </span>
        </div>
        </span>
      
<span style="float: right;">
 <div class="row allpro">
            <span><button id="button2" href="" class="btn btn-outline-primary">전체 상품 주문</button></span>
            <span>
            <form id="form" action="/member/rent/deleteWishAll" method="post">
            <input type="hidden" id="userID" name="userID" value="crystal"/>
            <span style="margin-left: 3pt;"><button id="deleteWish" class="btn btn-outline-primary deleteWishAll">위시리스트 비우기</button></span>
            </form></span>
            </div>
     </span>  
                                
     </c:if>                         
        </div>
                             
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
		$("#form").attr("action", "/member/rent/deleteWishList2");  
		$("#form").submit();
	  }else{   
		 event.preventDefault();
     event.stopPropagation();

	  };	
}

cartbutton.addEventListener("click",open)
function wishcheckArr() { 
	var array = new Array(); // 배열 선언
	$('input:checkbox[name=RowCheck]:checked').each(function() { // 체크된 체크박스의 value 값을 가지고 온다.	    
		array.push(this.value);
	});
				
	$("#arrayParam2").val(array);
	
	if (confirm("선택한 상품들을 위시리스트에서 삭제하시겠습니까?") == true){   
		$("#form").attr("action", "/member/rent/deleteWishList2");  
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






var btnrentList=document.querySelectorAll(".btnrent");
var btnbuyList=document.querySelectorAll(".btnbuy");
var btncartList=document.querySelectorAll(".btncart");
var btnrentLength = btnrentList.length;
var stateList=document.querySelectorAll("#buyType");
var proNameList=document.querySelectorAll("#proName");
var proIdList=document.querySelectorAll("#proId");
var proCategoryList=document.querySelectorAll("#proCategory");
var rentamountList=document.querySelectorAll("#proCanrent");
var buyamountList=document.querySelectorAll("#proCanbuy");
var proPriceList=document.querySelectorAll("#proPrice");


for(var i=0; i < btnrentLength; i++){
	btnrentList[i].addEventListener("click",open)};
for(var i=0; i < btnrentLength; i++){
		btnbuyList[i].addEventListener("click",open)};
		for(var i=0; i < btnrentLength; i++){
			btncartList[i].addEventListener("click",open)};
	
	

		function open(e) {
			for(var i=0; i< btnrentLength;i++){
			//대여버튼
			if(e.target==btnrentList[i]){
			document.querySelector(".modal").classList.remove('hidden');
			document.getElementById("productName").innerText='['+proCategoryList[i].value+']'+proNameList[i].value;
			document.getElementById("productId").value=proIdList[i].value;
				document.getElementById("buyType").value="대여";
				document.getElementById("buyType").setAttribute('disabled','disabled');
				document.getElementById("proamount").setAttribute('max',rentamountList[i].value);
				document.getElementById("productPrice").value=proPriceList[i].value*0.05;
				document.getElementById("proamount").addEventListener("input",changeprice);
				document.getElementById("rentdate").value=new Date().toISOString().substring(0, 10);
				document.getElementById("rentdate").setAttribute('min',new Date().toISOString().substring(0, 10));
				document.getElementById("rentdate").setAttribute('type','date');
				document.getElementById("rdate").classList.remove('hidden');
				document.getElementById("keepgo").innerText="대여";
				document.getElementById("keepgo").addEventListener("click",giveData);
					var price=(proPriceList[i].value)*0.05;
				function changeprice(ev){
					document.getElementById("productPrice").value=(document.getElementById("proamount").value)*price;
				};	
				function giveData(){
					if (confirm("대여 결제를 진행하시겠습니까?") == true){   
						document.getElementById("buyType").removeAttribute('disabled');
						$("#buyform").attr("action", "/member/rent/buy");  
						$("#buyform").submit();
					  }else{   
						 event.preventDefault();
				     event.stopPropagation();

					  };	
				};
				
			}
			//구매 버튼
			if(e.target==btnbuyList[i]){
				document.querySelector(".modal").classList.remove('hidden');
				document.getElementById("productName").innerText='['+proCategoryList[i].value+']'+proNameList[i].value;
				document.getElementById("productId").value=proIdList[i].value;
				document.getElementById("buyType").value="구매";
				document.getElementById("buyType").setAttribute('disabled','disabled');
				document.getElementById("proamount").setAttribute('max',buyamountList[i].value);
				document.getElementById("rentdate").value=new Date().toISOString().substring(0, 10);
				document.getElementById("rentdate").setAttribute('type','hidden');
				document.getElementById("rdate").classList.add('hidden');
				document.getElementById("productPrice").value=proPriceList[i].value*0.95;
				document.getElementById("proamount").addEventListener("input",changeprice);
				document.getElementById("keepgo").innerText="구매";
				document.getElementById("keepgo").addEventListener("click",giveData);
					var price=proPriceList[i].value*0.95;
				function changeprice(ev){
					document.getElementById("productPrice").value=(document.getElementById("proamount").value)*price;
				};			
				
					function giveData(){
						if (confirm("구매 결제를 진행하시겠습니까?") == true){   
							document.getElementById("buyType").removeAttribute('disabled');
							$("#buyform").attr("action", "/member/rent/buy");  
							$("#buyform").submit();
						  }else{   
							 event.preventDefault();
					     event.stopPropagation();

						  };	
					};
				
				
			}
			//장바구니 버튼
			if(e.target==btncartList[i]){
							var rentprice=(proPriceList[i].value)*0.05;
							var buyprice=(proPriceList[i].value)*0.95;
							var rentamount=rentamountList[i].value;
							var buyamount=buyamountList[i].value;
				document.querySelector(".modal").classList.remove('hidden');
				document.getElementById("productName").innerText='['+proCategoryList[i].value+']'+proNameList[i].value;
				document.getElementById("productId").value=proIdList[i].value;
				document.getElementById("buyType").addEventListener("input",changestate);
				document.getElementById("rentdate").setAttribute('type','hidden');
				document.getElementById("rdate").classList.add('hidden');
				document.getElementById("keepgo").innerText="장바구니";
				document.getElementById("keepgo").addEventListener("click",giveData);
				if(rentamount==0){
					$("#buyType option[value*='대여']").prop('disabled',true);
				}
				if(buyamount==0){
					$("#buyType option[value*='구매']").prop('disabled',true);
				}
				function giveData(){
						document.getElementById("buyType").removeAttribute('disabled');
						if(document.getElementById("buyType").value=="선택"){
							alert('옵션을 선택하세요!');
							event.preventDefault();
					    	 event.stopPropagation();

						}
						else{
					if (confirm("장바구니에 넣으시겠습니까?") == true){   
						$("#buyform").attr("action", "/member/rent/wishToCart");  
						$("#buyform").submit();
					  }else{   
						  $("#buyType option[value*='대여']").removeAttr('disabled');
						  $("#buyType option[value*='구매']").removeAttr('disabled');
						 event.preventDefault();
				    	 event.stopPropagation();

					  }
						}
				};
				
				function changestate(){
						if(document.getElementById("buyType").value=="대여"){
							document.getElementById("proamount").setAttribute('max',rentamount);
							document.getElementById("productPrice").value=rentprice;
							document.getElementById("proamount").addEventListener("input",changeprice);
							document.getElementById("rentdate").setAttribute('type','date');
							document.getElementById("rdate").classList.remove('hidden')
							document.getElementById("rentdate").value=new Date().toISOString().substring(0, 10);
							document.getElementById("rentdate").setAttribute('min',new Date().toISOString().substring(0, 10));
							
							function changeprice(){
								document.getElementById("productPrice").value=(document.getElementById("proamount").value)*rentprice;
							};	
							
						}
						
						if(document.getElementById("buyType").value=="구매"){
								
							document.getElementById("proamount").setAttribute('max',buyamount);
							document.getElementById("rentdate").value=new Date().toISOString().substring(0, 10);
							document.getElementById("rentdate").setAttribute('type','hidden');
							document.getElementById("rdate").classList.add('hidden');
							document.getElementById("productPrice").value=buyprice;
							document.getElementById("proamount").addEventListener("input",changeprice);
							
							function changeprice(ev){
								document.getElementById("productPrice").value=(document.getElementById("proamount").value)*buyprice;
							};			
							
								
						}
					};	
				
				
			}
			}
		};	
		
		document.querySelector(".closeBtn").addEventListener("click",close);
		function close(){
			if(confirm('진행창을 닫으시겠습니까?')){
				$("#buyType option[value*='대여']").removeAttr('disabled');
			  $("#buyType option[value*='구매']").removeAttr('disabled');
			  $("#buyType").removeAttr('disabled');
			  document.getElementById("buyType").value="선택";
			  document.getElementById("proamount").value="1";
			  document.getElementById("productPrice").value=0;  
			document.querySelector(".modal").classList.add('hidden');}
			else{
				 event.preventDefault();
		    	 event.stopPropagation();
			}
		};	




</script>
</body>
</html>