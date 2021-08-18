<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="en">


<head>
<title> 추천글 </title>

<%@ include file="/WEB-INF/views/adminHeader.jsp"%>

<style type="text/css">
.label-info2{
background-color: #4285F4;
color: white;
	
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
									
										<form id="sort" name="recSearch" method="post"
											action="/admin/rec/recList">

										<select id="searchType" name="searchType">
                                    <option value="">검색조건</option>
                                    <option value="t" <c:if test="${pageMaker.cri.searchType eq 't'}">selected </c:if>>회원ID</option>
                                    <option value="c" <c:if test="${pageMaker.cri.searchType eq 'c'}"> selected </c:if>>제품ID</option>
                                    <option value="w" <c:if test="${pageMaker.cri.searchType eq 'w'}"> selected </c:if>>제품명</option>
                                 </select>&nbsp;
											<input type="text" id="keyword" name="keyword"  
												value="${pageMaker.cri.keyword}" placeholder="검색어를 입력하세요" />&nbsp;
								
											<button id="button" class="btn waves-effect waves-light btn-primary btn-outline-primary">검색</button>&nbsp;
											<input type="button" id="button" class="btn waves-effect waves-light btn-primary btn-outline-primary" value="전체보기" onClick="location.href='/admin/rec/recList';">&nbsp;
										</form>
										<div><br></div>
										<div class="card">
											<div class="row">
												<div class="col-sm-12">
													<!-- Hover table card start -->
													<div class="card">
														<div class="card-header">
															<h5>추천글리스트</h5>
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
																	<form name="RecUpdate" action="/admin/rec/recUpdate" >
																<table class="table table-hover">
																	<thead>
																		<tr>
																			<th>회원 ID</th>
																			<th>제품ID</th>
																			<th>제품명</th>
																			<th>코멘트</th>
																			<th>작성날짜</th>
																			<th></th>
																		</tr>
																	</thead>
																	<c:forEach var="list" items="${recList}">
																		<tbody>
																			<tr>
																				<td>${list.v_mid }</td>
																				<td>${list.v_pid }</td>
																				<td>${list.p_name }</td>
																				<td>${list.v_content }</td>
																				<td>${list.v_date }</td>
																				<c:if test="${list.v_content eq '관리자에 의해 삭제된 코멘트 입니다.'}">
																				<td></td>
																				</c:if>
																				<c:if test="${list.v_content ne '관리자에 의해 삭제된 코멘트 입니다.'}">
																				<td><button type="button" class="btn waves-effect waves-light btn-primary btn-outline-primary" data-toggle="modal" data-target="#mymodal${list.v_id}">삭제</button></td>
																				</c:if>
																			</tr>
																		</tbody>
																		<!-- The Modal -->
																			<div class="modal" id="mymodal${list.v_id}">
																			  <div class="modal-dialog">
																			    <div class="modal-content">
																			
																			      <!-- Modal Header -->
																			      <div class="modal-header">
																			        <h5 class="modal-title">Modal Heading</h5>
																			        <button type="button" class="close" data-dismiss="modal">&times;</button>
																			      </div>
																			
																			      <!-- Modal body -->
																			      <div class="modal-body">
																			        	삭제하시겠습니까?
																			      </div>
																			
																			      <!-- Modal footer -->
																			      <div class="modal-footer">
																			      	<button type="button" class="btn btn-danger" data-dismiss="modal" onclick="recUpdate('${list.v_id }')">확인</button>
																			        <button type="button" class="btn btn-danger" data-dismiss="modal">취소</button>
																			      </div>
																			      
																			    </div>
																			  </div>
																			</div>
																			
																	</c:forEach>
																</table>
																		</form>
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
												<li><a href='<c:url value="/admin/rec/recList${pageMaker.makeQuery(pageMaker.startPage-1)}"/>'>
													<span style="font-weight: bold;">&nbsp;[이전]&nbsp;</span></a></li><span class="col-md-1"></span>
											</c:if>
											<c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="pageNum">
												<c:if test="${pageNum eq pageMaker.cri.page}"><li><a href='<c:url value="/admin/rec/recList${pageMaker.makeQuery(pageNum)}"/>'>
												<span id="pagingCur" style="background-color: #7971ea; display:inline-block; height: 30px; width: 30px; border-radius: 50%; font-weight: bold; color: white; padding : 5px;">&nbsp;${pageNum}&nbsp;</span></a></li><span class="col-md-1"></span></c:if>
												<c:if test="${pageNum ne pageMaker.cri.page}"><li><a href='<c:url value="/admin/rec/recList${pageMaker.makeQuery(pageNum)}"/>'>
												<span>&nbsp;${pageNum}&nbsp;</span></a></li><span class="col-md-1">   </span></c:if>
												
											</c:forEach>
											<c:if test="${pageMaker.next && pageMaker.endPage >0 }">
												<li><a href='<c:url value="/admin/rec/recList${pageMaker.makeQuery(pageMaker.endPage+1)}"/>'>
													<span style="font-weight: bold;">&nbsp;[다음]&nbsp;</span></a></li><span class="col-md-1"></span>
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
	
<script type="text/javascript">
   
function recUpdate(v_id) {
	console.log(v_id);
		location.href = '/admin/rec/recUpdate/' + v_id;
}
	
</script>
</body>

</html>
