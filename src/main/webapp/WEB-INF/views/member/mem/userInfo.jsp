<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html lang="en">

<head>
<title>내 정보 페이지 - UF&#38;O</title>
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
	background: #7971ea;
	color: #fff;
	height: 36px;
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

input[type=radio] {
	width: 0;
	height: 0;
	position: absolute;
	left: -9999px;
}

input[type=radio]+label {
	margin: 0;
	padding: .75em 28%;
	box-sizing: border-box;
	position: relative;
	display: inline-block;
	border: solid 1px #DDD;
	background-color: #FFF;
	line-height: 140%;
	text-align: center;
	box-shadow: 0 0 0 rgba(255, 255, 255, 0);
	transition: border-color .15s ease-out, color .25s ease-out,
		background-color .15s ease-out, box-shadow .15s ease-out;
	cursor: pointer;
}

input[type=radio]:checked+label {
	background-color: #4B9DEA;
	color: #FFF;
	box-shadow: 0 0 10px rgba(102, 179, 251, 0.5);
	border-color: #4B9DEA;
	z-index: 1;
}

.noChoice_raido {
	padding-left: 1.5px;
	padding-right: 1.5px;
}

select {
	color: #0764ff;
	width: inherit;
	padding: .5em .5em;
	border: 1px solid #7971ea;
	font-family: inherit;
	background: url('/resources/img/selectArrow.jpg') no-repeat 95% 50%;
	border-radius: 0px;
	-webkit-appearance: none;
	-moz-appearance: none;
	appearance: none;
}

select::-ms-expand {
	display: none;
}
</style>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>

<body>
<div class="site-wrap">
	<div class="py-3" style="background-color: #f4f4f4;">
		<div class="container">
			<div class="row">
				<div class="col-md-12 mb-0">
					<span class="mx-2 mb-0"></span>
				</div>
			</div>
		</div>
	</div>

	<div id="pcoded" class="pcoded">
		<div class="pcoded-overlay-box"></div>
		<div class="pcoded-container navbar-wrapper">

			<div class="pcoded-main-container">
				<div class="pcoded-wrapper" style="background-color: #fff;">

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
																	<li class="nav-item"><a class="nav-link active"
																		href="/member/mem/userInfo" role="tab">내 정보</a>
																		<div class="slide"></div></li>
																	<li class="nav-item"><a class="nav-link "
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
											<!-- 메뉴바 끝 -->
											<!--  sale analytics start -->
											<div class="col-xl-10 col-sm-12" id="changedPage">
												<!-- 회원 개인 정보 수정 가능하게끔 -->
												<div class="card">
													<div class="card-block">
														<div class="row">

															<!--  sale analytics start -->
															<div class="col-xl-6 col-md-12">
																<!-- 회원 개인 정보 수정 가능하게끔 -->
																<div class="card">
																	<div class="card-header">
																		<h5>개인 정보</h5>
																	</div>
																	<div class="card-block">
																		<form:form class="form-material" name="update"
																			action="/member/mem/userInfo"
																			method="post" enctype="multipart/form-data"
																			modelAttribute="userVO">
																			<div class="row">
																				<div class="col-sm-4">
																					<!-- 사진 나오게 하고 찾아보기 버튼 -->
																					<div class="filebox">
																						<div class="m_imgPreview">
																							<img
																								src="/resources/Images/member/${userInfo.m_img }"
																								class="img-fluid img-circle">
																						</div>
																						<input class="upload-name" value="파일선택"
																							disabled="disabled" /> <label for="input-file">업로드</label>
																						<input type="file" name="uploadFile"
																							id="input-file" class="upload-hidden" /> <input
																							type="text" name="m_img"
																							value="${userInfo.m_img }" hidden="true">
																					</div>

																				</div>
																				<div class="col-sm-8">
																					<div class="form-group row">
																						<div class="col-sm-3 col-form-label">아이디</div>
																						<div
																							class="form-group form-primary form-static-label col-sm-9 ">
																							<form:hidden path="m_id" 
																								value="${userInfo.m_id }"
																								class="form-control form-control-center form-control-round form-control-bold" />
																							<input id="id" value="${userInfo.m_id }"
																								disabled="disabled"
																								class="form-control form-control-center form-control-round form-control-bold" />

																							<span class="form-bar"></span>
																						</div>
																					</div>
																					<!-- 비밀번호 변경 소셜은 못 함! -->
																					<c:if test="${userInfo.m_regtype eq '카카오' || rentInfo.r_state eq '네이버'}">

																					<div class="form-group row">
																						<div class="col-sm-3 col-form-label">비밀번호</div>
																						<div
																							class="form-group form-primary form-static-label col-sm-9">
																							<input type="button" value=" 소셜로그인은 비밀번호 변경불가"
																								class="btn btn-primary btn-md btn-block waves-effect waves-light text-center m-b-20">
																							<form:input type="hidden"
																								value="${userInfo.m_pw }" path="m_pw"
																								class="form-control form-control-center form-control-round form-control-bold"
																								placeholder="필수 항목 입니다." required="required" />
																						</div>
																					</div>
																					</c:if>
																					
																					<!-- 비밀번호 변경  일반회원 가능 -->
																					<c:if test="${userInfo.m_regtype eq '유에프오'}">

																					<div class="form-group row">
																						<div class="col-sm-3 col-form-label">비밀번호</div>
																						<div
																							class="form-group form-primary form-static-label col-sm-9">
																							<input type="button" value="비밀번호 변경"
																								onclick="showPopUp()"
																								class="btn btn-primary btn-md btn-block waves-effect waves-light text-center m-b-20">
																							<form:input type="hidden"
																								value="${userInfo.m_pw }" path="m_pw"
																								class="form-control form-control-center form-control-round form-control-bold"
																								placeholder="필수 항목 입니다." required="required" />
																						</div>
																					</div>
																					</c:if>
																					
																					<div class="form-group row">
																						<div class="col-sm-3 col-form-label">이 름</div>
																						<div
																							class="form-group form-primary form-static-label col-sm-9">
																							<form:input type="text"
																								value="${userInfo.m_name }" path="m_name"
																								class="form-control form-control-center form-control-round form-control-bold"
																								placeholder="필수 항목 입니다." required="required" />
																							<span class="form-bar"></span>
																						</div>
																					</div>
																					<div class="form-group row">
																						<div class="col-sm-3 col-form-label">성별</div>
																						<div
																							class="form-group form-primary form-static-label col-sm-9 row"
																							style="margin-left: 0px; padding-left: 0px;">
																							<div class="col-sm-4" style="text-align: center;">
																								<c:choose>
																									<c:when test="${userInfo.m_gender eq '남자'}">
																										<input type="radio" name="m_gender"
																											id="male_raido" class="only-sr checked"
																											value="남자" checked>
																									</c:when>
																									<c:otherwise>
																										<input type="radio" name="m_gender"
																											id="male_raido" class="only-sr checked"
																											value="남자">
																									</c:otherwise>
																								</c:choose>
																								<label for="male_raido"
																									style="width: max-content;">
																									남&nbsp;&nbsp;&nbsp;&nbsp;자 </label>
																							</div>
																							<div class="col-sm-4" style="text-align: center;">
																								<c:choose>
																									<c:when test="${userInfo.m_gender eq '여자'}">
																										<input type="radio" name="m_gender"
																											id="female_raido" class="only-sr checked"
																											value="여자" checked>
																									</c:when>
																									<c:otherwise>
																										<input type="radio" name="m_gender"
																											id="female_raido" class="only-sr checked"
																											value="여자">
																									</c:otherwise>
																								</c:choose>
																								<label for="female_raido"
																									style="width: max-content;">
																									여&nbsp;&nbsp;&nbsp;&nbsp;자 </label>
																							</div>
																							<div class="col-sm-4" style="text-align: center;">
																								<c:choose>
																									<c:when test="${userInfo.m_gender eq '선택안함'}">
																										<input type="radio" name="m_gender"
																											id="noChoice_raido" class="only-sr checked"
																											value="선택안함" checked>
																									</c:when>
																									<c:otherwise>
																										<input type="radio" name="m_gender"
																											id="noChoice_raido" class="only-sr checked"
																											value="선택안함">
																									</c:otherwise>
																								</c:choose>
																								<label for="noChoice_raido"
																									style="width: max-content;">미선택</label>
																							</div>
																						</div>
																					</div>
																				</div>
																			</div>
																			<div class="form-group row">
																				<div class="col-sm-2 col-form-label">주소</div>
																				<div
																					class="form-group form-primary form-static-label col-sm-10">

																					<form:input type="hidden" id="realAddress"
																						path="m_addr" />
																					<!-- 주소 split 으로 나눠서 token 화 하기 -->
																					<div class="row">
																						<div class="col-sm-6">
																							<input type="text" id="postcode" name="addr"
																								value="${fn:split(userInfo.m_addr,'|')[0]}"
																								class="form-control" placeholder="우편번호 "
																								required="required" readonly="readonly" /> <span
																								class="form-bar"></span>

																						</div>
																						<div class="col-sm-6">
																							<input type="button" onclick="daumPostcode()"
																								value="우편번호 찾기"
																								class="btn btn-mat waves-effect waves-light btn-info "
																								style="background-color: #7971ea;" />
																						</div>
																					</div>

																					<input type="text" id="address" name="addr"
																						value="${fn:split(userInfo.m_addr,'|')[1]}"
																						class="form-control" placeholder="주소"
																						required="required" readonly="readonly"> <span
																						class="form-bar"></span>
																					<div class="row">
																						<div class="col-sm-6">
																						<c:choose>
																						<c:when test="${fn:split(userInfo.m_addr,'|')[2] eq ' ' }">
																							<input type="text" id="detailAddress"
																								value=""
																								class="form-control" placeholder="상세주소"
																								required="required"> <span
																								class="form-bar"></span>
																						</c:when>
																						<c:otherwise>
																							<input type="text" id="detailAddress"
																								value="${fn:split(userInfo.m_addr,'|')[2]}"
																								class="form-control" placeholder="상세주소"
																								required="required"> <span
																								class="form-bar"></span>
																						</c:otherwise>
																						</c:choose>			
																						</div>
																						<div class="col-sm-6">
																					
																							<input type="text" id="extraAddress" name="addr"
																								value="${fn:split(userInfo.m_addr,'|')[3]}"
																								class="form-control" placeholder="참고항목"
																								readonly="readonly"> <span
																								class="form-bar"></span>
																			
																						</div>
																					</div>
																				</div>
																			</div>
																			<div class="form-group row">
																				<div class="col-sm-2 col-form-label">전화번호</div>
																				<div
																					class="form-group form-primary form-static-label col-sm-10">

																					<form:input type="text" id="phoneNum" path="m_tel"
																						value="${userInfo.m_tel }"
																						class="form-control form-control-center form-control-round form-control-bold"
																						placeholder="'-'을 빼고 적어주세요." required="required" maxlength="13"/>

																					<span class="form-bar"></span>
																				</div>
																			</div>
																			<div class="form-group row">
																				<input type="hidden" name="m_email" id="realEmail"
																					value="${userInfo.m_email }" />
																				<div class="col-sm-2 col-form-label">이메일</div>
																				<div class="form-group form-primary form-static-label col-sm-3">
																					<input type="text" id="frontEmail"
																						value="${fn:split(userInfo.m_email,'@')[0] }"
																						onchange="emailSum()"
																						class="form-control form-control-center form-control-round form-control-bold"
																						placeholder="필수 항목 입니다." required="required" /> 
																						<span id="check_email" class="form-bar"></span>
																				</div>
																				@
																				<div class="col-sm-3"
																					style="padding: 0px 0px 0px 15px;">
																					<select id="backEmail" onchange="emailSum()">
																						<option value="">선택해주세요.</option>
																						<c:forTokens var="email"
																							items="naver.com,daum.net,hanmail.net,gmail.com"
																							delims=",">
																							<c:if
																								test="${fn:split(userInfo.m_email,'@')[1] eq email}">
																								<option value="${email }" selected>${email }</option>
																							</c:if>
																							<c:if
																								test="${fn:split(userInfo.m_email,'@')[1] ne email}">
																								<option value="${email }">${email }</option>
																							</c:if>
																						</c:forTokens>
																					</select>
																				</div>
																				<div class="col-sm-3">
																					<input type="button" value="중복확인" onclick="duplicatedCheck()"
																						class="btn btn-mat waves-effect waves-light btn-info " style="background-color: #7971ea;">
																				</div>
																			</div>
																			
																			<div class="form-group row">
																				<div class="col-sm-2 col-form-label">포인트</div>
																				<div
																					class="form-group form-primary form-static-label col-sm-10">
																					<form:input type="text" path="m_point"
																						value="${userInfo.m_point }"
																						class="form-control form-control-center form-control-round form-control-bold"
																						readonly='true' placeholder="필수 항목 입니다."
																						required="required" />
																					<span class="form-bar"></span>
																				</div>
																			</div>
																			<div class="form-group row">
																				<div class="col-sm-2 col-form-label">가입날짜</div>

																				<!--<fmt:formatDate var="formatRegDate" value="${userVO.m_regdate}" pattern="yyyy년 MM월 dd일, HH시 MM분 SS초"/>
                                                            <input value="${formatRegDate}" class="form-control form-control-center form-control-round form-control-bold" placeholder="필수 항목 입니다." readonly="readonly"/>-->
																				<div class="form-group form-primary col-sm-10">
																					<form:input type="date" name="m_regdate"
																						path="m_regdate" value="${userInfo.m_regdate }"
																						readonly='true' />
																					<span class="form-bar"></span>
																				</div>
																			</div>
																			<div class="row" style="float: right;">
																				<div>
																					<input type="button" id="update" value="수정" class="btn waves-effect waves-light btn-primary btn-outline-primary">
																				</div>

																			</div>
																		</form:form>
																	</div>
																</div>
															</div>
															<div class="col-xl-6 col-md-12">
																<!-- 여기 안에 두개를 넣어서 밑으로 두개 나오게 함 -->

																<!-- 회원 대여 현황(간략) -->
																<div class="card table-card">
																	<div class="card-header">
																		<h5>대여 현황</h5>
																		<a href="/member/mem/memRentList"
																			style="float: right;">더보기</a>
																	</div>
																	<div class="card-block">
																		<div class="table-responsive">
																			<c:choose>
																				<c:when test="${rentList.size() eq 0 }">
																					<div style="display: flex; justify-content: center">
																						<table>
																							<tbody>
																								<tr>
																									<td>대여 현황이 없습니다.</td>
																								</tr>
																							</tbody>
																						</table>
																					</div>
																				</c:when>
																				<c:otherwise>

																					<table class="table table-hover">
																						<c:set var="toRent" value="false"/>
																						<c:forEach var="list" items="${rentList }">
																							<tbody>

																								<tr
																									onClick="location.href='/member/mem/memRentDetail/${list.r_id}'">

																									<td>
																										<div class="d-inline-block align-middle">
																											
																											<div class="d-inline-block">
																												<h6>${list.p_name }</h6>
																												<p class="text-muted m-b-0">${list.p_category }</p>
																											</div>
																										</div>
																									</td>
																									<td>
																										<div>${list.r_sdate }</div>
																									</td>
																									<td>
																											<c:if test="${list.r_state eq '대여중'}">
																												<fmt:parseDate var="tempToday" value="${list.r_sdate}" pattern="yyyy-MM-dd"/>
																						  						<fmt:parseNumber var="sdate" value="${tempToday.time / (1000*60*60*24)}" integerOnly="true"/>
																						   						<c:set var="now" value="<%=new java.util.Date()%>" />
																						    					<fmt:parseNumber var="today" value="${now.time / (1000*60*60*24)}" integerOnly="true"/>
																						    					<c:set var="dDay" value="${today-sdate}" />
																												<c:if test="${sdate+3>=today}">D - ${dDay }</c:if>
																												<c:if test="${sdate+3<today}">D + ${dDay }</c:if>
																											</c:if>
																									</td>
																									<td class="text-right">
																									
																									
																									
																									<c:if test="${list.r_state eq '대여중'}">
																										<fmt:parseDate var="tempToday"
																											value="${list.r_sdate}" pattern="yyyy-MM-dd" />
																										<fmt:parseNumber var="sdate"
																											value="${tempToday.time / (1000*60*60*24)}"
																											integerOnly="true" />
																										<c:set var="now"
																											value="<%=new java.util.Date()%>" />
																										<fmt:parseNumber var="today"
																											value="${now.time / (1000*60*60*24)}"
																											integerOnly="true" />

																										<c:if
																											test="${sdate+3>=today and sdate+1<=today}">
																											<td style="width: 100px;"><label
																												class="btn btn-primary">대 여 중</label><span
																												id="state"></span></td>
																										</c:if>
																										<c:if test="${sdate+3<today}">
																											<td style="width: 100px;"><label
																												class="btn btn-danger">연 체 중</label><span
																												id="state"></span></td>
																										</c:if>
																										<c:if test="${sdate+1>today}">
																											<td style="width: 100px;"><label
																												class="btn"
																												style="background-color: #e8c3b9;">대여
																													예약</label><span id="state"></span></td>
																										</c:if>
																									</c:if>

																									<c:if test="${list.r_state eq '환불 요청(대여)'}">
																										<td style="width: 100px;"><label
																											class="btn btn-inverse">환불 요청</label><span
																											id="state"></span></td>
																									</c:if>
																									<c:if test="${list.r_state eq '환불 완료(대여)'}">
																										<td style="width: 100px;"><label
																											class="btn btn-inverse">환불 완료</label><span
																											id="state"></span></td>
																									</c:if>

																									<c:if test="${list.r_state eq '반납 요청'}">
																										<td style="width: 100px;"><label
																											class="btn btn-warning"
																											style="font-size: 10pt;">반납 요청</label><span
																											id="state"></span></td>
																									</c:if>
																									<c:if test="${list.r_state eq '반납 완료'}">
																										<td style="width: 100px;"><label
																											class="btn btn-success"
																											style="font-size: 10pt;">반납 완료</label><span
																											id="state"></span></td>
																									</c:if>
			
																						</td>
																								</tr>
																							</tbody>
																						</c:forEach>

																					</table>


																				</c:otherwise>
																			</c:choose>

																		</div>
																	</div>
																</div>

																<!-- 회원 구매 현황(간략) -->
																<div class="card table-card">
																	<div class="card-header">
																		<h5>구매 현황</h5>
																		<a href="/member/mem/memBuyList"
																			style="float: right;">더보기</a>
																	</div>
																	<div class="card-block">
																		<div class="table-responsive">
																			<c:choose>
																				<c:when test="${purchaseList.size() eq 0 }">
																					<div style="display: flex; justify-content: center">
																						<table>
																							<tbody>
																								<tr>
																									<td>구매 현황이 없습니다.</td>
																								</tr>
																							</tbody>
																						</table>
																					</div>
																				</c:when>
																				<c:otherwise>

																					<table class="table table-hover">

																						<c:forEach var="list" items="${purchaseList }">
																							<tbody>


																								<tr
																									onClick="location.href='/member/mem/memBuyDetail/${list.r_id}'">

																									<td>
																										<div class="d-inline-block align-middle">
																											<img
																												src="/resources/Images/tempProductImage.jpg"
																												class="img-radius img-40 align-top m-r-15">
																											<div class="d-inline-block">
																												<h6>${list.p_name }</h6>
																												<p class="text-muted m-b-0">${list.p_category }</p>
																											</div>
																										</div>
																									</td>
																									<td>
																										<div>${list.r_pdate }</div>
																									</td>
																									<td class="text-right"><c:if
																											test="${list.r_state eq '즉시 구매'}">
																											<label class="btn btn-info">즉시 구매</label>
																										</c:if> <c:if test="${list.r_state eq '구매 확정'}">
																											<label class="btn btn-info2">구매 확정</label>
																										</c:if></td>
																								</tr>
																							</tbody>
																						</c:forEach>
																					</table>
																				</c:otherwise>
																			</c:choose>
																		</div>
																	</div>
																</div>





																<!-- 회원 메시지함 -->
																<div class="card table-card">
																	<div class="card-header">
																		<h5>메시지함</h5>
																		<a href="/member/mem/messageList"
																			style="float: right;">더보기</a>
																	</div>
																	<div class="card-block">
																		<div class="table-responsive">
																			<c:choose>
																				<c:when test="${messageList.size() eq 0 }">
																					<div style="display: flex; justify-content: center">
																						<table>
																							<tbody>
																								<tr>
																									<td>메시지가 없습니다.</td>
																								</tr>
																							</tbody>
																						</table>
																					</div>
																				</c:when>
																				<c:otherwise>


																					<table class="table table-hover">

																						<c:forEach var="messageList"
																							items="${messageList }">
																							<tbody>
																								<tr
																									onclick="location.href='/member/mem/messageList/${messageList.a_id }'"
																									style="cursor: hand">
																									<td>
																										<div>
																											<p>UFO&nbsp;고객센터</p>
																										</div>
																									</td>
																									<td>
																										<div>
																											<div>

																												<p>${messageList.a_title }</p>

																											</div>
																										</div>
																									</td>
																									<td><fmt:formatDate
																											value="${messageList.a_date }"
																											pattern="yyyy-MM-dd hh:mm:ss" /></td>
																								</tr>
																							</tbody>
																						</c:forEach>
																					</table>
																				</c:otherwise>
																			</c:choose>



																		</div>
																	</div>
																</div>
																<!-- 회원 메시지함  끝-->



															</div>



														</div>
													</div>
												</div>


												<!-- Page-body end -->
												<c:if test="${userInfo.m_regtype eq '카카오' || rentInfo.r_state eq '네이버'}">
												<div style="float: right; padding-bottom: 100px"><a href="/member/mem/accountDelete">
													<input type="hidden" id="alert" value="회원탈퇴"
															class="btn waves-effect waves-light btn-primary btn-outline-primary">
													<input type="hidden" id="confirm" value="userVO.m_id">
															</a>
												</div>
												
												</c:if>
												<c:if test="${userInfo.m_regtype eq '유에프오'}">
												<div style="float: right; padding-bottom: 100px">
												<form name="accountDelete" action="/member/mem/accountDelete">
													<input type="button" id="accountDeleteBtn" value="회원탈퇴"
															class="btn waves-effect waves-light btn-primary btn-outline-primary">
													<input type="hidden" id="confirm" value="userVO.m_id">
												</form>
												</div>
												</c:if>

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




	<!--이 script 없으면 css 깨짐-->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js">
		
	</script>
	<script>
	function emailSum() {
		var front = document
				.getElementById("frontEmail").value;
		var back = document
				.getElementById("backEmail");
		var email = "";
		var hidInput = document
				.getElementById("realEmail");
		email = front
				+ "@"
				+ back.options[back.selectedIndex].value;
		hidInput.value = email;

	}
	
	var emailCheck = false;
	function duplicatedCheck(){
		var realEmail = $('input#realEmail');
		var inputed = $('input#frontEmail').val();
		var select = $('select#backEmail').val();
		var checkInput = $('input#checkKey');
				
		var SC = ["!","@","#","$","%","`","~","^","&","*","(",")","+","=","\\","|","{","}",":",";","\"","\'",",","<",">","/","?"];
        var check_SC = 0;
		
        for(var i = 0; i < SC.length; i++){
            if(inputed.indexOf(SC[i]) != -1) check_SC = 1;
        }
		
		if(check_SC == 1 || select == "" || inputed == ""){
			$("#check_email").css("color","red");
			$("#check_email").text("이메일을 제대로 입력해주세요.");
			emailFormCheck = false;
		}else{
			$("#check_email").text("");
			emailFormCheck = true;
		}
		
		if(emailFormCheck && (inputed.length > 0 || inputed != "")) {
			$.ajax({
				data : inputed+"@"+select,
				url : "/member/mem/emailCheck",
				type : "POST",
				dataType : "JSON",
				contentType: "application/json; charset=UTF-8",
				success : function(data) {
					console.log("emailCheck : " + inputed+"@"+select);

					if(data.ufo || data.kakao || data.naver){
						var savedEmail = "${userInfo.m_email}";
						emailSum();
						var hidInput = document.getElementById("realEmail").value;
						if(savedEmail == hidInput){
							$("#check_email").css("color","green");
							$("#check_email").text("현재 이메일 입니다.");
							emailCheck = true;
						}else{
							$("#check_email").css("color","red");
							$("#check_email").text("이미 사용중인 이메일 입니다.");
							emailCheck = false;
						}
					} else{
						$("#check_email").css("color","blue");
						$("#check_email").text("사용가능한 이메일 입니다.");
						emailCheck = true;
					}
				}
			});
		}

	};
	
	var hidInput = document
	.getElementById("realEmail");
	
	
	
	//비밀번호 수정 팝업창 띄우기
	function showPopUp() {
		var url = "/member/mem/pw_change/1";
		var name = "addrPopup";
		var option = "width = 450, height = 560 left = 200, top=50, location=no";
		window.open(url, name, option);
	}
	//전화번호 자동 - 추가
	var autoHypenPhone = function(str) {
		str = str.replace(/[^0-9]/g, '');
		var tmp = '';
		if (str.length < 4) {
			return str;
		} else if (str.length < 7) {
			tmp += str.substr(0, 3);
			tmp += '-';
			tmp += str.substr(3);
			return tmp;
		} else if (str.length < 11) {
			tmp += str.substr(0, 3);
			tmp += '-';
			tmp += str.substr(3, 3);
			tmp += '-';
			tmp += str.substr(6);
			return tmp;
		} else {
			tmp += str.substr(0, 3);
			tmp += '-';
			tmp += str.substr(3, 4);
			tmp += '-';
			tmp += str.substr(7);
			return tmp;
		}
		return str;
	}
	var phoneNum = document.getElementById('phoneNum');
	phoneNum.onkeyup = function() {
		console.log(this.value);
		this.value = autoHypenPhone(this.value);
	}
	$(document).ready(
			function() {
				var size = $(window)[0].innerWidth;
				if (size > 1200) {
					$('#menuBar').attr('class',
							"nav nav-tabs md-tabs tabs-left b-none");
				} else {
					$('#menuBar').attr('class', "nav nav-tabs md-tabs");
				}
			});
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
	function goRentDetailPage(r_id) {
		var url = '/member/mem/memRentDetail/' + r_id;
		$("#tempPage").load(url, function() {
			$("#changedPage").html($("#tempPage").html());
			$("#tempPage").html("");
		});
	}
	function goBuyDetailPage(r_id) {
		var url = '/member/mem/memBuyDetail/' + r_id;
		$("#tempPage").load(url, function() {
			$("#changedPage").html($("#tempPage").html());
			$("#tempPage").html("");
		});
	}
	/*사진 미리 보여주기 함수 memberDetail*/
	$(document).ready(
			function() {
				var fileTarget = $('.upload-hidden');
				fileTarget.on('change', function() { // 값이 변경되면 
					if (window.FileReader) { // modern browser 
						var filename = $(this)[0].files[0].name;
					} else { // old IE 
						var filename = $(this).val().split('/').pop()
								.split('\\').pop(); // 파일명만 추출 
					} // 추출한 파일명 삽입 
					$(this).siblings('.upload-name').val(filename);
				});
			});

	var emailChange = false;
	$(document).on('change','#frontEmail', function(){
		console.log("frontEmail에 in")
		emailChange = true;
		emailCheck = false;
		$("#check_email").css("color","green");
		$("#check_email").text("");
	});
	
	var imgTarget = $('.upload-hidden');
	imgTarget
			.on(
					'change',
					function() {
						var parent = $(this).parent();
						parent.children('.m_imgPreview').remove();
						if (window.FileReader) {
							if (!$(this)[0].files[0].type.match(/image\//))
								return;
							var reader = new FileReader();
							reader.onload = function(e) {
								var src = e.target.result;
								parent
										.prepend('<div class="m_imgPreview"><img src="' + src +'" class="img-fluid img-circle"></div>');
							}
							reader.readAsDataURL($(this)[0].files[0]);
						}
					});
	
	/*다음 우편번호 찾기 javaScript */
	function daumPostcode() {
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
	$('#detailAddress').focusout(
			function() {
				var detail =  $('#detailAddress').val();
				if(detail == ""){
					detail = " ";
				}
				var realAddr = $('input[name=addr]').eq(0).val() + "|"
						+ $('input[name=addr]').eq(1).val() + "|"
						+ detail + "|"
						+ $('input[name=addr]').eq(2).val();
				$('#realAddress').val(realAddr);
			});
	//승빈
	$(function() {
		//사용 예시 **************************
		$(document).on("click", "#accountDeleteBtn", function() {
			var toRent = "${toRent}";
			
			if(toRent == "true"){
				action_popup.alert("대여 중인 상품이 있습니다. 다시 확인해 주세요.");
				
			}else {
				action_popup.confirm("탈퇴 하시겠습니까?", function(res) {
					if (res) {
						document.accountDelete.submit();
					}
				});
			} 
		});
		$(document).on("click", "#update", function() {
			var savedEmail = "${userInfo.m_email}";
			emailSum();
			var hidInput = document.getElementById("realEmail").value;
			
			if(savedEmail == hidInput){
				emailCheck = true;
			}
			if(emailChange){
				if(emailCheck){
					action_popup.confirm("수정 하시겠습니까?", function(upd) {
						if (upd) {
							action_popup.alert("수정이 되었습니다.");
							document.update.submit();
						} else {
							action_popup.alert("수정에 실패하였습니다.");
						}
					});
				}else{
					action_popup.alert("이메일 중복확인을 해주세요.");
				}
			}else{
				action_popup.confirm("수정 하시겠습니까?", function(upd) {
					if (upd) {
						action_popup.alert("수정이 되었습니다.");
						document.update.submit();
					} else {
						action_popup.alert("수정에 실패하였습니다.");
					}
				});
			}
			
		});
		
		
		$(document).on("click", "#alert", function() {
			action_popup.confirm("탈퇴 하시겠습니까?", function(res) {
				if (res) {
					
					action_popup.alert("정보 약관에 동의해주세요.");
				} else {
					action_popup.alert("대여 중인 상품이 있습니다. 다시 확인해 주세요.");
				}
			})
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