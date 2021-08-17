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
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  	 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
 	 <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
 	 <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
 	 <link rel="stylesheet" href="/resources/demos/style.css">
 	 <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>


  <style>

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
	
  </style>
    <%@ include file="/WEB-INF/views/customerHeader.jsp" %>
  </head>
  <body>
  
  <div class="site-wrap">
    

  
    <div class="site-section">
      <div class="container">
        <div class="row">
          <div class="col-md-6 mainContainer"><span>
            <img src=/resources/Images/product/${productVO.p_mainImg} alt="${productVO.p_mainImg}" title="${productVO.p_mainImg}" width="500px" height="500px" class="img-fluid">
          </div>
          <div class="col-md-6" id="info">
   <form:form name="form" method="get" action="/member/rent/buy" modelAttribute="buyInfoVO">
            <form:input path="productId" id="p_id" value="${productVO.p_id}" hidden="true"/>
            
            <h2 class="text-black site-top-icons">${productVO.p_name}</h2><hr>
            
          <c:if test = "${recommendVO eq null}">   
       <a id="like"><img src=/resources/Images/product/like1.jpg id="like-o" class="like-o" width="50" height="50" onclick= 'like();'/></a>
          </c:if>
           <c:if test = "${recommendVO ne null}">  	 
		<a id="like"><img src=/resources/Images/product/like2.jpg id="like" class="like" width="50" height="50" onclick= 'like();'/></a>      
		   </c:if>

 <c:if test = "${wishListVO eq null}">
<a id="wish"><span class="icon icon-heart-o"></span></a> 
</c:if>
 <c:if test = "${wishListVO ne null}">
 <a id="wish"><span class="icon icon-heart"></span></a>
</c:if>
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
    <a class="nav-link" href="/member/recList">리뷰게시판</a>
  </li>
 
</ul>
        <div class="row justify-content-center">
          <div class="col-lg-12 col-sm-12 subContainer" style="text-align:center;">
           <img src=/resources/Images/product/${productVO.p_subImg} width="700px" height="70%" 	 		
							alt="${ productVO.p_subImg }" title="${ productVO.p_subImg }" class="img-fluid thumbnailSub img-with-text">	</div>
		<pre><div style="text-align:center;">${ productVO.p_content }</div></pre>					  
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
	        ,maxDate: "+3y" //최대 선택일자(+1D:하루후, -1M:한달후, -1Y:일년후)  
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
		alert('옵션을 선택해주세요');
	} else {
		document.form.submit();		
	}
}
//조아요
$('#like').on('click', function(){
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
        	alert('구독&조아요');
        },
        error: function(){
            alert("위시 추가:실패!");
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
           				alert("구독&좋아요 취소");
 	
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
        	
        	if (confirm('WishList에 추가되었습니다.\n\nWishList 확인해볼래요?')) {
    			location.href = '/customer/rent/wishList';
    		 }
        },
        error: function(){
            alert("위시 추가:실패!");
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
           				alert("위시리스트에서 삭제하였습니다");
   		
          		 }
      			 });
    	
   				 }		
});

//ajax 장바구니꺼
$('#cart').on('click', function(){
	var stateSelect = document.getElementById("buyType"); 
	var selectValue = stateSelect.options[stateSelect.selectedIndex].value; 
	if (selectValue == "optSel") {
		alert("옵션을 선택해주세요");
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
        	
        		if (confirm('추가되었습니다.\n\n장바구니로 갈래요?')) {
        			location.href = '/customer/rent/cartList';
        		 }
        	   	 
        },
        error: function(){
            alert("장바구니 추가 :실패!");
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


</script>
  
  





    
  </body>
</html>