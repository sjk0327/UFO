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
table {
	width: 100%;
	border: 0;
	border-spacing: 0;
	border-collapse: collapse;
	display: table;
	box-sizing: border-box;
	text-indent: initial;
}

.tablebody {
	border-top: 1px solid;
	border-top-color: black;
}

td, th {
	border-left: none;
	border-right: none;
	padding: 10px;
}

.site-navbar {
	position: sticky;
	top: 0px;
}

.js-logo-clone {
	font-size: 50pt;
}

.postbtn {
	box-shadow: inset 0px 1px 0px 0px #ffffff;
	background: linear-gradient(to bottom, #f9f9f9 5%, #abf5bf 100%);
	background-color: #f9f9f9;
	border-radius: 4px;
	border: 1px solid #dcdcdc;
	display: inline-block;
	cursor: pointer;
	color: #316320;
	font-family: Arial;
	font-size: 15px;
	font-weight: bold;
	padding: 2px 10px;
	text-decoration: none;
	text-shadow: 0px 1px 0px #ffffff;
}

.postbtn:hover {
	background: linear-gradient(to bottom, #abf5bf 5%, #f9f9f9 100%);
	background-color: #abf5bf;
}

.postbtn:active {
	position: relative;
	top: 1px;
}

#buy {
	background: #555555;
	color: #FEE500;
	border: none;
	border-radius: 8px;
	position: relative;
	height: 60px;
	font-size: 2.0em;
	font-family: fantasy;
	width: 200px;
	cursor: pointer;
	transition: 800ms ease all;
	outline: none;
}

#buy:hover {
	background: #fff;
	color: #555555;
}

#buy:before, #buy:after {
	content: '';
	position: absolute;
	top: 0;
	right: 0;
	height: 2px;
	width: 0;
	background: #FEE500;
	transition: 400ms ease all;
}

#buy:after {
	right: inherit;
	top: inherit;
	left: 0;
	bottom: 0;
}

#buy:hover:before, #buy:hover:after {
	width: 100%;
	transition: 800ms ease all;
}

.picture {
	border-radius: 8px;
	width: 200px;
	height: 60px;
}

.noselect {
	-webkit-touch-callout: none;
	-webkit-user-select: none;
	-khtml-user-select: none;
	-moz-user-select: none;
	-ms-user-select: none;
	user-select: none;
	-webkit-tap-highlight-color: transparent;
}

.button {
	margin: 0 auto;
	width: 200px;
	height: 60px;
	background: transparent;
	font-size: 22px;
	font-weight: bold;
	cursor: pointer;
	border-radius: 8px;
	transition: 1s;
	position: relative;
	display: block;
	overflow: hidden;
	border: 2px solid #555555;
}

.button1, .button2 {
	color: #555555;
}

.button1:hover, .button2:hover {
	color: #FEE500;
	background: #555555;
}

.button::before {
	content: "";
	position: absolute;
	left: 0;
	width: 100%;
	height: 0%;
	background: #555555;
	z-index: -1;
	transition: 0.5s;
}

body, html {
	height: 100%;
}

.modal .btn {
	cursor: pointer;
	border: 1px solid #999999;
	text-align: center;
	border-radius: 5px;
	outline: none;
	font-weight: 500;
}

.dimLayer {
	display: block;
	width: 100%;
	background-color: rgba(0, 0, 0, 0.3);
	position: fixed;
	left: 0;
	top: 0px;
	margin: 0;
	padding: 0;
	z-index: 9998;
}

.mocdal {
	width: 500px;
	height: 252px;
	border-radius: 10px;
	padding: 80px 24px;
	box-sizing: border-box;
	text-align: center;
}

.modal-section {
	background: #ffffff;
	box-sizing: border-box;
	display: none;
	position: fixed;
	top: 50%;
	left: 50%;
	-webkit-transform: translate(-50%, -50%);
	-ms-transform: translate(-50%, -50%);
	-moz-transform: translate(-50%, -50%);
	-o-transform: translate(-50%, -50%);
	transform: translate(-50%, -50%);
	display: none;
	z-index: 9999;
}

.menu_msg {
	font-size: 21px;
	font-weight: 500;
}

.enroll_box p {
	padding-bottom: 56px;
}

.gray_btn {
	width: 90px;
	background: #ffffff;
	color: #999999;
	height: 36px;
	line-height: 36px;
	transition: 0.5s;
	font-size: 17px;
}

.pink_btn {
	width: 90px;
	background: #ed197a;
	color: #fff;
	height: 36px;
	line-height: 36px;
	transition: 0.5s;
	font-size: 17px;
	border: none;
}
</style>
</head>
<body>

	<div class="site-wrap">
		<%@ include file="/WEB-INF/views/customerHeader.jsp"%>
		<br> <br>
		<div class="titleArea" style="text-align: center;">
			<h2 style="color: #566963;">주문 / 결제</h2>
		</div>
		<br>
		<!-- 장바구니내역 start -->
		<div class="container">
			<div class="row mb-5">
				<form class="col-md-12" method="post">
					<div class="card" style="border: none;">
						<div class="card-header" style="background-color: #ffffff;">
						</div>
						<div class="card-block table-border-style">
							<div class="table-responsive">
								<table border="1" summary="" class="">
									<thead style="text-align: center;">
										<tr>
											<th scope="col">이미지</th>
											<th scope="col">상품정보</th>
											<th scope="col">구매정보</th>
											<th scope="col">포인트적립</th>
											<th scope="col">수량</th>
											<th scope="col">상품금액</th>
											<th scope="col">대여날짜</th>
										</tr>
									</thead>
									<tbody class="tablebody">
										<c:forEach var="buyInfo" items="${buyInfoList}">
											<fmt:parseNumber var="rentpoint" value="${(buyInfo.productPrice * 0.05) * buyInfo.proamount * 0.01}"
												integerOnly="true" />
											<fmt:parseNumber var="buypoint" value="${(buyInfo.productPrice * 0.95) * buyInfo.proamount * 0.01}"
												integerOnly="true" />
											<c:if test="${buyInfo.buyType eq '대여' }">
												<c:set var="i" value="${(buyInfo.productPrice * 0.05) * buyInfo.proamount }" />
											</c:if>
											<c:if test="${buyInfo.buyType eq '구매' }">
											<c:set var="i" value="${(buyInfo.productPrice * 0.95) * buyInfo.proamount }" />
											</c:if>
											<c:if test="${buyInfo.buyType eq '대여' }">
												<c:set var="k" value="${(buyInfo.productPrice * 0.05) * buyInfo.proamount * 0.01}" />
											</c:if>
											<c:if test="${buyInfo.buyType eq '구매' }">
												<c:set var="k" value="${(buyInfo.productPrice * 0.95) * buyInfo.proamount * 0.01}" />
											</c:if>
											<!-- 총금액 s -->
											<c:set var="s" value="${i + s }" />
											<c:set var="p" value="${k + p }" />
											<tr
												style="text-align: center; color: #111111; font-size: 14px;">
												<td><img src="/resources/Images/${buyInfo.productImg}.jpg"
													alt="Image" class="img-fluid" style="width: 100px; height: 100px;"></td>
												<td>${buyInfo.productName }</td>
												<td>${buyInfo.buyType }</td>
												<c:if test="${buyInfo.buyType eq '대여' }">
													<td><img src="/resources/Images/icon_cash.gif" alt="적립금" style="margin-bottom: 2px;" /> 
													<fmt:formatNumber pattern="###,###,###">${rentpoint }</fmt:formatNumber></td>
												</c:if>
												<c:if test="${buyInfo.buyType eq '구매' }">
													<td><img src="/resources/Images/icon_cash.gif" alt="적립금" style="margin-bottom: 2px;" /> 
													<fmt:formatNumber pattern="###,###,###">${buypoint }</fmt:formatNumber></td>
												</c:if>
												<td>${buyInfo.proamount }</td>
												<c:if test="${buyInfo.buyType eq '대여' }">
													<td><fmt:formatNumber pattern="###,###,###">${(buyInfo.productPrice * 0.05) * buyInfo.proamount }</fmt:formatNumber>원</td>
												</c:if>
												<c:if test="${buyInfo.buyType eq '구매'}">
													<td><fmt:formatNumber pattern="###,###,###">${(buyInfo.productPrice * 0.95) * buyInfo.proamount }</fmt:formatNumber>원</td>
												</c:if>
												<td>${buyInfo.rentdate }</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</form>
			</div>
		</div>
		<!-- 장바구니내역 end -->
		<div class="col-md-1 mmodal">
			<!-- 모달창 구현 -->
			<!-- confirm 모달을 쓸 페이지에 추가 start-->
			<section class="mocdal modal-section type-confirm">
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
			<section class="mocdal modal-section type-alert">
				<div class="enroll_box">
					<p class="menu_msg"></p>
				</div>
				<div class="enroll_btn">
					<button class="btn pink_btn modal_close">확인</button>
				</div>
			</section>
			<!-- alert 모달을 쓸 페이지에 추가 end-->
		</div>
		<br> <br> <br>
		<!-- 주문자정보 start -->
		<div class="container">
			<div class="row">

				<div class="col-md-6">
					<h5 style="text-align: center; color: #666666; font-weight: bold;">주문자정보</h5>
					<div id="bc" class="p-3 p-lg-5" style="border-radius: 0.25rem;">
						<div class="card-block">
							<form class="form-material">
								<div class="form-group row">
									<div class="col-sm-3 col-form-label" style="color: #566963; font-weight: bold; line-height: 1;">회원 ID</div>
									<div class="col-sm-9">
										<input id="m_id" name="m_id" type="text" value="${userVO.m_id }" placeholder="회원 ID"
											class="form-control form-control-center form-control-round form-control-bold"
											style="height: 30px; font-size: 14px; background-color: #ffffff; text-align: center;"
											readonly />
									</div>
								</div>

								<div class="form-group row">
									<div class="col-sm-3 col-form-label"
										style="color: #566963; font-weight: bold; line-height: 1;">이름</div>
									<div class="col-sm-9">
										<input id="m_name" name="m_name" type="text" value="${userVO.m_name }" placeholder="이름"
											class="form-control form-control-center form-control-round form-control-bold"
											style="height: 30px; font-size: 14px; background-color: #ffffff; text-align: center;"
											readonly />
									</div>
								</div>
								<br>
								<hr>
								<br>
								<h5 style="text-align: center; color: #666666; font-weight: bold;">포인트</h5>
								<br>
								<div class="form-group row">
									<div class="col-sm-3 col-form-label" style="color: #566963; font-weight: bold; line-height: 1;">보유포인트</div>
									<div class="col-sm-9">
										<fmt:formatNumber value="${userVO.m_point }" pattern="###,###,###" var="mmpoint"></fmt:formatNumber>
										<input id="m_point" name="m_point" type="text" value="${mmpoint }P"
											class="form-control form-control-center form-control-round form-control-bold"
											style="height: 30px; font-size: 14px; background-color: #ffffff; text-align: right;"
											readonly />
									</div>
								</div>
								<div class="form-group row">
									<div class="col-sm-3 col-form-label" style="color: #566963; font-weight: bold; line-height: 1;">포인트사용</div>
									<div class="col-sm-6">
										<input type="number" min="100" step="100" class="form-control form-control-round form-control-bold"
											id="usepoint" value="0" placeholder="0" style="height: 30px; font-size: 14px; text-align: right;">
									</div>

									<div class="col-sm-1.5" style="line-height: 1;">
										<input type="button" class="postbtn"
											onClick="clickPoint('${userVO.m_point }','${s }','${p }')"
											value="사용" style="height: 30px; float: right;">
									</div>

									<div class="col-sm-1.5" style="line-height: 1;">
										<input type="button" class="postbtn"
											onClick="cancelPoint('${userVO.m_point }','${s }','${p }')"
											value="취소" style="height: 30px; float: right;">
									</div>
								</div>

								
							</form>
						</div>
					</div>
				</div>
				<!-- 주문자정보 end -->
				
				<!-- 배송지정보 start -->
				
				<div class="col-md-6" style="border-left: 1px solid #DDDDDD;">
					<div class="row mb-5">
						<div class="col-md-12">
							<h5 style="text-align: center; color: #666666; font-weight: bold;">배송정보</h5>
							<div class="p-3 p-lg-5" style="border-radius: 0.25rem;">
								<div class="card-block">
								
								<div style="text-align: center;">
								<input type="radio" id="radioType1" name="radioType" value="add1" checked>&nbsp;&nbsp;기본배송지&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        						<input type="radio" id="radioType2" name="radioType" value="add2">&nbsp;&nbsp;신규배송지&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        						<input type="button" class="postbtn" value="배송지목록" onclick="showPopup(${fn:length(buyInfoList)})">
								</div>
								<br>
								
							<form class="form-material" id="radio1" name="radio1" style="display:none;">
								
								<div class="form-group row">
									<div class="col-sm-3 col-form-label" style="color: #566963; font-weight: bold; line-height: 1;">이름</div>
									<div class="col-sm-9">
										<input id="m_name1" name="m_name1" type="text" value="${userVO.m_name }" placeholder="이름"
											class="form-control form-control-center form-control-round form-control-bold"
											style="height: 30px; font-size: 14px; background-color: #ffffff; text-align: center;" readonly/>
									</div>
								</div>

								<div class="form-group row">
									<div class="col-sm-3 col-form-label" style="color: #566963; font-weight: bold; line-height: 1;">전화번호</div>
									<div class="col-sm-9" style="line-height: 1;">
										<input id="m_tel1" name="m_tel1" type="text" value="${userVO.m_tel }" placeholder="전화번호"
											class="form-control form-control-center form-control-round form-control-bold"
											style="height: 30px; font-size: 14px; background-color: #ffffff; text-align: center;"
											onchange="changeTel1(this)" required/>
									</div>
								</div>

								<div class="form-group row">
									<div class="col-sm-3 col-form-label" style="color: #566963; font-weight: bold; line-height: 1;">주소</div>
									<div class="col-sm-9">
										<div class="row">
											<div class="col-sm-6">
												<input type="text" class="form-control form-control-round form-control-bold"
													id="postcode" name="addr1" value="${fn:split(userVO.m_addr,'|')[0]}" placeholder="우편번호"
													style="height: 30px; font-size: 14px; background-color: #ffffff;" readonly>
											</div>
											<div class="col-sm-6">
												<input type="button" class="postbtn" onclick="DaumPostcode1()" value="우편번호 찾기"
													style="height: 30px; float: right;">
											</div>
										</div>
										<input type="text" id="address" name="addr1" value="${fn:split(userVO.m_addr,'|')[1]}"
											class="form-control form-control-center form-control-round form-control-bold"
											placeholder="주소" style="height: 30px; font-size: 14px; background-color: #ffffff;" readonly> 
											
											<input type="text" name="addr1" value="${fn:split(userVO.m_addr,'|')[3]}"
											class="form-control form-control-center form-control-round form-control-bold"
											id="extraAddress" placeholder="참고사항" style="height: 30px; font-size: 14px; 
											background-color: #ffffff;" readonly> 
											
											<input type="text" name="addr1" value="${fn:split(userVO.m_addr,'|')[2]}"
											class="form-control form-control-center form-control-round form-control-bold"
											id="detailAddress" placeholder="상세주소" style="height: 30px; font-size: 14px;"
											onchange="detail_m_addr1(this)" required>
									</div>
								</div>
								
								<div class="form-group row">
									<div class="col-sm-3 col-form-label"
										style="color: #566963; font-weight: bold; line-height: 1;">요청사항</div>
									<div class="col-sm-9">
										<input id="req" name="req" type="text" placeholder="요청사항"
											value="" class="form-control form-control-center form-control-round form-control-bold"
											style="height: 30px; font-size: 14px;" list="reqs" onchange="data(this)" />
										<datalist id="reqs">
											<option value="배송전에 미리 연락 바랍니다.">
											<option value="부재시 경비실에 맡겨 주세요 .">
											<option value="부재시 전화 주시거나 문자 남겨주세요.">
										</datalist>
									</div>
								</div>
							</form>
						</div>
						
						
						<form class="form-material" id="radio2" name="radio2" style="display:none;">
								
								<div class="form-group row">
									<div class="col-sm-3 col-form-label" style="color: #566963; font-weight: bold; line-height: 1;">이름</div>
									<div class="col-sm-9">
										<input id="m_name2" name="m_name2" type="text" value="" placeholder="이름"
											class="form-control form-control-center form-control-round form-control-bold"
											style="height: 30px; font-size: 14px; background-color: #ffffff; text-align: center;" 
											onchange="changeName(this)" required/>
									</div>
								</div>

								<div class="form-group row">
									<div class="col-sm-3 col-form-label" style="color: #566963; font-weight: bold; line-height: 1;">전화번호</div>
									<div class="col-sm-9" style="line-height: 1;">
										<input id="m_tel2" name="m_tel2" type="text" value="" placeholder="특수문자 없이 숫자만 입력해주세요"
											class="form-control form-control-center form-control-round form-control-bold"
											style="height: 30px; font-size: 14px; background-color: #ffffff; text-align: center;"
											onchange="changeTel2(this)" required/>
									</div>
								</div>

								<div class="form-group row">
									<div class="col-sm-3 col-form-label" style="color: #566963; font-weight: bold; line-height: 1;">주소</div>
									<div class="col-sm-9">
										<div class="row">
											<div class="col-sm-6">
												<input type="text" class="form-control form-control-round form-control-bold"
													id="postcode55" name="addr2" value="" placeholder="우편번호"
													style="height: 30px; font-size: 14px; background-color: #ffffff;" required/>
											</div>
											<div class="col-sm-6">
												<input type="button" class="postbtn" onclick="DaumPostcode2()" value="우편번호 찾기"
													style="height: 30px; float: right;">
											</div>
										</div>
										<input type="text" id="address55" name="addr2" value=""
											class="form-control form-control-center form-control-round form-control-bold"
											placeholder="주소" style="height: 30px; font-size: 14px; background-color: #ffffff;" required/> 
											
											<input type="text" name="addr2" value=""
											class="form-control form-control-center form-control-round form-control-bold"
											id="extraAddress55" placeholder="참고사항" style="height: 30px; font-size: 14px; 
											background-color: #ffffff;" required/> 
											
											<input type="text" name="addr2" value=""
											class="form-control form-control-center form-control-round form-control-bold"
											id="detailAddress55" placeholder="상세주소" style="height: 30px; font-size: 14px;"
											onchange="detail_m_addr2(this)" required/>
									</div>
								</div>
								
								<div class="form-group row">
									<div class="col-sm-3 col-form-label"
										style="color: #566963; font-weight: bold; line-height: 1;">요청사항</div>
									<div class="col-sm-9">
										<input id="req" name="req" type="text" placeholder="요청사항"
											value="" class="form-control form-control-center form-control-round form-control-bold"
											style="height: 30px; font-size: 14px;" list="reqs" onchange="data(this)" />
										<datalist id="reqs">
											<option value="배송전에 미리 연락 바랍니다.">
											<option value="부재시 경비실에 맡겨 주세요 .">
											<option value="부재시 전화 주시거나 문자 남겨주세요.">
										</datalist>
									</div>
								</div>
							</form>
						

							</div>
						</div>
					</div>
				</div>
				
				<!-- 배송자정보 end -->

				<!-- 결제정보  start-->
				<div class="col-md-12">
					<div class="row mb-12">
						<div class="col-md-12">
						<hr>
						<br>
							<h5 style="text-align: center; color: #666666; font-weight: bold;">결제상세</h5><br>
							<div class="p-3 p-lg-5 border" style="border-radius: 0.25rem;">
								<table class="table site-block-order-table mb-5">
									<thead>
										<tr>
											<th style="color: #666666; font-size: 19px;">주문금액</th>
											<th><input id="price" name="price" type="text" value="원"
												onload="total(${s });"
												class="form-control form-control-center form-control-round form-control-bold"
												style="background-color: white; border: none; height: 30px; text-align: right; font-size: 20px; font-weight: bold;"
												readonly /></th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td style="font-size: 17px">배송료</td>
											<td style="text-align: right; font-size: 20px;"><fmt:formatNumber
													value="2500" pattern="###,###,###" />원&nbsp;&nbsp;&nbsp;</td>
										</tr>

										<tr>
											<td style="color: #c47135; font-size: 17px;">포인트할인</td>
											<td style="text-align: right;"><input id="usep"
												name="usep" type="text" value="0원"
												class="form-control form-control-center form-control-round form-control-bold"
												style="background-color: white; border: none; height: 30px; text-align: right; color: #c47135; font-size: 20px;"
												readonly /></td>
										</tr>

										<tr>
											<td
												style="color: #666666; font-size: 19px; font-weight: bold;">결제금액</td>
											<td style="text-align: right;">
											<input id="total" name="total" type="text" value="" class="form-control form-control-center form-control-round form-control-bold"
												style="background-color: white; border: none; height: 30px; text-align: right; font-weight: bold; font-size: 20px;" readonly />
												</td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
					</div>
					<br>
					<div class="form-group" style="text-align: center;">
						<form:form name="buyInsert" action="/member/rent/buyKakao" commandName="BuyVO" method="post">
							<input type="hidden" id="m_id2" name="m_id" value="${userVO.m_id }" />
							<input type="hidden" id="hiddenTotal" name="total" value="" />
							<c:forEach var="buyInfo" items="${buyInfoList}" varStatus="status">
								<input type="hidden" id="b_mid" name="b_mid" value="${userVO.m_id }" />
								<input type="hidden" id="b_pid" name="b_pid" value="${buyInfo.productId }" />
								<input type="hidden" id="b_mname1${status.index}" name="b_mname" value="${userVO.m_name }" />
								
								<input type="hidden" id="realAddress1" name="b_maddr" required/>
								
								<input type="hidden" id="b_mtel1${status.index}" name="b_mtel" value="${userVO.m_tel }" required/>
								
								<input type="hidden" id="b_amount" name="b_amount" value="${buyInfo.proamount }" />
								<input type="hidden" id="b_how" name="b_how" value="카카오페이" />
								<input type="hidden" id="b_state" name="b_state" value="${buyInfo.buyType }" />
								
								<c:if test="${buyInfo.buyType eq '대여' }">
									<input type="hidden" id="b_purchase" name="b_purchase" value="${(buyInfo.productPrice * 0.05) * buyInfo.proamount }" />
								</c:if>
								<c:if test="${buyInfo.buyType eq '구매' }">
									<input type="hidden" id="b_purchase" name="b_purchase" value="${(buyInfo.productPrice * 0.95) * buyInfo.proamount }" />
								</c:if>
								<input type="hidden" id="b_message" name="b_message" value="안전하게 배송해 주세요." />
								<input type="hidden" id="sp" name="m_point" value="${p + userVO.m_point }" /> 
								
							</c:forEach>

							
							<h6 style="font-weight: bold;">※ 100만원이
										넘는 금액은 일반결제로 결제해 주시기 바랍니다.</h6><br>
							
							<div class="form-group row">
								<div class="col-sm-6">
									<img class="picture" src="/resources/img/image_readto.jpg"
										alt="카카오페이">
								</div>
								<div class="col-sm-6">
									<button id="buy">kakaopay</button>
								</div>
							</div>
						</form:form>

						<form:form name="buyInsert2" action="/customer/buyInsert" commandName="BuyVO" method="post">
							<input type="hidden" id="m_id" name="m_id" value="${userVO.m_id }" />

							<c:forEach var="buyInfo" items="${buyInfoList}" varStatus="status">
								<input type="hidden" id="b_mid2" name="b_mid" value="${userVO.m_id }" />
								<input type="hidden" id="b_pid2" name="b_pid" value="${buyInfo.productId }" />
								<input type="hidden" id="b_mname2${status.index}" name="b_mname" value="${userVO.m_name }" />
								
								<input type="hidden" id="realAddress2" name="b_maddr" required/>
								
								<input type="hidden" id="b_mtel2${status.index}" name="b_mtel" value="${userVO.m_tel }" required/>
								
								<input type="hidden" id="b_amount2" name="b_amount" value="${buyInfo.proamount }" />
								<input type="hidden" id="b_how2" name="b_how" value="카카오페이" />
								<input type="hidden" id="b_state2" name="b_state" value="${buyInfo.buyType }" />
								<c:if test="${buyInfo.buyType eq '대여' }">
									<input type="hidden" id="b_purchase2" name="b_purchase" value="${(buyInfo.productPrice * 0.05) * buyInfo.proamount }" />
								</c:if>
								<c:if test="${buyInfo.buyType eq '구매' }">
									<input type="hidden" id="b_purchase2" name="b_purchase" value="${(buyInfo.productPrice * 0.95) * buyInfo.proamount }" />
								</c:if>
								<input type="hidden" id="b_message2" name="b_message" value="안전하게 배송해 주세요." />
							</c:forEach>
								<input type="hidden" id="sp" name="m_point" value="${p + userVO.m_point }" /> 
								<input type="hidden" id="hiddenTotal2" name="total" value="" /> 
								
							<div class="form-group row">
								<div class="col-sm-6">
									
								</div>
								<div class="col-sm-6">
									<input type="button" value="일 반 결 제" class="button button1" onclick="check()">
								</div>
							</div>
						</form:form>
					</div>
				</div>
				<!-- 결제정보 end -->
			</div>
			<br>
		</div>
		<%@ include file="/WEB-INF/views/customerFooter.jsp"%>

	</div>

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
	
	
	function check(){
		
		if(document.getElementById("radioType2").checked){
			
			if(document.getElementById("m_name2").value == "" 
					|| document.getElementById("m_tel2").value == "" 
					|| document.getElementById("detailAddress55").value == ""){
				action_popup.alert("이름, 전화번호, 주소는 필수입력 입니다.");
			} else {
				action_popup.confirm("결제하시겠습니까?", function (res) {
			        if (res) {
			            action_popup.alert("확인창을 눌렀습니다.");
			            document.buyInsert2.submit();
			        }
			})
			}
		} else {
			action_popup.confirm("결제하시겠습니까?", function (res) {
		        if (res) {
		            action_popup.alert("확인창을 눌렀습니다.");
		            document.buyInsert2.submit();
		        }
		})
			
		}
	} 
		
	
	$(document).ready(function() {
		
		$("#radio1").show();
		
		   $('#radioType1').click(function() {
			   $("#radio1").show();
			   $("#radio2").hide();
			   document.getElementById("detailAddress").focus();
			   
		   });
		   
		   $('#radioType2').click(function() {
			   $("#radio2").show();
			   $("#radio1").hide();
			   document.getElementById("m_name2").value="";
			   document.getElementById("m_tel2").value="";
			   document.getElementById("postcode55").value="";
			   document.getElementById("address55").value="";
			   document.getElementById("extraAddress55").value="";
			   document.getElementById("detailAddress55").value="";
			   
		   });
		   
		});
	
	function showPopup(list) { 
		 
		var url = "/buy/addr/" + list;
		var name = "addrPopup";
		var option = "width = 1300, height = 300 left = 200, top=50, location=no";
		 
		window.open(url,name,option); 
		 
	 }

	//요청사항
	function data(obj) {
		var size = document.getElementsByName("b_message").length;
		var data = obj.value;
		for(var i = 0; i < size; i++){
		    document.getElementsByName("b_message")[i].value = data;
		}
	}
	
	//주소
	function detail_m_addr1(daddr){
		var detail_m_addr = daddr.value;
		<c:forEach var="buyInfo" items="${buyInfoList}" varStatus="status">
		document.getElementById("detailAddress11${status.index}").value = detail_m_addr;
		document.getElementById("detailAddress22${status.index}").value = detail_m_addr;
		</c:forEach>
		
		
	}
	
	function detail_m_addr2(daddr){
		var detail_m_addr = daddr.value;
		<c:forEach var="buyInfo" items="${buyInfoList}" varStatus="status">
		document.getElementById("detailAddress11${status.index}").value = detail_m_addr;
		document.getElementById("detailAddress22${status.index}").value = detail_m_addr;
		</c:forEach>
	}
	
	
	$(document).ready(function(){
		total(${s });
			  
	});
	
	function total(s){
		
		document.getElementById("price").value = s;
		var price = Number(document.getElementById("price").value);
		var total = Number(document.getElementById("price").value) + 2500;
		document.getElementById("price").value = price.toLocaleString() + "원";
		document.getElementById("total").value = total;
		document.getElementById("hiddenTotal").value = total;
		document.getElementById("hiddenTotal2").value = total;
	}

		// 포인트 사용
		$(document).ready(function(){
		       $("#usepoint").keypress(function (e) {
		        if (e.which == 13){
		        	clickPoint(${userVO.m_point },${s },${p });
		        }
		    });
		});
		
		function clickPoint(m_point, s, p) {
			
			var p_price =  Number(s) + 2500;
			var v_point = Number(document.getElementById("usepoint").value);
			var sp = p + (m_point - v_point);
			
			document.getElementById("sp").value = sp;
			
			if (v_point < 100) {
				v_point = 0;
				action_popup.alert("포인트는 100P 이상 사용가능 합니다");
				
			} else if(v_point%100 != 0){
				v_point = 0;
				action_popup.alert("포인트는 100P 단위로만 사용가능 합니다.");
			}

			if (v_point > p_price) {
				v_point = p_price;
				
				document.getElementById("usepoint").value = v_point;
			}
			
			//보유 포인트보다 사용포인트를 크게 입력했을때
			if (m_point < v_point) {
				
				action_popup.alert("보유하신 포인트만 사용가능 합니다.");
				
				document.getElementById("usepoint").value = "";
				
				document.getElementById("total").value = p_price;
			} else {
				
				document.getElementById("usep").value = v_point;
				var usep = Number(document.getElementById("usep").value);
				document.getElementById("usep").value = usep.toLocaleString() + "원";
				
				document.getElementById("total").value = p_price - v_point;
				var total = Number(document.getElementById("total").value);
				document.getElementById("total").value = total;
				
				var mpoint = m_point - v_point;
				document.getElementById("m_point").value = mpoint.toLocaleString() + "P";
			}

		}
		//포인트 사용 취소
		function cancelPoint(m_point, p_price, p) {
			
			var c_point = 
				parseInt(document.getElementById("usep").value.replace(/,/g,"")) + parseInt(document.getElementById("m_point").value.replace(/,/g,""));
			var sp = c_point + Number(p);
			
			document.getElementById("sp").value = sp;
			
			document.getElementById("m_point").value = c_point.toLocaleString() + "P";
			
			document.getElementById("usepoint").value = 0;
			
			document.getElementById("total").value = p_price;
			var cancleTotal = Number(document.getElementById("total").value) + 2500;
			
			document.getElementById("total").value = cancleTotal;
			
			document.getElementById("usep").value = 
				parseInt(document.getElementById("usep").value) - parseInt(document.getElementById("usep").value) + "원";
			
		}
		 
		// 다음 우편번호 찾기 javaScript
		function DaumPostcode1() {
			new daum.Postcode(
					{
						oncomplete : function(data) {
							// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

							// 각 주소의 노출 규칙에 따라 주소를 조합한다.
							// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
							var addr = ''; // 주소 변수
							var extraAddr = ''; // 참고항목 변수

							//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
							if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
								addr = data.roadAddress;
							} else { // 사용자가 지번 주소를 선택했을 경우(J)
								addr = data.jibunAddress;
							}

							// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
							if (data.userSelectedType === 'R') {
								// 법정동명이 있을 경우 추가한다. (법정리는 제외)
								// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
								if (data.bname !== ''
										&& /[동|로|가]$/g.test(data.bname)) {
									extraAddr += data.bname;
								}
								// 건물명이 있고, 공동주택일 경우 추가한다.
								if (data.buildingName !== ''
										&& data.apartment === 'Y') {
									extraAddr += (extraAddr !== '' ? ', '
											+ data.buildingName
											: data.buildingName);
								}
								// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
								if (extraAddr !== '') {
									extraAddr = ' (' + extraAddr + ')';
								}
								// 조합된 참고항목을 해당 필드에 넣는다.
								document.getElementById("extraAddress").value = extraAddr;
							} else {
								document.getElementById("extraAddress").value = '';
								
							}
							// 우편번호와 주소 정보를 해당 필드에 넣는다.
							document.getElementById('postcode').value = data.zonecode;
							document.getElementById("address").value = addr;
							
							// 커서를 상세주소 필드로 이동한다.
							document.getElementById("detailAddress").value = '';
							document.getElementById("detailAddress").focus();
						}
					}).open();
		}
		
			$(document).ready(function() {
		      var realAddr = $('input[name=addr1]').eq(0).val() 
		               + "|" + $('input[name=addr1]').eq(1).val()
		               + "|" + $('#detailAddress').val()
		               + "|" + $('input[name=addr1]').eq(2).val()
		               + "@@";
		      $('input[name=b_maddr]').val(realAddr);
		   });
			
			$('#detailAddress').focusout(function(){
			      var realAddr = $('input[name=addr1]').eq(0).val() 
			               + "|" + $('input[name=addr1]').eq(1).val()
			               + "|" + $('#detailAddress').val()
			               + "|" + $('input[name=addr1]').eq(2).val()
			               + "@@";
			      $('input[name=b_maddr]').val(realAddr);
					})
					
	//전화번호	
	var autoHypenPhone = function(str){
       str = str.replace(/[^0-9]/g, '');
       var tmp = '';
       if( str.length < 4){
           return str;
       }else if(str.length < 7){
           tmp += str.substr(0, 3);
           tmp += '-';
           tmp += str.substr(3);
           return tmp;
       }else if(str.length < 11){
           tmp += str.substr(0, 3);
           tmp += '-';
           tmp += str.substr(3, 3);
           tmp += '-';
           tmp += str.substr(6);
           return tmp;
       }else{              
           tmp += str.substr(0, 3);
           tmp += '-';
           tmp += str.substr(3, 4);
           tmp += '-';
           tmp += str.substr(7);
           return tmp;
       }

       return str;
   }

   var phoneNum = document.getElementById('m_tel1');

   phoneNum.onkeyup = function(){
   console.log(this.value);
   this.value = autoHypenPhone( this.value ) ;  
   }			
					
		//전호번호1
		$('#m_tel1').focusout(function() {
			
			var realTel = $('input[name=m_tel1]').val();
   				$('input[name=b_mtel]').val(realTel);
			   
		});
		
		function DaumPostcode2() {
			new daum.Postcode(
					{
						oncomplete : function(data) {
							// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

							// 각 주소의 노출 규칙에 따라 주소를 조합한다.
							// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
							var addr = ''; // 주소 변수
							var extraAddr = ''; // 참고항목 변수

							//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
							if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
								addr = data.roadAddress;
							} else { // 사용자가 지번 주소를 선택했을 경우(J)
								addr = data.jibunAddress;
							}

							// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
							if (data.userSelectedType === 'R') {
								// 법정동명이 있을 경우 추가한다. (법정리는 제외)
								// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
								if (data.bname !== ''
										&& /[동|로|가]$/g.test(data.bname)) {
									extraAddr += data.bname;
								}
								// 건물명이 있고, 공동주택일 경우 추가한다.
								if (data.buildingName !== ''
										&& data.apartment === 'Y') {
									extraAddr += (extraAddr !== '' ? ', '
											+ data.buildingName
											: data.buildingName);
								}
								// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
								if (extraAddr !== '') {
									extraAddr = ' (' + extraAddr + ')';
								}
								// 조합된 참고항목을 해당 필드에 넣는다.
								document.getElementById("extraAddress55").value = extraAddr;
								
							} else {
								document.getElementById("extraAddress55").value = '';
								
							}

							// 우편번호와 주소 정보를 해당 필드에 넣는다.
							document.getElementById('postcode55').value = data.zonecode;
							document.getElementById("address55").value = addr;
							
							// 커서를 상세주소 필드로 이동한다.
							document.getElementById("detailAddress55").value = '';
							document.getElementById("detailAddress55").focus();
						}
					}).open();
		}
		
		$('#detailAddress55').focusout(function(){
		      var realAddr = $('input[name=addr2]').eq(0).val() 
		               + "|" + $('input[name=addr2]').eq(1).val()
		               + "|" + $('#detailAddress55').val()
		               + "|" + $('input[name=addr2]').eq(2).val()
		               + "@@";
		      $('input[name=b_maddr]').val(realAddr);
		   });
		
		
		var phoneNum = document.getElementById('m_tel2');

		   phoneNum.onkeyup = function(){
		   console.log(this.value);
		   this.value = autoHypenPhone( this.value ) ;  
		   }
		   
		//전화번호2
		$('#m_tel2').focusout(function(){
		      var realTel = $('input[name=m_tel2]').val() ;
		      $('input[name=b_mtel]').val(realTel);
		});
		   
		//이름2
	   $('#m_name2').focusout(function(){
		      var realName = $('input[name=m_name2]').val() ;
		      $('input[name=b_mname]').val(realName);
		});
		
		
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
	</script>

</body>

</html>
