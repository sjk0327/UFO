<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>



<!DOCTYPE html>
<html lang="en">

<head>
<title> 관리자 회원 리스트 페이지 - UF&#38;O </title>
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





										<form id="sort" class="dropdown-primary dropdown open"
											name="memSearch" method="post" action="/admin/mem/memList">
											<select id="searchType" name="searchType">
												<option value="">검색조건</option>
												<option value="t" <c:if test="${pageMaker.cri.searchType eq 't'}">selected </c:if>>회원ID</option>
												<option value="c" <c:if test="${pageMaker.cri.searchType eq 'c'}"> selected </c:if>>이름</option>
												<option value="w" <c:if test="${pageMaker.cri.searchType eq 'w'}"> selected </c:if>>포인트</option>
												<option value="tc" <c:if test="${pageMaker.cri.searchType eq 'tc'}"> selected </c:if>>가입일</option>

											</select>&nbsp; 
											<input type="text" id="keyword" name="keyword"
												value="${pageMaker.cri.keyword}" placeholder="검색어를 입력하세요" />&nbsp; 
											<button id="button"
												class="btn waves-effect waves-light btn-primary btn-outline-primary">검색</button>&nbsp; 
											<input id="button" type="button" value="전체보기"
												class="btn waves-effect waves-light btn-primary btn-outline-primary"
												onClick="location.href='/admin/mem/memList';">&nbsp; 
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
                                       <span style="font-weight: bold;">&nbsp;[이전]&nbsp;</span></a></li><span class="col-md-1"></span>
                                 </c:if>
                                 <c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="pageNum">
                                    <c:if test="${pageNum eq pageMaker.cri.page}"><li><a href='<c:url value="/admin/mem/memList${pageMaker.makeQuery(pageNum)}"/>'>
                                    <span id="pagingCur" style="background-color: #7971ea; display:inline-block; height: 30px; width: 30px; border-radius: 50%; font-weight: bold; color: white; padding : 5px;">&nbsp;${pageNum}&nbsp;</span></a></li><span class="col-md-1"></span></c:if>
                                    <c:if test="${pageNum ne pageMaker.cri.page}"><li><a href='<c:url value="/admin/mem/memList${pageMaker.makeQuery(pageNum)}"/>'>
                                    <span>&nbsp;${pageNum}&nbsp;</span></a></li><span class="col-md-1">   </span></c:if>
                                    
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


 
	





	<%@ include file="/WEB-INF/views/adminFooter.jsp"%>
</html>