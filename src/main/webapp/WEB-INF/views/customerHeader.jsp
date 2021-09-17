 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
 <!--신영 추가  상품리스트용-->
  <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Mukta:300,400,700"> 
    <link rel="stylesheet" href="/resources/common/fonts/icomoon/style.css">

    <link rel="stylesheet" href="/resources/common/css/bootstrap.min.css">
    <link rel="stylesheet" href="/resources/common/css/magnific-popup.css">
    <link rel="stylesheet" href="/resources/common/css/jquery-ui.css">
    <link rel="stylesheet" href="/resources/common/css/owl.carousel.min.css">
    <link rel="stylesheet" href="/resources/common/css/owl.theme.default.min.css">
<!-- Favicon icon -->
<link rel="shortcut icon" type="image/x-icon" href="/resources/Images/ufo_purple_favi.ico" />  

    <link rel="stylesheet" href="/resources/common/css/aos.css">

    <link rel="stylesheet" href="/resources/common/css/style.css">
    
    <script src="/resources/common/js/jquery-3.3.1.min.js"></script>
  	<script src="/resources/common/js/jquery-ui.js"></script>
  	<script src="/resources/common/js/popper.min.js"></script>
  	<script src="/resources/common/js/bootstrap.min.js"></script>
  	<script src="/resources/common/js/owl.carousel.min.js"></script>
	<script src="/resources/common/js/jquery.magnific-popup.min.js"></script>
 	<script src="/resources/common/js/aos.js"></script>
 	<script src="/resources/common/js/main.js"></script>
  	<script src="http://code.jquery.com/jquery-latest.js"></script>
  
	<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
  
  <style>
  .count {
    position: absolute;
    top: 0;
    right: 0;
    margin-right: 40px;
    margin-top: -20px;
    font-size: 13px;
    width: 24px;
    height: 24px;
    line-height: 24px;
    border-radius: 50%;
    text-align: center;
    background: #7971ea;
    color: #fff;
    -webkit-transition: .2s all ease-in-out;
    -o-transition: .2s all ease-in-out;
    transition: .2s all ease-in-out;
}


  </style>
  <header class="site-navbar" role="banner">
      <div class="site-navbar-top">
        <div class="container">
          <div class="row align-items-center">

            <div class="col-6 col-md-4 order-2 order-md-1 site-search-icon text-left">
             
            </div>

            <div class="col-12 mb-3 mb-md-0 col-md-4 order-1 order-md-2 text-center">
            
               <div style="margin-left: 20px;">
               <a href="/"><img class="picture" src="/resources/Images/UFO_purple.png"
										alt="로고" style="width: 200px; height:90px;"></a>
              
              </div>
            </div>

            <div class="col-6 col-md-4 order-3 order-md-3 text-right">
              <div class="site-top-icons">
                <ul>

               <c:choose>
                <c:when  test ="${empty userInfo}">
                  <li><a href="/login">[ 로그인 ]</a></li>
                  <li><a href="/member/mem/memJoin">[ 회원가입 ]</a></li>
                  </c:when >
                  <c:otherwise>
                   <li>${userInfo.m_id } 님, 환영합니다!&nbsp;&nbsp;
                  <li><a href="/member/mem/userInfo"><span class="icon icon-person"></span></a></li>
                  <li><a href="/member/rent/wishList"><span class="icon icon-heart-o"></span></a></li>
                  <li><a href="/member/rent/cartList"><span class="icon icon-shopping_cart"></span>
                  <span class="count">1</span>
                  </a></li>
                   <c:if test="${sessionScope.loginPl == 'ufo'}">
                   <li><a href="/logout"><i class="fas fa-sign-out-alt"></i></a></li>
                   </c:if>
                   <c:if test="${sessionScope.loginPl == 'kakao'}">
                   <li><a href="https://kauth.kakao.com/oauth/logout?client_id=0ba57b2de5ae26e3cc0a370db0b7f98d&logout_redirect_uri=http://www.ufo2021.link/logout"><i class="fas fa-sign-out-alt"></i></a></li>
                   </c:if>
                   <c:if test="${sessionScope.loginPl == 'naver'}">
                   <li><a href="/logout"><i class="fas fa-sign-out-alt"></i></a></li>
                   </c:if>
                   
                  </c:otherwise>
                 </c:choose>
                 
                </ul>
              </div>
              <br>
              <form id="sort" name="productSearch" method="POST" action="/member/pro/productList">
                <span class="icon icon-search2"></span>  
                <input type="text" id="keyword" name="keyword" placeholder="Search" value="${pageMaker.cri.keyword}" style="border-radius:5px; border: solid 2px grey;" >
              	<button type="submit" id="firstSearchId" value="검색" >검색</button>
              </form>
              
              
               
            </div>

          </div>
        </div>
      </div> 
      <nav class="site-navigation text-right text-md-center" role="navigation">
        <div class="container">
          <ul class="site-menu js-clone-nav d-none d-md-block">
            <li class="active">
              <a href="/">Home</a></li>
            <li class="has-children">
              <a href="/member/pro/productList/">Shop</a>
              <ul class="dropdown">
                <li><a href="/member/pro/productList?keyword=스마트폰">스마트폰</a></li>
                <li><a href="/member/pro/productList?keyword=노트북">노트북</a></li>
                <li><a href="/member/pro/productList?keyword=카메라">카메라</a></li>
                <li><a href="/member/pro/productList?keyword=스마트워치">스마트워치</a></li>
                <li><a href="/member/pro/productList?keyword=태블릿">태블릿</a></li>
              </ul>
            </li>
            <li class="has-children">
              <a href="/member/pro/productList/">My 쇼핑</a>
              <ul class="dropdown">
                <li><a href="/member/mem/memRentList">대여 내역</a></li>
                <li><a href="/member/mem/memBuyList">구매 내역</a></li>
              </ul>
            </li>
            <li class="has-children">
              <a href="/member/noticeList">커뮤니티</a>
              <ul class="dropdown">
                <li><a href="/member/noticeList">공지사항</a></li>
                <li><a href="/member/qna/qnaList">Q&A</a></li>
              </ul>
            </li>
            
          </ul>
        </div>
      </nav>
    </header>
