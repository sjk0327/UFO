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
</style>

</head>

<body>

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

											<!--  sale analytics start -->
											<div class="col-xl-6 col-md-12">
												<!-- 회원 개인 정보 수정 가능하게끔 -->
												<div class="card">
													<div class="card-header">
														<h5>개인 정보</h5>
													</div>
													<div class="card-block">
														<form:form class="form-material"
															action="/member/mem/userInfo/${userVO.m_id }"
															method="post" enctype="multipart/form-data"
															modelAttribute="userVO">
															<div class="row">
																<div class="col-sm-4">
																	<!-- 사진 나오게 하고 찾아보기 버튼 -->
																	<div class="filebox">
																		<div class="m_imgPreview">
																			<img src="/resources/Images/member/${userVO.m_img }"
																				class="img-fluid img-circle">
																		</div>
																		<input class="upload-name" value="파일선택"
																			disabled="disabled" /> <label for="input-file">업로드</label>
																		<input type="file" name="uploadFile" id="input-file"
																			class="upload-hidden" />
																	</div>

																</div>
																<div class="col-sm-8">
																	<div class="form-group row">
																		<div class="col-sm-3 col-form-label">아이디</div>
																		<div
																			class="form-group form-primary form-static-label col-sm-9 ">
																			<form:input path="m_id"
																				class="form-control form-control-center form-control-round form-control-bold"
																				disabled='true' />
																			<span class="form-bar"></span>
																		</div>
																	</div>
																	<div class="form-group row">
																		<div class="col-sm-3 col-form-label">이 름</div>
																		<div
																			class="form-group form-primary form-static-label col-sm-9">
																			<form:input type="text" value="${userVO.m_name }"
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
																				value="${fn:split(userVO.m_addr,',')[0]}"
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
																		value="${fn:split(userVO.m_addr,',')[1]}"
																		class="form-control" placeholder="주소"
																		required="required" />
																	<span class="form-bar"></span>
																	<div class="row">
																		<div class="col-sm-6">
																			<form:input type="text" id="detailAddress"
																				path="m_addr"
																				value="${fn:split(userVO.m_addr,',')[2]}"
																				class="form-control" placeholder="상세주소"
																				required="required" />
																			<span class="form-bar"></span>
																		</div>
																		<div class="col-sm-6">
																			<form:input type="text" id="extraAddress"
																				path="m_addr"
																				value="${fn:split(userVO.m_addr,',')[3]}"
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
																		class="form-control form-control-center form-control-round form-control-bold"
																		placeholder="필수 항목 입니다." required="required" />
																	<span class="form-bar"></span>
																</div>
															</div>
															  <div class="form-group row">
                                                      	 <input type="hidden" name="m_email" id="realEmail" value="${userVO.m_email }"/>
                                                         <div class="col-sm-2 col-form-label">이메일</div>
                                                         <div class="form-group form-primary form-static-label col-sm-5">
                                                            <input type="text" id="frontEmail" value="${fn:split(userVO.m_email,'@')[0] }" onchange="emailSum()" class="form-control form-control-center form-control-round form-control-bold" placeholder="필수 항목 입니다." required="required"/>
                                                            <span class="form-bar"></span>
                                                         </div>
                                                         @
                                                         <div class="col-sm-4">
					                                    	<select id="backEmail" onchange="emailSum()">
					                                    		<option value="">선택해주세요.</option>
					                                    	<c:forTokens var="email" items="naver.com,daum.net,hanmail.net,gmail.com" delims=",">
					                                    		<c:if test="${fn:split(userVO.m_email,'@')[1] eq email}">
					                                    		<option value="${email }" selected>${email }</option>
					                                    		</c:if>
					                                    		<option value="${email }">${email }</option>
					                                    		</c:forTokens>
					                                    	</select>
					                                    </div>
                                                      </div>
                                                      <script>
                                                      function emailSum(){
                                                    	  var front = document.getElementById("frontEmail").value;
                                                    	  var back = document.getElementById("backEmail");
                                                    	  var email = "";
                                                    	  var hidInput = document.getElementById("realEmail");
                                                    	  email = front + "@" + back.options[back.selectedIndex].value;
                                                    	  hidInput.value = email;
                                                    	  
                                                      }
                                                      </script>	
															<div class="form-group row">
																<div class="col-sm-2 col-form-label">포인트</div>
																<div
																	class="form-group form-primary form-static-label col-sm-10">
																	<form:input type="text" path="m_point"
																		class="form-control form-control-center form-control-round form-control-bold"
																		disabled='true' placeholder="필수 항목 입니다." required="required" />
																	<span class="form-bar"></span>
																</div>
															</div>
															<div class="form-group row">
																<div class="col-sm-2 col-form-label">가입날짜</div>

																<!--<fmt:formatDate var="formatRegDate" value="${userVO.m_regdate}" pattern="yyyy년 MM월 dd일, HH시 MM분 SS초"/>
                                                            <input value="${formatRegDate}" class="form-control form-control-center form-control-round form-control-bold" placeholder="필수 항목 입니다." readonly="readonly"/>-->
																<div class="form-group form-primary col-sm-10">
																	<form:input type="date" name="m_regdate"
																		path="m_regdate" disabled='true'/>
																	<span class="form-bar"></span>
																</div>
															</div>
															<div class="row">
																<div>
																	<input type="submit" id="button" value="수정"
																		class="btn waves-effect waves-light btn-primary btn-outline-primary">
																</div>
																<div>
																	<input type="submit" id="button" value="탈퇴"
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
																			onClick="location.href='/admin/rent/rentDetail/${list.r_id}'">
																			<td>
																				<div class="d-inline-block align-middle">
																					<img src="/resources/Images/tempProductImage.jpg"
																						class="img-radius img-40 align-top m-r-15">
																					<div class="d-inline-block">
																						<h6>${list.p_name }</h6>
																						<p class="text-muted m-b-0">상품 카테고리</p>
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
																		<tr>
																		<tr
																			onClick="location.href='/admin/rent/rentDetail/${list.r_id}'">
																			<td>
																				<div class="d-inline-block align-middle">
																					<img src="/resources/Images/tempProductImage.jpg"
																						class="img-radius img-40 align-top m-r-15">
																					<div class="d-inline-block">
																						<h6>${list.p_name }</h6>
																						<p class="text-muted m-b-0">상품 카테고리?</p>
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
														<h5>회원 메시지함</h5>
													</div>
													<div class="card-block">
														<div class="table-responsive">
															<table class="table table-hover">

																<c:forEach var="list" items="${purchaseList }">
																	<tbody>
																		<tr>
																		<tr
																			onClick="location.href='/admin/rent/rentDetail/${list.r_id}'">
																			<td>
																				<div class="d-inline-block align-middle">
																					<img src="/resources/Images/tempProductImage.jpg"
																						class="img-radius img-40 align-top m-r-15">
																					<div class="d-inline-block">
																						<h6>${list.p_name }</h6>
																						<p class="text-muted m-b-0">상품 카테고리?</p>
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









											</div>
											<!--  sale analytics end -->


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
	<!--이 script 없으면 css 깨짐-->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
															<script>
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
	</script>
															<%@ include file="/WEB-INF/views/adminFooter.jsp"%>
															<%@ include file="/WEB-INF/views/customerFooter.jsp"%>
</body>

</html>