<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>



<!DOCTYPE html>
<html lang="en">

<head>
<title>회원관리</title>
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
	font-size: 13px;
	color: #585858;
	border-radius: 5px;
}

.myButton {
	background-color:#7fabff	;
	border-radius: 6px;
	display: inline-block;
	cursor: pointer;
	color: #7fabff	
	font-family: Arial;
	font-size: 15px;

	padding: 2px 6px;
	text-decoration: none;
	height: 35px

}





.myButton:active {
	backgrund-color: #7fabff;
	color: #ffffff;
	position: relative;
	top: 1px;
}


#keyword {
	border-radius: 5px;
	height: 28px;
	border: solid 1px grey;
}

#searchBtn:hover{ background-color:#C8C8FF; }

#button:hover{ background-color:#C8C8FF; }






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
							<!-- Main-body start -->
							<div class="main-body">
								<div class="page-wrapper">
									<!-- Page-body start -->
									<div class="page-body">





										<form id="sort" class="dropdown-primary dropdown open"
											name="memSearch" method="post" action="/admin/mem/memList">
											<select id="searchType" name="searchType" style="width: 85px; height: 38px;">
												<option value="">검색조건</option>
												<option value="t" <c:if test="${pageMaker.cri.searchType eq 't'}">selected </c:if>>회원ID</option>
												<option value="c" <c:if test="${pageMaker.cri.searchType eq 'c'}"> selected </c:if>>이름</option>
												<option value="w" <c:if test="${pageMaker.cri.searchType eq 'w'}"> selected </c:if>>포인트</option>
												<option value="tc" <c:if test="${pageMaker.cri.searchType eq 'tc'}"> selected </c:if>>가입일</option>

											</select> <input type="text" id="keyword" name="keyword"
												style="width: 200px; height: 38px;;"
												value="${pageMaker.cri.keyword}" placeholder="검색어를 입력하세요" />
											<button id="searchBtn"
												class="btn waves-effect waves-light btn-primary btn-outline-primary">검색</button>
											<input id="button" type="button" value="전체보기"
												class="btn waves-effect waves-light btn-primary btn-outline-primary"
												onClick="location.href='/admin/mem/memList';">
										</form>
										<div>
											<br>
										</div>






										<!-- Basic table card start -->
										<div class="card">
											<div class="card-header">
												<h5>회원목록</h5>
											</div>
											<div class="card-block table-border-style">
												<div class="table-responsive">
													<table class="table table-hover">
														<thead>
															<tr>
																<th width="150">아이디</th>
																<th width="150">이름</th>
																<th width="100">성별</th>
																<th width="150">포인트</th>
																<th width="200">가입일</th>
															</tr>
														</thead>

														<c:forEach var="list" items="${memList}" begin="0"
															end="10" step="1" varStatus="status">

															<tbody>
																<tr
																	onclick="location.href='/admin/mem/memDetail/${list.m_id }'"
																	style="cursor: hand">
																	<td scope="row">${list.m_id }</td>
																	<td>${list.m_name }</td>
																	<td>${list.m_gender }</td>
																	<td><fmt:formatNumber value="${list.m_point }"
																			pattern="#,###" />P</td>
																	<td>${list.m_regdate }</td>

																</tr>
															</tbody>
														</c:forEach>

													</table>
												</div>
											</div>
										</div>
									</div>
								</div>
								<!-- Page-body end -->
					
								<!-- 페이징 start -->
                              <div id = "paging-div">
                              <ul class="btn-group pagination">
                                 <c:if test="${pageMaker.prev }">
                                    <li><a href='<c:url value="/admin/mem/memList${pageMaker.makeQuery(pageMaker.startPage-1)}"/>'>
                                       <span style="font-weight: bold;">&nbsp;&#60;&#60;&#60;&nbsp;</span></a></li><span class="col-md-1"></span>
                                 </c:if>
                                 <c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="pageNum">
                                    <c:if test="${pageNum eq pageMaker.cri.page}"><li><a href='<c:url value="/admin/mem/memList${pageMaker.makeQuery(pageNum)}"/>'>
                                    <span id="pagingCur" style="background-color: #7971ea; display:inline-block; height: 30px; width: 30px; border-radius: 50%; font-weight: bold; color: white; padding : 5px;">&nbsp;${pageNum}&nbsp;</span></a></li><span class="col-md-1"></span></c:if>
                                    <c:if test="${pageNum ne pageMaker.cri.page}"><li><a href='<c:url value="/admin/mem/memList${pageMaker.makeQuery(pageNum)}"/>'>
                                    <span id="pagingCur">&nbsp;${pageNum}&nbsp;</span></a></li><span class="col-md-1">   </span></c:if>
                                    
                                 </c:forEach>
                                 <c:if test="${pageMaker.next && pageMaker.endPage >0 }">
                                    <li><a href='<c:url value="/admin/mem/memList${pageMaker.makeQuery(pageMaker.endPage+1)}"/>'>
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
		</div>
	</div>


 
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
				window.location.href = "listPage?page=" + thisPage
						+ "&perPageNum=" + $perPageSel.val();
			})
		}
	</script>






	<%@ include file="/WEB-INF/views/adminFooter.jsp"%>
</html>