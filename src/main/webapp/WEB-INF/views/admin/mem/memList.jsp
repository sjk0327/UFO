<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>



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
										<!-- 
										<form name="searchMem" method="post"
											action="/admin/mem/memList">
											<select name="search_option">
												<option value="all"
													<c:if test="${map.search_option == 'all'}">selected</c:if>>전체</option>

												<option value="m_id"
													<c:if test="${map.search_option == 'm_id'}">selected</c:if>>아이디</option>

												<option value="m_name"
													<c:if test="${map.search_option == 'm_name'}">selected</c:if>>이름</option>

												<option value="m_gender"
													<c:if test="${map.search_option == '성별'}">selected</c:if>>성별</option>

											</select> <input name="keyword" value="${map.keyword}"> <input
												type="submit" value="조회">
										</form>
                                         -->





										<!-- 
										

										<div class="form-group row justify-content-center">

											<div class="w100" style="padding-right: 10px">

												<select class="form-control form-control-sm"
													name="searchType" id="searchType">

													<option value="all">전체</option>
													
													<option value="m_id">아이디</option>

													<option value="m_name">이름</option>

													<option value="m_point">포인트</option>

												</select>

											</div>

											<div class="w300" style="padding-right: 10px">

												<input type="text" class="form-control form-control-sm"
													name="keyword" id="keyword">

											</div>

											<div>

												<button class="btn btn-sm btn-primary" name="btnSearch"
													id="btnSearch">검색</button>

											</div>

										</div>
										
-->


										<div class="form-inline">
											<select id="searchType" name="searchType" >
												<option value="all">전체</option>
												<option value="i">아이디</option>
												<option value="n">이름</option>
												<option value="p">포인트</option>
											</select> 
											<input class="form-control" type="text" id="keyword"
												name="keyword" value="${pageMaker.cri.keyword}"
												placeholder="검색어를 입력하세요" />
											<button id="searchBtn" class="btn btn-primary">검색</button>
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
																	<td>${list.m_point }</td>
																</tr>
															</tbody>
														</c:forEach>

													</table>
													<br>
													<!-- page start -->
													<ul class="btn-group pagination">
														<c:if test="${pageMaker.prev }">
															<li><a
																href='<c:url value="/admin/mem/memList?page=${pageMaker.startPage-1 }"/>'><i
																	class="fa fa-chevron-left"></i></a></li>
														</c:if>
														<c:forEach begin="${pageMaker.startPage }"
															end="${pageMaker.endPage }" var="pageNum">
															<li><a
																href='<c:url value="/admin/mem/memList?page=${pageNum }"/>'><i
																	class="fa">${pageNum }</i></a></li>
														</c:forEach>
														<c:if test="${pageMaker.next && pageMaker.endPage >0 }">
															<li><a
																href='<c:url value="/admin/mem/memList?page=${pageMaker.endPage+1 }"/>'><i
																	class="fa fa-chevron-right"></i></a></li>
														</c:if>
													</ul>
													<!-- page end -->


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





	<%@ include file="/WEB-INF/views/adminFooter.jsp"%>
</html>