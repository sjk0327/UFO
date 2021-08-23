<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
  <head>
    <title>UFO</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

  	


  <style>
	img{
	border-radius: 15px;
	}
	textarea {
	border: none;
	font-size: 1em;
	background-color:transparent;
	}
	 input {
    border: none;
    outline:none;
    text-align: right;
    
    }
	#amount {
	text-align: center;
	}

	select {    
	border: none; 
    outline:none;
    text-align-last: center;	
	}
	
	.img-with-text {
    text-align: justify;
    width: 700px;
	}

	.img-with-text img {
    display: block;
    margin: 0 auto;
    }
    
    ul li {
     margin-top:50px;
     text-align: center;
 	 padding: 0;
    }     
     
    #buttonGroup{
    text-align: right;
    }
    
    .mainContainer{
	 margin:auto;	
	}
	
	a {
	cursor:pointer;
	}
	
	.icon-heart-o, .icon-heart{
	font-size: 50px;
	color: red;
	
	}
	#info div {
	margin-top: 5px;}
	
	#like-o, #like {
	cursor: pointer;
	}
	#recommendation input{
	font-size: 30pt;
	text-align:left;
	}
	.profile img{ 
	height: 60px;
	  max-width: 60px;
	  min-width: 60px;
	  display: block;
	border-radius: 30px; 
	}
	.imgIdDate {
	margin-bottom :20px;
	}
	.reviewContent textarea {
	width:100%; 
	resize: none; 
	overflow-y: hidden;
	}
	.wrap textarea {
      width: 100%;
      height:auto;
      resize: none;
      overflow-y: hidden; /* prevents scroll bar flash */
      padding: 1.1em; /* prevents text jump on Enter keypress */
      padding-bottom: 0.2em;
      line-height: 1.6;
    }


* {padding: 0;margin: 0;}
body, html {height: 100%;}
.modal .btn{cursor: pointer;border: 1px solid #999999;text-align: center;border-radius: 5px;outline: none;font-weight: 500;}
.dimLayer{display: block;width: 100%;background-color: rgba(0, 0, 0, 0.3);position: fixed;left: 0;top: 0px;margin: 0;padding: 0;z-index: 9998;}
.mocdal{width: 500px;height: 252px;border-radius: 10px;padding: 80px 24px;box-sizing: border-box;text-align: center; }
.modal-section{background: #ffffff;box-sizing: border-box;display: none;position: fixed;top: 50%;left: 50%;-webkit-transform: translate(-50%, -50%);-ms-transform: translate(-50%, -50%);-moz-transform: translate(-50%, -50%);-o-transform: translate(-50%, -50%);transform: translate(-50%, -50%);display: none;z-index: 9999;}
.menu_msg{font-size: 21px;font-weight: 500;}
.enroll_box p{padding-bottom: 56px;}
.gray_btn {width: 90px;background: #ffffff;color: #999999;height: 36px;line-height: 36px;transition: 0.5s;font-size: 17px;}
.pink_btn {width: 90px;background: #ed197a;color: #fff;height: 36px;line-height: 36px;transition: 0.5s;font-size: 17px;border: none;}







	
  </style>
    <%@ include file="/WEB-INF/views/customerHeader.jsp" %>
    
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
 	 <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
 	 <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
 	 <link rel="stylesheet" href="/resources/demos/style.css">
 	 <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>   
  </head>

  <body>

  <div class="site-wrap">
 
    <div class="site-section">
      <div class="container">
        <div class="row">
          <div class="col-md-5 mainContainer"><span>
            <img src=/resources/Images/product/${productVO.p_mainImg} alt="${productVO.p_mainImg}" title="${productVO.p_mainImg}" width="500px" height="500px" class="img-fluid">
          </div> 
          
          <div class="col-md-1 mmodal">
          <!-- 모달창 구현 -->
	 <!-- confirm 모달을 쓸 페이지에 추가 start-->
        <section class="mocdal modal-section type-confirm">
            <div class="enroll_box">
                <p class="menu_msg"></p>
            </div>
            <div class="enroll_btn">
                <button class="btn pink_btn btn_ok">확인</button>
                <button class="btn gray_btn modal_close">취소</button>
            </div>
        </section>
        <!-- confirm 모달을 쓸 페이지에 추가 end-->

        <!-- alert 모달을 쓸 페이지에 추가 start-->
        <section class="mocdal modal-section type-alert">
            <div class="enroll_box">
                <p class="menu_msg"></p>
            </div>
            <div class="enroll_btn">
                <button class="btn pink_btn modal_close">확인</button>
            </div>
        </section>
        <!-- alert 모달을 쓸 페이지에 추가 end-->
          </div>
          
          <div class="col-md-6" id="info">
   <form:form name="form" method="post" action="/member/rent/buy" modelAttribute="buyInfoVO">
            <form:input path="productId" id="p_id" value="${productVO.p_id}" hidden="true"/>
            <form:input path="productImg" id="productImg" value="${productVO.p_mainImg}" hidden="true"/>
            <input name="p_id" id="p_id" value="${productVO.p_id}" hidden="true"/>
            <h2 class="text-black site-top-icons">${productVO.p_name}</h2><hr>
      
      		
      
      
      
      
      
      <div class="row">     
       <div class="col-lg-6 sm-6" id="recommendation">     
          <c:if test = "${recommendVO eq null}">   
       <a id="like"><img src=/resources/Images/product/like1.jpg id="like-o" class="like-o" width="50" height="50" onclick= 'like();'/></a>
          </c:if>
           <c:if test = "${recommendVO ne null}">  	 
		<a id="like"><img src=/resources/Images/product/like2.jpg id="like" class="like" width="50" height="50" onclick= 'like();'/></a>      
		   </c:if>
		   <input id='recommendCount' name='recommendCount' value="${recommendCount}" readonly size="1">
	   </div>
	<div class="col-lg-6 sm-6 id="wishList" align="right">     
 	<c:if test = "${wishListVO eq null}">
	<a id="wish"><span class="icon icon-heart-o"></span></a> 
	</c:if>
 	<c:if test = "${wishListVO ne null}">
 	<a id="wish"><span class="icon icon-heart"></span></a>
	</c:if> 
	</div>
	</div>
<form:input type="text" path="productPrice" value="${productVO.p_price}" hidden="true"/> 
<div class="row"><div class="col-lg-5"><label>제품가격</label></div><div class="col-lg-7" style="text-align:right;" ><fmt:formatNumber value="${productVO.p_price}" pattern="###,###,###" />원</div></div>            
<div class="row"><div class="col-lg-5"><label>대여금액</label></div><div class="col-lg-7" style="text-align:right;" ><fmt:formatNumber value="${productVO.p_price *0.05}" pattern="###,###,###" />원</div></div>                
 <div class="row"><div class="col-lg-5"><label for="amount">수량</labeL></div><div class="col-lg-7" style="text-align:right;"><input type=hidden name="sell_price" value="${productVO.p_price}"/><input type=hidden name="rent_price" value="${productVO.p_price * 0.05}"/>
<input type="button" class="btn btn-outline-primary js-btn-plus" value=" - " onclick="del();"/><input type="text" id="amount" name="proamount" value="1" size="2"  required="required" readonly="readonly" onchange="change();"/><input class="btn btn-outline-primary js-btn-plus" type="button"  value=" + " onclick="add();"></div></div>
<div class="row"><div class="col-lg-5"><label>옵션선택</label></div><div class="col-lg-7" style="text-align:right;" >
  <select id="buyType" name="buyType" onchange="changeStateSelect()">
  	<option value="optSel">옵션</option>
  	<option disabled>------</option>
  	<option value="구매">구매</option>
  	<option id="rent" value="대여">대여</option>
  	
  </select>
  </div></div>
 <div class="row"><div class="col-lg-4" id="selectDate"><label id="choice" for="datepicker" >대여일선택</labeL></div><div class="col-lg-8" style="text-align:right;"><input type="text" name="rentdate"  readonly="readonly" required="required" placeholder="날짜를 선택해주세요" id="datepicker" hidden="false"></div></div>

 <div class="row"><div class="col-lg-5"><label>배송방법</label></div><div class="col-lg-7" style="text-align:right;" >택배</div></div>
  <div class="row"><div class="col-lg-5"><label>배송비</label></div><div class="col-lg-7" style="text-align:right;">2500원</div></div><hr>   
 <div class="row"><div class="col-lg-5"><label></label></div><div class="col-lg-7" style="text-align:right;">총액</div></div><hr>
<div class="row"><div class="col-lg-5"><label>구매가격</label></div><div class="col-lg-7" style="text-align:right;"><input type="text" name="buysum" size="11" readonly/>원</div></div>
<div class="row"><div class="col-lg-5"><label>대여가격</label></div><div class="col-lg-7" style="text-align:right;"><input type="text" name="rentsum" size="11" readonly/>원</div></div>
  
               
            <div id="buttonGroup" >
             <input type="button" id="cart" value="장바구니" class="buy-now btn btn-sm btn-primary"/>
			<input type="button" value="결제" onclick="payment();" class="buy-now btn btn-sm btn-primary"/>			
			</div>
			
			
			

			
			
   </form:form>

          </div>
        </div>
      </div>
    </div>
    
    
    <div class="site-section block-3 site-blocks-2 bg-light">
     
      <div class="container ">
      <ul class="nav nav-tabs centered">
  <li class="nav-item">
    <a class="nav-link active" href="#productInfo">상세정보</a>
  </li>
  <li class="nav-item">
    <a class="nav-link" href="#reviewTop">리뷰게시판</a>
  </li>
 
</ul>
        <div class="row justify-content-center">
          <div class="col-lg-12 col-sm-12 subContainer" style="text-align:center;">
           <img src=/resources/Images/product/${productVO.p_subImg} width="700px" height="70%" 	 		
							alt="${ productVO.p_subImg }" title="${ productVO.p_subImg }" class="img-fluid thumbnailSub img-with-text">	
		  <div class="wrap"><textarea disabled>${ productVO.p_content }</textarea></div>
		  <!--  <pre><div style="text-align:center;">${ productVO.p_content }</div></pre>	-->
		  </div>
						  
          </div>
      
   
                
         <div class="site-section">
         
    	<div name="sortReview" >
    	<nav class="navbar navbar-expand-sm bg-light navbar-light">
  <ul class="navbar-nav">
    <li class="nav-item active">
      <a class="nav-link" href="#">최신순</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" href="#">추천높은순</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" href="#">추천낮은순</a>
    </li>
  </ul>
</nav>
    	</div>
    	
      <div class="container" id="reviewTop"> 
        <div class="row mb-5">
          <div class="col-md-12 order-2">
       
         
            <c:forEach var="recVO" items="${recVO}" begin="0" end="10" step="1" varStatus="status">                             
                <hr>
                <div class="row imgIdDate" name="imgIdDate">
                 
                	<div class="col-2 profile" align="center">  
                	 <img src = /resources/Images/member/${recVO.m_img} alt="${recVO.m_img}" title="${recVO.m_img}" class="img-fluid img-circle">         
                	</div> 
                	<div class="col-10">
                	 <div>${recVO.v_mid}</div>
                	 <div>${recVO.v_date}</div>
                	</div>      		
                	                      
                </div>
 
                <div class="row" name="content">
                 <div class="col-12 reviewContent">
                <textarea disabled>${recVO.v_content}</textarea>
                 </div>
                </div>
                
                <!--  
                <div  class="block-4 text-center border">
                  <figure class="block-4-image">
                    <a href="/member/pro/productDetail/${reviewList.v_pid}"><img src="/resources/img/iPad.jpg" alt="상품 사진" class="img-fluid"></a>
                  </figure>
                  <div class="block-4-text p-4">
                    <p> 상품코드  : <a href="/member/pro/productDetail/${reviewList.v_id}">${reviewList.v_mid}</a></p>
                    <p class="mb-0">${reviewList.v_pid}</p>
                    <p class="text-primary font-weight-bold" >${reviewList.v_content}</p>
                     </div>
                </div>  
                -->          
             </c:forEach> 
                <!-- 페이징 start -->
										<div id = "paging-div">
										<ul class="btn-group pagination">
											<c:if test="${pageMaker.prev }">
												<li><a href='<c:url value="/member/pro/productDetail${pageMaker.makeQuery(pageMaker.startPage-1)}"/>'>
													<span style="font-weight: bold;">&nbsp;[이전]&nbsp;</span></a></li><span class="col-md-1"></span>
											</c:if>
											<c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="pageNum">
												<c:if test="${pageNum eq pageMaker.cri.page}"><li><a href='<c:url value="/member/pro/productDetail${pageMaker.makeQuery(pageNum)}"/>'>
												<span id="pagingCur" style="background-color: #7971ea; display:inline-block; height: 30px; width: 30px; border-radius: 50%; font-weight: bold; color: white; padding : 5px;">&nbsp;${pageNum}&nbsp;</span></a></li><span class="col-md-1"></span></c:if>
												<c:if test="${pageNum ne pageMaker.cri.page}"><li><a href='<c:url value="/member/pro/productDetail${pageMaker.makeQuery(pageNum)}"/>'>
												<span>&nbsp;${pageNum}&nbsp;</span></a></li><span class="col-md-1">   </span></c:if>
												
											</c:forEach>
											<c:if test="${pageMaker.next && pageMaker.endPage >0 }">
												<li><a href='<c:url value="/member/pro/productDetail${pageMaker.makeQuery(pageMaker.endPage+1)}"/>'>
													<span style="font-weight: bold;">&nbsp;[다음]&nbsp;</span></a></li><span class="col-md-1"></span>
											</c:if>
										</ul>
										</div>
										<!-- 페이징 end -->
            
        

       


            </div>
          </div>
        </div>

    
        
      </div>
             
                
                
                
        </div> 
        <div style="text-align:center;"><button type="button" class="btn btn-primary" onclick='productList()'>목록</button>&nbsp;&nbsp;&nbsp;
      </div>
    </div>

    <%@ include file="/WEB-INF/views/customerFooter.jsp" %>
  </div>

	<script language="JavaScript">

//개수에 따라서 가격변동시키는거.
var sell_price;
var rent_price;
var amount;
var selectDate;
var stateSelect;
var selectValue;
var recommendCount;

window.onload = function() {
	sell_price = document.form.sell_price.value;
	rent_price = document.form.rent_price.value;
	amount = document.form.amount.value;
	document.form.buysum.value = sell_price;
	document.form.rentsum.value = rent_price;		
	change();	
	$('#datepicker').datepicker('setDate', 'today');	
	 $("#datepicker").datepicker({
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
	        ,maxDate: "-1M" //최대 선택일자(+1D:하루후, -1M:한달후, -1Y:일년후)  
	 		,showButtonPanel: true
	 		,currentText: '오늘 날짜'
	 		,closeText: '닫기'
	 		,nextText:"다음"
	 		,prevText:"이전"

	    });      
	 document.getElementById('datepicker').value = new Date().toISOString().substring(0, 10);	
document.getElementById("datepicker").removeAttribute('hidden');	
document.getElementById("choice").removeAttribute('hidden');



}

function add () {
	hm = document.form.amount;
	buysum = document.form.buysum;
	rentsum = document.form.rentsum;
	hm.value ++ ;

	sellprice= parseInt(hm.value) * sell_price;
	 buysum.value=sellprice.toLocaleString('ko-KR');
	rentprice= parseInt(hm.value) * rent_price;
	rentsum.value =rentprice.toLocaleString('ko-KR');
}

function del () {
	hm = document.form.amount;
	buysum = document.form.buysum;
	rentsum = document.form.rentsum;
		if (hm.value > 1) {
			hm.value -- ;
			sellprice= parseInt(hm.value) * sell_price;
			 buysum.value=sellprice.toLocaleString('ko-KR');
			rentprice= parseInt(hm.value) * rent_price;
			rentsum.value =rentprice.toLocaleString('ko-KR');
		}
		
}

function change () {
	hm = document.form.amount;
	buysum = document.form.buysum;
	rentsum = document.form.rentsum;
	rent_price = Math.floor(rent_price); //소수점버림
	
		if (hm.value < 0) {
			hm.value = 0;
		}		
		sellprice= parseInt(hm.value) * sell_price;
		 buysum.value=sellprice.toLocaleString('ko-KR');
		rentprice= parseInt(hm.value) * rent_price;
		rentsum.value =rentprice.toLocaleString('ko-KR');
		
  }//여기까지~~
  
//고객 상품목록으로가기
function productList() {
		location.href = '/member/pro/productList';		 
   }
  
function payment() {
	 stateSelect = document.getElementById("buyType"); 
	 selectValue = stateSelect.options[stateSelect.selectedIndex].value; 
	if (selectValue == "optSel") {
		action_popup.alert('옵션을 선택해주세요');
	} else { 
		
				action_popup.confirm('결제를 진행하시겠습니까?', function (res) {
        		if (res) {
        			document.form.submit();		
       		 } 
    		})
		
		
	}
}
//조아요
$('#like').on('click', function(){
	recommend = document.form.recommendCount;
    var form = {
    		  p_id      : $("#p_id").val()         
    }    
    if ($('img').is(".like-o") === true){
    $.ajax({
        url: "/member/recommendInsert/${productVO.p_id}",
        type: "POST",
        data: form,
        success: function(data){  
        	$('.like-o').attr('src','/resources/Images/product/like2.jpg'); 
        	$('.like-o').attr('class','like'); 
        	recommend.value ++;
 
        	 action_popup.alert('구독&조아요');
        	
        },
        error: function(){
            action_popup.alert("조아요 실패!");
        }				
    });                } else { 
   
      					 $.ajax({
         			 	 url: "/member/recommendDelete/${productVO.p_id}",
          				 type: "POST",
          				 data: form,
          				 success: function(data){     	
          					 },
          				 error: function(){
          					
          					$('.like').attr('src','/resources/Images/product/like1.jpg');
          					$('.like').attr('class','like-o');  
           				action_popup.alert("구독&좋아요 취소");
           				recommend.value --;
 	
          				 }
      					 });
    	
   						 }		
});

//ajax 위시리스트 추가
$('#wish').on('click', function(){
    var form = {
    		  p_id      : $("#p_id").val()
            , amount    : $("#amount").val()
    }    
    if ($('span').is(".icon-heart-o") === true){
    $.ajax({
        url: "/member/wishListInsert/${productVO.p_id}",
        type: "POST",
        data: form,
        success: function(data){   
        	$('.icon-heart-o').attr('class','icon-heart');
        	
        	
        	action_popup.confirm('WishList에 추가되었습니다.  확인해볼래요?', function (res) {
                if (res) {
                	location.href = '/customer/rent/wishList';
                }
            })
        },
        error: function(){
        	action_popup.alert("위시리스트추가 실패");
        }				
    });                } else{ 
    	 				
      
      				 $.ajax({
         			  url: "/member/wishListDelete/${productVO.p_id}",
          			 type: "POST",
          		 data: form,
          			 success: function(data){ 
           	
          		 },
          		 error: function(){
          			$('.icon-heart').attr('class','icon-heart-o');
          			action_popup.alert("위시리스트에서 삭제됐습니다");
   		
          		 }
      			 });
    	
   				 }		
});

//ajax 장바구니꺼
$('#cart').on('click', function(){
	
	var stateSelect = document.getElementById("buyType"); 
	var selectValue = stateSelect.options[stateSelect.selectedIndex].value; 
	if (selectValue == "optSel") {
		action_popup.alert("옵션을 선택하세요");
  } else  {										
	  		 
    var form = {
    		  p_id      : $("#p_id").val()
            , amount    : $("#amount").val()
            , c_date    : $("#datepicker").val()
            , c_state    : $("#buyType").val()
    }
    $.ajax({
        url: "/member/cartInsert/${productVO.p_id}",
        type: "POST",
        data: form,
        success: function(data){
        	
        	action_popup.confirm("장바구니에 추가됐습니다.  장바구니 볼라우?", function (res) {
                if (res) {
                	location.href = '/member/rent/cartList';
                }
            })
             
        	   	 
        },
        error: function(){
        	action_popup.alert("장바구니 추가 :실패!");

        }
    });   }  
});
//대여 선택했을 때 달력나오게하는거.
function changeStateSelect(){ 
	 stateSelect = document.getElementById("buyType"); 
	 selectValue = stateSelect.options[stateSelect.selectedIndex].value; 

	if (selectValue == "rent") {
		
		$('#datepicker').datepicker('setDate', 'today');	
		 $("#datepicker").datepicker({
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
		        ,maxDate: "+3y" //최대 선택일자(+1D:하루후, -1M:한달후, -1Y:일년후)  
		 		,showButtonPanel: true
		 		,currentText: '오늘 날짜'
		 		,closeText: '닫기'
		 		,nextText:"다음"
		 		,prevText:"이전"

		    });      	
		 $( "#datepicker" ).datepicker( "show" );
		 document.getElementById('datepicker').value = new Date().toISOString().substring(0, 10);	
		 document.getElementById("datepicker").removeAttribute('hidden');	
		document.getElementById("choice").removeAttribute('hidden');
	

	} 
}

$(function () {
    $(".modal_close").on("click", function () {
        action_popup.close(this);
    });

});

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



</script>
  
  





    
  </body>
</html>