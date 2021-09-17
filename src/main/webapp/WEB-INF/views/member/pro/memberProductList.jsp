<%@page import="java.net.URLDecoder"%>
<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en" >
  <head>
    <title>상품리스트(고객)</title>
    <%@ include file="/WEB-INF/views/customerHeader.jsp"%>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
   
   
   
   
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Mukta:300,400,700"> 
    <link rel="stylesheet" href="/resources/common/fonts/icomoon/style.css">
   
    <link rel="stylesheet" href="/resources/common/css/bootstrap.min.css">
    <link rel="stylesheet" href="/resources/common/css/magnific-popup.css">
    <link rel="stylesheet" href="/resources/common/css/jquery-ui.css">
    <link rel="stylesheet" href="/resources/common/css/owl.carousel.min.css">
    <link rel="stylesheet" href="/resources/common/css/owl.theme.default.min.css">


    <link rel="stylesheet" href="/resources/common/css/aos.css">

    <link rel="stylesheet" href="/resources/common/css/style.css">
    <script src="https://code.jquery.com/jquery-3.5.0.js"></script>
    <script src="/resources/common/js/jquery-3.3.1.min.js"></script>
     <script src="/resources/common/js/jquery-ui.js"></script>
     <script src="/resources/common/js/popper.min.js"></script>
     <script src="/resources/common/js/bootstrap.min.js"></script>
     <script src="/resources/common/js/owl.carousel.min.js"></script>
   <script src="/resources/common/js/jquery.magnific-popup.min.js"></script>
    <script src="/resources/common/js/aos.js"></script>
    <script src="/resources/common/js/main.js"></script>
    <style>
#container {
	width:210px;
	margin:0 auto;
	text-align:left;
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
.modal .btn{cursor: pointer;border: 1px solid #999999;text-align: center;border-radius: 5px;outline: none;font-weight: 500;}
.dimLayer{display: block;width: 100%;background-color: rgba(0, 0, 0, 0.3);position: fixed;left: 0;top: 0px;margin: 0;padding: 0;z-index: 9998;}
.modal{width: 600px;height: 252px;border-radius: 10px;padding: 80px 24px;box-sizing: border-box;text-align: center;}
.modal-section{background: #ffffff;box-sizing: border-box;display: none;position: absolute;top: 50%;left: 50%;-webkit-transform: translate(-50%, -50%);
-ms-transform: translate(-50%, -50%);-moz-transform: translate(-50%, -50%);-o-transform: translate(-50%, -50%);
transform: translate(-50%, -50%);display: none;z-index: 9999;}
.menu_msg{font-size: 21px;font-weight: 500;}
.enroll_box p{padding-bottom: 56px;}
.gray_btn {width: 90px;background: #ffffff;color: #999999;height: 36px;line-height: 36px;transition: 0.5s;font-size: 17px;}
.pink_btn {width: 90px;background: #7971ea;color: #fff;height: 36px;line-height: 36px;transition: 0.5s;font-size: 17px;border: none;}
#mainMenuList {text-align: center; width:100%; height:220px; background-color:#f4f4f4;}
#mainMenuList ul {text-align: center; width:1200px; margin:0 auto; padding:50px 0;}
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

#paging-div {
    margin-left: auto;
    margin-right: auto;
    text-align: center;
}
</style>
  </head>
  <body>
  <div class="main_moving_banner" style="display:none;">
		<a href="" data-attr=""><img src="" alt="" data-ref-compareKey=""/></a>
		<button type="button" class="moving_banner_close">배너 하루동안 보지 않기</button>
	</div>
<ul id="tempList" style=" display:none"></ul>

  <div class="site-wrap" >
    <header role="banner">
      <nav class="text-right text-md-center" role="navigation" style="background-color:#f4f4f4;">
        <div class="container">
              <div class="row">
          <div class="col-md-12">
            <div class="site-section site-blocks-2">
                <div class="container">
  <div id="mainMenuList" style="text-align:center; z-index: 0;" >
	<ul>		
		<li class="mb-1"><a href="/member/pro/productList/" ><img src="/resources/common/images/total.png" /><p>전체리스트</p></a></li>
		<li class="mb-1"><a href="/member/pro/productList?keyword=스마트폰" ><img src="/resources/common/images/phone.png" /><p>스마트폰</p></a></li>
		<li class="mb-1"><a href="/member/pro/productList?keyword=노트북" ><img src="/resources/common/images/laptop.png" /><p>노트북</p></a></li>  
		<li class="mb-1"><a href="/member/pro/productList?keyword=카메라" ><img src="/resources/common/images/camera.png" /><p>카메라</p></a></li>  
		<li class="mb-1"><a href="/member/pro/productList?keyword=스마트워치" ><img src="/resources/common/images/watch.png" /><p>스마트워치</p></a></li>  
		<li class="mb-1"><a href="/member/pro/productList?keyword=태블릿" ><img src="/resources/common/images/tablet.png" /><p>태블릿PC</p></a></li>  		
  </ul>   
</div>
     
            </div>
          </div>
        </div>
        </div>
        </div>
      </nav>
    </header>
</div>
    <div>
      <div class="container">
        <div class="row">
          <div class="col-md-12 mb-0"><a href="">Home</a> <span class="mx-2 mb-0">/</span> <strong class="text-black">Shop</strong></div>
        </div>
      </div>
    </div>
      
    <div class="site-section">
    <div class="wrap">
       
        
        <!-- confirm 모달을 쓸 페이지에 추가 start-->
        <section class="modal modal-section type-confirm">
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

      <div class="container"> 
        <div class="row mb-5">
          <div class="col-md-9 order-2">
            <div class="row">
              <div class="col-md-12 mb-5">
                <div class="float-md-left mb-4"><h2 class="text-black h5">Shop All</h2></div>
                <div class="d-flex" id="sort">
                  <div class="dropdown mr-1 ml-md-auto">
                    <form id="sort" name="productSearch" method="POST" action="/member/pro/productList">
                        <input type="hidden" name="keyword" value="${pageMaker.cri.keyword}"/>
                  		<input type="text" id="keyword" name="searchType" value="${pageMaker.cri.searchType}" placeholder="검색어를 입력하세요"/>&nbsp;
                		<input type="submit" id="secoundSearch" value="검색" class="btn waves-effect waves-light btn-primary btn-outline-primary">
                	</form>
                	<form id="sort" name="productSort" method="POST" action="/member/pro/productList">
                	 	<input type="hidden" name="keyword" value="${pageMaker.cri.keyword}"/>
                	 	<input type="hidden" name="searchType" value="${pageMaker.cri.searchType}"/>
                	 	<input type="hidden" name="color" value="${pageMaker.cri.color }"/>
						<input type="hidden" name="tab" value="${pageMaker.cri.tab }"/>
						<input type="hidden" name="minPrice" value="${pageMaker.cri.minPrice }"/>
						<input type="hidden" name="maxPrice" value="${pageMaker.cri.maxPrice }"/>
                	 	<input type="hidden" id="sortHidden" name="sort" value=""/>
                   		<input type="button" class="btn btn-secondary btn-sm"  id="sortPh" name="sortPh " aria-haspopup="true" aria-expanded="false" value="높은가격순">
                    	<input type="button" class="btn btn-secondary btn-sm"  id="sortPl" name="sortPl " aria-haspopup="true" aria-expanded="false" value="낮은가격순">
                    	<input type="button" class="btn btn-secondary btn-sm"  id="sortRc" name="sortRc " aria-haspopup="true" aria-expanded="false" value="추천순">                	             
                     </form>
                  </div>
               
                </div>
              </div>
            </div>
            <br>
            <div class="row mb-5 " id="ulList" >
 		 <c:forEach var="list" items="${productList}">                     
             <div class="col-sm-6 col-lg-4 mb-4" id="listClick" onClick="productReadUpdate('${list.p_id}')" data-aos="fade-up" onclick="location.href='/member/pro/productDetail/${list.p_id}'">  
                     
                <div  class="block-4 text-center border">
                  <figure class="block-4-image">
                    <a href="/member/pro/productDetail/${list.p_id}"><img src="/resources/Images/product/${list.p_mainImg }" alt="상품 사진" class="img-fluid"></a>
                  </figure>
                  <div class="block-4-text p-4">
                   
                    <p class="mb-0">상품명 : ${list.p_name }</p>
                    <p class="text-primary font-weight-bold" >카테고리 : ${list.p_category }</p>
                    <p class="text-primary font-weight-bold" id="textdeco" >원 가  : <fmt:formatNumber value="${list.p_price}" pattern="###,###,###" />원</p>
                    <p class="text-primary font-weight-bold" >대여가  : <fmt:formatNumber value="${list.p_price*0.05}" pattern="###,###,###" />원</p>
                    <p class="text-primary font-weight-bold" >즉시구매가  : <fmt:formatNumber value="${list.p_price*0.95}" pattern="###,###,###" />원</p>
                  </div>
                </div>
              </div>
              
             </c:forEach> 

            </div>         
            
           
                               
            
				<div class="row">
             <!-- 페이징 start -->
                <div id = "paging-div">
                <ul class="btn-group pagination text-center">
                   <c:if test="${pageMaker.prev }">
                      <li><a href='<c:url value="/member/pro/productList${pageMaker.makeQuery(pageMaker.startPage-1)}"/>'>
                         <span style="font-weight: bold;">&nbsp;[이전]&nbsp;</span></a></li><span class="col-md-1"></span>
                   </c:if>
                   <c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="pageNum">
                      <c:if test="${pageNum eq pageMaker.cri.page}"><li>
                       <a href='<c:url value="/member/pro/productList${pageMaker.makeQuery(pageNum)}"/>'>
                       <span id="pagingCur" style="background-color: #7971ea; display:inline-block; height: 30px; width: 30px; 
                                        border-radius: 50%; font-weight: bold; color: white; padding : 5px;">&nbsp;${pageNum}&nbsp;</span></a></li>
                       <span class="col-md-1"></span>
                      </c:if>
                      <c:if test="${pageNum ne pageMaker.cri.page}"><li>
                       <a href='<c:url value="/member/pro/productList${pageMaker.makeQuery(pageNum)}"/>'>
                       <span>&nbsp;${pageNum}&nbsp;</span></a></li><span class="col-md-1"></span>
                      </c:if>
                      
                   </c:forEach>
                   <c:if test="${pageMaker.next && pageMaker.endPage >0 }">
                      <li><a href='<c:url value="/member/pro/productList${pageMaker.makeQuery(pageMaker.endPage+1)}"/>'>
                         <span style="font-weight: bold;">&nbsp;[다음]&nbsp;</span></a></li><span class="col-md-1"></span>
                   </c:if>
                </ul>
                </div>
           <!-- 페이징 end --> 
            </div>
          </div>

          <div class="col-md-3 order-1 mb-5 mb-md-0">
            <div class="border p-4 rounded mb-4">
              <h3 class="mb-3 h6 text-uppercase text-black d-block">Categories</h3>
              
              <ul class="list-unstyled mb-0">
                <li class="mb-1"><a href="/member/pro/productList/" class="d-flex"><span>전체</span> <span class="text-black ml-auto">(${totalCount})</span></a></li>
                <li class="mb-1"><a href="/member/pro/productList?keyword=스마트폰" class="d-flex"><span>핸드폰</span> <span class="text-black ml-auto">(${countSmartPhone})</span></a></li>
                <li class="mb-1"><a href="/member/pro/productList?keyword=노트북" class="d-flex"><span>노트북</span> <span class="text-black ml-auto">(${countLaptop})</span></a></li>
                <li class="mb-1"><a href="/member/pro/productList?keyword=카메라" class="d-flex"><span>카메라</span> <span class="text-black ml-auto">(${countCamera})</span></a></li>
                <li class="mb-1"><a href="/member/pro/productList?keyword=스마트워치" class="d-flex"><span>스마트워치</span> <span class="text-black ml-auto">(${countWatch})</span></a></li>
                <li class="mb-1"><a href="/member/pro/productList?keyword=태블릿" class="d-flex"><span>태블릿</span> <span class="text-black ml-auto">(${countTablet})</span></a></li>
              </ul>
            </div>

            <div class="border p-4 rounded mb-4">
              <div class="mb-4" style="margin: -24px;">
                <h3 class="mb-3 h6 text-uppercase text-black d-block"></h3>
                
              </div>
        <div id="container">
		<ul class="tab">
			<li class="current" data-tab="tab1"><a href="#">대여가격 조회</a></li>
			<li data-tab="tab2"><a href="#">구매가격 조회</a></li>
		</ul>
		<!-- 대여가격조회 -->
		
		<div id="tab1" class="tabcontent current">
		<form id="productRent" name="productRent" action="/member/pro/productList" method="POST">
		<input type="hidden" name="keyword" value="${pageMaker.cri.keyword }"/>
		<input type="hidden" name="searchType" value="${pageMaker.cri.searchType }"/>
		<input type="hidden" name="color" value="${pageMaker.cri.color }"/>
		<input type="hidden" id="tabRentHidden" name="tab" value="${pageMaker.cri.tab }"/>
		<input type="hidden" id="minPriceRentHidden" name="minPrice" value="${pageMaker.cri.minPrice }"/>
		<input type="hidden" id="maxPriceRentHidden" name="maxPrice" value="${pageMaker.cri.maxPrice }"/>
			<select name="minPrice" id="minPriceRent" class="line selectric">
                      <option value="" >최소</option>      
                      <option value="10000">1만원</option>                
                      <option value="50000">5만원</option>                  
                      <option value="100000">10만원</option>                  
                      <option value="150000">15만원</option>                  
                      <option value="200000">20만원</option>                                      
                 </select>
         <span class="inp_division" >&nbsp;~&nbsp;</span>
             <select name="maxPrice" id="maxPriceRent" class="line selectric">
                <option value="">최대</option>                   
              <option value="50000">5만원</option>                    
              <option value="100000">10만원</option>                    
              <option value="200000">20만원</option>                    
              <option value="300000">30만원</option>                      
             </select>
            </form>              
          <br><input type="button" id="priceSearchRent" class="btn waves-effect waves-light btn-primary btn-outline-primary" value="선택조회"/><br>
          <br>
           	<form id="selfProductRent" name="selfProductRent" action="/member/pro/productList" method="POST">
				<input type="hidden" name="keyword" value="${pageMaker.cri.keyword }"/>
				<input type="hidden" name="searchType" value="${pageMaker.cri.searchType }"/>
				<input type="hidden" name="color" value="${pageMaker.cri.color }"/>
				<input type="hidden" id="selfTabRentHidden" name="tab" value="${pageMaker.cri.tab }"/>
          	<div>
          	<c:choose>
          	<c:when test="${pageMaker.cri.tab ne 'rent'}">
          		<input type="text" id="selfMinPriceRent" name="minPrice" placeholder="최소금액 " size=5 style="text-align:right;" >&nbsp;
                <span class="inp_division" >&nbsp;~&nbsp;</span> &nbsp;
                <input type="text" name="maxPrice" id="selfMaxPriceRent" placeholder="최대금액" size=5  style="text-align:right;">
                <div class="form_inner_fixed"><br>
                	<input type="button" id="selfPriceSearchRent" class="btn waves-effect waves-light btn-primary btn-outline-primary" value="입력조회"/><br>
                </div>
          	</c:when>
          	<c:otherwise>
          		<input type="text" id="selfMinPriceRent" name="minPrice" placeholder="최소금액 " size=5 style="text-align:right;" value="${pageMaker.cri.minPrice }" >&nbsp;
                <span class="inp_division" >&nbsp;~&nbsp;</span> &nbsp;
                <input type="text" name="maxPrice" id="selfMaxPriceRent" placeholder="최대금액" size=5  style="text-align:right;" value="${pageMaker.cri.maxPrice }">
                <div class="form_inner_fixed"><br>
                	<input type="button" id="selfPriceSearchRent" class="btn waves-effect waves-light btn-primary btn-outline-primary" value="입력조회"/><br>
                </div>
      		</c:otherwise>
          	</c:choose>
             </div>
			</form>
		</div>
		
		<!-- 구매가격조회 -->
		
		<div id="tab2" class="tabcontent">
			<form id="productBuy" name="productBuy" action="/member/pro/productList" method="POST">
			<input type="hidden" name="keyword" value="${pageMaker.cri.keyword }"/>
			<input type="hidden" name="searchType" value="${pageMaker.cri.searchType }"/>
			<input type="hidden" name="color" value="${pageMaker.cri.color }"/>
			<input type="hidden" id="tabBuyHidden" name="tab" value="${pageMaker.cri.tab }"/>
			<input type="hidden" id="minPriceBuyHidden" name="minPrice" value="${pageMaker.cri.minPrice }"/>
			<input type="hidden" id="maxPriceBuyHidden" name="maxPrice" value="${pageMaker.cri.maxPrice }"/>
			<select name="minPrice" id="minPriceBuy" class="line selectric">
                      <option value="" >최소</option>      
                      <option value="500000">50만원</option>                
                      <option value="1000000">100만원</option>                  
                      <option value="2000000">200만원</option>                  
                      <option value="3000000">300만원</option>                  
                      <option value="4000000">400만원</option>                                      
                 </select>
         <span class="inp_division" >&nbsp;~&nbsp;</span>
             <select name="maxPrice" id="maxPriceBuy" class="line selectric">
                <option value="">최대</option>                   
              <option value="1000000">100만원</option>                    
              <option value="2000000">200만원</option>                    
              <option value="3000000">300만원</option>                    
              <option value="4000000">400만원</option>                      
             </select>		
			               
          <br><input type="button" id="priceSearchBuy" name="searchType" class="btn waves-effect waves-light btn-primary btn-outline-primary" value="선택조회"/><br>
          <br>
          </form>
          <form id="selfProductBuy" name="selfProductBuy" action="/member/pro/productList" method="POST">
          	<input type="hidden" name="keyword" value="${pageMaker.cri.keyword }"/>
			<input type="hidden" name="searchType" value="${pageMaker.cri.searchType }"/>
			<input type="hidden" name="color" value="${pageMaker.cri.color }"/>
			<input type="hidden" id="selfTabBuyHidden" name="tab" value="${pageMaker.cri.tab }"/>
          <div>
          <c:choose>
          <c:when test="${pageMaker.cri.tab ne 'buy' }">
          	<input type="text" name="minPrice" id="selfMinPriceBuy" placeholder="최소금액 " size=5 style="text-align:right;">&nbsp;
            <span class="inp_division" >&nbsp;~&nbsp;</span>&nbsp;
            <input type="text" name="maxPrice" id="selfMaxPriceBuy" placeholder="최대금액" size=5  style="text-align:right;">
            <div class="form_inner_fixed"><br>
           		<input type="button" id="selfPriceSearchBuy" name="searchType" class="btn waves-effect waves-light btn-primary btn-outline-primary" value="입력조회"/><br>
            </div>
          </c:when>
          <c:otherwise>
          	<input type="text" name="minPrice" id="selfMinPriceBuy" placeholder="최소금액 " size=5 style="text-align:right;" value="${pageMaker.cri.minPrice }">&nbsp;
            <span class="inp_division" >&nbsp;~&nbsp;</span>&nbsp;
            <input type="text" name="maxPrice" id="selfMaxPriceBuy" placeholder="최대금액" size=5  style="text-align:right;" value="${pageMaker.cri.maxPrice }">
            <div class="form_inner_fixed"><br>
           		<input type="button" id="selfPriceSearchBuy" name="searchType" class="btn waves-effect waves-light btn-primary btn-outline-primary" value="입력조회"/><br>
            </div>
          </c:otherwise>
          </c:choose>
          </div>
		
			</form>
		</div>
		

               <div class="mb-4">
            <h3 class="mb-3 h6 text-uppercase text-black d-block">Filter by Color</h3>
			<form id="productColor" name="productColor" action="/member/pro/productList" method="POST">
				<input type="hidden" name="keyword" value="${pageMaker.cri.keyword }"/>
				<input type="hidden" name="searchType" value="${pageMaker.cri.searchType }"/>
				<input type="hidden" name="minPrice" value="${pageMaker.cri.minPrice }"/>
				<input type="hidden" name="maxPrice" value="${pageMaker.cri.maxPrice }"/>
				<input type="hidden" name="tab" value="${pageMaker.cri.tab }"/>
				<input type="hidden" id="colorHidden" name="color" value="${pageMaker.cri.color }"/>
				
       		<a href="javascript:selectColor('black');" class="d-flex color-item align-items-center" >
              <span class="bg-danger color d-inline-block rounded-circle mr-2" ></span><span class="text-black">Black</span>
            </a>
       		
            <a href="javascript:selectColor('white');" class="d-flex color-item align-items-center" >
              <span class="bg-success color d-inline-block rounded-circle mr-2" style="border: 1px solid black;"></span> <span class="text-black">White</span>
            </a>
            <a href="javascript:selectColor('silver');" class="d-flex color-item align-items-center" >
              <span class="bg-info color d-inline-block rounded-circle mr-2"></span> <span class="text-black">Silver</span>
            </a>
            <a href="javascript:selectColor('red');" class="d-flex color-item align-items-center" >
              <span class="bg-primary color d-inline-block rounded-circle mr-2"></span> <span class="text-black">Red</span>
            </a>     	             
          
			</form>
              </div>
             </div>

  
</div>
  
  
</div>

         

            </div>
          </div>
        </div>




  <script>

	/*고객productList function*/
	function selectColor(color){
		
		document.getElementById('colorHidden').value = color;	
		console.log(document.getElementById('colorHidden').value);
		
		document.productColor.submit();
	}

	$('#sortPh').on('click', function(){
		$('#sortHidden').val("pricehigh");
		document.productSort.submit();
     	//var url = "/member/pro/productList?sort=pricehigh";
     	//location.href = url;
     	// $("#tempList").load(url, function(){
      	//  $("#ulList").html($("#tempList").html());
       	//  $("#tempList").html(""); 
     	//}); 
	});
	$('#sortPl').on('click', function(){
		$('#sortHidden').val("pricelow");
		document.productSort.submit();
     	//var url = "/member/pro/productList?sort=pricelow";
     	//location.href = url;
/*     	 $("#tempList").load(url, function(){
      	  $("#ulList").html($("#tempList").html());
       	  $("#tempList").html(""); 
     	}); */
	});
	$('#sortRc').on('click', function(){
		$('#sortHidden').val("recommand");
		document.productSort.submit();
     	//var url = "/member/pro/productList?sort=recommand";
     	//location.href = url;
/*     	 $("#tempList").load(url, function(){
      	  $("#ulList").html($("#tempList").html());
       	  $("#tempList").html(""); 
     	}); */
	});
	

	//신영-메뉴bar 가격조회
	   $('#priceSearchRent').on('click', function(){
	        var minPrice = $('#minPriceRent option:selected').val();
	        var maxPrice = $('#maxPriceRent option:selected').val();       
	     	console.log("minPrice: " + minPrice + " maxPrice: "+ maxPrice);
	        if(minPrice != "" && maxPrice != ""){
	       /*  	if(minPrice )
	        var url = '/member/pro/productList/priceSearchRent/' + minPrice +'/'+ maxPrice;
	        
	          $("#tempList").load(url, function(){
	          $("#ulList").html($("#tempList").html());
	           $("#tempList").html(""); 
	       }); */
	       		$('#minPriceRentHidden').val(minPrice);
	       		$('#maxPriceRentHidden').val(maxPrice);
	       		$('#tabRentHidden').val('rent');
	       		document.productRent.submit();
	        }
	        else{
	        	 action_popup.confirm("조회하실 가격을 선택해 주세요.", function (res) {
	        	 document.getElementsById("minPriceRent").focus();
	 	        })
	        }
	   });
	   $('#priceSearchBuy').on('click', function(){
	        var minPriceBuy = $('#minPriceBuy option:selected').val();
	        var maxPriceBuy = $('#maxPriceBuy option:selected').val();       
	     
	        if(minPriceBuy != "" && maxPriceBuy != ""){
	       /*  var url = '/member/pro/productList/priceSearchBuy/' + minPriceBuy +'/'+ maxPriceBuy;
	        
	          $("#tempList").load(url, function(){
	          $("#ulList").html($("#tempList").html());
	          $("#tempList").html(""); 
	       }); */
	        	$('#minPriceBuyHidden').val(minPriceBuy);
	       		$('#maxPriceBuyHidden').val(maxPriceBuy);
	       		$('#tabBuyHidden').val('buy');
	       		document.productBuy.submit();
	        }
	        else{
	        	 action_popup.confirm("조회하실 가격을 선택해 주세요.", function (res) {
	        	 document.getElementsById("minPriceBuy").focus();
	 	        })
	        }
	   });
	   
	   
	    $(".modal_close").on("click", function () {
	           action_popup.close(this);
	       });
	    
	    
	   //신영-가격 직접입력 조회
	   $('#selfPriceSearchRent').on('click', function(){
	      
	      var selfminprice = $('#selfMinPriceRent').val();
	      var selfmaxprice = $('#selfMaxPriceRent').val();
	       
	        if(selfminprice != "" && selfmaxprice != ""){
	        /* var url = '/member/pro/productList/priceSearchRent/' + selfminprice +'/'+ selfmaxprice;
	          $("#tempList").load(url, function(){
	          $("#ulList").html($("#tempList").html());
	           $("#tempList").html(""); 
	       }); */
	        	
	       		$('#selfTabRentHidden').val('rent');
	       		document.selfProductRent.submit();
	        }
	        else{
	        	action_popup.confirm("조회하실 가격을 입력해 주세요.", function (res) {
		        document.getElementsByid("selfMinPriceRent").focus();
	        	})
	        }
	        
	   });
	   $('#selfPriceSearchBuy').on('click', function(){
		      
		   var selfminprice = $('#selfMinPriceBuy').val();
		   var selfmaxprice = $('#selfMaxPriceBuy').val();
	      
	        if(selfminprice != "" && selfmaxprice != ""){
	       /*  var url = '/member/pro/productList/priceSearchBuy/' + selfminprice +'/'+ selfmaxprice;
	          $("#tempList").load(url, function(){
	          $("#ulList").html($("#tempList").html());
	           $("#tempList").html(""); 
	       }); */
	        	$('#selfTabBuyHidden').val('buy');
	       		document.selfProductBuy.submit();
		        }
		        else{
		        	action_popup.confirm("조회하실 가격을 입력해 주세요.", function (res) {
			        document.getElementsByid("selfMinPriceBuy").focus();
		        	})
		        }
		        
		   });
	//신영-최근본상품 퀵메뉴bar
	 /* $(document).ready(function(){
        var currentPosition = parseInt($("#slidemenu").css("top"));
        $(window).scroll(function() {
            var position = $(window).scrollTop(); // 현재 스크롤바의 위치값을 반환합니다.
            $("#slidemenu").stop().animate({"top":position+currentPosition+"px"},700);
        });
    }); */
	 //신영-상품클릭시 조회수 증가
	 function productReadUpdate(p_id) {			
			var p_id = p_id;			
			location.href = '/member/pro/productList/readUpdate/' + p_id;
			 }
			 
	//신영-모달창 pop
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
	var newValue;
    // 모든 텍스트의 변경에 반응합니다.
    $("#keyword").on("change paste", function() {      
    
       newValue = $(this).val();  
       location.href = '/member/pro/productList/' + newValue;       
    }); 
    
    $(function() {
		$('ul.tab li').click(function() {
			var activeTab = $(this).attr('data-tab');
			$('ul.tab li').removeClass('current');
			$('.tabcontent').removeClass('current');
			$(this).addClass('current');
			$('#' + activeTab).addClass('current');
		})
	});
 </script>
   
 
  <script src="/resources/common/js/jquery-3.3.1.min.js"></script>
  <script src="/resources/common/js/jquery-ui.js"></script>
  <script src="/resources/common/js/popper.min.js"></script>
  <script src="/resources/common/js/bootstrap.min.js"></script>
  <script src="/resources/common/js/owl.carousel.min.js"></script>
  <script src="/resources/common/js/jquery.magnific-popup.min.js"></script>
  <script src="/resources/common/js/aos.js"></script>

  <script src="js/main.js"></script>

 
  </body>
   <%@ include file="/WEB-INF/views/customerFooter.jsp"%>
</html>