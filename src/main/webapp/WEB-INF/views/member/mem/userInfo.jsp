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
	<ul id="tempPage" style=" display:none"></ul>
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
										            <div class="sub-title" style="margin-bottom:0px;">Menu</div>
										            <!-- Nav tabs -->
										            <ul id="menuBar" class="nav nav-tabs md-tabs" role="tablist">
										                <li class="nav-item">
										                    <a class="nav-link active" href="/member/mem/userInfo" role="tab">내 정보</a>
										                    <div class="slide"></div>
										                </li>
										                <li class="nav-item">
										                    <a class="nav-link " href="/member/mem/memRentList" role="tab">대역 내역</a>
										                    <div class="slide"></div>
										                </li>
										                <li class="nav-item">
										                    <a class="nav-link" href="/member/mem/memBuyList" role="tab">구매 내역</a>
										                    <div class="slide"></div>
										                </li>
										                <li class="nav-item">
										                    <a class="nav-link" href="#MessageBox" role="tab">메시지 함</a>
										                    <div class="slide"></div>
										                </li>
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
															action="/member/mem/userInfo/${userInfo.m_id }"
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
																		<input type="file" name="uploadFile" id="input-file"
																			class="upload-hidden" /> <input type="text"
																			name="m_img" value="${userInfo.m_img }" hidden="true">
																	</div>

																</div>
																<div class="col-sm-8">
																	<div class="form-group row">
																		<div class="col-sm-3 col-form-label">아이디</div>
																		<div
																			class="form-group form-primary form-static-label col-sm-9 ">
																			<form:hidden path="m_id" value="${userInfo.m_id }"
																				class="form-control form-control-center form-control-round form-control-bold" />
																			<input id="id" value="${userInfo.m_id }"
																				disabled="disabled"
																				class="form-control form-control-center form-control-round form-control-bold" />

																			<span class="form-bar"></span>
																		</div>
																	</div>
																	
																	<div class="form-group row">
																		<div class="col-sm-3 col-form-label">비밀번호</div>
																		<div
																			class="form-group form-primary form-static-label col-sm-9">
																			<form:input type="text" value="${userInfo.m_pw }"
																				path="m_pw"
																				class="form-control form-control-center form-control-round form-control-bold"
																				placeholder="필수 항목 입니다." required="required" />
																			<span class="form-bar"></span>
																		</div>
																	</div>
																	
																	<div class="form-group row">
																		<div class="col-sm-3 col-form-label">이 름</div>
																		<div
																			class="form-group form-primary form-static-label col-sm-9">
																			<form:input type="text" value="${userInfo.m_name }"
																				path="m_name"
																				class="form-control form-control-center form-control-round form-control-bold"
																				placeholder="필수 항목 입니다." required="required" />
																			<span class="form-bar"></span>
																		</div>
																	</div>
																	<div class="form-group row">
																		<div class="col-sm-3 col-form-label">성별</div>
																		<div
																			class="form-group form-primary form-static-label col-sm-9">
																			<form:input type="text" path="m_gender"
																				value="${userInfo.m_gender }"
																				class="form-control form-control-center form-control-round form-control-bold"
																				readonly="readonly" />
																			<span class="form-bar"></span>
																		</div>
																	</div>
																</div>
															</div>
															<div class="form-group row">
																<div class="col-sm-2 col-form-label">주소</div>
																<div
																	class="form-group form-primary form-static-label col-sm-10">
																	<!-- 주소 split 으로 나눠서 token 화 하기 -->
																	<div class="row">
																		<div class="col-sm-6">
																			<form:input type="text" id="postcode" path="m_addr"
																				value="${fn:split(userInfo.m_addr,',')[0]}"
																				class="form-control" placeholder="우편번호"
																				required="required" />
																			<span class="form-bar"></span>
																		</div>
																		<div class="col-sm-6">
																			<input type="button" onclick="daumPostcode()"
																				value="우편번호 찾기"
																				class="btn btn-mat waves-effect waves-light btn-info "
																				style="background-color: #7971ea;" />
																		</div>
																	</div>
																	<form:input type="text" id="address" path="m_addr"
																		value="${fn:split(userInfo.m_addr,',')[1]}"
																		class="form-control" placeholder="주소"
																		required="required" />
																	<span class="form-bar"></span>
																	<div class="row">
																		<div class="col-sm-6">
																			<form:input type="text" id="detailAddress"
																				path="m_addr"
																				value="${fn:split(userInfo.m_addr,',')[2]}"
																				class="form-control" placeholder="상세주소"
																				required="required" />
																			<span class="form-bar"></span>
																		</div>
																		<div class="col-sm-6">
																			<form:input type="text" id="extraAddress"
																				path="m_addr"
																				value="${fn:split(userInfo.m_addr,',')[3]}"
																				class="form-control" placeholder="참고항목" />
																			<span class="form-bar"></span>
																		</div>
																	</div>
																</div>
															</div>
															<div class="form-group row">
																<div class="col-sm-2 col-form-label">전화번호</div>
																<div
																	class="form-group form-primary form-static-label col-sm-10">
																	<form:input type="text" path="m_tel"
																		value="${userInfo.m_tel }"
																		class="form-control form-control-center form-control-round form-control-bold"
																		placeholder="필수 항목 입니다." required="required" />
																	<span class="form-bar"></span>
																</div>
															</div>
															<div class="form-group row">
																<input type="hidden" name="m_email" id="realEmail"
																	value="${userInfo.m_email }" />
																<div class="col-sm-2 col-form-label">이메일</div>
																<div
																	class="form-group form-primary form-static-label col-sm-5">
																	<input type="text" id="frontEmail"
																		value="${fn:split(userInfo.m_email,'@')[0] }"
																		onchange="emailSum()"
																		class="form-control form-control-center form-control-round form-control-bold"
																		placeholder="필수 항목 입니다." required="required" /> <span
																		class="form-bar"></span>
																</div>
																@
																<div class="col-sm-4">
																	<select id="backEmail" onchange="emailSum()">
																		<option value="">선택해주세요.</option>
																		<c:forTokens var="email"
																			items="naver.com,daum.net,hanmail.net,gmail.com"
																			delims=",">
																			<c:if
																				test="${fn:split(userInfo.m_email,'@')[1] eq email}">
																				<option value="${email }" selected>${email }</option>
																			</c:if>
																			<option value="${email }">${email }</option>
																		</c:forTokens>
																	</select>
																</div>
															</div>
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
															</script>
															<div class="form-group row">
																<div class="col-sm-2 col-form-label">포인트</div>
																<div
																	class="form-group form-primary form-static-label col-sm-10">
																	<form:input type="text" path="m_point"
																		value="${userInfo.m_point }"
																		class="form-control form-control-center form-control-round form-control-bold"
																		disabled='true' placeholder="필수 항목 입니다."
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
																		disabled='true' />
																	<span class="form-bar"></span>
																</div>
															</div>
															<div class="row" style="float: right;">
																<div>
																	<input type="button" id="update" value="수정"
																		class="btn waves-effect waves-light btn-primary btn-outline-primary">
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
													</div>
													<div class="card-block">
														<div class="table-responsive">
															<table class="table table-hover">

																<c:forEach var="list" items="${rentList }">
																	<tbody>
																		<tr
																			onClick="location.href='/member/mem/memRentDetail/${list.r_id}'">
																			<td>
																				<div class="d-inline-block align-middle">
																					<img src="/resources/Images/tempProductImage.jpg"
																						class="img-radius img-40 align-top m-r-15">
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
																				<div>D - ${list.r_sdate}</div>
																			</td>
																			<td class="text-right"><c:if
																					test="${list.r_state eq '대여중'}">
																					<fmt:parseDate var="tempToday"
																						value="${list.r_sdate}" pattern="yyyy-MM-dd" />
																					<fmt:parseNumber var="sdate"
																						value="${tempToday.time / (1000*60*60*24)}"
																						integerOnly="true" />
																					<c:set var="now" value="<%=new java.util.Date()%>" />
																					<fmt:parseNumber var="today"
																						value="${now.time / (1000*60*60*24)}"
																						integerOnly="true" />
																					<c:if test="${sdate+3>=today}">
																						<label class="btn btn-primary">대 여 중</label>
																					</c:if>
																					<c:if test="${sdate+3<today}">
																						<label class="btn btn-danger">연 체 중</label>
																					</c:if>
																				</c:if> <c:if test="${list.r_state eq '반납 요청'}">
																					<label class="btn btn-warning">반납 요청</label>
																				</c:if> <c:if test="${list.r_state eq '반납 완료'}">
																					<label class="btn btn-success">반납 완료</label>
																				</c:if></td>
																		</tr>
																	</tbody>
																</c:forEach>

															</table>
														</div>
													</div>
												</div>
												<!-- 회원 구매 현황(간략) -->
												<div class="card table-card">
													<div class="card-header">
														<h5>구매 현황</h5>
													</div>
													<div class="card-block">
														<div class="table-responsive">
															<table class="table table-hover">

																<c:forEach var="list" items="${purchaseList }">
																	<tbody>

																		<tr onClick="location.href='/member/mem/memBuyDetail/${list.r_id}'">

																			<td>
																				<div class="d-inline-block align-middle">
																					<img src="/resources/Images/tempProductImage.jpg"
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
														</div>
													</div>
												</div>





												<!-- 회원 메시지함 -->
												<div class="card table-card">
													<div class="card-header">
														<h5>메시지함</h5><a href="/member/mem/messageList" style="float: right;">더보기</a>
													</div>
													<div class="card-block">
														<div class="table-responsive">
															<table class="table table-hover">

																<c:forEach var="messageList" items="${messageList }">
																	<tbody>
																		<tr onclick="location.href='/member/mem/messageList/${messageList.a_id }'"
																	style="cursor: hand">
																		    <td>
																				<div>
																					<p>UFO&nbsp;고객센터</p>
																				</div>
																			</td>
																			<td>
																				<div>
																					<div>
																						<h6>${messageList.a_title }</h6>
																					</div>
																				</div>
																			</td>
																			<td>
																				<fmt:formatDate value="${messageList.a_date }" pattern="yyyy-MM-dd hh:mm:ss" />
																			</td>
																		</tr>
																	</tbody>
																</c:forEach>




															</table>



														</div>
													</div>
												</div>
												<!-- 회원 메시지함  끝-->


											</div>



										</div>
										</div>
										</div>
										<!-- Page-body end -->
									<form:form class="form-material" name="delete2"
										action="/member/mem/userDelete/${userInfo.m_id }"
										method="post" enctype="multipart/form-data"
										modelAttribute="userVO">
										<form:hidden path="m_id" value="${userInfo.m_id }"
											class="form-control form-control-center form-control-round form-control-bold" />

										<div style="float: right; padding-bottom: 100px">
											<input type="button" id="confirm" value="회원탈퇴"
												class="btn waves-effect waves-light btn-primary btn-outline-primary">
										</div>
									</form:form>
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




	<!--이 script 없으면 css 깨짐-->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js">
	</script>
	<script>
	$(document).ready(function(){
		var size =$(window)[0].innerWidth;
		if(size > 1200) {
			$('#menuBar').attr('class' , "nav nav-tabs md-tabs tabs-left b-none");
		} else {
			$('#menuBar').attr('class' , "nav nav-tabs md-tabs");
		}
	});


	$(window).resize(function() {
		var size =$(window)[0].innerWidth;
		if(size > 1200) {
			$('#menuBar').attr('class' , "nav nav-tabs md-tabs tabs-left b-none");
		} else {
			$('#menuBar').attr('class' , "nav nav-tabs md-tabs");
		}
	});

	function goRentDetailPage(r_id){
	   	var url = '/member/mem/memRentDetail/'+r_id;
    	 $("#tempPage").load(url, function(){
      	 $("#changedPage").html($("#tempPage").html());
      	 $("#tempPage").html("");
     	});
	}
	
	function goBuyDetailPage(r_id){
	   	var url = '/member/mem/memBuyDetail/'+r_id;
    	 $("#tempPage").load(url, function(){
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
							document.getElementById("detailAddress").focus();
						}
					}).open();
		}

		//승빈

		$(function() {
			//사용 예시 **************************
			$(document).on("click", "#confirm", function() {
				action_popup.confirm("탈퇴 하시겠습니까?", function(res) {
					if (res) {
						action_popup.alert("탈퇴가 되었습니다.");
						document.delete2.submit();
					} else {
						action_popup.alert("탈퇴에 실패하였습니다.");
					}
				})
			});

			$(document).on("click", "#update", function() {
				action_popup.confirm("수정 하시겠습니까?", function(upd) {
					if (upd) {
						action_popup.alert("수정이 되었습니다.");
						document.update.submit();
					} else {
						action_popup.alert("수정에 실패하였습니다.");
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

	<%@ include file="/WEB-INF/views/customerFooter.jsp"%>
</body>

</html>