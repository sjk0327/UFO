<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="en">


<head>
<title> 관리자 대여/구매 리스트 페이지 - UF&#38;O </title>

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
									
										<form id="sort" name="rentSearch" method="post"
											action="/admin/rent/rentList">

										<select id="searchType" name="searchType">
                                    <option value="">검색조건</option>
                                    <option value="t" <c:if test="${pageMaker.cri.searchType eq 't'}">selected </c:if>>회원ID</option>
                                    <option value="c" <c:if test="${pageMaker.cri.searchType eq 'c'}"> selected </c:if>>제품ID</option>
                                    <option value="w" <c:if test="${pageMaker.cri.searchType eq 'w'}"> selected </c:if>>제품명</option>
                                    <option value="tc" <c:if test="${pageMaker.cri.searchType eq 'tc'}"> selected </c:if>>상태</option>
                                 </select>&nbsp;
											<input type="text" id="keyword" name="keyword"  
												value="${pageMaker.cri.keyword}" placeholder="검색어를 입력하세요" />&nbsp;
								
											<button id="button" class="btn waves-effect waves-light btn-primary btn-outline-primary">검색</button>&nbsp;
											<input type="button" id="button" class="btn waves-effect waves-light btn-primary btn-outline-primary" value="전체보기" onClick="location.href='/admin/rent/rentList';">&nbsp;
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
																			<tr onClick="location.href='/admin/rent/rentDetail/${list.r_id}'">
																			<c:if test="${list.r_state ne '구매 확정'}">
																				<td>${list.r_id }</td>
																				<td>${list.r_mid }</td>
																				<td>${list.r_pid }</td>
																				<td>${list.p_name }</td>
																				</c:if>
																				<c:if test="${list.r_state eq '구매 확정'}">
																				<td>▶</td>
																				<td></td>
																				<td></td>
																				<td></td>
																				</c:if>
																				
																				<td>${list.r_sdate }</td>
																				<c:if test="${list.r_state eq '대여중'}">
																					<fmt:parseDate var="tempToday" value="${list.r_sdate}" pattern="yyyy-MM-dd"/>
															  						<fmt:parseNumber var="sdate" value="${tempToday.time / (1000*60*60*24)}" integerOnly="true"/>
															   						<c:set var="now" value="<%=new java.util.Date()%>" />
															    					<fmt:parseNumber var="today" value="${now.time / (1000*60*60*24)}" integerOnly="true"/>

																					<c:if
																											test="${sdate+3>=today and sdate+1<=today}">
																											<td style="width: 100px;"><label
																												class="label label-primary">대 여 중</label><span
																												id="state"></span></td>
																										</c:if>
																										<c:if test="${sdate+3<today}">
																											<td style="width: 100px;"><label
																												class="label label-danger">연 체 중</label><span
																												id="state"></span></td>
																										</c:if>
																										<c:if test="${sdate+1>today}">
																											<td style="width: 100px;"><label
																												class="label"
																												style="background-color: #e8c3b9;">대여
																													예약</label><span id="state"></span></td>
																										</c:if>
																					</c:if>
																			
																				<c:if test="${list.r_state eq '즉시 구매'}"><td style="width:100px;"><label class="label label-info" style="font-size: 10pt;">즉시 구매</label></td></c:if>
																				<c:if test="${list.r_state eq '구매 확정'}"><td style="width:100px;"><label class="label label-info2" style="font-size: 10pt;">구매 확정</label></td></c:if>
																				<c:if test="${list.r_state eq '반납 요청'}">
																					<td style="width:100px;"><label class="label label-warning" style="font-size: 10pt;">반납 요청</label></td>
																				</c:if>
																				<c:if test="${list.r_state eq '반납 완료'}">
																					<td style="width:100px;"><label class="label label-success" style="font-size: 10pt;">반납 완료</label></td>
																				</c:if>
																				<c:if test="${list.r_state eq '환불 요청(대여)'}">
																					<td style="width:100px;"><label class="label label-primary" style="font-size: 10pt;">대여중</label><span>→ </span><label class="label label-inverse" style="font-size: 10pt;">환불 요청</label></td>
																				</c:if>
																				<c:if test="${list.r_state eq '환불 완료(대여)'}">
																					<td style="width:100px;"><label class="label label-primary" style="font-size: 10pt;">대여중</label><span>→ </span><label class="label label-default" style="font-size: 10pt;">환불 완료</label></label></td>
																				</c:if>
																				<c:if test="${list.r_state eq '환불 요청(즉시 구매)'}">
																					<td style="width:100px;"><label class="label label-info" style="font-size: 10pt;">즉시 구매</label><span>→ </span><label class="label label-inverse" style="font-size: 10pt;">환불 요청</label></td>
																				</c:if>
																				<c:if test="${list.r_state eq '환불 완료(즉시 구매)'}">
																					<td style="width:100px;"><label class="label label-info" style="font-size: 10pt;">즉시 구매</label><span>→ </span><label class="label label-default" style="font-size: 10pt;">환불 완료</label></label></td>
																				</c:if>
																				<c:if test="${list.r_state eq '환불 요청(구매 확정)'}">
																					<td style="width:100px;"><label class="label label-info2" style="font-size: 10pt;">구매 확정</label><span>→ </span><label class="label label-inverse" style="font-size: 10pt;">환불 요청</label></td>
																				</c:if>
																				<c:if test="${list.r_state eq '환불 완료(구매 확정)'}">
																					<td style="width:100px;"><label class="label label-info2" style="font-size: 10pt;">구매 확정</label><span>→ </span><label class="label label-default" style="font-size: 10pt;">환불 완료</label></label></td>
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
													<span style="font-weight: bold;">&nbsp;[이전]&nbsp;</span></a></li><span class="col-md-1"></span>
											</c:if>
											<c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="pageNum">
												<c:if test="${pageNum eq pageMaker.cri.page}"><li><a href='<c:url value="/admin/rent/rentList${pageMaker.makeQuery(pageNum)}"/>'>
												<span id="pagingCur" style="background-color: #7971ea; display:inline-block; height: 30px; width: 30px; border-radius: 50%; font-weight: bold; color: white; padding : 5px;">&nbsp;${pageNum}&nbsp;</span></a></li><span class="col-md-1"></span></c:if>
												<c:if test="${pageNum ne pageMaker.cri.page}"><li><a href='<c:url value="/admin/rent/rentList${pageMaker.makeQuery(pageNum)}"/>'>
												<span>&nbsp;${pageNum}&nbsp;</span></a></li><span class="col-md-1">   </span></c:if>
												
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

</html>
