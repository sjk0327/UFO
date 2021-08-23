<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">

<head>
<title> 메시지 리스트 페이지 - UF&#38;O </title>
<%@ include file="/WEB-INF/views/adminHeader.jsp"%>
<%@ include file="/WEB-INF/views/customerHeader.jsp"%>
<style>




</style>


</head>

<body>
	<div id="pcoded" class="pcoded">
		<div class="pcoded-overlay-box"></div>
		<div class="pcoded-container navbar-wrapper">
		
			<div class="pcoded-main-container">
				<div class="pcoded-wrapper">
				
					<div class="pcoded-content">
						<div class="pcoded-inner-content">
							<!-- Main-body start -->
							<div class="main-body">
								<div class="page-wrapper">
									<!-- Page-body start -->
									<div class="page-body">





										<form id="sort" class="dropdown-primary dropdown open"
											name="messageSearch" method="post" action="/member/mem/messageList">
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
												onClick="location.href='/member/mem/messageList';">&nbsp; 
										</form>
										<div>
											<br>
										</div>






										<!-- Basic table card start -->
										<div class="card">
											
											<div class="card-header">
												<h5>메시지함</h5>
											</div>
											<div class="card-block table-border-style">
												<div class="table-responsive">
													<table class="table table-hover">
														<thead>
															<tr>
																<th width="100">보낸사람</th>
																<th width="100">제목</th>
																<th width="100">날짜</th>
															</tr>
														</thead>

														<c:forEach var="list" items="${messageList}" begin="0"
															end="8" step="1" varStatus="status">

															<tbody>
																<tr
																	onclick="location.href='/member/mem/messageList/${list.a_id }'"
																	style="cursor: hand">
																	<td><p>UFO&nbsp;고객센터</p></td>
																	<td scope="row">${list.a_title }</td> 
																	<td><fmt:formatDate value="${list.a_date }" pattern="yyyy-MM-dd hh:mm:ss" /></td>
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
								
                              <div id = "paging-div" >
                              <div class="col-sm-3">
                              <ul class="btn-group pagination" >
                                 <c:if test="${pageMaker.prev }">
                                    <li><a href='<c:url value="/member/mem/messageList${pageMaker.makeQuery(pageMaker.startPage-1)}"/>'>
                                       <span style="font-weight: bold;">&nbsp;[이전]&nbsp;</span></a></li><span class="col-md-1"></span>
                                 </c:if>
                                 <c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="pageNum">
                                    <c:if test="${pageNum eq pageMaker.cri.page}"><li><a href='<c:url value="/member/mem/messageList${pageMaker.makeQuery(pageNum)}"/>'>
                                    <span id="pagingCur" style="background-color: #7971ea; display:inline-block; height: 30px; width: 30px; border-radius: 50%; font-weight: bold; color: white; padding : 5px;">&nbsp;${pageNum}&nbsp;</span></a></li><span class="col-md-1"></span></c:if>
                                    <c:if test="${pageNum ne pageMaker.cri.page}"><li><a href='<c:url value="/member/mem/messageList${pageMaker.makeQuery(pageNum)}"/>'>
                                    <span>&nbsp;${pageNum}&nbsp;</span></a></li><span class="col-md-1">   </span></c:if>
                                    
                                 </c:forEach>
                                 <c:if test="${pageMaker.next && pageMaker.endPage >0 }">
                                    <li><a href='<c:url value="/member/mem/messageList${pageMaker.makeQuery(pageMaker.endPage+1)}"/>'>
                                       <span style="font-weight: bold;">&nbsp;[다음]&nbsp;</span></a></li><span class="col-md-1"></span>
                                 </c:if>
                              </ul>
                              </div>
                              </div>
                              <!-- 페이징 end -->
                           

							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>


 
	





	<%@ include file="/WEB-INF/views/customerFooter.jsp"%>
</html>