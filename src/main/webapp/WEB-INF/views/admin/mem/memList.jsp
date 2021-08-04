<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ page session="false"%>
<!DOCTYPE html>
<html lang="en">

<head>
<title>회원관리</title>
<%@ include file="/WEB-INF/views/adminHeader.jsp" %>
</head>

<body>
	<div id="pcoded" class="pcoded">
		<div class="pcoded-overlay-box"></div>
		<div class="pcoded-container navbar-wrapper">
			<%@ include file="/WEB-INF/views/adminNav.jsp" %>
			<div class="pcoded-main-container">
				<div class="pcoded-wrapper">
					<%@ include file="/WEB-INF/views/adminMenu.jsp" %>
					<div class="pcoded-content">
						<div class="pcoded-inner-content">
							<!-- Main-body start -->
							<div class="main-body">
								<div class="page-wrapper">
									<!-- Page-body start -->
									<div class="page-body">
										<form name="searchMem" method="post" action="/admin/mem/memList">
											<select name="search_option">
												<option value="all"
													<c:if test="${map.search_option == 'all'}">selected</c:if>>전체</option>
													
												<option value="m_id"
													<c:if test="${map.search_option == 'm_id'}">selected</c:if>>아이디</option>

												<option value="m_name"
													<c:if test="${map.search_option == 'm_name'}">selected</c:if>>이름</option>

												<option value="m_gender"
													<c:if test="${map.search_option == '성별'}">selected</c:if>>성뱔</option>

											</select> <input name="keyword" value="${map.keyword}"> <input
												type="submit" value="조회">
											</form>
									
										<!-- Basic table card start -->
										<div class="card">
											<div class="card-header">
												<h5>회원목록</h5>
											</div>
											<div class="card-block table-border-style">
												<div class="table-responsive">
													<table class="table">
														<thead>
															<tr>
																<th width="200">아이디</th>
																<th width="150">이름</th>
																<th width="100">성별</th>
																<th width="200">포인트</th>
															</tr>
														</thead>

														<c:forEach var="list" items="${memList}">

															<tbody>
																<tr>
																	<th scope="row"><a
																		href="memDetail?m_id=${list.m_id }">${list.m_id }</a></th>
																	<td>${list.m_name }</td>
																	<td>${list.m_gender }</td>
																	<td>${list.m_point }</td>
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
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

    <%@ include file="/WEB-INF/views/adminFooter.jsp" %>
</body>

</html>
