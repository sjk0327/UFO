<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>


<!DOCTYPE html>
<html lang="ko">

<head>
<title>대여 상세 정보 페이지 - UF&#38;O</title>

<%@ include file="/WEB-INF/views/adminHeader.jsp"%>
<%@ include file="/WEB-INF/views/customerHeader.jsp"%>
<style type="text/css">
#username {
	color: white;
	text-decoration: underline;
}

#username:hover {
	font-weight: bold;
}

.btn-link {
	border: none;
	outline: none;
	background: none;
	cursor: pointer;
	color: white;
	padding: 0;
	text-decoration: underline;
	font-family: inherit;
	font-size: inherit;
}

.btn-link:hover {
	font-weight: bold;
	color: white;
}

.table {
	text-align: center;
}

@media screen and (min-width: 768px) {
	.division_line {
		border-right: solid;
		color: gray;
	}
}

@media screen and (max-width:768px) {
	.table {
		table-layout: fixed;
		width: 100%;
		text-align: center;
		font-size: 15px;
	}
	.table th {
		background: #ccc;
	}
	.table td, .table th {
		padding: 10px 20px;
		border-top: 1px solid #ccc;
		word-break: break-all;
		
	}
	/*block*/
	.table--block thead {
		display: none;
	}
	.table--block tr {
		display: block;
		margin-bottom: 14px;
		border-top: none;
		padding-bottom: 0px !important;
	}
	.table--block tbody td:before {
		display: block;
		position: absolute;
		left: 0;
		top: 0;
		width: 30%;
		padding: 10px 0;
		background: #ccc;
	}
	.table--block th, .table--block tbody td {
		display: block;
		position: relative;
		padding: 10px 0;
		padding-left: 30%;
		border-width: 0 0 1px 0;
		text-align: right;
	}
	.table--block tbody td.content {
		display: block;
		position: relative;
		padding: 10px 0;
		padding-left: 30%;
		border-width: 0 0 1px 0;
		text-align: left;
		margin-right: 50px
	}
	.table--block tbody td {
		text-align: right;
		white-space: normal !important;
		/*padding-right: 100px;*/
	}

	.table--block td:nth-child(1):before {
		content: '상품 번호';
		text-align: center;
	}
	.table--block td:nth-child(2):before {
		content: '상품 정보';
		text-align: center;
	}
	.table--block td:nth-child(3):before {
		content: '금 액';
		text-align: center;
	}
	.table--block td:nth-child(4):before {
		content: '수 량';
		text-align: center;
	}
	.table--block td:nth-child(5):before {
		content: '진행 상태';
		text-align: center;
		padding: 16px 0px;
	}	

}

<!--
modal 관련 css -->* {
	padding: 0;
	margin: 0;
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
	transition: 0.5s;
	font-size: 17px;
}

.pink_btn {
	width: 90px;
	background: #ed197a;
	color: #fff;
	height: 36px;
	transition: 0.5s;
	font-size: 17px;
	border: none;
}

<!--
관리자 쪽 템블릿 가져와서 왼쪽에 메뉴 부분이 비어 있을 때 제거하는 css -->
.pcoded[theme-layout="vertical"][vertical-placement="left"][vertical-nav-type="offcanvas"][vertical-effect="overlay"] .pcoded-content
	{
	margin-left: 0;
}

.pcoded[theme-layout="vertical"][vertical-placement="left"][vertical-nav-type="expanded"][vertical-effect="shrink"] .pcoded-content
	{
	margin-left: 0;
}

.tabs-left, .tabs-left-content, .tabs-right, .tabs-right-content {
	display: table-cell;
}



* {
	margin: 0;
	padding: 0;
}

a.button {
	display: inline-block;
	padding: 10px 20px;
	text-decoration: none;
	color: #fff;
	background: #000;
	margin: 20px;
}

#modal {
	display: none;
	position: fixed;
	width: 100%;
	height: 100%;
	top: 0;
	left: 0;
	background: rgba(0, 0, 0, 0.3);
}

.modal-con {
	display: none;
	position: fixed;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	max-width: 60%;
	min-height: 30%;
	background: #fff;
}

.modal-con .title {
	font-size: 20px;
	padding: 10px;
	background: #7971ea;
	font-weight: bold;
	color: white;
}

.modal-con .con {
	font-size: 15px;
	line-height: 1.3;
	padding: 30px;
}

.modal-con .close {
	display: block;
	position: absolute;
	width: 30px;
	height: 30px;
	border-radius: 50%;
	border: 3px solid #000;
	text-align: center;
	line-height: 30px;
	text-decoration: none;
	color: #000;
	font-size: 20px;
	font-weight: bold;
	right: 10px;
	top: 10px;
}
@media only screen and (max-width:600px) {
.modal-con {

	max-width: 100%;
	width: 300px;
 z-index: 9998;
	
}
#buyTyped{
width: 100px;
}
#amountd{
width: 100px;
}
#priced{
width: 100px;
}


}



</style>

</head>

<body>
<div class="site-wrap">
	<div id="pcoded" class="pcoded">
		<div class="pcoded-overlay-box"></div>
		<div class="pcoded-container navbar-wrapper">
			<div class="pcoded-main-container">
				<div class="pcoded-wrapper">
					<div class="pcoded-content">
						<div class="pcoded-inner-content">
							<div class="main-body">
								<div class="page-wrapper">
									<div class="page-body">
										<div class="row">
											<div class="col-xl-2 col-sm-12">
												<div class="card">
													<div class="card-block">
														<!-- Row start -->
														<div class="row">
															<div class="col-sm-12">
																<div class="sub-title" style="margin-bottom: 0px;">Menu</div>
																<!-- Nav tabs -->
																<ul id="menuBar" class="nav nav-tabs md-tabs"
																	role="tablist">
																	<li class="nav-item"><a class="nav-link "
																		href="/member/mem/userInfo" role="tab">내 정보</a>
																		<div class="slide"></div></li>
																	<li class="nav-item"><a class="nav-link active"
																		href="/member/mem/memRentList" role="tab">대여 내역</a>
																		<div class="slide"></div></li>
																	<li class="nav-item"><a class="nav-link"
																		href="/member/mem/memBuyList" role="tab">구매 내역</a>
																		<div class="slide"></div></li>
																	<li class="nav-item"><a class="nav-link"
																		href="/member/mem/messageList" role="tab">메시지 함</a>

																		<div class="slide"></div></li>
																	<li class="nav-item"><a class="nav-link"
																		href="/member/rec/recommendList" role="tab">내 리뷰</a>
																		<div class="slide"></div></li>
																</ul>
															</div>
														</div>
														<!-- Row end -->
													</div>
												</div>
											</div>
											<!--  project and team member start -->
											<div class="col-xl-10 col-sm-12">
												<div class="card table-card">
													<div class="card-header">
														<h5>${rentInfo.r_mid }님의 ${rentInfo.r_pid } 대여 현황</h5>
														<div class="card-header-right">
															<ul class="list-unstyled card-option">
																<li><i class="fa fa fa-wrench open-card-option"></i></li>
																<li><i class="fa fa-window-maximize full-card"></i></li>
																<li><i class="fa fa-refresh reload-card"></i></li>
															</ul>
														</div>
													</div>
													<div class="card-block">
														<div class="table-responsive col-xl-12">
															<script src="https://kit.fontawesome.com/848d8f1fa9.js"></script>
															<div class="container-fluid col-xl-12"
																style="text-align: center;">
																<div class="col-lg-12">
																	<div
																		class="col-1 col-lg-1   flex-column flex-shrink-0 p-3 bg-light "
																		style="width: 250px;"></div>

																	<main class="col-12  ms-sm-auto col-lg-12">
																		<div class="row" id="topmarin">
																			<div class="col-sm-12"
																				style="padding: 0px 0px 15px 0px;">
																				<div
																					style="border-bottom: solid 1px; text-align: center; font-weight: bold; font-size: 15pt;">대여
																					정보</div>
																			</div>
																			<div class="col-sm-12" style="padding-bottom: 15px;">
																				<div class="row"
																					style="font-size: 13pt; font-weight: bold; height: 50px; padding: 10px; border: solid; color: gray; height: fit-content;">
																					<div class="col-md-6 division_line">
																						<div class="row">
																							<div class="col-md-6 division_line">대여일자</div>
																							<div class="col-md-6">${rentInfo.r_sdate }</div>
																						</div>
																					</div>
																					<div class="col-md-6">
																						<div class="row">
																							<div class="col-md-6 division_line">대여 번호</div>
																							<div class="col-md-6">${rentInfo.r_id }</div>
																						</div>
																					</div>
																				</div>
																			</div>
																			<div>
																				<table
																					class="table table-striped table--block"
																					id="testab">
																					<thead>
																						<tr>
																							<th>상품 번호</th>
																							<th>상품 정보</th>
																							<th>금&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;액
																							</th>
																							<th>수&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;량</th>
																							<th>진행 상태</th>
																						</tr>
																					</thead>
																					<tbody>
																						<tr>
																							<td>${proInfo.p_id }</td>
																							<td>${proInfo.p_name }</td>
																							<td><c:if
																									test="${rentInfo.r_state eq '대여중' || rentInfo.r_state eq '반납 요청'|| rentInfo.r_state eq '반납 완료' || rentInfo.r_state eq '환불 요청(대여)' || rentInfo.r_state eq '환불 완료(대여)'}">
																									<fmt:parseNumber var="totalprice"
																										value="${proInfo.p_price * 0.05 * rentInfo.r_rent}"
																										integerOnly="true" />
										${totalprice}<%="원"%>
																								</c:if></td>
																							<td>${rentInfo.r_rent }<%="개"%></td>
																							<td style="padding: 9.6px 0px;">
																								<!-- 상태 색깔 변경 로직 부분  추가--> <span
																								class="col-md-2"> <c:if
																										test="${rentInfo.r_state eq '대여중'}">
																										<fmt:parseDate var="tempToday"
																											value="${rentInfo.r_sdate}"
																											pattern="yyyy-MM-dd" />
																										<fmt:parseNumber var="sdate"
																											value="${tempToday.time / (1000*60*60*24)}"
																											integerOnly="true" />
																										<c:set var="now"
																											value="<%=new java.util.Date()%>" />
																										<fmt:parseNumber var="today"
																											value="${now.time / (1000*60*60*24)}"
																											integerOnly="true" />
																										<!-- 
										<c:out  value="<script type='text/javascript'>alert(${sdate } + ':' +${today });</script>" escapeXml="fasle"/>
										-->
																										<c:if
																											test="${sdate+3>=today and sdate<=today}">
																											<label
																												class="btn btn-primary rent-state-btn-label">대
																												여 중</label>
																										</c:if>
																										<c:if test="${sdate+3<today}">
																											<label
																												class="btn btn-danger late-state-btn-label">연
																												체 중</label>
																										</c:if>
																										<c:if test="${sdate>today}">
																											<label
																												class="btn btn-primary rent-state-btn-label"
																												style="background-color: #e8c3b9; border-color: #e8c3b9">대여
																												예약</label>
																										</c:if>
																									</c:if> <c:if test="${rentInfo.r_state eq '반납 요청'}">
																										<label
																											class="btn btn-warning request-state-btn-label">반납
																											요청</label>
																									</c:if> <c:if test="${rentInfo.r_state eq '반납 완료'}">
																										<label
																											class="btn btn-success return-state-btn-label">반납
																											완료</label>
																									</c:if> <c:if
																										test="${rentInfo.r_state eq '환불 요청(대여)'}">
																										<label
																											class="btn btn-inverse return-state-btn-label">환불
																											요청</label>
																									</c:if> <c:if
																										test="${rentInfo.r_state eq '환불 완료(대여)'}">
																										<label
																											class="btn btn-inverse return-state-btn-label">환불
																											완료</label>
																									</c:if>

																							</span> <!-- 상태 색깔 변경 로직 부분  끝 -->
																							</td>
																						</tr>
																						<c:if test="${!empty rentBuy}">
																							<tr>
																								<td>${proInfo.p_id }</td>
																								<td>${proInfo.p_name }</td>
																								<td><fmt:parseNumber var="totalprice"
																										value="${proInfo.p_price * 0.05 * rentBuy.r_rent}"
																										integerOnly="true" /> ${totalprice}<%="원"%>


																								</td>
																								<td>${rentBuy.r_rent }<%="개"%></td>
																								<td style="padding: 9.6px 0px;">
																									<!-- 상태 색깔 변경 로직 부분  추가--> <span
																									class="col-md-2"> <label
																										class='btn btn-info2'
																										style='background-color: #4285F4;'>구매
																											확정</label>
																								</span> <!-- 상태 색깔 변경 로직 부분  끝 -->
																								</td>
																							</tr>
																						</c:if>
																					</tbody>
																				</table>

																			</div>
																			<c:if test="${!empty rentBuy}">
																				<div class="col-sm-12" style="float: right;">
																					<button
																						class="btn waves-effect waves-light btn-primary btn-outline-primary"
																						id="rentbuyButton"
																						style="margin-left: 15px; float: right;"
																						onClick="location.href='/member/mem/memBuyDetail/${rentBuy.r_id}'">구매
																						확정 내역 보기</button>
																				</div>
																			</c:if>

																			<div class="col-sm-12"
																				style="padding: 0px 0px 15px 0px;">
																				<div
																					style="border-bottom: solid 1px; text-align: center; font-weight: bold; font-size: 15pt;">결제
																					정보 확인</div>
																			</div>
																			<hr>
																			<c:forEach var="buyInfo" items="${buyList}">
																				<div class="col-sm-12" style="padding-bottom: 15px;">
																					<div class="row">
																						<div class="col-md-6"
																							style="height: 150px; padding: 50px;">${buyInfo.b_how }</div>
																						<div class="col-md-6"
																							style="font-size: 13pt; color: white; padding: 5px; background-color: #7971ea">
																							<div style="text-align: left;"><%="상품 가격 : "%>${proInfo.p_price }<%="원"%></div>
																							<div style="text-align: left;"><%="대여 구매 정보 : "%>${buyInfo.b_state }</div>
																							<div style="text-align: left;"><%="수량 : "%>${buyInfo.b_amount }</div>
																							<hr>
																							<div
																								style="font-size: 15pt; font-weight: bold; text-align: left;"><%="결제 가격 : "%>

																								<c:if test="${buyInfo.b_state eq '대여'}">
																									<fmt:parseNumber var="totalprice"
																										value="${buyInfo.b_purchase}"
																										integerOnly="true" />
										${totalprice}<%="원 ("%>${buyInfo.b_amount }<%="개)"%>
																								</c:if>
																								<c:if test="${buyInfo.b_state eq '환불 요청'}">
																									<fmt:parseNumber var="totalprice"
																										value="${buyInfo.b_purchase}"
																										integerOnly="true" />
										${totalprice}<%="원 ("%>${buyInfo.b_amount }<%="개)"%>
																								</c:if>
																								<c:if test="${buyInfo.b_state eq '환불 완료'}">
																									<fmt:parseNumber var="totalprice"
																										value="${buyInfo.b_purchase}"
																										integerOnly="true" />
										${totalprice}<%="원 ("%>${buyInfo.b_amount }<%="개)"%>
																								</c:if>
																								<c:if test="${buyInfo.b_state eq '연체료 납부'}">
																									<fmt:parseNumber var="totalprice"
																										value="${buyInfo.b_purchase}"
																										integerOnly="true" />
						${totalprice}<%="원 ("%>${buyInfo.b_amount }<%="개)"%>
																								</c:if>
																							</div>
																						</div>
																					</div>
																				</div>
																				<hr>
																			</c:forEach>
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
																			<!-- 구매확정 모달창 -->
																			<div id="modal"></div>
																			<div class="modal-con modal1">
																				<a href="javascript:;" class="close">X</a>
																				<p class="title">옵션을 확인해주세요!</p>
																				<div class="con">
																					<form:form id="buyform" method="post"
																						commandName="BuyInfoVO">
																						<input type="hidden" id="productId"
																							name="productId" value="${proInfo.p_id}">
																						<input type="hidden" id="rid" name="rid"
																							value="${rentInfo.r_id}">
																						<input id="cartId" name="cartId" type="hidden"
																							value="0">
																						<div class="row" style="margin-top: 20px;">
																							<div class="col-md-4">
																								<img id="productImg" class="img-fluid"
																									src="/resources/Images/product/${proInfo.p_mainImg}"
																									style="width: 200px; height: 150px; margin-left: 20px;">
																							</div>
																							<div class="col-md-3" id="productName"
																								style="color: #505050; font-weight: bold;">${proInfo.p_name}</div>
																							<div class="col-md-5">
																								<div>
																								<br>
																									<div class="row">
																										<div id="buyTyped" class="col-md-5">구매정보</div>
																										<div id="buyTyped" class="col-md-6">
																											<input id="buyType" name="buyType"
																												type="text" value="구매 확정" size="5px;"
																												readonly="readonly">
																										</div>
																									</div>
																								</div>
																								<div>
																									<div class="row" style="margin-top: 8pt;">
																										<div id="amountd" class="col-md-5">수량</div>
																										<div id="amountd" class="col-md-6">
																											<input id="proamount" name="proamount"
																												type="number" min="1"
																												max="${proInfo.p_canBuy }"
																												value="${rentInfo.r_rent }"
																												style="size: 5px;">
																										</div>
																									</div>
																								</div>

																								<div>
																									<div class="row" style="margin-top: 8pt;">
																										<div id="priced" class="col-md-5">총 가격</div>
																										<div id="priced" class="col-md-6">
																											<input id="productPrice" name="productPrice"
																												type="text"
																												value="${proInfo.p_price*rentInfo.r_rent }"
																												readonly="readonly" size="5px;">
																										</div>
																									</div>
																								</div>


																							</div>
																						</div>
																						<div class="row" style="margin-top: 8pt;">
																							<div class="col-md-9"></div>
																							<div class="col-md-3">
																								<div class="row">

																									<div class="col-md-6"
																										style="padding-left: 30px;">
																										<input type="button" id="keepgo"
																											class="btn btn-outline-primary btn-sm"
																											value="구매"></input>
																									</div>
																								</div>
																							</div>
																						</div>
																					</form:form>
																				</div>
																			</div>
																			<!-- 모달창 끝 -->


																			<div class="col-sm-12" style="float: right;">

																				<c:if
																					test="${empty rentBuy and ((rentInfo.r_state eq '대여중' and (sdate+3>=today and sdate<=today)) or (rentInfo.r_state eq '반납 요청') or (rentInfo.r_state eq '반납 완료') or (rentInfo.r_state eq '환불 완료(대여)'))}">
																					<button
																						class="btn waves-effect waves-light btn-primary btn-outline-primary"
																						id="buyButton"
																						style="margin-left: 15px; float: right;">구매하기</button>
																				</c:if>


																				<c:if test="${rentInfo.r_state eq '대여중'}">
																					<c:if test="${sdate+3>=today and sdate<=today}">
																						<button
																							class="btn waves-effect waves-light btn-primary btn-outline-primary"
																							id="returnButton"
																							style="margin-left: 15px; float: right;">반납하기</button>
																					</c:if>
																					<c:if test="${sdate+3<today}">
																						<button
																							class="btn waves-effect waves-light btn-primary btn-outline-primary"
																							id="lateFeeButton"
																							style="margin-left: 15px; float: right;">연체료
																							납부 후 반납</button>
																					</c:if>
																					<c:if test="${sdate>=today}">
																						<button
																							class="btn waves-effect waves-light btn-primary btn-outline-primary"
																							id="refundButton"
																							style="margin-left: 15px; float: right;">환불하기</button>
																					</c:if>
																				</c:if>

																			</div>
																		</div>
																	</main>
																	<main
																		class="col-12 col-lg-1 ms-sm-auto  px-md-4 bg-light"></main>
																</div>
															</div>
														</div>
													</div>
												</div>
											</div>
											<!--  project and team member end -->
										</div>
									</div>
									<!-- Page-body end -->
								</div>

							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script>
		window.onload = function() {
			var size = $(window)[0].innerWidth;
			if (size > 1200) {
				$('#menuBar').attr('class',
						"nav nav-tabs md-tabs tabs-left b-none");
			} else {
				$('#menuBar').attr('class', "nav nav-tabs md-tabs");
			}
		};

		$(window).resize(
				function() {
					var size = $(window)[0].innerWidth;
					if (size > 1200) {
						$('#menuBar').attr('class',
								"nav nav-tabs md-tabs tabs-left b-none");
					} else {
						$('#menuBar').attr('class', "nav nav-tabs md-tabs");
					}
				});

		var rid = ${r_id};

		$(document)
				.on(
						"click",
						"#returnButton",
						function() {
							console.log("반납 요청 스크립트 진입");
							$(".btn_ok").text("반납");
							action_popup
									.confirm(
											"대여하신 상품을 반납 하시겠습니까?",
											function(res) {
												if (res) {
													window.location
															.replace("/member/mem/memRentReturn/"
																	+ rid);

												}
											});

						});

		$(document).on(
				"click",
				"#lateFeeButton",
				function() {
					console.log("연체료 납부 스크립트 진입");
					$(".btn_ok").text("납부");
					action_popup.confirm("연체료를 납부 후 반납 가능합니다.연체료를 납부해주십시오.",
							function(res) {
								if (res) {
									window.location
											.replace("/member/mem/memRentLate/"
													+ rid);
								}
							});

				});

		$(document)
				.on(
						"click",
						"#refundButton",
						function() {
							console.log("환불 스크립트 진입");
							$(".btn_ok").text("환불");
							action_popup
									.confirm(
											"대여하신 상품을 환불 하시겠습니까?",
											function(res) {
												if (res) {
													window.location
															.replace("/member/mem/memRentRefund/"
																	+ rid);
												}
											});

						});

		var state = "${rentInfo.r_state}"

		$(document).on(
				"click",
				"#buyButton",
				function() {
					if (state == '대여중') {
						action_popup.confirm(
								'대여 상품이 반납 후 구매 결제가 진행됩니다.\n진행하시겠습니까?',
								function(res) {
									if (res) {
										openModal('modal1');
									}
								});
					} else if (state != '대여중') {
						action_popup.confirm("대여하신 상품을 구매 하시겠습니까?", function(
								res) {
							if (res) {
								openModal('modal1');
							}

						});
					}
				});

		$(function() {
			$(".modal_close").on("click", function() {
				action_popup.close(this);
			});

		});

		var action_popup = {
			timer : 500,
			confirm : function(txt, callback) {
				if (txt == null || txt.trim() == "") {
					console.warn("confirm message is empty.");
					return;
				} else if (callback == null || typeof callback != 'function') {
					console.warn("callback is null or not function.");
					return;
				} else {
					$(".type-confirm .btn_ok").on("click", function() {
						$(this).unbind("click");
						callback(true);
						action_popup.close(this);
					});
					this.open("type-confirm", txt);
				}
			},

			alert : function(txt) {
				if (txt == null || txt.trim() == "") {
					console.warn("confirm message is empty.");
					return;
				} else {
					this.open("type-alert", txt);
				}
			},

			open : function(type, txt) {
				var popup = $("." + type);
				popup.find(".menu_msg").text(txt);
				$("body").append("<div class='dimLayer'></div>");
				$(".dimLayer").css('height', $(document).height()).attr(
						"target", type);
				popup.fadeIn(this.timer);
			},

			close : function(target) {
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
				setTimeout(function() {
					dimLayer != null ? dimLayer.remove() : "";
				}, this.timer);
			}
		}

		function openModal(modalname) {
			document.get
			$("#modal").fadeIn(300);
			$("." + modalname).fadeIn(300);
		}

		$("#modal, .close").on('click', function() {
			$("#modal").fadeOut(300);
			$(".modal-con").fadeOut(300);
		});

		//수정이 추가

		document.getElementById("proamount").addEventListener("input",changeprice);
		var price = ${proInfo.p_price}
		function changeprice(ev) {
			document.getElementById("productPrice").value = (document.getElementById("proamount").value)* price;
		};

		document.getElementById("keepgo").addEventListener("click", giveData);
		function giveData() {
			action_popup.confirm("구매 결제를 진행하시겠습니까?", function(res) {
				if (res) {

					$("#buyform").attr("action", "/member/rent/buy");
					$("#buyform").submit();

				} else {
					return;
					event.preventDefault();
					event.stopPropagation();
				}
			})
		};
	</script>
	<%@ include file="/WEB-INF/views/customerFooter.jsp"%></div>
	<script src="/resources/common/js/jquery-3.3.1.min.js"></script>
	<script src="/resources/common/js/jquery-ui.js"></script>
	<script src="/resources/common/js/popper.min.js"></script>
	<script src="/resources/common/js/bootstrap.min.js"></script>
	<script src="/resources/common/js/owl.carousel.min.js"></script>
	<script src="/resources/common/js/jquery.magnific-popup.min.js"></script>
	<script src="/resources/common/js/aos.js"></script>

	<script src="/resources/common/js/main.js"></script>

</body>

</html>
