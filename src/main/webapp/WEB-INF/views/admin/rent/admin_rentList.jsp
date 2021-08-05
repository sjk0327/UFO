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
											<select name="searchCondition">
												<option value="r_mid">회원ID</option>
												<option value="r_pid">제품명</option>
												<option value="r_sdate">대여날짜</option>
												<option value="r_state">상태</option>
											</select> <input id="textsearch" name="searchKeyword" type="text">
											<input type="submit" value="검색"> 
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
																			<th>제품명</th>
																			<th>대여날짜</th>
																			<th>상태</th>
																		</tr>
																	</thead>
																	<c:forEach var="list" items="${rentList}">
																		<tbody>
																			<tr onClick="location.href='/adminsite/adminRentDetail/${list.r_id}'">
																				<td>${list.r_id }</td>
																				<td>${list.r_mid }</td>
																				<td>${list.r_pid }</td>
																				<td>${list.r_sdate }</td>
																				<td>${list.r_state }</td>
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
