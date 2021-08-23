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
.buy {
	color: #666;
	font-weight: bold;
}

#success {
	color: #FF5675;
}

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
		<div class="box">
			<div class="site-wrap">
				<div id="order_end">
					<br> <img class="picture" src="/resources/img/buysuccess.png" alt="결제완료"> <br> <br>
					<div style="border: none; width: 60%; margin: auto; padding: 10px;">
						<h4 class="buy" style="line-height: 35px; letter-spacing: 1px;">
							결제가 <span id="success">완료</span> 되었습니다!!
						</h4>
						<br>
						<hr style="border: 1px solid #666666;">
						<br>
						<div class="row">
							<div class="col-md-6" style="color: #666; font-weight: bold; font-size: 17px;">결제 금액</div>
							<div class="col-md-6" style="color: #666; font-weight: bold; font-size: 18px;">
								<fmt:formatNumber pattern="###,###,###">${total }</fmt:formatNumber>원
							</div>
							<br>
							<div class="col-md-12">
								<hr>
							</div>
							<br>
							<div class="col-md-6" style="color: #666; font-weight: bold; font-size: 17px;">결제 일시</div>
							<div class="col-md-6" style="color: #666; font-weight: bold; font-size: 18px;"><%=sf.format(nowTime)%></div>
						</div>
						<br> <br>
						<br>
						<div class="row" style="width: 80%; margin: auto;">
							<div class="multi-button" >
						  <button onClick="location.href='/member/pro/productList';">쇼핑게속하기</button>
						  <button onClick="location.href='/member/mem/userInfo';">내주문내역</button>
						  <button onClick="location.href='/';">처음화면으로</button>
						</div>
						</div>
					</div>
				</div>
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
		
	</script>
</body>

</html>
