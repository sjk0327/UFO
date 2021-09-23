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
<title>위시리스트 - UF&#38;O</title>
<div class="site-wrap">
<%@ include file="/WEB-INF/views/customerHeader.jsp" %>

<link rel="stylesheet" type="text/css" href="/resources/common/css/style.css">
<link rel="stylesheet" type="text/css" href="/ind-script/optimizer.php?filename=tZVBUgQhDEX33W49R8pZeAb3ngDodJMSCEWCztxepnWhzsbqgSWp5IX6IR_wHBGeTgVy4a2YCAWFa3EITgTWwknBcYycHlrgEf6Tj24SDlWJ02T5fLCwqh5tGswFy7FSNTbgj1J0cxUsAhYTKUcjig1WbSA3e40BZMF5QaEtgbxROj3v5MhLDQjxIp4zfJD4QKIdwGu78Z2YJg9XBWuE3M68GXAX6legN7UNqx1wqjSKrMxBKY_CewzD2O2RL9UN0zybjZJRHKa8saPQN3bSl_7L5XprEoYJ3tLcKPZfE77TSb_7xNp28-qpr55yprR17-A4vTdI-wyy6w4XbesTeON17c9GU5x_QbMM0P16Z-XduD4B&type=css&k=89a12bf899430c5c696ea12eadc518ef948738e3&t=1627622406" />
<link rel="stylesheet" type="text/css" href="/ind-script/optimizer.php?filename=rczLDcMgEEXRAsjWdTwpizThKvi8GBRgImZQ5O5t1-Bsr3QPsjSC0U3lUAT2YtK8Gge-M9QSXbZWoYkuUcvWoZ_Sny9EVcTsh63cfzLS4wwLbnFbD39QmqRZiep3mYa3yLld7AE&type=css&k=04827dcf247ed9d72d23c4e72d4402951c293c7b&t=1627969594" />
<link rel="stylesheet" type="text/css" href="/resources/common/css/label.css">

<!-- datepicker -->
<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<!-- datepicker 여기까지 -->
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
    <script src="/resources/common/js/main.js"></script>
    
  
<style type="text/css">

#del{
left: 40px;
}
#itemBox{
margin-left: 40px; 
margin-right: 40px; 

}

.ui-datepicker {
  position: fixed !important;
  left: calc(50vw + 350px) !important;
  top: 240px !important; 
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
          z-index: 1;
          align-items: center;
        }

        .modal .bg {
          width: 100%;
          height: 100%;
          background-color: rgba(0, 0, 0, 0.6);
        }

.modal-con{  
  position:fixed;
  top:50%; left:50%;
  transform: translate(-50%,-50%);
  max-width: 60%;
  min-height: 30%;
  background:#fff;
}
 

        .hidden {
          display: none;
        }
        
        
        .wishimg{
        width:100px;
        height: 100px;
        }
        
*{margin:0; padding:0;}
a.button{display:inline-block; padding: 10px 20px; text-decoration:none; color:#fff; background:#000; margin:20px;}

.modal-con .title{
  font-size:20px; 
  padding: 10px; 
  background : #7971ea;
  font-weight: bold;
  color: white;
  text-align: center;
}
.modal-con .con{
  font-size:15px; line-height:1.3;
  padding: 30px;
}
.modal-con .close{
  display:block;
  position:absolute;
  width:30px; height:30px;
  border-radius:50%; 
  border: 3px solid #000;
  text-align:center; line-height: 30px;
  text-decoration:none;
  color:#000; font-size:20px; font-weight: bold;
  right:10px; top:10px;
}
@media only screen and (max-width:600px) {

.img-fluid{
	height: 200px;
	width: 345px;
}

#itemBox{
margin-left: 0px; 
margin-right: 0px; 

}

.checkth, .prhth, .pohth, .imgboxth,  .selth, #recommendBox {
display: none;
}

#del{
left: 0px;
bottom: 30px;
}

#rentp{
width: 160px;
}
#buyp{
width: 160px;
}

#rentb{
width: 105px;
}

#buyb{
width: 105px;
}

#cartb{
width: 105px;
}

#space{
width: 0px;
}

#page{
padding-left: 150px;
}
#modalForbuy{
max-width: 100%;
width: 300px;
 z-index: 9998;

}
.ui-datepicker {
  position: fixed !important;
  left: 100px;
  top: 100px !important; 
  z-index: 9999;
 
}

#modal{
width: 350px;
}

}

.small1 { width: 100px; height: 100px; }
.small2 { width: 80px; height: 80px; align:center;}

#usersee{
max-height: 700px;
position: sticky;
top:300px;

}



* {padding: 0;margin: 0;}
body, html {height: 100%;}
.modac .btn{cursor: pointer;border: 1px solid #999999;text-align: center;border-radius: 5px;outline: none;font-weight: 500;}
.dimLayer{display: block;width: 100%;background-color: rgba(0, 0, 0, 0.3);position: fixed;left: 0;top: 0px;margin: 0;padding: 0; z-index: 2;}
.modac{width: 600px;height: 252px;border-radius: 10px;padding: 80px 24px;box-sizing: border-box;text-align: center;}
.modac-section{background: #ffffff;box-sizing: border-box;display: none;position: fixed;top: 50%;left: 50%;-webkit-transform: translate(-50%, -50%);-ms-transform: translate(-50%, -50%);-moz-transform: translate(-50%, -50%);-o-transform: translate(-50%, -50%);transform: translate(-50%, -50%);display: none;z-index: 9999;}
.menu_msg{font-size: 21px;font-weight: 500;}
.enroll_box p{padding-bottom: 56px;}
.gray_btn {width: 90px;background: #ffffff;color: #999999;height: 36px;transition: 0.5s;font-size: 17px;}
.pink_btn {width: 90px;background: #7971ea;color: #fff;height: 36px;transition: 0.5s;font-size: 17px;border: none;}
</style>

</head>
<body>



<!-- 모달창 시작 -->
                <div class="modal hidden">
  <div class="bg"></div>
  <div id="modalForbuy" class="modal-con">
  <a href="javascript:;" class="close">X</a>
  <p class="title" >옵션을 확인해주세요!</p>
  <div class="con">
 	<form:form id="buyform" method="post" commandName="BuyInfoVO">
    <input type="hidden" id="productId" name="productId" value="1">
     <input id="cartId" name="cartId" type="hidden" value="0"> 
    <div class="row" style="margin-top: 20px;">
    <div class="col-md-4"><img id="productImg" class="img-fluid" src="/resources/Images/product/${wishInfo.p_mainimg}" style="width:200px; height: 150px; margin-left: 20px;"></div>
    <div class="col-md-3" id="productName" style="color: #505050; font-weight: bold;">${wishInfo.p_name}</div>
    <div class="col-md-5">
    <div>
    <div class="row">
    <div class="col-md-5">
      구매정보</div>
      <div class="col-md-7">
      <select id="buyType" name="buyType">
      <option value="선택">선택해주세요</option>
      <option value="대여">대여</option>
      <option value="구매">구매</option>
      </select>
      </div></div></div>
      <div>
      <div class="row" style="margin-top:8pt;">
       <div class="col-md-5">
       수량</div><div class="col-md-7">
        <input id="proamount" name="proamount" type="number" min="1" max="100" value="1" style="width:83.2px;">               
			</div></div></div>
			  <div>
      <div class="row" style="margin-top:8pt;">
       <div class="col-md-5" id="rdate">
       날짜</div><div class="col-md-7">
        <input id="rentdate" name="rentdate" type="text" value="" size="7px;">            
			</div></div></div>
			<div>
      <div class="row" style="margin-top:8pt;">
       <div class="col-md-5">
       총 가격</div><div class="col-md-7">
        <input id="productPrice" name="productPrice" type="text" value="1" readonly="readonly" style="margin-right: 8pt;" size="7px;">               
			</div></div></div>
			
			
			</div></div>
		<div class="row" style="margin-top: 8pt;">	
		<div class="col-md-9"></div>
		<div class="col-md-3">
		<div class="row">
		
    <div class="col-md-6" style="padding-left: 30px;">	
    <input type="button" id="keepgo" class="btn btn-outline-primary btn-sm" value=""></input></div></div></div>
  </div>
  </form:form></div></div>	
</div>
<!-- 모달창 끝 -->

       <!-- confirm 모달을 쓸 페이지에 추가 start-->
        <section id="modal" class="modac modac-section type-confirm">
            <div class="enroll_box">
                <p class="menu_msg"></p>
            </div>
            <div class="enroll_btn">
                <input type="button" class="btn pink_btn btn_ok" value="확인"></input>
                <input type="button" id="modal_close" class="btn gray_btn modal_close" value="취소"></input>
            </div>
        </section>
        <!-- confirm 모달을 쓸 페이지에 추가 end-->
        
        <!-- confirm2 모달을 쓸 페이지에 추가 start-->
        <section id="modal" class="modac modac-section type-confirm2">
            <div class="enroll_box">
                <p class="menu_msg"></p>
            </div>
            <div class="enroll_btn">
                <input type="button" class="btn pink_btn btn_ok2" value="확인"></input>
                <input id="modal_close2" type="button" class="btn gray_btn modal_close" value="취소"></input>
            </div>
        </section>
        <!-- confirm 모달을 쓸 페이지에 추가 end-->
        
        

        <!-- alert 모달을 쓸 페이지에 추가 start-->
        <section id="modal" class="modac modac-section type-alert">
            <div class="enroll_box">
                <p class="menu_msg"></p>
            </div>
            <div class="enroll_btn">
                <button id="modal_close" class="btn pink_btn modal_close">확인</button>
            </div>
        </section>
        <!-- alert 모달을 쓸 페이지에 추가 end-->

<!-- 남은 수량 계산위한 rentalList -->
	<c:forEach var="rentalList" items="${rentalListNow}">
	<input id="rentalIdNow" type="hidden" value="${rentalList.r_pid}">
	<input id="rentaldateNow" type="hidden" value="${rentalList.r_sdate}">
	<input id="rentalamountNow" type="hidden" value="${rentalList.r_rent}">
	</c:forEach>
	<!-- 남은 수량 계산위한 rentalList end script로! -->
	
	<!-- cartList -->
	<c:forEach var="cart" items="${cartList}">
	<input id="cartProId" type="hidden" value="${cart.c_pid}">
	<input id="cartProState" type="hidden" value="${cart.c_state}">
	</c:forEach>
	<!-- cartList end script로! -->


 <div class="site-wrap" >
    <div class="py-3" style="background-color: #f4f4f4;">
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
                     
                <div  id="itemBox" class="block-4 text-center border;">
                <!-- 체크박스 -->
                <div class="col">
                <div class="row">
                <div class="check col-md-5" onclick="event.cancelBubble=true" style="text-align: left; margin: 3pt;" >
                     <input class="check" onclick="event.cancelBubble=true" type="checkbox" name="RowCheck" value="${wishInfo.w_id }"></div>
                  <div id="del" class="col-md-5" style="text-align: right; margin: 3pt;"><form id="deleteSepForm" action="/member/rent/deleteWishList" method="post">
                        <input type="hidden" name="w_id" value="${wishInfo.w_id}">
                        <input type="button" id="delbtn" class="deleteWish" onclick="deleteWish();" value="Χ"></input>
 						</form></div></div></div>
                     
                  <!-- 이미지 -->
                  <figure class="block-4-image">
                   
                                       <div class="imgbox" style="padding :0;"><a href="/member/pro/productDetail/${wishInfo.w_pid}">  
    <div id="recipeCarousel" class="carousel slide" data-ride="carousel">
        <div class="carousel-inner">
            
            <div class="carousel-item row no-gutters active">
                <div class="float-left">
               		<img class="img-fluid" src="/resources/Images/product/${wishInfo.p_mainimg}">
                </div>              
            </div>
            
            <div class="carousel-item row no-gutters">
                <div class="float-left">
                	<img class="img-fluid" src="/resources/Images/product/${wishInfo.p_subimg}">
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

                        <div class="name"><a href="/member/pro/productDetail/${wishInfo.w_pid}" class="product-name">    
                        <span style="color: #505050; font-weight: bold;">[${wishInfo.p_category}]${wishInfo.p_name}</span>
                        </a></div>

</div>




               
                    <div class="price pr right" style="font-size: 11pt;">
<strong class="" style="text-decoration: line-through;">원가 : <fmt:formatNumber value="${wishInfo.p_price}" pattern="###,###,###" />원<br/></strong>
<fmt:parseNumber var="rentprice" value="${wishInfo.p_price*0.05}" integerOnly="true" />
<fmt:parseNumber var="buyprice" value="${wishInfo.p_price*0.95}" integerOnly="true" />
<div class="row">

<div id="rentp" class="col-md-6 col-xs-6 col-sm-6">
대여가<br><span style="font-weight: bold;"><fmt:formatNumber value="${rentprice }" pattern="###,###,###" />원</span>
</div>
<div id="buyp" class="col-md-6 col-xs-6 col-sm-6">
즉시구매가<br><span style="font-weight: bold;"><fmt:formatNumber value="${buyprice }" pattern="###,###,###" />원</span>
</div>
</div></div>
<br>

                   
                   <div class="button sel">
                   
                    	<div class="btngroup row" style="align-items: center;">

                    	 
                       
                        <div id="rentb" class="col-md-4" style="padding-left: 0; padding-right: 0;"><button id="button2" class="btn btn-outline-primary btn-sm btnrent" value="대여">대여</button></div>
                    
                        
                         <c:if test="${wishInfo.p_canbuy eq 0}">
                        <div id="buyb" class="col-md-4" style="padding-left: 0; padding-right: 0;"><button id="button2" class="btn btn-outline-primary btn-sm btnbuy" value="구매" style="margin-left: 2pt;" disabled="disabled">구매</button></div>
                        </c:if>
                        <c:if test="${wishInfo.p_canbuy ne 0}">
                        <div id="buyb" class="col-md-4" style="padding-left: 0; padding-right: 0;"><button id="button2" class="btn btn-outline-primary btn-sm btnbuy" value="구매" style="margin-left: 2pt;">구매</button></div>
                        </c:if>
               
                       <div id="cartb" class="col-md-4" style="padding-left: 1px; padding-right: 0;"><button id="button" class="btn btn-outline-primary btn-sm btncart" style="margin-left: 2pt; height: 43px;"><span class="fas fa-shopping-cart" style="font-size: 15pt;"></span></button>
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
                <div id="page" class="col-md-6">
                <ul class="btn-group pagination">
                   <c:if test="${pageMaker.prev }">
                      <li><a href='<c:url value="/member/rent/wishList${pageMaker.makeQuery(pageMaker.startPage-1)}"/>'>
                         <span style="font-weight: bold; color: #37474f;" >&nbsp;[이전]&nbsp;</span></a></li><span id="space" class="col-md-1"></span>
                   </c:if>
                   <c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="pageNum">
                      <c:if test="${pageNum eq pageMaker.cri.page}"><li><a href='<c:url 
                                        value="/member/rent/wishList${pageMaker.makeQuery(pageNum)}"/>'>
                      <span id="pagingCur" style="background-color: #7971ea; display:inline-block; height: 30px; width: 30px; 
                                        border-radius: 50%; font-weight: bold; color: white; padding : 3px; padding-right : 3px;">&nbsp;&nbsp;${pageNum}&nbsp;</span></a></li><span id="space" class="col-md-1"></span></c:if>
                      <c:if test="${pageNum ne pageMaker.cri.page}"><li>
                                  <a href='<c:url value="/member/rent/wishList${pageMaker.makeQuery(pageNum)}"/>'>
                      <span style="color: #37474f;">&nbsp;${pageNum}&nbsp;</span></a></li><span id="space" class="col-md-1"></span></c:if>
                      
                   </c:forEach>
                   <c:if test="${pageMaker.next && pageMaker.endPage >0 }">
                      <li><a href='<c:url value="/member/rent/wishList${pageMaker.makeQuery(pageNum)}/member/rent/wishList${pageMaker.makeQuery(pageMaker.endPage+1)}"/>'>
                         <span style="font-weight: bold; color: #37474f;">&nbsp;[다음]&nbsp;</span></a></li><span id="space" class="col-md-1"></span></a></li>
                   </c:if>
                </ul></div></div>
                </div>
           <!-- 페이징 end -->
<div>

               
               
               
                

      
                

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
           	<span style="margin-left: 3pt;"><input type="button" id="deleteWish" class="btn btn-outline-primary" onclick="wishcheckboxArr();" value="삭제하기"></input></span>
           	<input type="hidden" id="arrayParam" name="arrayParam"/>
           	</form>

        </div>
        </span>
      
<span style="float: right;">
 <div class="row allpro">
    
            <span>
            <form id="deleteAllForm" action="/member/rent/deleteWishAll" method="post">
            <input type="hidden" id="userID" name="userID" value="crystal"/>
            <span style="margin-left: 3pt;"><input type="button" id="deleteWish" class="btn btn-outline-primary deleteWishAll" value="위시리스트 비우기"></input></span>
            </form></span>
            </div>
     </span>  
                                
     </c:if>                         
        </div>
                             
</div>

<div class="col-md-3" style="text-align: center;" id="recommendBox">
<div id="usersee" class="block-4 border col-md-10 box" style="font-weight: bold;">${userInfo.m_id}님, 이런 상품은 어떠세요?<hr>
<c:forEach var="prowish" items="${wishProList}">
<div id="prowishline" class="row" style="margin-bottom: 1pt; cursor: pointer;" onclick="window.location='/member/pro/productDetail/${prowish.p_id}'">
<div class="col-md-6">
<a><img class="wishimg" src="/resources/Images/product/${prowish.p_mainImg}"></a>
</div>
<div class="col-md-6" style="font-weight: bold; font-size: 8pt; margin-top: 8pt;">
[${prowish.p_category}]<br>${prowish.p_name}</div></div>
<hr>
</c:forEach>
<a href="/member/pro/productList?keyword=${maxcate}" >더보기</a>

</div></div></div>
</div>

</div></div>

    </div>    
<%@ include file="/WEB-INF/views/customerFooter.jsp" %></div>
<script type="text/javascript">


$(function(){
   $('#rentdate').datepicker();
})
 $('#rentdate').datepicker({
	        dateFormat: 'yy-mm-dd' //달력 날짜 형태
	        ,showOtherMonths: true //빈 공간에 현재월의 앞뒤월의 날짜를 표시
	        ,showMonthAfterYear:true // 월- 년 순서가아닌 년도 - 월 순서
	        ,changeYear: true //option값 년 선택 가능
	        ,changeMonth: true //option값  월 선택 가능                
	        ,showOn: "both" //button:버튼을 표시하고,버튼을 눌러야만 달력 표시 ^ both:버튼을 표시하고,버튼을 누르거나 input을 클릭하면 달력 표시  
	        ,buttonImage: "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif" //버튼 이미지 경로
	        ,buttonImageOnly: true //버튼 이미지만 깔끔하게 보이게함
	        ,buttonText: "선택" //버튼 호버 텍스트              
	        ,yearSuffix: "년" //달력의 년도 부분 뒤 텍스트
	        ,monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 텍스트
	        ,monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 Tooltip
	        ,dayNamesMin: ['일','월','화','수','목','금','토'] //달력의 요일 텍스트
	        ,dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'] //달력의 요일 Tooltip
	        ,minDate: "-0D" //최소 선택일자(-1D:하루전, -1M:한달전, -1Y:일년전)
	        ,maxDate: "+1M" //최대 선택일자(+1D:하루후, -1M:한달후, -1Y:일년후)  
	 		,showButtonPanel: true
	 		,currentText: '오늘 날짜'
	 		,closeText: '닫기'
	 		,nextText:"다음"
	 		,prevText:"이전"
	 	
	    });      




$(document).ready(function() {
	$('#myCarousel').carousel('cycle');
	$('#myCarousel2').carousel('cycle');
});


	


function deleteWish(){
	action_popup.confirm("해당 상품을 위시리스트에서 삭제하시겠습니까?",function(res){
		if(res){
			action_popup.alert("상품이 위시리스트에서 삭제되었습니다!");
			 $("#modal_close").on("click", function () {
				 $("#deleteSepForm").submit();
			    });
			
		}else{
			 event.preventDefault();
		       event.stopPropagation();
		}
	})
}



$('.deleteWishAll').click(function() {
	action_popup.confirm("위시리스트를 모두 비우시겠습니까?",function(res){
		if(res){
			action_popup.alert("위시리스트를 모두 비웠습니다!");
			 $("#modal_close").on("click", function () {
				 $("#deleteAllForm").submit();
			    });
		
	  }else{   
		 event.preventDefault();
       event.stopPropagation();

	  }	
})
});


function wishcheckboxArr() { 
	var array = new Array(); // 배열 선언
	$('input:checkbox[name=RowCheck]:checked').each(function() { // 체크된 체크박스의 value 값을 가지고 온다.	    
		array.push(this.value);
	});
				
	$("#arrayParam").val(array);
	
	action_popup.confirm("선택한 상품들을 위시리스트에서 삭제하시겠습니까?",function(res){
		if(res){
			action_popup.alert("선택한 상품들이 위시리스트에서 삭제되었습니다!");
			 $("#modal_close").on("click", function () {
				 $("#form").attr("action", "/member/rent/deleteWishList2");  
					$("#form").submit();
			    });
		
	  }else{   
		 event.preventDefault();
     event.stopPropagation();

	  };	
});
};



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
var proImgList=document.querySelectorAll("#proImg");


for(var i=0; i < btnrentLength; i++){
	btnrentList[i].addEventListener("click",open)};
for(var i=0; i < btnrentLength; i++){
		btnbuyList[i].addEventListener("click",open)};
for(var i=0; i < btnrentLength; i++){
		btncartList[i].addEventListener("click",open)};

		function open(e) {
			//rental table
			var rentalIdNowList=document.querySelectorAll("#rentalIdNow");
			var rentalIdNowListLength = rentalIdNowList.length;
			var rentaldateNowList=document.querySelectorAll("#rentaldateNow");
			var rentalamountNowList=document.querySelectorAll("#rentalamountNow");
			var cartProId=document.querySelectorAll("#cartProId");
			var cartProState=document.querySelectorAll("#cartProState");
			var cartListLength = cartProId.length;
			
			for(var i=0; i< btnrentLength;i++){
			//대여버튼
			if(e.target==btnrentList[i]){
						
						
			document.querySelector(".modal").classList.remove('hidden');
			document.getElementById("productName").innerText='['+proCategoryList[i].value+']'+proNameList[i].value;
			document.getElementById("productId").value=proIdList[i].value;
				document.getElementById("buyType").value="대여";
				document.getElementById("buyType").setAttribute('disabled','disabled');
				document.getElementById("rentdate").value=new Date().toISOString().substring(0, 10);
				document.getElementById("rentdate").setAttribute('min',new Date().toISOString().substring(0, 10));
				document.getElementById("rentdate").setAttribute('type','text');
				document.getElementById("rdate").classList.remove('hidden');
				document.getElementById("productImg").setAttribute('src','/resources/Images/product/'+proImgList[i].value);
				
				var price=(proPriceList[i].value)*0.05;	
				var canRental=0;
				var count=0;
					var rentd=new Date();
					rentd.setDate(rentd.getDate() + 2);
				for(var k=0;k<rentalIdNowListLength;k++){
					var rentdatenow=new Date(rentaldateNowList[k].value);
				if(document.getElementById("productId").value==rentalIdNowList[k].value && rentd<rentdatenow){
					count+=rentalamountNowList[k].value*1
					}
				}
				canRental=rentamountList[i].value*1+count;
				if(canRental<=0){
					document.getElementById("proamount").disabled=true;
					document.getElementById("keepgo").disabled=true;
					
				}else{
					document.getElementById("proamount").disabled=false;
					document.getElementById("keepgo").disabled=false;
					document.getElementById("proamount").setAttribute('max',canRental);
					document.getElementById("proamount").value=1;
					
				}
				document.getElementById("proamount").addEventListener("input",changeprice);
				document.getElementById("proamount").addEventListener("change",checkDisabled);
				document.getElementById("productPrice").value=proPriceList[i].value*0.05;
				document.getElementById("keepgo").value="대여";
				document.getElementById("keepgo").addEventListener("click",giveData);
				var arrayDay= new Array();
				
				//남은 수량 구하기
				var rentamount = rentamountList[i].value;
				$("#rentdate").change(function (e){
					var canRental=0;
					if(e.target==document.getElementById("rentdate")){
						var count=0;
						for(var k=0;k<rentalIdNowListLength;k++){
							var rentd=new Date(document.getElementById("rentdate").value);
							rentd.setDate(rentd.getDate() + 2);
							var rentd2=new Date(document.getElementById("rentdate").value);
							rentd2.setDate(rentd2.getDate() - 2);
							var rentdatenow=new Date(rentaldateNowList[k].value);
						if(document.getElementById("productId").value==rentalIdNowList[k].value && (rentd<rentdatenow|| rentd2>rentdatenow)){
							count+=rentalamountNowList[k].value*1
							}
						}
						canRental=rentamount*1+count;
						if(canRental<=0){
							document.getElementById("proamount").disabled=true;
							document.getElementById("keepgo").disabled=true;
							
						}else{
							document.getElementById("proamount").disabled=false;
							document.getElementById("keepgo").disabled=false;
							document.getElementById("proamount").setAttribute('max',canRental);
							document.getElementById("proamount").value=1;
							
						}
						
				}	
		});	
				//남은 수량 구하기 끝
				
				
				
				function changeprice(ev){
					document.getElementById("productPrice").value=(document.getElementById("proamount").value)*price;
				};	
				
				function giveData(){
					action_popup.confirm("대여 결제를 진행하시겠습니까?",function(res){
						if(res){
							document.getElementById("buyType").removeAttribute('disabled');
							$("#buyform").attr("action", "/member/rent/buy");  
							$("#buyform").submit();
							
						}else{
							 return;
							 event.preventDefault();
						       event.stopPropagation();
						}
					})
				};
					
					
					
				
				function checkDisabled(){
					var amount=document.getElementById("proamount").value;
					arrayDay=[];
					var today=new Date();
					var now = new Date();
					var monthLater=new Date(now.setMonth(now.getMonth() + 1));
					while(today<=monthLater){
						var count=0;
						var canRental=0;
						var d=new Date(today);
						d.setDate(d.getDate() + 2);
				
					for(var k=0;k<rentalIdNowListLength;k++){
						var rentdatenow=new Date(rentaldateNowList[k].value);
					if(document.getElementById("productId").value==rentalIdNowList[k].value && d<rentdatenow){
						count+=rentalamountNowList[k].value*1
						}
					}
				canRental=rentamount*1+count;
					if(canRental<amount){
						arrayDay.push(today);
					}				
					today.setDate(today.getDate() + 1);
				}
					return arrayDay;	
				};
				
				
				$("#rentdate").datepicker({
					  beforeShowDay: function disableAllTheseDays(date) {

						    var m = date.getMonth(), d = date.getDate(), y = date.getFullYear();
						    for (i = 0; i < arrayDay.length; i++) {
						        if($.inArray(y + '-' +(m+1) + '-' + d,arrayDay) != -1) {
						            return [false];
						        }
						    
						    return [true];
						}}
					});
				
				
				
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
				$("#rentdate").datepicker("option","showOn","text");
				
				document.getElementById("productPrice").value=proPriceList[i].value*0.95;
				document.getElementById("proamount").addEventListener("input",changeprice);
				document.getElementById("keepgo").value="구매";
				document.getElementById("keepgo").addEventListener("click",giveData);
				document.getElementById("productImg").setAttribute('src','/resources/Images/product/'+proImgList[i].value);
					var price=proPriceList[i].value*0.95;
				function changeprice(ev){
					document.getElementById("productPrice").value=(document.getElementById("proamount").value)*price;
				}			
				
				function giveData(){
					action_popup.confirm("구매 결제를 진행하시겠습니까?",function(res){
						if(res){
							document.getElementById("buyType").removeAttribute('disabled');
							$("#buyform").attr("action", "/member/rent/buy");  
							$("#buyform").submit();
							
						}else{
							 return;
							 event.preventDefault();
						       event.stopPropagation();
						}
					})
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
				document.getElementById("rentdate").setAttribute('readonly',true);
				document.getElementById("keepgo").value="장바구니";
				document.getElementById("keepgo").addEventListener("click",giveData);
				document.getElementById("productImg").setAttribute('src','/resources/Images/product/'+proImgList[i].value);
				$("#rentdate").datepicker("option","showOn","text");
				
				if(buyamount==0){
					$("#buyType option[value*='구매']").prop('disabled',true);
				}
				function giveData(){
						document.getElementById("buyType").removeAttribute('disabled');
						if(document.getElementById("buyType").value=="선택"){
							action_popup.alert('옵션을 선택하세요!');
							event.preventDefault();
					    	 event.stopPropagation();

						}
						else{
							
							action_popup.confirm("장바구니에 넣으시겠습니까?",function(res){
								if(res){
									var count=0;
									for(var k=0;k<cartListLength;k++){
										if(document.getElementById("productId").value==cartProId[k].value && document.getElementById("buyType").value==cartProState[k].value){
										count++;
										}
										
									}
									if(count>0){
									
									action_popup.alert("해당 옵션의 해당 상품이 이미 존재합니다!");
									}else{
										 event.stopPropagation();
									action_popup.confirm2("장바구니에 담겼습니다. 장바구니를 확인해보시겠습니까?", function(r){
										
										if(r){	
									$("#buyform").attr("action", "/member/rent/wishToCart");  
									$("#buyform").submit();
										}

									})
									}
									
								}else{
									 $("#buyType option[value*='대여']").removeAttr('disabled');
									  $("#buyType option[value*='구매']").removeAttr('disabled');
									 event.preventDefault();
							    	 event.stopPropagation();
								}
							})
						}
				};
				$("#modal_close2").on("click", function () {
					$("#buyform").attr("action", "/member/rent/wishToCart2");  
					$("#buyform").submit();
					    });
				function changestate(){
						if(document.getElementById("buyType").value=="대여"){
							document.getElementById("proamount").setAttribute('max',rentamount);
							document.getElementById("productPrice").value=rentprice;
							document.getElementById("proamount").addEventListener("input",changeprice);
							document.getElementById("rentdate").setAttribute('type','text');
							document.getElementById("rentdate").removeAttribute('readonly');
							document.getElementById("rentdate").value=new Date().toISOString().substring(0, 10);
							$("#rentdate").datepicker("option","showOn","both");
							
							var canRental=0;
							var count=0;
								var rentd=new Date();
								rentd.setDate(rentd.getDate() + 2);
							for(var k=0;k<rentalIdNowListLength;k++){
								var rentdatenow=new Date(rentaldateNowList[k].value);
							if(document.getElementById("productId").value==rentalIdNowList[k].value && rentd<rentdatenow){
								count+=rentalamountNowList[k].value*1
								}
							}
							
							canRental=rentamount*1+count;
							document.getElementById("proamount").setAttribute('max',canRental);
					
		
							function changeprice(){
								document.getElementById("productPrice").value=(document.getElementById("proamount").value)*rentprice;
							};	
							
							//남은 수량 구하기
							
							$("#rentdate").change(function (e){
								
								var canRental=0;
								if(e.target==document.getElementById("rentdate")){
									var count=0;
									for(var k=0;k<rentalIdNowListLength;k++){
										var rentd=new Date(document.getElementById("rentdate").value);
										rentd.setDate(rentd.getDate() + 2);
										var rentdatenow=new Date(rentaldateNowList[k].value);
									if(document.getElementById("productId").value==rentalIdNowList[k].value && rentd<rentdatenow){
										count+=rentalamountNowList[k].value*1
										}
									}

									canRental=rentamount*1+count;
									document.getElementById("proamount").setAttribute('max',canRental);
									document.getElementById("proamount").value=1;
							}	
					});	
							
						
							//남은 수량 구하기 끝
							
							
							
							
						}
						
						if(document.getElementById("buyType").value=="구매"){
								
							document.getElementById("proamount").setAttribute('max',buyamount);
							document.getElementById("rentdate").value=new Date().toISOString().substring(0, 10);
							document.getElementById("rentdate").setAttribute('readonly',true);
							$("#rentdate").datepicker("option","showOn","text");
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
		
		
		document.querySelector(".close").addEventListener("click",close);
		function close(){
			action_popup.confirm("진행창을 닫으시겠습니까?",function(res){
				if(res){
				$("#buyType option[value*='대여']").removeAttr('disabled');
			  $("#buyType option[value*='구매']").removeAttr('disabled');
			  $("#buyType").removeAttr('disabled');
			  document.getElementById("buyType").value="선택";
			  document.getElementById("proamount").value="1";
			  document.getElementById("productPrice").value=0;  
			  document.querySelector(".modal").classList.add('hidden');
				location.reload();

			}
			else{
				 event.preventDefault();
		    	 event.stopPropagation();
			}
		})
		};
		
		

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
		    confirm2: function (txt, callback) {
		        if (txt == null || txt.trim() == "") {
		            console.warn("confirm message is empty.");
		            return;
		        } else if (callback == null || typeof callback != 'function') {
		            console.warn("callback is null or not function.");
		            return;
		        } else {
		            $(".type-confirm2 .btn_ok2").on("click", function () {
		                $(this).unbind("click");
		                callback(true);
		                action_popup.close(this);
		            });
		            this.open("type-confirm2", txt);
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
		        var modal = $(target).closest(".modac-section");
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
		
		 $("#modal_close").on("click", function () {
		        action_popup.close(this);
		    });
		

</script>
</body>
</html>