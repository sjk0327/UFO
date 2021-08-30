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
  background-color: var(--color-secondary);
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

</style>
</head>
<body>
	<%@ include file="/WEB-INF/views/customerHeader.jsp"%>
	<div class="container" style="text-align: center;">
		<br><br>
		<h2 style="color: #666666; font-weight: bold;">공 지 사 항</h2>
		<br><br>
		<div class="box">
			<table class="table table-hover table-sm">
				<thead style="background-color: #A0AFFF;">
					<tr style="color: #eeeeee; font-weight: bold;">
						<th style="text-align: center; width: 20%;">번호</th>
						<th style="text-align: center; width: 40%;">제목</th>
						<th style="text-align: center; width: 20%;">작성자</th>
						<th style="text-align: center; width: 25%;">작성날짜</th>
					</tr>
				</thead>
				<c:forEach var="notice" items="${noticeList}">
					<tbody>
						<tr style="text-align: center; color: #555555;" onClick="location.href='/member/noticeDetail/${notice.n_id}'">
							<td>${notice.n_id }</td>
							<td>${notice.n_title }</td>
							<td>${notice.n_name }</td>
							<td>${notice.n_date }</td>
						</tr>
					</tbody>
				</c:forEach>
			</table>
		</div><br>
	<div class="row" style="justify-content: center">
				<!-- 페이징 start -->
				<div id = "paging-div">
				<ul class="btn-group pagination">
					<c:if test="${pageMaker.prev }">
						<li><a href='<c:url value="/member/noticeList${pageMaker.makeQuery(pageMaker.startPage-1)}"/>'>
							<span style="font-weight: bold;">&nbsp;[이전]&nbsp;</span></a></li><span class="col-md-1"></span>
					</c:if>
					<c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="pageNum">
						<c:if test="${pageNum eq pageMaker.cri.page}"><li><a href='<c:url value="/member/noticeList${pageMaker.makeQuery(pageNum)}"/>'>
						<span id="pagingCur" style="background-color: #7971ea; display:inline-block; height: 30px; width: 30px; border-radius: 50%; font-weight: bold; color: white; padding : 2px;">&nbsp;${pageNum}&nbsp;</span></a></li><span class="col-md-1"></span></c:if>
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
		
	</script>
</body>

</html>
