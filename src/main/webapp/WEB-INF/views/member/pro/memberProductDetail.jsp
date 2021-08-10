<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <title>Shoppers &mdash; Colorlib e-Commerce Template</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Mukta:300,400,700"> 
    <link rel="stylesheet" href="fonts/icomoon/style.css">

    <link rel="stylesheet" href="/resources/common/css/bootstrap.min.css">
    <link rel="stylesheet" href="/resources/common/css/magnific-popup.css">
    <link rel="stylesheet" href="/resources/common/css/jquery-ui.css">
    <link rel="stylesheet" href="/resources/common/css/owl.carousel.min.css">
    <link rel="stylesheet" href="/resources/common/css/owl.theme.default.min.css">


    <link rel="stylesheet" href="/resources/common/css/aos.css">

    <link rel="stylesheet" href="/resources/common/css/style.css">
  
  <style>
	textarea {
	border: none;
	font-size: 1em;
	background-color:transparent;
	}
	 input {
    border:none;
    text-align: left;
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
    p{
      text-align: center;
    }
  
  
  </style>
    <%@ include file="/WEB-INF/views/customerHeader.jsp" %>
  </head>
  <body>
  
  <div class="site-wrap">
    

   

    <div class="site-section">
      <div class="container">
        <div class="row">
          <div class="col-md-6">
            <img src=/resources/Images/product/${productVO.p_mainImg} alt="${productVO.p_mainImg}" title="${productVO.p_mainImg}" width="500px" height="500px" class="img-fluid">
          </div>
          <div class="col-md-6">
   <form:form name="form" method="post" modelAttribute="productVO">
            <form:input path="p_id" value="${productVO.p_id}" hidden="true"/>
            <h2 class="text-black site-top-icons">${productVO.p_name}</h2><hr>
             
            <div class="row"><div class="col-lg-5"><label>판매가격</label></div><div class="col-lg-7" ><input type="text" name="buysum" size="11" readonly/>원</div></div>
			<div class="row"><div class="col-lg-5"><label>대여가격</label></div><div class="col-lg-7"><input type="text" name="rentsum" size="11" readonly/>원</div></div>
            
            
             
 <div class="row"><div class="col-lg-5"><label>수량</labeL></div><div class="col-lg-7"><input type=hidden name="sell_price" value="${productVO.p_price}"/><input type=hidden name="rent_price" value="${productVO.p_price * 0.05}"/>
<input type="button" value=" - " onclick="del();"/><input type="text" name="amount" value="1" size="3"  onchange="change();"/><input type="button" value=" + " onclick="add();"></div></div>
 <div class="row"><div class="col-lg-5"><label>배송방법</label></div><div class="col-lg-7" ><p>택배</p></div></div>
  <div class="row"><div class="col-lg-5"><label>배송비</label></div><div class="col-lg-7" ><p>5000원</p></div></div>                
            <div id="buttonGroup" >
            <a href="#" id="wish" class="buy-now btn btn-sm btn-primary" data-toggle="popover" data-placement="bottom" title="WishList" data-content="위시리스트에 추가되었습니다.">wishList</a>
			<input type="submit" value="Own" formaction="/member/buy" class="buy-now btn btn-sm btn-primary"/>
			<input type="submit" value="Use" formaction="/member/rent/rentInsert" class="buy-now btn btn-sm btn-primary"/>
			</div>
   </form:form>
			</div>
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
          <div class="col-lg-12 col-sm-12" style="text-align:center;">
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

window.onload = function() {
	sell_price = document.form.sell_price.value;
	rent_price = document.form.rent_price.value;
	amount = document.form.amount.value;
	document.form.buysum.value = sell_price;
	document.form.rentsum.value = rent_price;
	change();
}

function add () {
	hm = document.form.amount;
	buysum = document.form.buysum;
	rentsum = document.form.rentsum;
	hm.value ++ ;

	buysum.value = parseInt(hm.value) * sell_price;
	rentsum.value = parseInt(hm.value) * rent_price;
}

function del () {
	hm = document.form.amount;
	buysum = document.form.buysum;
	rentsum = document.form.rentsum;
		if (hm.value > 1) {
			hm.value -- ;
			buysum.value = parseInt(hm.value) * sell_price;		
			rentsum.value = parseInt(hm.value) * rent_price;	
		}
		
}

function change () {
	hm = document.form.amount;
	buysum = document.form.buysum;
	rentsum = document.form.rentsum;
		if (hm.value < 0) {
			hm.value = 0;
		}
		buysum.value = parseInt(hm.value) * sell_price;
		rentsum.value = parseInt(hm.value) * rent_price;
  }//여기까지~~
  
//고객 상품목록으로가기
function productList() {
		location.href = '/member/pro/productList';		 
   }
 
// 위시리스트 추가시 알림창.
$(document).ready(function(){
  $('[data-toggle="popover"]').popover(); 
 
});




</script>
	

  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
  <script src="/resources/common/js/jquery-3.3.1.min.js"></script>
  <script src="/resources/common/js/jquery-ui.js"></script>
  <script src="/resources/common/js/popper.min.js"></script>
  <script src="/resources/common/js/bootstrap.min.js"></script>
  <script src="/resources/common/js/owl.carousel.min.js"></script>
  <script src="/resources/common/js/jquery.magnific-popup.min.js"></script>
  <script src="/resources/common/js/aos.js"></script>

  <script src="/resources/common/js/main.js"></script>
    
  </body>
</html>