<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>


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
#order_end {
	margin: 90px auto;
	text-align: center
}

#order_end  a.btn {
	display: inline-block;
	padding: 10px 25px;
	background: #666;
	color: #fff
}

.buy {
	color: #666;
}

#success {
	color: #FF5675;
}

</style>
</head>
<body>
		<%@ include file="/WEB-INF/views/customerHeader.jsp"%>
<div class="container">
	<div class="site-wrap">
		<br> <br>
		<div id="order_end">
			<span class="icon-check_circle display-4 text-success"></span> <br><br>
			<div>
			<h4 class="buy">결제가 <span id="success">완료</span> 되었습니다. 감사합니다.</h4>
			</div>
			<hr>
			<br>
			<a href="" class="btn" style="margin: 1em;">계속쇼핑하기</a> 
			<a href="" class="btn" style="margin: 1em;">내구매내역</a>
			<a href="" class="btn" style="margin: 1em;">Home</a>
		</div>
	</div>
	</div>
	<br>
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
