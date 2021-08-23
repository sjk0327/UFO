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

.button {
	width: 130px;
	height: 45px;
	font-family: 'Roboto', sans-serif;
	font-size: 13px;
	text-transform: uppercase;
	letter-spacing: 2.5px;
	font-weight: bold;
	color: #555555;
	background-color: #fff;
	border: none;
	border-radius: 15px;
	box-shadow: 0px 8px 15px rgba(0, 0, 0, 0.1);
	transition: all 0.3s ease 0s;
	cursor: pointer;
	outline: none;
}

.button:hover {
	background-color: #555555;
	box-shadow: 0px 15px 20px rgba(46, 229, 157, 0.4);
	color: #fff;
	transform: translateY(-7px);
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
						<hr style="border: 1px solid #666666;">
						<div class="row">
							<div class="col-md-6" style="color: #666; font-weight: bold; font-size: 16px;">결제 금액</div>
							<div class="col-md-6" style="color: #666; font-weight: bold; font-size: 17px;">
								<fmt:formatNumber pattern="###,###,###">${total }</fmt:formatNumber>원
							</div>
							<br>
							<div class="col-md-12">
								<hr>
							</div>
							<br>
							<div class="col-md-6" style="color: #666; font-weight: bold; font-size: 16px;">결제 일시</div>
							<div class="col-md-6" style="color: #666; font-weight: bold; font-size: 17px;"><%=sf.format(nowTime)%></div>
						</div>
						<br> <br> <img class="picture" style="width: 100%;" src="/resources/img/hr23.png" alt="end"> <br> <br>
						<br>
						<div class="row">
							<div class="col-md-4 col-sm-4 col-xs-4">
								<button class="button" onClick="location.href='/member/pro/productList';">게속쇼핑하기</button>
							</div>
							<br>
							<br>
							<div class="col-md-4 col-sm-4 col-xs-4">
								<button class="button">내 주문내역</button>
							</div>
							<br>
							<br>
							<div class="col-md-4 col-sm-4 col-xs-4">
								<button class="button" onClick="location.href='/';">처음화면으로</button>
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
