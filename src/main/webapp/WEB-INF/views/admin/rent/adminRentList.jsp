<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="en">


<head>
<title>admin_rentList</title>

<%@ include file="/WEB-INF/views/adminHeader.jsp"%>
<style>
#sort {
	text-align: left;
}

#textsearch {
	margin-left: 5px;
	margin-right: 5px;
	width: 250px;
}

#paging-div { 
	margin-left: auto; 
	margin-right: auto; 
	text-align: center; 
}

#searchType {
	width: 100px;
	height: 28px;
	padding-left: 8px;
	font-size: 15px;
	font-weight:bold;
	color:#ffffff;
	border-radius: 5px;
	border:1px solid #c584f3;
	display:inline-block;
	background:linear-gradient(to bottom, #dfbdfa 5%, #bc80ea 100%);
	background-color:#9990A3;
	text-decoration:none;
	text-shadow:0px 1px 0px #9752cc;
}

#searchType:hover {
	background:linear-gradient(to bottom, #bc80ea 5%, #dfbdfa 100%);
	background-color:#bc80ea;
}
#searchType:active {
	position:relative;
	top:1px;
	background-color: white;
}

.myButton {
	box-shadow:inset 0px 1px 0px 0px #efdcfb;
	background-color:#9990A3;
	border-radius:6px;

	display:inline-block;
	cursor:pointer;
	color:#ffffff;
	font-family:Arial;
	font-size:15px;
	font-weight:bold;
	padding:2px 6px;
	text-decoration:none;
	
}
.myButton:hover {

	background-color:#9990A3;
}
.myButton:active {
	position:relative;
	top:1px;
}

#keyword{
	border-radius:5px; 
	height: 28px; 
	border: solid 1px grey;
}

</style>

</head>

<body>
	<div id="pcoded" class="pcoded">
		<div class="pcoded-overlay-box"></div>
		<div class="pcoded-container navbar-wrapper">
			<%@ include file="/WEB-INF/views/adminNav.jsp"%>
			<div class="pcoded-main-container">
				<div class="pcoded-wrapper">
					<%@ include file="/WEB-INF/views/adminMenu.jsp"%>
					<div class="pcoded-content">
						<div class="pcoded-inner-content">
							<div class="main-body">
								<div class="page-wrapper">
									<div class="page-body">
									
										<form id="sort" name="rentSearch" method="post"
											action="/admin/rent/rentList">

											
											<select id="searchType" name="searchType" >
												<option value="">검색조건</option>
												<option value="t">회원ID</option>
												<option value="c">제품ID</option>
												<option value="w">제품명</option>
												<option value="tc">상태</option>
											</select> 
											<input type="text" id="keyword" name="keyword"  
												value="${pageMaker.cri.keyword}" placeholder="검색어를 입력하세요" />
											<button id="searchBtn" class="myButton">검색</button>
											<input type="button" class="myButton" value="전체보기" onClick="location.href='/admin/rent/rentList';">

										</form>
										<div><br></div>
										<div class="card">
											<div class="row">
												<div class="col-sm-12">
													<!-- Hover table card start -->
													<div class="card">
														<div class="card-header">
															<h5>대여 / 구매관리</h5>
															<div class="card-header-right">
																<ul class="list-unstyled card-option">
																	<li><i class="fa fa fa-wrench open-card-option"></i></li>
																	<li><i class="fa fa-window-maximize full-card"></i></li>
																	<li><i class="fa fa-refresh reload-card"></i></li>
																</ul>
															</div>
														</div>
														<div class="card-block table-border-style">
															<div class="table-responsive">
																<table class="table table-hover">
																	<thead>
																		<tr>
																			<th>번호</th>
																			<th>회원 ID</th>
																			<th>제품ID</th>
																			<th>제품명</th>
																			<th>대여날짜</th>
																			<th>상태</th>
																		</tr>
																	</thead>
																	<c:forEach var="list" items="${rentList}">
																		<tbody>
																			<tr
																				onClick="location.href='/admin/rent/rentDetail/${list.r_id}'">
																				<td>${list.r_id }</td>
																				<td>${list.r_mid }</td>
																				<td>${list.r_pid }</td>
																				<td>${list.p_name }</td>
																				<td>${list.r_sdate }</td>
																				<c:if test="${list.r_state eq '대여중'}">
																					<fmt:parseDate var="tempToday" value="${list.r_sdate}" pattern="yyyy-MM-dd"/>
															  						<fmt:parseNumber var="sdate" value="${tempToday.time / (1000*60*60*24)}" integerOnly="true"/>
															   						<c:set var="now" value="<%=new java.util.Date()%>" />
															    					<fmt:parseNumber var="today" value="${now.time / (1000*60*60*24)}" integerOnly="true"/>
																					<c:if test="${sdate+3<today}"><td><label class="label label-danger" style="font-size: 10pt;">연체중</label></td></c:if>
																					<c:if test="${sdate+3>=today}"><td><label class="label label-primary" style="font-size: 10pt;">대여중</label></td></c:if>
																					</c:if>
																				<c:if
																					test="${list.r_state eq '즉시 구매' || list.r_state eq '구매 확정'}">
																					<td><label class="label label-info" style="font-size: 10pt;">${list.r_state }</label></td>
																				</c:if>
																				<c:if test="${list.r_state eq '반납 요청'}">
																					<td><label class="label label-warning" style="font-size: 10pt;">반납 요청</label></td>
																				</c:if>
																				<c:if test="${list.r_state eq '반납 완료'}">
																					<td><label class="label label-success" style="font-size: 10pt;">반납 완료</label></td>
																				</c:if>
																			</tr>
																		</tbody>
																	</c:forEach>
																</table>
															</div>
														</div>
													</div>
												</div>
											</div>
										</div>
										<!-- 페이징 start -->
										<div id = "paging-div">
										<ul class="btn-group pagination">
											<c:if test="${pageMaker.prev }">
												<li><a href='<c:url value="/admin/rent/rentList${pageMaker.makeQuery(pageMaker.startPage-1)}"/>'>
													<span style="font-weight: bold;">&nbsp;&#60;&#60;&#60;&nbsp;</span></a></li><span class="col-md-1"></span>
											</c:if>
											<c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="pageNum">
												<c:if test="${pageNum eq pageMaker.cri.page}"><li><a href='<c:url value="/admin/rent/rentList${pageMaker.makeQuery(pageNum)}"/>'>
												<span id="pagingCur" style="background-color: #7971ea; display:inline-block; height: 30px; width: 30px; border-radius: 50%; font-weight: bold; color: white; padding : 5px;">&nbsp;${pageNum}&nbsp;</span></a></li><span class="col-md-1"></span></c:if>
												<c:if test="${pageNum ne pageMaker.cri.page}"><li><a href='<c:url value="/admin/rent/rentList${pageMaker.makeQuery(pageNum)}"/>'>
												<span id="pagingCur">&nbsp;${pageNum}&nbsp;</span></a></li><span class="col-md-1">   </span></c:if>
												
											</c:forEach>
											<c:if test="${pageMaker.next && pageMaker.endPage >0 }">
												<li><a href='<c:url value="/admin/rent/rentList${pageMaker.makeQuery(pageMaker.endPage+1)}"/>'>
													<span style="font-weight: bold;">&nbsp;[다음]&nbsp;</span></a></li><span class="col-md-1"></span></a></li>
											</c:if>
										</ul>
										</div>
										<!-- 페이징 end -->
									</div>
								</div>
							</div>
						</div>
					</div>
					<div id="styleSelector"></div>
				</div>
			</div>
		</div>
	</div>
	<%@ include file="/WEB-INF/views/adminFooter.jsp"%>
</body>
<script>
	$(function() {
		//perPageNum select 박스 설정
		setPerPageNumSelect();

		//등록, 삭제 후 문구 처리
		var result = '${result}';
		$(function() {
			if (result === 'registerOK') {
				$('#registerOK').removeClass('hidden');
				$('#registerOK').fadeOut(2000);
			}
			if (result === 'removeOK') {
				$('#removeOK').removeClass('hidden');
				$('#removeOK').fadeOut(2000);
			}
		})

		//prev 버튼 활성화, 비활성화 처리
		var canPrev = '${pageMaker.prev}';
		if (canPrev !== 'true') {
			$('#page-prev').addClass('disabled');
		}

		//next 버튼 활성화, 비활성화 처리
		var canNext = '${pageMaker.next}';
		if (canNext !== 'true') {
			$('#page-next').addClass('disabled');
		}

		//현재 페이지 파란색으로 활성화
		var thisPage = '${pageMaker.cri.page}';
		//매번 refresh 되므로 다른 페이지 removeClass 할 필요는 없음->Ajax 이용시엔 해야함
		$('#page' + thisPage).addClass('active');
	})

	function setPerPageNumSelect() {
		var perPageNum = "${pageMaker.cri.perPageNum}";
		var $perPageSel = $('#perPageSel');
		var thisPage = '${pageMaker.cri.page}';
		$perPageSel.val(perPageNum).prop("selected", true);
		//PerPageNum가 바뀌면 링크 이동
		$perPageSel.on('change', function() {
			//pageMarker.makeQuery 사용 못하는 이유: makeQuery는 page만을 매개변수로 받기에 변경된 perPageNum을 반영못함
			window.location.href = "listPage?page=" + thisPage + "&perPageNum="
					+ $perPageSel.val();
		})
	}
</script>
</html>
