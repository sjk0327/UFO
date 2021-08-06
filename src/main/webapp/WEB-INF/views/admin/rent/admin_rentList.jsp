<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html lang="en">


<head>
<title>admin_rentList</title>

<%@ include file="/WEB-INF/views/adminHeader.jsp"%>

<style>
#sort {
	text-align: center;
}

#textsearch {
	margin-left: 5px;
	margin-right: 5px;
	width: 250px;
}
</style>
<script>
	$(function(){
		//perPageNum select 박스 설정
		setPerPageNumSelect();
		
		//등록, 삭제 후 문구 처리
		var result = '${result}';
		$(function(){
			if(result === 'registerOK'){
				$('#registerOK').removeClass('hidden');
				$('#registerOK').fadeOut(2000);
			}
			if(result === 'removeOK'){
				$('#removeOK').removeClass('hidden');
				$('#removeOK').fadeOut(2000);
			}
		})
		
		//prev 버튼 활성화, 비활성화 처리
		var canPrev = '${pageMaker.prev}';
		if(canPrev !== 'true'){
			$('#page-prev').addClass('disabled');
		}
		
		//next 버튼 활성화, 비활성화 처리
		var canNext = '${pageMaker.next}';
		if(canNext !== 'true'){
			$('#page-next').addClass('disabled');
		}
		
		//현재 페이지 파란색으로 활성화
		var thisPage = '${pageMaker.cri.page}';
		//매번 refresh 되므로 다른 페이지 removeClass 할 필요는 없음->Ajax 이용시엔 해야함
		$('#page'+thisPage).addClass('active');
	})
	
	function setPerPageNumSelect(){
		var perPageNum = "${pageMaker.cri.perPageNum}";
		var $perPageSel = $('#perPageSel');
		var thisPage = '${pageMaker.cri.page}';
		$perPageSel.val(perPageNum).prop("selected",true);
		//PerPageNum가 바뀌면 링크 이동
		$perPageSel.on('change',function(){
			//pageMarker.makeQuery 사용 못하는 이유: makeQuery는 page만을 매개변수로 받기에 변경된 perPageNum을 반영못함
			window.location.href = "listPage?page="+thisPage+"&perPageNum="+$perPageSel.val();
		})
	}
</script>
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
										<form id="sort" name="rentSearch" method="post" action="/admin/rent/rentList">
										
											<select id="searchType" name="searchType">
												<option value="">검색조건</option>
												<option value="t">회원ID</option> 
												<option value="c">제품ID</option>
												<option value="w">제품명</option>
												<option value="tc">상태</option>
											</select>
											<input type="text" id="keyword" name="keyword" value="${pageMaker.cri.keyword}" placeholder="검색어를 입력하세요"/>
											<button id="searchBtn">검색</button> 
											<input type="button" value="전체보기" onClick="location.href='/admin/rent/rentList';">
											
										</form>
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
																				onClick="location.href='/adminsite/adminRentDetail/${list.r_id}'">
																				<td>${list.r_id }</td>
																				<td>${list.r_mid }</td>
																				<td>${list.r_pid }</td>
																				<td>${list.p_name }</td>
																				<td>${list.r_sdate }</td>
																				<c:if test="${list.r_state eq '대여중'}">
																				<td><label class="label label-primary" style="font-size: 10pt;">${list.r_state }</label></td>
																				</c:if>
																				<c:if test="${list.r_state eq '즉시 구매' || list.r_state eq '구매 확정'}">
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
											<div class="text-center">
												<nav aria-label="pagination">
													<ul class="pagination">
														<!-- prev 버튼 -->
														<li id="page-prev">
															<a href="/admin/rent/rentList${pageMaker.makeQuery(pageMaker.startPage-1)}" aria-label="Prev">
																<span aria-hidden="true">[이전]&nbsp;</span>
															</a>
														</li>
														<!-- 페이지 번호 (시작 페이지 번호부터 끝 페이지 번호까지) -->
														<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
														    <li id="page${idx}">
															    <a href="/admin/rent/rentList${pageMaker.makeQuery(idx)}">
															    	<!-- 시각 장애인을 위한 추가 -->
															      	<span>&nbsp;&nbsp;${idx}&nbsp;&nbsp;<span class="sr-only">(current)</span></span>
															    </a>
														    </li>
														</c:forEach>
														<!-- next 버튼 -->
														<li id="page-next">
														
														<c:choose>

													    <c:when test="${pageMaker.totalDataCount % pageMaker.cri.perPageNum eq 0}">
													        <c:if test="${pageMaker.cri.page ne (pageMaker.totalDataCount / pageMaker.cri.perPageNum)}">
														    <a href="/admin/rent/rentList${pageMaker.makeQuery(pageMaker.endPage+1)}" aria-label="Next">
														    	<span aria-hidden="true">&nbsp;[다음]</span>
														    </a>
														    </c:if>
													    </c:when>
													
													    <c:when test="${pageMaker.totalDataCount % pageMaker.cri.perPageNum ne 0}">
													        <c:if test="${pageMaker.cri.page ne (pageMaker.totalDataCount / pageMaker.cri.perPageNum+1)}">
														    <a href="/admin/rent/rentList${pageMaker.makeQuery(pageMaker.endPage+1)}" aria-label="Next">
														    	<span aria-hidden="true">&nbsp;[다음]</span>
														    </a>
														    </c:if>
													    </c:when>
													
													</c:choose>
													
														</li>
														
													</ul>
												</nav>
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

</html>
