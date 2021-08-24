<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">

<head>
<title>메시지 리스트 페이지 - UF&#38;O</title>
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
																	<li class="nav-item"><a class="nav-link"
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

											<!-- Basic table card start -->
											<!--  sale analytics start -->
											<div class="col-xl-10 col-sm-12" id="changedPage">
												<div class="card">
													<div class="card-block">

														<div>
															<div class="card-header">
																<h5>메시지함</h5>
															</div>
															<!-- 검색창 시작  -->
															<form id="sort" class="dropdown-primary dropdown open"
																name="messageSearch" method="post"
																action="/member/mem/messageList">
																<select id="searchType" name="searchType">
																	<option value="">검색조건</option>
																	<option value="t"
																		<c:if test="${pageMaker.cri.searchType eq 't'}">selected </c:if>>제목</option>
																	<option value="c"
																		<c:if test="${pageMaker.cri.searchType eq 'c'}"> selected </c:if>>이름</option>
																	<option value="w"
																		<c:if test="${pageMaker.cri.searchType eq 'w'}"> selected </c:if>>포인트</option>
																	<option value="tc"
																		<c:if test="${pageMaker.cri.searchType eq 'tc'}"> selected </c:if>>가입일</option>

																</select>&nbsp; <input type="text" id="keyword" name="keyword"
																	value="${pageMaker.cri.keyword}"
																	placeholder="검색어를 입력하세요" />&nbsp;
																<button id="button"
																	class="btn waves-effect waves-light btn-primary btn-outline-primary">검색</button>
																&nbsp; <input id="button" type="button" value="전체보기"
																	class="btn waves-effect waves-light btn-primary btn-outline-primary"
																	onClick="location.href='/member/mem/messageList';">&nbsp;
															</form>
															
																	<div>
																		<br>
																	</div>



															<div class="col-xl-10 col-md-12">
																<div class="card">



																	<div>
																		<br>
																	</div>
																	
																	


																	<!-- 검색창 끝  -->


																	<div class="card-block table-border-style">
																		<div class="table-responsive">
																			<table class="table table-hover">
																				<thead>
																					<tr>
																						<th width="100">보낸사람</th>
																						<th width="100">제목</th>
																						<th width="100">날짜</th>
																					</tr>
																				</thead>

																				<c:forEach var="list" items="${messageList}"
																					begin="0" end="8" step="1" varStatus="status">

																					<tbody>
																						<tr
																							onclick="location.href='/member/mem/messageList/${list.a_id }'"
																							style="cursor: hand">
																							<td><p>UFO&nbsp;고객센터</p></td>
																							<td scope="row">${list.a_title }</td>
																							<td><fmt:formatDate value="${list.a_date }"
																									pattern="yyyy-MM-dd hh:mm:ss" /></td>
																						</tr>
																					</tbody>
																				</c:forEach>

																			</table>
																		</div>
																	</div>
																</div>
															</div>

															<!-- Page-body end -->

															<!-- 페이징 start -->

															<div id="paging-div">
																<div class="col-sm-3">
																	<ul class="btn-group pagination">
																		<c:if test="${pageMaker.prev }">
																			<li><a
																				href='<c:url value="/member/mem/messageList${pageMaker.makeQuery(pageMaker.startPage-1)}"/>'>
																					<span style="font-weight: bold;">&nbsp;[이전]&nbsp;</span>
																			</a></li>
																			<span class="col-md-1"></span>
																		</c:if>
																		<c:forEach begin="${pageMaker.startPage }"
																			end="${pageMaker.endPage }" var="pageNum">
																			<c:if test="${pageNum eq pageMaker.cri.page}">
																				<li><a
																					href='<c:url value="/member/mem/messageList${pageMaker.makeQuery(pageNum)}"/>'>
																						<span id="pagingCur"
																						style="background-color: #7971ea; display: inline-block; height: 30px; width: 30px; border-radius: 50%; font-weight: bold; color: white; padding: 5px;">&nbsp;${pageNum}&nbsp;</span>
																				</a></li>
																				<span class="col-md-1"></span>
																			</c:if>
																			<c:if test="${pageNum ne pageMaker.cri.page}">
																				<li><a
																					href='<c:url value="/member/mem/messageList${pageMaker.makeQuery(pageNum)}"/>'>
																						<span>&nbsp;${pageNum}&nbsp;</span>
																				</a></li>
																				<span class="col-md-1"> </span>
																			</c:if>

																		</c:forEach>
																		<c:if
																			test="${pageMaker.next && pageMaker.endPage >0 }">
																			<li><a
																				href='<c:url value="/member/mem/messageList${pageMaker.makeQuery(pageMaker.endPage+1)}"/>'>
																					<span style="font-weight: bold;">&nbsp;[다음]&nbsp;</span>
																			</a></li>
																			<span class="col-md-1"></span>
																		</c:if>
																	</ul>
																</div>
															</div>
															<!-- 페이징 end -->
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
	</script>


	<%@ include file="/WEB-INF/views/customerFooter.jsp"%>
	</body>
</html>