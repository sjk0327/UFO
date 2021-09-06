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
<title>공지사항</title>
<%@ include file="/WEB-INF/views/adminHeader.jsp"%>
	<%@ include file="/WEB-INF/views/customerHeader.jsp"%>
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
	width: 70%;
	height: 70%;
	margin: auto;
}

:root {
  --border-size: 0.125rem;
  --duration: 500ms;
  --ease: cubic-bezier(0.215, 0.61, 0.355, 1);
  --font-family: monospace;
  --color-primary: white;
  --color-secondary: #555555;
  --color-tertiary: dodgerblue;
  --shadow: rgba(0, 0, 0, 0.1);
  --space: 1rem;
}


.multi-button {
  display: flex;
  width: 100%;
}

.multi-button button {
  flex-grow: 1;
  cursor: pointer;
  position: relative;
  font-weight: bold;
  border-radius: 8px;
  color: var(--color-secondary);
  background-color: var(--color-primary);
  font-size: 1em;
  font-family: var(--font-family);
  text-transform: lowercase;
  text-shadow: var(--shadow) 2px 2px;
  transition: flex-grow var(--duration) var(--ease);
}

.multi-button button + button {
  border-left: var(--border-size) solid black;
  margin-left: calc(var(--border-size) * -1);
}

.multi-button button:hover,
.multi-button button:focus {
  flex-grow: 2;
  color: white;
  outline: none;
  text-shadow: none;
  background-color: #7971ea;
}

.multi-button button:focus {
  outline: var(--border-size) dashed var(--color-primary);
  outline-offset: calc(var(--border-size) * -3);
}

.multi-button:hover button:focus:not(:hover) {
  flex-grow: 1;
  color: var(--color-secondary);
  background-color: var(--color-primary);
  outline-color: var(--color-tertiary);
}

.multi-button button:active {
  transform: translateY(var(--border-size));
}

.tabs-left, .tabs-left-content, .tabs-right, .tabs-right-content {
	display: table-cell !important;
}

.table.table-sm td, .table.table-sm th{
	padding: 5px 5px !important;
}

</style>
</head>
<body>
	
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
		<div class="col-xl-6 col-sm-12">
		<div class="box">
			<div class="card-block table-border-style">
					<table class="table table-striped table-sm">
						<tr>
							<td class="danger" style="font-weight: bold; color: #555555; background-color: #F2DEDE;">글번호</td>
							<td style="text-align: center; background-color: white; color: #555555;">${noticeVO.n_id }</td>
							<td class="danger" style="font-weight: bold; color: #555555; background-color: #F2DEDE;">작성자</td>
							<td style="text-align: center; background-color: white; color: #555555;">${noticeVO.n_name }</td>
							<td class="danger" style="font-weight: bold; color: #555555; background-color: #F2DEDE;">작성일</td>
							<td style="text-align: center; background-color: white; color: #555555;">${noticeVO.n_date }</td>
							
						</tr>
						<tr>
							<td class="danger" style="font-weight: bold; color: #555555;">제목</td>
							<td colspan="5" style="color: #555555;">${noticeVO.n_title }</td>
						</tr>
	
						<tr>
							<td class="danger" style="font-weight: bold; color: #555555; background-color: #F2DEDE; vertical-align: middle;">내용</td>
							<td colspan="5"><textarea name="n_content" class="form-control" rows="18" style="resize: none; background-color: white;" disabled>${noticeVO.n_content }</textarea></td>
						</tr>
	
						<tr>
							<td colspan="7" class="text-center"><br>
							<div class="row" style="width: 100px; margin: auto;">
							<div class="multi-button" >
							  <button onClick="javascript:history.back();">글 목 록</button>
							</div>
						</div></td>
						</tr>
					</table>
			
			</div>
		</div>
		</div>
		<div class="col-xl-3 col-sm-12">
			</div>
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
