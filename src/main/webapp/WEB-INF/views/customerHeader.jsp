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
  
  
  
  
 <header class="site-navbar" role="banner" >
      <div class="site-navbar-top">
        <div class="container">
          <div class="row align-items-center">

            <div class="col-6 col-md-4 order-2 order-md-1 site-search-icon text-left" >
              <form action="" >
                <span class="icon icon-search2"></span>  
                <input type="text"  placeholder="Search" style="border-radius:5px; border: solid 2px grey;" >
              	<input type="submit" value="검색" style="border-radius:5px; border: solid 2px grey; background-color: white;">
              </form>
            </div>

            <div class="col-12 mb-3 mb-md-0 col-md-4 order-1 order-md-2 text-center" >
              <div class="site-logo" >
                <a href="/" class="js-logo-clone" style="font-size: 20pt; font-weight: bold;" >UF&O</a>
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
                   <li>${userInfo.m_id } 님, 환영합니다.&nbsp&nbsp
                   <c:if test="${sessionScope.loginPl == 'ufo'}">
                   <li><a href="/logout">[ 로그아웃 ]</a></li>
                   </c:if>
                   <c:if test="${sessionScope.loginPl == 'kakao'}">
                   <li><a href="https://kauth.kakao.com/oauth/logout?client_id=0ba57b2de5ae26e3cc0a370db0b7f98d&logout_redirect_uri=http://localhost:8090/logout">[ 로그아웃 ]</a></li>
                   </c:if>
                   <c:if test="${sessionScope.loginPl == 'naver'}">
                   <li><a href="/logout">[ 로그아웃 ]</a></li>
                   </c:if>
                   
                  <li><a href="/member/mem/userInfo">[ 내정보 ]</a></li>
                  </c:otherwise>
                 </c:choose>
                   <li><a href="member/noticeList">[ 공지사항 ]</a></li>
                    <li><a href="member/qnaList">[ Q&A ]</a></li>
                 
                </ul>
              </div> 
            </div>

          </div>
        </div>
      </div> 
     
    </header>