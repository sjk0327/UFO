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
<link rel="stylesheet" type="text/css" href="/resources/common/css/label.css">
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
    <script src="/resources/common/js/main.js"></script>
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
#delbtn{
border: 0;
background-color: white;
color:#8c92a0;
font-size: 12px;
}

#delbtn:hover{
cursor: pointer;
font-weight: bold;
text-shadow: 4px 2px 2px gray;
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
	width: 284px;
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
        
        
        .wishimg{
        width:100px;
        height: 100px;
        }
@media only screen and (max-width:600px) {

tr{
display : block;
border-bottom: solid;
}

.checkth, .prhth, .pohth, .imgboxth,  .selth {
display: none;
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

.small1 { width: 100px; height: 100px; }
.small2 { width: 80px; height: 80px; align:center;}

#usersee{
max-height: 500px;
position: sticky;
top:300px;

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

            <div class="col">
         <div class="row">
         <div class="col-md-2"></div>
<div class="col-md-9">
         <br>
         <div class="row">
         <div class="col-md-9">
          <div class="checkth col-md-3">
<input type="checkbox" name="RowCheck" onclick="allChk(this);"/> 전체 상품 선택
</div>
  <div class="row mb-5" id="ulList" style="align-items: center;" >
 	
           
          <c:if test="${!empty wishList}">


               <c:forEach var="wishInfo" items="${wishList}">
               <input type="hidden" id="proName" value="${wishInfo.p_name}">
               <input type="hidden" id="proId" value="${wishInfo.w_pid}">
               <input type="hidden" id="proCategory" value="${wishInfo.p_category}">
               <input type="hidden" id="proCanbuy" value="${wishInfo.p_canbuy}">
               <input type="hidden" id="proCanrent" value="${wishInfo.p_canrent}">
               <input type="hidden" id="proPrice" value="${wishInfo.p_price}">
               <input type="hidden" id="proImg" value="${wishInfo.p_mainimg}">
               
             <div class="col-sm-6 col-lg-4 mb-4" id="listClick"  data-aos="fade-up" onclick="" >  
                     
                <div  class="block-4 text-center border;" style="margin-left: 40px; margin-right: 40px;" >
                <!-- 체크박스 -->
                <div class="col">
                <div class="row">
                <div class="check col-md-5" onclick="event.cancelBubble=true" style="text-align: left; margin: 3pt;" >
                     <input class="check" onclick="event.cancelBubble=true" type="checkbox" name="RowCheck" value="${wishInfo.w_id }"></div>
                  <div class="col-md-5" style="text-align: right; margin: 3pt; left: 40px;"><form action="/member/rent/deleteWishList" method="post">
                        <input type="hidden" name="w_id" value="${wishInfo.w_id}">
                        <button id="delbtn" class="deleteWish"onclick="">Χ</button>
 						</form></div></div></div>
                     
                  <!-- 이미지 -->
                  <figure class="block-4-image">
                   
                                       <div class="imgbox" style="padding :0;"><a>  
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
</a></div>
                  </figure>
                  
                  
                  <div class="block-4-text p-4">
                    <div class="left info" style="text-align: left; height: 80px;">

                       
                       <div>
                        <c:if test="${wishInfo.p_canrent <=5 and wishInfo.p_canrent ne 0}">
                       <label class="label label-danger">대여 품절 예정</label>
                        </c:if>
                        <c:if test="${wishInfo.p_canrent eq 0}">
                         <label class="label label-default">대여 품절</label>
                        </c:if>
                        <c:if test="${wishInfo.p_canbuy <=5 and wishInfo.p_canbuy ne 0}">
                        <label class="label label-danger">구매 품절 예정</label>
                        </c:if>
                        <c:if test="${wishInfo.p_canbuy eq 0}">
                        <label class="label label-default">구매 품절</label>
                        </c:if>
                      </div>

                        <div class="name"><a href="" class="product-name">    
                        <span style="color: #505050; font-weight: bold;">[${wishInfo.p_category}]${wishInfo.p_name}</span>
                        </a></div>

</div>




               
                    <div class="price pr right" style="font-size: 12pt;">
<strong class="" style="text-decoration: line-through;">원가 : <fmt:formatNumber value="${wishInfo.p_price}" pattern="###,###,###" />원<br/></strong>
<fmt:parseNumber var="rentprice" value="${wishInfo.p_price*0.05}" integerOnly="true" />
<fmt:parseNumber var="buyprice" value="${wishInfo.p_price*0.95}" integerOnly="true" />
<div class="row">

<div class="col-md-6">
대여가<br><span style="font-weight: bold;"><fmt:formatNumber value="${rentprice }" pattern="###,###,###" />원</span>
</div>
<div class="col-md-6">
즉시구매가<br><span style="font-weight: bold;"><fmt:formatNumber value="${buyprice }" pattern="###,###,###" />원</span>
</div>
</div></div>
<br>

                   
                   <div class="button sel">
                   
                    	<div class="btngroup row" style="align-items: center;">

                    	 <c:if test="${wishInfo.p_canrent eq 0}">
                        <div class="col-md-4" style="padding-left: 0; padding-right: 0;"><button id="button2" class="btn btn-outline-primary btn-sm btnrent" value="대여" disabled="disabled">대여</button></div>
                        </c:if>
                        <c:if test="${wishInfo.p_canrent ne 0}">
                        <div class="col-md-4" style="padding-left: 0; padding-right: 0;"><button id="button2" class="btn btn-outline-primary btn-sm btnrent" value="대여">대여</button></div>
                        </c:if>
                        
                         <c:if test="${wishInfo.p_canbuy eq 0}">
                        <div class="col-md-4" style="padding-left: 0; padding-right: 0;"><button id="button2" class="btn btn-outline-primary btn-sm btnbuy" value="구매" style="margin-left: 2pt;" disabled="disabled">구매</button></div>
                        </c:if>
                        <c:if test="${wishInfo.p_canbuy ne 0}">
                        <div class="col-md-4" style="padding-left: 0; padding-right: 0;"><button id="button2" class="btn btn-outline-primary btn-sm btnbuy" value="구매" style="margin-left: 2pt;">구매</button></div>
                        </c:if>
               
                       <div class="col-md-4" style="padding-left: 1px; padding-right: 0;"><button id="button" class="btn btn-outline-primary btn-sm btncart" style="margin-left: 2pt; height: 43px;"><span class="fas fa-shopping-cart" style="font-size: 15pt;"></span></button>
                        </div>
                        </div>
                        
                    </div>
                  </div>
                </div>
              </div>
              </c:forEach>
              </c:if>
      
            </div>
            <br>
             <!-- 페이징 start -->
                <div id = "paging-div">
                <div class="row">
                <div class="col-md-5"></div>
                <div class="col-md-6">
                <ul class="btn-group pagination">
                   <c:if test="${pageMaker.prev }">
                      <li><a href='<c:url value="/member/rent/wishList${pageMaker.makeQuery(pageMaker.startPage-1)}"/>'>
                         <span style="font-weight: bold; color: #37474f;" >&nbsp;[이전]&nbsp;</span></a></li><span class="col-md-1"></span>
                   </c:if>
                   <c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="pageNum">
                      <c:if test="${pageNum eq pageMaker.cri.page}"><li><a href='<c:url 
                                        value="/member/rent/wishList${pageMaker.makeQuery(pageNum)}"/>'>
                      <span id="pagingCur" style="background-color: #7971ea; display:inline-block; height: 30px; width: 30px; 
                                        border-radius: 50%; font-weight: bold; color: white; padding : 2px; padding-right : 3px;">&nbsp;${pageNum}&nbsp;</span></a></li><span class="col-md-1"></span></c:if>
                      <c:if test="${pageNum ne pageMaker.cri.page}"><li>
                                  <a href='<c:url value="/member/rent/wishList${pageMaker.makeQuery(pageNum)}"/>'>
                      <span style="color: #37474f;">&nbsp;${pageNum}&nbsp;</span></a></li><span class="col-md-1"></span></c:if>
                      
                   </c:forEach>
                   <c:if test="${pageMaker.next && pageMaker.endPage >0 }">
                      <li><a href='<c:url value="/member/rent/wishList${pageMaker.makeQuery(pageNum)}/member/rent/wishList${pageMaker.makeQuery(pageMaker.endPage+1)}"/>'>
                         <span style="font-weight: bold; color: #37474f;">&nbsp;[다음]&nbsp;</span></a></li><span class="col-md-1"></span></a></li>
                   </c:if>
                </ul></div></div>
                </div>
           <!-- 페이징 end -->
           


<div>

               
               
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

<div class="col-md-3">
<div id="usersee" class="block-4 border col-md-10 box" >${userInfo.m_id}님, 이런 상품은 어떠세요?<br>
<c:forEach var="prowish" items="${wishProList}">
<div class="row" style="margin-bottom: 1pt;">
<div class="col-md-6">
<a><img class="wishimg" src="/resources/Images/${prowish.p_mainImg}.jpg"></a>
</div>
<div class="col-md-6" style="font-weight: bold;">
[${prowish.p_category}]<br>${prowish.p_name}</div></div>

</c:forEach>



</div></div></div>
</div>

</div></div>

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