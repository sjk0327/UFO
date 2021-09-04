<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%
	Date nowTime = new Date();
	SimpleDateFormat sf = new SimpleDateFormat("yyyy. MM. dd HH:mm:ss");
%>


<!DOCTYPE html>
<html lang="en">
<head>
<title>Shoppers &mdash; Colorlib e-Commerce Template</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Mukta:300,400,700">
<link rel="stylesheet" href="/resources/common/fonts/icomoon/style.css">

<link rel="stylesheet" href="/resources/common/css/bootstrap.min.css">
<link rel="stylesheet" href="/resources/common/css/magnific-popup.css">
<link rel="stylesheet" href="/resources/common/css/jquery-ui.css">
<link rel="stylesheet" href="/resources/common/css/owl.carousel.min.css">
<link rel="stylesheet"
	href="/resources/common/css/owl.theme.default.min.css">


<link rel="stylesheet" href="/resources/common/css/aos.css">

<link rel="stylesheet" href="/resources/common/css/style.css">

<style type="text/css">


.box {
	width: 100%;
	height: 70%;
}

.tabs-left, .tabs-left-content, .tabs-right, .tabs-right-content {
	display: table-cell !important;
}

</style>
</head>
<body>
	<%@ include file="/WEB-INF/views/adminHeader.jsp"%>
	<%@ include file="/WEB-INF/views/customerHeader.jsp"%>
	<div style="text-align: center;">
		<br><br>
		<h2 style="color: #666666; font-weight: bold;">공 지 사 항</h2>
		<br><br>
		<div class="row">
		<div class="col-xl-1 col-sm-12">
		</div>
		<!--  메뉴바 시작 -->
		
		<div class="col-xl-2 col-sm-12">
		<div class="container" style="text-align: center; margin: auto;">
			<div class="card">
				<div class="card-block">
		<div class="main-body">
		<div class="page-body">
			<!-- Page-body start -->
					<!-- Row start -->
					<div class="row">
						<div class="col-sm-12">
							<div class="sub-title" style="font-weight: bold; font-size: 15px; margin: 0px">Menu</div>
							<!-- Nav tabs -->
							<ul id="menuBar" class="nav nav-tabs md-tabs" role="tablist" style="padding-top: 10px !important; padding-right: 0px !important; padding-bottom: 10px !important; padding-left: 0px !important;">
								<li class="nav-item"><a id="menu-1" class="nav-link active"
                           href="/member/noticeList" role="tab" style="font-weight: bold;">공지사항</a>
                           <div class="slide"></div></li>
                        <li class="nav-item"><a id="menu-2" class="nav-link "
                           href="/member/qnaList" role="tab" style="font-weight: bold;">Q&A</a>
                           <div class="slide"></div></li>
							</ul>
						</div>
					</div>
					<!-- Row end -->
			</div>
			</div>
		</div>
		</div>
		</div>
		</div>
		
		<!-- 메뉴바 끝 -->
		<div class="col-xl-7 col-sm-12">
		<div class="container" style="text-align: center;">
		<div class="box">
			<table class="table table-hover table-sm">
				<thead style="background-color: #A0AFFF;">
					<tr style="color: #fffeee; font-weight: bold;">
						<th style="text-align: center; width: 20%;">번호</th>
						<th style="text-align: center; width: 40%;">제목</th>
						<th style="text-align: center; width: 20%;">작성자</th>
						<th style="text-align: center; width: 25%;">작성날짜</th>
					</tr>
				</thead>

				<c:set var="num" value="${totalCount }"></c:set>
            <c:forEach var="notice" items="${noticeList }">
               <tbody>
                  <tr style="text-align: center; color: #555555;" onClick="location.href='/member/noticeDetail/${notice.n_id }'">
                     <td>${num-(pageMaker.cri.page-1)*9 }</td>
                     <td>${notice.n_title }</td>
                     <td>${notice.n_name }</td>
                     <td>${notice.n_date }</td>
                  </tr>
               </tbody>
                <c:set var="num" value="${num-1 }"></c:set>
            </c:forEach>

			</table>
		</div><br><br><br>
		</div>
		</div>
		<div class="col-xl-2 col-sm-12">
		</div>
		</div>
	<div class="row">
				<!-- 페이징 start -->
				<div id = "paging-div">
				<ul class="btn-group pagination">
					<c:if test="${pageMaker.prev }">
						<li><a href='<c:url value="/member/noticeList${pageMaker.makeQuery(pageMaker.startPage-1)}"/>'>
							<span style="font-weight: bold;">&nbsp;[이전]&nbsp;</span></a></li><span class="col-md-1"></span>
					</c:if>
					<c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="pageNum">
						<c:if test="${pageNum eq pageMaker.cri.page}"><li><a href='<c:url value="/member/noticeList${pageMaker.makeQuery(pageNum)}"/>'>
						<span id="pagingCur" style="background-color: #7971ea; display:inline-block; height: 30px; width: 30px; border-radius: 50%; font-weight: bold; color: white; padding : 4px;">&nbsp;${pageNum}&nbsp;</span></a></li><span class="col-md-1"></span></c:if>
						<c:if test="${pageNum ne pageMaker.cri.page}"><li><a href='<c:url value="/member/noticeList${pageMaker.makeQuery(pageNum)}"/>'>
						<span>&nbsp;${pageNum}&nbsp;</span></a></li><span class="col-md-1">   </span></c:if>
						
					</c:forEach>
					<c:if test="${pageMaker.next && pageMaker.endPage >0 }">
						<li><a href='<c:url value="/member/noticeList${pageMaker.makeQuery(pageMaker.endPage+1)}"/>'>
							<span style="font-weight: bold;">&nbsp;[다음]&nbsp;</span></a></li><span class="col-md-1"></span>
					</c:if>
				</ul>
				</div>
				<!-- 페이징 end -->
				</div>
	</div>
	<%@ include file="/WEB-INF/views/customerFooter.jsp"%>

	<script src="/resources/common/js/jquery-3.3.1.min.js"></script>
	<script src="/resources/common/js/jquery-ui.js"></script>
	<script src="/resources/common/js/popper.min.js"></script>
	<script src="/resources/common/js/bootstrap.min.js"></script>
	<script src="/resources/common/js/owl.carousel.min.js"></script>
	<script src="/resources/common/js/jquery.magnific-popup.min.js"></script>
	<script src="/resources/common/js/aos.js"></script>

	<script src="/resources/common/js/main.js"></script>


	<script
		src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script>
		
	
	$(document).ready(function(){
	      var size =$(window)[0].innerWidth;
	      if(size > 1200) {
	         $('#menuBar').attr('class' , "nav nav-tabs md-tabs tabs-left b-none");
	         $('#menuBar').attr('style' , "font-weight: bold;");
	         $('.sub-title').attr('style', 'font-weight: bold; font-size: 15px;');
	         $('#menu-1').attr('style', 'padding:20px 0 !important;');
	         $('#menu-2').attr('style', 'padding:20px 0 !important;');
	      } else {
	         $('#menuBar').attr('class' , "nav nav-tabs md-tabs");
	         $('#menuBar').attr('style' , "padding-top: 10px !important; padding-right: 0px !important; padding-bottom: 10px !important; padding-left: 0px !important;");
	         $('.sub-title').attr('style', 'font-weight: bold; font-size: 15px; margin:0px;');
	         $('#menu-1').attr('style', "font-weight: bold; padding-top: 10px !important; padding-right: 0px !important; padding-bottom: 10px !important; padding-left: 0px !important;");
	         $('#menu-2').attr('style', "font-weight: bold; padding-top: 10px !important; padding-right: 0px !important; padding-bottom: 10px !important; padding-left: 0px !important;");
	      }
	   });


	   $(window).resize(function() {
	      var size =$(window)[0].innerWidth;
	      if(size > 1200) {
	         $('#menuBar').attr('class' , "nav nav-tabs md-tabs tabs-left b-none");
	         $('#menuBar').attr('style' , "font-weight: bold;");
	         $('.sub-title').attr('style', 'font-weight: bold; font-size: 15px;');
	         $('#menu-1').attr('style', 'padding:20px 0 !important;');
	         $('#menu-2').attr('style', 'padding:20px 0 !important;');
	      } else {
	         $('#menuBar').attr('class' , "nav nav-tabs md-tabs");
	         $('#menuBar').attr('style' , "padding-top: 10px !important; padding-right: 0px !important; padding-bottom: 10px !important; padding-left: 0px !important;");
	         $('.sub-title').attr('style', 'font-weight: bold; font-size: 15px; margin:0px;');
	         
	         $('#menu-1').attr('style', "font-weight: bold; padding-top: 10px !important; padding-right: 0px !important; padding-bottom: 10px !important; padding-left: 0px !important;");
	         $('#menu-2').attr('style', "font-weight: bold; padding-top: 10px !important; padding-right: 0px !important; padding-bottom: 10px !important; padding-left: 0px !important;");
	      }
	   });
	
	</script>
</body>

</html>
