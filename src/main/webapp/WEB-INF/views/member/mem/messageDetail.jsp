<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>



<!DOCTYPE html>
<html lang="en">

<head>
<title>메시지 페이지 - UF&#38;O</title>
<%@ include file="/WEB-INF/views/adminHeader.jsp"%>
<%@ include file="/WEB-INF/views/customerHeader.jsp"%>





<style>
.filebox input[type="file"] {
	position: absolute;
	width: 1px;
	height: 1px;
	padding: 0;
	margin: -1px;
	overflow: hidden;
	clip: rect(0, 0, 0, 0);
	border: 0;
}

.filebox label {
	display: inline-block;
	padding: .5em .75em;
	color: #999;
	font-size: inherit;
	line-height: normal;
	vertical-align: middle;
	background-color: #fdfdfd;
	cursor: pointer;
	border: 1px solid #ebebeb;
	border-bottom-color: #e2e2e2;
	border-radius: .25em;
} /* named upload */
.filebox .upload-name {
	display: inline-block;
	padding: .5em .75em; /* label의 패딩값과 일치 */
	font-size: inherit;
	font-family: inherit;
	line-height: normal;
	vertical-align: middle;
	background-color: #f5f5f5;
	border: 1px solid #ebebeb;
	border-bottom-color: #e2e2e2;
	border-radius: .25em;
}

* {
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

.modal {
	width: 600px;
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
	position: absolute;
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
	background: #7971ea;
	color: #fff;
	height: 36px;
	line-height: 36px;
	transition: 0.5s;
	font-size: 17px;
	border: none;
}

.pcoded[theme-layout="vertical"][vertical-placement="left"][vertical-nav-type="expanded"][vertical-effect="shrink"] .pcoded-content
	{
	margin-left: 0;
}

.tabs-left, .tabs-left-content, .tabs-right, .tabs-right-content {
	display: table-cell;
}
</style>



<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>


</head>

<body>
	<ul id="tempPage" style="display: none"></ul>
	<div id="pcoded" class="pcoded">
		<div class="pcoded-overlay-box"></div>
		<div class="pcoded-container navbar-wrapper">

			<div class="pcoded-main-container">
				<div class="pcoded-wrapper">

					<div class="pcoded-content">
						<div class="pcoded-inner-content">
							<!-- Main-body start -->
							<div class="main-body">
								<div class="page-wrapper">
									<!-- Page-body start -->
									<div class="page-body">
										<div class="row">


											<!--  메뉴바 시작 -->
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
																	<li class="nav-item"><a class="nav-link "
																		href="/member/mem/memRentList" role="tab">대역 내역</a>
																		<div class="slide"></div></li>
																	<li class="nav-item"><a class="nav-link"
																		href="/member/mem/memBuyList" role="tab">구매 내역</a>
																		<div class="slide"></div></li>
																	<li class="nav-item"><a class="nav-link active"
																		href="/member/mem/messageList" role="tab">메시지 함</a>
																		<div class="slide"></div></li>
																</ul>
															</div>
														</div>
														<!-- Row end -->
													</div>
												</div>
											</div>
											<!-- 메뉴바 끝 -->

											<!-- 메시지함 시작 -->
											<div class="col-xl-10 col-md-12">
												<div class="card">
													<div class="pcoded-inner-content">
														<div class="main-body">
															<div class="page-wrapper">
																<div class="page-body">
																	<div class="row">
																		<div class="col-sm-6">
																			<div class="card">
																				<div class="card-header">
																					<h5>메시지</h5>
																				</div>

																				<div class="card">

																					<div>
																						<br>
																						<h6>&nbsp;&nbsp;${message.a_mid }&nbsp;회원님</h6>
																						<br>
																						<h5>&nbsp;&nbsp;${message.a_title }</h5>
																					</div>
																					<div class="card-block">
																						<pre>${message.a_content }</pre>
																					</div>
																					<br>
																					<div>
																						<div>
																							<p>&nbsp;&nbsp;UFO&nbsp;고객센터</p>
																						</div>
																						<div>
																							&nbsp;&nbsp;발신일
																							<p>
																								&nbsp;&nbsp;
																								<fmt:formatDate value="${message.a_date }"
																									pattern="yyyy-MM-dd hh:mm:ss" />
																							</p>
																						</div>
																					</div>
																					<br> <br> <br>
																					<form:form class="form-material" name="delete2"
																						action="/member/mem/messageDelete/${message.a_id }"
																						method="post" enctype="multipart/form-data"
																						modelAttribute="message">
																						<form:hidden path="a_id" value="${message.a_id }"
																							class="form-control form-control-center form-control-round form-control-bold" />

																						<div style="float: right; padding-right: 50px">
																							<input type="button" id="confirm" value="메시지 삭제"
																								class="btn waves-effect waves-light btn-primary btn-outline-primary">
																						</div>
																					</form:form>

																					<br>


																				</div>
																			</div>
																		</div>

																	</div>


																</div>
															</div>
														</div>
														<!-- 메시지함 끝 -->

														<!-- 대여 내역-->
													
																<div class="card table-card">
																	<div class="card-header">
																		<h5>${rentInfo.r_mid }님의${rentInfo.r_pid }대여현황</h5>
																		
																	</div>
																	<div class="card-block">
																		<div class="table-responsive col-xl-12">
																			<script
																				src="https://kit.fontawesome.com/848d8f1fa9.js"></script>
																			<div class="container-fluid col-xl-12"
																				style="text-align: center;">
																				<div class="col-lg-12">
																					<div
																						class="col-1 col-lg-1   flex-column flex-shrink-0 p-3 bg-light "
																						style="width: 250px;"></div>

																					<main class="col-6  ms-sm-auto col-lg-6">
																						<div class="row" id="topmarin">
																							<div class="col-sm-12"
																								style="padding: 0px 0px 15px 0px;">
																								<div
																									style="border-bottom: solid 1px; text-align: center; font-weight: bold; font-size: 15pt;">대여
																									정보</div>
																							</div>
																							<div class="col-sm-12"
																								style="padding-bottom: 15px;">
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
																											<div class="col-md-6 division_line">대여
																												번호</div>
																											<div class="col-md-6">${rentInfo.r_id }</div>
																										</div>
																									</div>
																								</div>
																							</div>
																							<div class="table">
																							
																								<table
																									class="table table-striped table-sm table--block"
																									id="testab">
																									<thead>
																										<tr>
																											<th class="one">상품 번호</th>
																											<th class="two">상품 정보</th>
																											<th>금&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;액</th>
																											<th>수&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;량</th>
																											<th>진행 상태</th>
																										</tr>
																									</thead>
																									<tbody class="col-sm-12">
																										<tr>
																											<td>${proInfo.p_id }</td>
																											<td>${proInfo.p_name }</td>
																											<td><c:if
																													test="${rentInfo.r_state eq '대여중' || rentInfo.r_state eq '반납 요청'|| rentInfo.r_state eq '반납 완료' || rentInfo.r_state eq '환불 요청' || rentInfo.r_state eq '환불 완료'}">
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
																														<c:if test="${sdate+3>=today}">
																															<label
																																class="btn btn-primary rent-state-btn-label">대
																																여 중</label>
																														</c:if>
																														<c:if test="${sdate+3<today}">
																															<label
																																class="btn btn-danger late-state-btn-label">연
																																체 중</label>
																														</c:if>
																													</c:if> <c:if
																														test="${rentInfo.r_state eq '반납 요청'}">
																														<label
																															class="btn btn-warning request-state-btn-label">반납
																															요청</label>
																													</c:if> <c:if
																														test="${rentInfo.r_state eq '반납 완료'}">
																														<label
																															class="btn btn-success return-state-btn-label">반납
																															완료</label>
																													</c:if> <c:if
																														test="${rentInfo.r_state eq '환불 요청'}">
																														<label
																															class="btn btn-warning return-state-btn-label">환불
																															요청</label>
																													</c:if> <c:if
																														test="${rentInfo.r_state eq '환불 완료'}">
																														<label
																															class="btn btn-success return-state-btn-label">환불
																															완료</label>
																													</c:if>
																											</span> <!-- 상태 색깔 변경 로직 부분  끝 -->
																											</td>
																										</tr>
																									</tbody>
																								</table>
																							</div>
																							<div class="col-sm-12"
																								style="padding: 0px 0px 15px 0px;">
																								<div
																									style="border-bottom: solid 1px; text-align: center; font-weight: bold; font-size: 15pt;">결제
																									정보 확인</div>
																							</div>
																							<hr>
																							<c:forEach var="buyInfo" items="${buyList}">
																								<div class="col-sm-12"
																									style="padding-bottom: 15px;">
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
																											</div>
																										</div>
																									</div>
																								</div>
																								<hr>
																							</c:forEach>
																							<!-- confirm 모달을 쓸 페이지에 추가 start-->
																							<section
																								class="mocdal modal-section type-confirm">
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
																							<div class="col-sm-12" style="float: right;">
																								<button
																									class="btn waves-effect waves-light btn-primary btn-outline-primary"
																									id="buyButton"
																									style="margin-left: 15px; float: right;">구매하기</button>
																								<c:if test="${rentInfo.r_state eq '대여중'}">
																									<c:if test="${sdate+3>=today}">
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
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>

			<!-- confirm 모달을 쓸 페이지에 추가 start-->
			<section class="modal modal-section type-confirm">
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
			<section class="modal modal-section type-alert">
				<div class="enroll_box">
					<p class="menu_msg"></p>
				</div>
				<div class="enroll_btn">
					<button class="btn pink_btn modal_close">확인</button>
				</div>
			</section>

			<!-- alert 모달을 쓸 페이지에 추가 end-->
			<!-- 승빈-->
			<script>
				$(function() {
					//사용 예시 **************************
					$(document).on("click", "#confirm", function() {
						action_popup.confirm("삭제 하시겠습니까?", function(res) {
							if (res) {
								action_popup.alert("삭제가 되었습니다.");
								document.delete2.submit();
							} else {
								action_popup.alert("삭제에 실패하였습니다.");
							}
						})
					});

					$(document).on("click", "#alert", function() {
						action_popup.alert("경고창 테스트!!!");
					});

					$(".modal_close").on("click", function() {
						action_popup.close(this);
					});
					//사용 예시 **************************
				});

				/**
				 *  alert, confirm 대용 팝업 메소드 정의 <br/>
				 *  timer : 애니메이션 동작 속도 <br/>
				 *  alert : 경고창 <br/>
				 *  confirm : 확인창 <br/>
				 *  open : 팝업 열기 <br/>
				 *  close : 팝업 닫기 <br/>
				 */
				var action_popup = {
					timer : 500,
					confirm : function(txt, callback) {
						if (txt == null || txt.trim() == "") {
							console.warn("confirm message is empty.");
							return;
						} else if (callback == null
								|| typeof callback != 'function') {
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
						$(".dimLayer").css('height', $(document).height())
								.attr("target", type);
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

				$(document)
						.ready(
								function() {
									var size = $(window)[0].innerWidth;
									if (size > 1200) {
										$('#menuBar')
												.attr('class',
														"nav nav-tabs md-tabs tabs-left b-none");
									} else {
										$('#menuBar').attr('class',
												"nav nav-tabs md-tabs");
									}
								});

				$(window)
						.resize(
								function() {
									var size = $(window)[0].innerWidth;
									if (size > 1200) {
										$('#menuBar')
												.attr('class',
														"nav nav-tabs md-tabs tabs-left b-none");
									} else {
										$('#menuBar').attr('class',
												"nav nav-tabs md-tabs");
									}
								});
			</script>



			<%@ include file="/WEB-INF/views/customerFooter.jsp"%>
</body>
</html>