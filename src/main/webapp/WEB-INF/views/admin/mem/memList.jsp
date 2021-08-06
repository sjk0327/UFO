<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<%@ page session="false"%>
<!DOCTYPE html>
<html lang="en">

<head>
<title>회원관리</title>
<%@ include file="/WEB-INF/views/adminHeader.jsp"%>

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
									
						


											
										<form id="sort" name="memSearch" method="post"
											action="/admin/mem/memList">
											<select name="searchType">
												<option value="">검색조건</option>
												<option value="t">회원ID</option>
												<option value="c">이름</option>
												<option value="w">포인트</option>
												
											</select> 
											<input type="text" id="keyword" name="keyword" value="${pageMaker.cri.keyword}" placeholder="검색어를 입력하세요"/>
											<button id="searchBtn">검색</button>
											<input type="button" value="전체보기" onClick="location.href='/admin/mem/memList';">
										</form>
										
						 

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
																		<th width="200">포인트</th>
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
																			<td><fmt:formatNumber value="${list.m_point }" pattern="#,###"/>P</td>
																			
																		</tr>
																	</tbody>
																</c:forEach>

															</table>
															<br>
																<!-- 페이징 start -->
											<div class="text-center">
												<nav aria-label="pagination">
													<ul class="pagination">
														<!-- prev 버튼 -->
														<li id="page-prev">
															<a href="/admin/mem/memList${pageMaker.makeQuery(pageMaker.startPage-1)}" aria-label="Prev">
																<span aria-hidden="true">[이전]&nbsp;</span>
															</a>
														</li>
														<!-- 페이지 번호 (시작 페이지 번호부터 끝 페이지 번호까지) -->
														<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
														    <li id="page${idx}">
															    <a href="/admin/mem/memList${pageMaker.makeQuery(idx)}">
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
														    <a href="/admin/mem/memList${pageMaker.makeQuery(pageMaker.endPage+1)}" aria-label="Next">
														    	<span aria-hidden="true">&nbsp;[다음]</span>
														    </a>
														    </c:if>
													    </c:when>
													
													
													
													    <c:when test="${pageMaker.totalDataCount % pageMaker.cri.perPageNum ne 0}">
													        <c:if test="${pageMaker.cri.page ne (pageMaker.totalDataCount / pageMaker.cri.perPageNum+1)}">
														    <a href="/admin/mem/memList${pageMaker.makeQuery(pageMaker.endPage+1)}" aria-label="Next">
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
										<!-- Page-body end -->
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			
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
			
			
			
			
		

			<%@ include file="/WEB-INF/views/adminFooter.jsp"%>
</html>