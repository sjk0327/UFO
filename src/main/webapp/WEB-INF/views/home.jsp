<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
 <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
 <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <title>UFO</title>
     <%@ include file="/WEB-INF/views/customerHeader.jsp" %>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- Favicon icon -->
<link rel="shortcut icon" type="image/x-icon" href="/resources/Images/ufo_purple_favi.ico" />
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Mukta:300,400,700"> 

  <script src="resources/common/js/jquery-3.3.1.min.js"></script>
  <script src="resources/common/js/jquery-ui.js"></script>
  <script src="resources/common/js/popper.min.js"></script>
  <script src="resources/common/js/bootstrap.min.js"></script>
  <script src="resources/common/js/owl.carousel.min.js"></script>
  <script src="resources/common/js/jquery.magnific-popup.min.js"></script>
  <script src="resources/common/js/aos.js"></script>
  <script src="resources/common/js/main.js"></script>
<!-- datepicker -->
<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<!-- datepicker 여기까지 -->    
    
    
    
    <style type="text/css">
    .item:hover{
    cursor: pointer;
 margin:0px ; border:2px solid #7971ea;
    
}

#kakao-talk-channel-chat-button{
position: fixed;
top : 670px;
right :30px;

}
.tab {
	list-style: none;
	margin: 0;
	padding: 0;
	overflow: hidden;
}
/* Float the list items side by side */
.tab li {
	float: left;
}
/* Style the links inside the list items */
.tab li a {
	display: inline-block;
	color: #000;
	text-align: center;
	text-decoration: none;
	padding: 9px 13px;
	font-size: 12px;
	transition:0.3s;
}
/* Style the tab content */
.tabcontent {
	display: none;
	background-color: rgb(246,246,246);
	padding: 6px -20px;
	color:#F6F6F6;
	text-align:left;
}
ul.tab li.current{
	background-color: rgb(246,246,246);
	color: #F6F6F6;
}
.tabcontent.current {
	display: block;
}

.small1 { width: 100px; height: 100px; }
.small2 { width: 80px; height: 80px; align:center;}
.mb-1 { font-size : 18px; }
.blackColoer { color : red;}
#searchType {
   width: 85px;
   height: 38px;
   padding-left: 8px;
   font-size: 13px;
   color: #585858;
   border-radius: 5px;
}
#slidemenu{background:#12cf3d;position:absolute;width:100px;top:50px;right:10px;}
#imghover:hover { margin:0px ; border:2px solid #888; }  
* {padding: 0;margin: 0;}
body, html {height: 100%;}
.modal .btn{;border: 1px solid #999999;text-align: center;border-radius: 5px;outline: none;font-weight: 500;}
.dimLayer{display: block;width: 100%;background-color: rgba(0, 0, 0, 0.3);position: fixed;left: 0;top: 0px;margin: 0;padding: 0;z-index: 9998;}
.modal{width: 600px;height: 252px;border-radius: 10px;padding: 80px 24px;box-sizing: border-box;text-align: center;}
.modal-section{background: #ffffff;box-sizing: border-box;display: none;position: absolute;top: 50%;left: 50%;-webkit-transform: translate(-50%, -50%);
-ms-transform: translate(-50%, -50%);-moz-transform: translate(-50%, -50%);-o-transform: translate(-50%, -50%);
transform: translate(-50%, -50%);display: none;z-index: 9999;}
.menu_msg{font-size: 21px;font-weight: 500;}
.enroll_box p{padding-bottom: 56px;}
.gray_btn {width: 90px;background: #ffffff;color: #999999;height: 36px;line-height: 36px;transition: 0.5s;font-size: 17px;}
.pink_btn {width: 90px;background: #7971ea;color: #fff;height: 36px;line-height: 36px;transition: 0.5s;font-size: 17px;border: none;}
#mainMenuList {text-align: center; width:100%; height:94px; background-color:#f4f4f4; padding-bottom: -15px;}
#mainMenuList ul {text-align: center; width:1200px; margin:0 auto; padding:-16px 0;}
#mainMenuList ul:after {content:""; display:block; clear:both;}
#mainMenuList ul li {float:left; height:120px; width:15%; text-align:center;}
#mainMenuList ul li p {padding:10px 0 12px 0; text-align:center; font-weight:700;}
#mainMenuList ul li a {display:block; font-size:18px; letter-spacing:-1px; font-weight:700;}
#mainMenuList ul li a:hover {color:#8A2BE2; text-decoration:none;}
#listClick:hover { border: solid 2px #4B0082; color:#f26617; }
ul{ list-style:none;}
.mb-1 {
  transform: scale(1);
  -webkit-transform: scale(1);
  -moz-transform: scale(1);
  -ms-transform: scale(1);
  -o-transform: scale(1);
  transition: all 0.5s ease-in-out;  /* 서서히 확대 */
}
.mb-1:hover {
  transform: scale(1.1);
  -webkit-transform: scale(1.1);
  -moz-transform: scale(1.1);
  -ms-transform: scale(1.1);
  -o-transform: scale(1.1);
}
.inp_division { font-weight:700; }
#margin { margin:20px; padding:80px; }
#minPrice { height: 32px; width: 81px; }
#maxPrice { height: 32px; width: 81px; }
#minPriceBuy{ height: 32px; width: 81px; }
#maxPriceBuy{ height: 32px; width: 81px; }
#selfminprice{ height: 32px; width: 81px; }
#selfmaxprice{ height: 32px; width: 81px; }
#priceSearch { height: 32px; width: 90px; font-size: 14px; text-align:"center"; }
#selfSearchRent { height: 32px; width: 90px; font-size: 14px; text-align:"center"; }
#selfSearchBuy { height: 32px; width: 90px; font-size: 14px; text-align:"center"; }
#priceSearchBuy { height: 32px; width: 90px; font-size: 14px; text-align:"center"; }
#selfSearch { height: 32px; width: 90px; font-size: 14px; text-align:"center"; }
#textdeco {text-decoration: line-through;}
    .site-navbar{
    position:sticky;
    top: 0px;
    }
    .js-logo-clone{
    
    font-size:50pt;
    }
    .site-navigation text-right text-md-center{
    padding : -50px;
    }
    </style>
  </head>
  <body>
  
  <div class="site-wrap">
  
    <header class="site-navbar" role="banner">
      <nav class="site-navigation text-right text-md-center" role="navigation" style="background-color:#f4f4f4;">
        <div class="container">
          <ul class="site-menu js-clone-nav d-none d-md-block">
            <li class="has-children">
              <div class="row">
          <div class="col-md-12">
            <div class="site-section site-blocks-2">
                <div class="row justify-content-center text-center mb-5">
                  <div class="col-md-7 site-section-heading pt-4">
                    <h2></h2>
                  </div>
                </div>
                <div class="container">
                 <div class="row">
                 <div class="col-md-12">
  <div id="mainMenuList" style="text-align:center;" >
	<ul>		
		<li class="mb-1"><a href="/member/pro/productList/" ><img src="/resources/common/images/total.png" /><p>전체리스트</p></a></li>
		<li class="mb-1"><a href="/member/pro/productList/스마트폰" ><img src="/resources/common/images/phone.png" /><p>스마트폰</p></a></li>
		<li class="mb-1"><a href="/member/pro/productList/노트북" ><img src="/resources/common/images/laptop.png" /><p>노트북</p></a></li>  
		<li class="mb-1"><a href="/member/pro/productList/카메라" ><img src="/resources/common/images/camera.png" /><p>카메라</p></a></li>  
		<li class="mb-1"><a href="/member/pro/productList/스마트워치" ><img src="/resources/common/images/watch.png" /><p>스마트워치</p></a></li>  
		<li class="mb-1"><a href="/member/pro/productList/태블릿" ><img src="/resources/common/images/tablet.png" /><p>태블릿PC</p></a></li>  		
  </ul>   
</div>
        </div>   </div>   </div>
            </div>
          </div>
        </div>
        
      </nav>
    </header>


    <div class="site-section site-section-sm site-blocks-1">
      <div class="container">
        <div class="row">
          <div class="col-md-6 col-lg-4 d-lg-flex mb-4 mb-lg-0 pl-4" data-aos="fade-up" data-aos-delay="">
            <div class="icon mr-4 align-self-start">
              <span class="icon-truck"></span>
            </div>
            <div class="text">
              <h2 class="text-uppercase">고객 맞춤 배송 서비스</h2>
              <p>당일 대여를 제외한 대여 상품은 대여 예약일 오전 9시까지 고객님께 배송해드립니다!</p>
            </div>
          </div>
          <div class="col-md-6 col-lg-4 d-lg-flex mb-4 mb-lg-0 pl-4" data-aos="fade-up" data-aos-delay="100">
            <div class="icon mr-4 align-self-start">
              <span class="icon-refresh2"></span>
            </div>
            <div class="text">
              <h2 class="text-uppercase">무료 환불 서비스</h2>
              <p>대여 서비스가 시작되지 않았거나 구매 당일에는 무료 환불이 가능합니다.</p>
            </div>
          </div>
          <div class="col-md-6 col-lg-4 d-lg-flex mb-4 mb-lg-0 pl-4" data-aos="fade-up" data-aos-delay="200">
            <div class="icon mr-4 align-self-start">
              <span class="icon-help"></span>
            </div>
            <div class="text">
              <h2 class="text-uppercase">고객 지원</h2>
              <p>카카오톡 상담톡에서 상담원이 평일 오전 9시부터 오후 6시까지 상시 대기 중이니 문의사항이 있을 시 언제든 상담톡 바랍니다.
              </p>
            </div>
          </div>
        </div>
      </div>
    </div>





       <div class="site-section block-3 site-blocks-2 bg-light">
      <div class="container">
        <div class="row justify-content-center">
          <div class="col-md-7 site-section-heading text-center pt-4">
            <h3 style="color: #25262a;">카테고리 별 최다 추천 상품</h3>
          </div>
        </div>
        <div class="row">
          <div class="col-md-12">
            <div class="nonloop-block-3 owl-carousel">
              <div class="item" onclick="location.href='/member/pro/productDetail/${smartphone.p_id}'">
                <div class="block-4 text-center" >
                  <figure class="block-4-image">
                    <img src="/resources/Images/product/${smartphone.p_mainImg}" alt="Image placeholder" class="img-fluid" style="width: 346.66px; height: 246.06px;">
                  </figure>
                  <div class="block-4-text p-4">
                    <h3><a style="color: #8c92a0; font-weight: bold;" href="#">${fn:substring(smartphone.p_name,0,15) }<br>${fn:substringAfter(smartphone.p_name,fn:substring(smartphone.p_name,0,15)) }</a></h3>
                  </div>
                    <p class="text-primary font-weight-bold" style="text-decoration: line-through;">원가 : <fmt:formatNumber value="${smartphone.p_price}" pattern="###,###,###" /></p>
                    <p class="text-primary font-weight-bold">대여가 : <fmt:formatNumber value="${smartphone.p_price*0.05}" pattern="###,###,###" />원&nbsp;/&nbsp;즉시구매가 : <fmt:formatNumber value="${smartphone.p_price*0.95}" pattern="###,###,###" /></p>
                </div>
              </div>
              <div class="item" onclick="location.href='/member/pro/productDetail/${notebook.p_id}'">
                <div class="block-4 text-center">
                  <figure class="block-4-image">
                    <img src="/resources/Images/product/${notebook.p_mainImg}" alt="Image placeholder" class="img-fluid" style="width: 346.66px; height: 246.06px;">
                  </figure>
                  <div class="block-4-text p-4">
                    <h3><a style="color: #8c92a0; font-weight: bold;" href="#">${fn:substring(notebook.p_name,0,15)}<br>${fn:substringAfter(notebook.p_name,fn:substring(notebook.p_name,0,15))}</a></h3>
                  </div>
                   
                    <p class="text-primary font-weight-bold" style="text-decoration: line-through;">원가 : <fmt:formatNumber value="${notebook.p_price}" pattern="###,###,###" /></p>
               <p class="text-primary font-weight-bold">대여가 : <fmt:formatNumber value="${notebook.p_price*0.05}" pattern="###,###,###" />원&nbsp;/&nbsp;즉시구매가 : <fmt:formatNumber value="${notebook.p_price*0.95}" pattern="###,###,###" /></p>
                </div>
              </div>
              <div class="item" onclick="location.href='/member/pro/productDetail/${camera.p_id}'">
                <div class="block-4 text-center">
                  <figure class="block-4-image">
                    <img src="/resources/Images/product/${camera.p_mainImg}" alt="Image placeholder" class="img-fluid" style="width: 346.66px; height: 246.06px;">
                  </figure>
                  <div class="block-4-text p-4">
                    <h3><a style="color: #8c92a0; font-weight: bold;" href="#">${fn:substring(camera.p_name,0,15)}<br>${fn:substringAfter(camera.p_name,fn:substring(camera.p_name,0,15))}</a></h3>
                  </div>
                    
                    <p class="text-primary font-weight-bold" style="text-decoration: line-through;">원가 : <fmt:formatNumber value="${camera.p_price}" pattern="###,###,###" /></p>
                    <p class="text-primary font-weight-bold">대여가 : <fmt:formatNumber value="${camera.p_price*0.05}" pattern="###,###,###" />원&nbsp;/&nbsp;즉시구매가 : <fmt:formatNumber value="${camera.p_price*0.95}" pattern="###,###,###" /></p>
                </div>
              </div>
              <div class="item" onclick="location.href='/member/pro/productDetail/${smartwatch.p_id}'">
                <div class="block-4 text-center">
                  <figure class="block-4-image">
                    <img src="/resources/Images/product/${smartwatch.p_mainImg}" alt="Image placeholder" class="img-fluid" style="width: 346.66px; height: 246.06px;">
                  </figure>
                  <div class="block-4-text p-4">
                    <h3><a style="color: #8c92a0; font-weight: bold;" href="#">${fn:substring(smartwatch.p_name,0,15)}<br>${fn:substringAfter(smartwatch.p_name,fn:substring(smartwatch.p_name,0,15))}</a></h3>
                  </div>
                   
                    <p class="text-primary font-weight-bold" style="text-decoration: line-through;">원가 : <fmt:formatNumber value="${smartwatch.p_price}" pattern="###,###,###" /></p>
                    <p class="text-primary font-weight-bold">대여가 : <fmt:formatNumber value="${smartwatch.p_price*0.05}" pattern="###,###,###" />원&nbsp;/&nbsp;즉시구매가 : <fmt:formatNumber value="${smartwatch.p_price*0.95}" pattern="###,###,###" /></p>
                </div>
              </div>
              <div class="item" onclick="location.href='/member/pro/productDetail/${tablet.p_id}'">
                <div class="block-4 text-center">
                  <figure class="block-4-image">
                    <img src="/resources/Images/product/${tablet.p_mainImg}" alt="Image placeholder" class="img-fluid" style="width: 346.66px; height: 246.06px;">
                  </figure>
                  <div class="block-4-text p-4">
                    <h3><a style="color: #8c92a0; font-weight: bold;" href="#">${fn:substring(tablet.p_name,0,15)}<br>${fn:substringAfter(tablet.p_name,fn:substring(tablet.p_name,0,15))}</a></h3>
                  </div>
                    
                    <p class="text-primary font-weight-bold" style="text-decoration: line-through;">원가 : <fmt:formatNumber value="${tablet.p_price}" pattern="###,###,###" /></p>
                    <p class="text-primary font-weight-bold">대여가 : <fmt:formatNumber value="${tablet.p_price*0.05}" pattern="###,###,###" />원&nbsp;/&nbsp;즉시구매가 : <fmt:formatNumber value="${tablet.p_price*0.95}" pattern="###,###,###" /></p>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
<br>
    <div class="site-section block-8">
           
          
            
      <div class="container">
        <div class="row justify-content-center  mb-5">
          <div class="col-md-7 site-section-heading text-center pt-4">
            <h2>Big Sale!</h2>
          </div>
        </div>
        <div class="row">
          <div class="col-md-12 col-lg-7 mb-5">
            <a href="#"><img src="resources/common/images/blog_1.jpg" alt="Image placeholder" class="img-fluid rounded"></a>
          </div>
          <div class="col-md-12 col-lg-5 text-center pl-md-5">
            <h2><a href="#">빠른 대여하기</a></h2>
             <form:form id="buyform" method="post" commandName="BuyInfoVO">
     <div style="float: left;">      
            카테고리 :  
      <select id="Category" onchange="chageCategory()">
      <option value="선택" disabled="disabled" selected="selected">선택해주세요</option>
      <option value="스마트폰">스마트폰</option>
      <option value="노트북">노트북</option>
      <option value="카메라">카메라</option>
      <option value="스마트워치">스마트워치</option>
      <option value="태블릿">태블릿</option>
      </select></div> 
      <div style="float: left; text-align: left;">상품명 : 
      <select id="Proname" style="width: 400px;" onchange="chageProname()">
    <option value="선택">카테고리를 먼저 선택해주세요!</option>
      </select></div>
      <br>
      <br>
      <br>
      <br>  
      <div style="text-align: left;">
     대여일자 : <input id="rentdate" name="rentdate" type="text" value="" onchange="chageDate()" style="width: 100px;" disabled="disabled"></div>
     <div style="text-align: left;">
    대여수량  : <input id="rentamount" name="proamount" type="number" value="0" min="0" max="0" style="width: 50px; margin-top : 8pt;"  onchange="chageAmount()"></div>
            <p class="post-meta mb-4" style="font-size: 15pt; color : #8c92a0;">결제 가격 &nbsp;<a href="#" id="totalprice" style="font-weight: bold; font-size: 15pt;">0</a><span class="block-8-sep" style="font-size: 15pt; color: #8c92a0;">원</span></p>
             <input type="hidden" id="buyType" name="buyType" value="대여">
        <input type="hidden" id="productId" name="productId" value="">
        <input id="productPrice" name="productPrice" type="hidden" value=""> </form:form>
            <p><input type="button" class="btn btn-primary btn-sm" onclick="purchase()" value="결제"></p>
        </div>
      </div>
    </div>
            

   
  </div>

         <div
  id="kakao-talk-channel-chat-button"
  data-channel-public-id="_xlGxlxcs"
  data-title="consult"
  data-size="large"
  data-color="yellow"
  data-shape="pc"
  data-support-multiple-densities="true"
></div>


    <%@ include file="/WEB-INF/views/customerFooter.jsp" %>
  </body>

  <script>
  
  function chageCategory(){
	  var category=document.getElementById("Category");
	  var ca = category.options[category.selectedIndex].value; 
	  document.getElementById("rentdate").value="";
	  document.getElementById("rentdate").setAttribute('disabled','disabled');
	  $("#rentdate").datepicker("option","showOn","text");
	  document.getElementById("rentamount").value=0;
	  document.getElementById("rentamount").setAttribute('max',"0");
	  document.getElementById('totalprice').innerText="0";
		
	  $.ajax({
		  method: "POST",
		  url: "/index/productList",  
		  data: {ca:ca},  
		  dataType: "json",  
		  success: function(result){
			  var namelong=result.array;
			 
			  var htmltext='<option value="선택" disabled="disabled" selected="selected">선택해주세요</option>';
			  for(var k=0;k<namelong;k++){
				 htmltext=htmltext+'<option value="'+result.arrayid[k]+'">'+result.arrayname[k]+'</option>'
			  }
			  document.getElementById('Proname').innerHTML=htmltext;
		  }, 
		  error : function(a, b, c) {
		         //통신 실패시 발생하는 함수(콜백)
		         alert("a:" + a + "b:" + b + "c:" + c);
		      }
		}); 
  }
  function chageProname(){
	  var proname=document.getElementById("Proname");
	
	document.getElementById("rentdate").value=new Date().toISOString().substring(0, 10);
	document.getElementById("rentdate").setAttribute('min',new Date().toISOString().substring(0, 10));
	document.getElementById("rentdate").removeAttribute('disabled');
	$("#rentdate").datepicker("option","showOn","both");
	 document.getElementById("rentamount").value=0;
	  document.getElementById("rentamount").setAttribute('max',"0");
	  document.getElementById('totalprice').innerText="0";
	$.ajax({
		  method: "POST",
		  url: "/index/calRentamount",  
		  data: {rentdate:document.getElementById("rentdate").value, p_id:proname.value},  
		  dataType: "json",  
		  success: function(result){
			  var canamount=result.canamount;
			
			document.getElementById("rentamount").setAttribute('max',canamount);
		  }, 
		  error : function(a, b, c) {
		         //통신 실패시 발생하는 함수(콜백)
		         alert("a:" + a + "b:" + b + "c:" + c);
		      }
		}); 

  }
  
  function chageDate(){
	  var rentdate=document.getElementById("rentdate");
	  var proname=document.getElementById("Proname");
	  document.getElementById("rentamount").value=0;
	  document.getElementById("rentamount").setAttribute('max',"0");
	  document.getElementById('totalprice').innerText="0";
	$.ajax({
		  method: "POST",
		  url: "/index/calRentamount",  
		  data: {rentdate:rentdate.value, p_id:proname.value},  
		  dataType: "json",  
		  success: function(result){
			  var canamount=result.canamount;
			
			document.getElementById("rentamount").setAttribute('max',canamount);
		  }, 
		  error : function(a, b, c) {
		         //통신 실패시 발생하는 함수(콜백)
		         alert("a:" + a + "b:" + b + "c:" + c);
		      }
		}); 
	
	
  }
  
  function chageAmount(){
	  var rentamount=document.getElementById("rentamount");
	  var proname=document.getElementById("Proname");
	$.ajax({
		  method: "POST",
		  url: "/index/calPrice",  
		  data: {rentamount:rentamount.value, p_id:proname.value},  
		  dataType: "json",  
		  success: function(result){
			  var rentPrice=result.rentPrice;
			  document.getElementById('productPrice').value=rentPrice
			  rentPrice=AddComma(rentPrice);
			document.getElementById('totalprice').innerText=rentPrice;
		  }, 
		  error : function(a, b, c) {
		         //통신 실패시 발생하는 함수(콜백)
		         alert("a:" + a + "b:" + b + "c:" + c);
		      }
		}); 
	
	
  }
  
  function purchase(){

      document.getElementById('productId').value=document.getElementById('Proname').value;
      document.getElementById('buyform').setAttribute("action","/member/rent/buy");  
      document.getElementById('buyform').submit();
	
	
  }
  
  
  
  function AddComma(num)
	{
	var regexp = /\B(?=(\d{3})+(?!\d))/g;
	return num.toString().replace(regexp, ',');
	}
  window.kakaoAsyncInit = function() {
    Kakao.Channel.createChatButton({
      container: '#kakao-talk-channel-chat-button',
    });
  };

  (function(d, s, id) {
    var js, fjs = d.getElementsByTagName(s)[0];
    if (d.getElementById(id)) return;
    js = d.createElement(s); js.id = id;
    js.src = 'https://developers.kakao.com/sdk/js/kakao.channel.min.js';
    fjs.parentNode.insertBefore(js, fjs);
  })(document, 'script', 'kakao-js-sdk');


	 
	 
	 $(function(){
		   $('#rentdate').datepicker();
		})
		 $('#rentdate').datepicker({
			        dateFormat: 'yy-mm-dd' //달력 날짜 형태
			        ,showOtherMonths: true //빈 공간에 현재월의 앞뒤월의 날짜를 표시
			        ,showMonthAfterYear:true // 월- 년 순서가아닌 년도 - 월 순서
			        ,changeYear: true //option값 년 선택 가능
			        ,changeMonth: true //option값  월 선택 가능                
			        ,showOn: "text" //button:버튼을 표시하고,버튼을 눌러야만 달력 표시 ^ both:버튼을 표시하고,버튼을 누르거나 input을 클릭하면 달력 표시  
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


	 
  </script>
</html>
