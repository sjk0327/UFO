<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="en">


<head>
<title> 관리자 공지사항 리스트 페이지  - UF&#38;O </title>

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
							<div class="main-body">
								<div class="page-wrapper">
									<div class="page-body">
									<input type="button" id="button" class="btn waves-effect waves-light btn-primary btn-outline-primary" value="공지글작성" onClick="location.href='/admin/notice/noticeInsertForm';">
									<br><br>
										<div class="card">
											<div class="row">
												<div class="col-sm-12">
													<!-- Hover table card start -->
													<div class="card">
														<div class="card-header">
															<h5>공지사항</h5>
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
																	<form name="NoticeInsert" action="/admin/notice/noticeInsert" >
																<table class="table table-hover">
																	<thead>
																		<tr>
																			<th style="text-align: center; width: 10%;">번호</th>
																			<th style="text-align: center; width: 40%;">제목</th>
																			<th style="text-align: center; width: 10%;">작성자</th>
																			<th style="text-align: center; width: 15%;">작성날짜</th>
																			<th style="text-align: center; width: 15%;"></th>
																		</tr>
																	</thead>
																	<c:forEach var="notice" items="${noticeList}">
																		<tbody>
																			<tr style="text-align: center;">
																				<td onClick="location.href='/admin/noticeDetail/${notice.n_id}'">${notice.n_id }</td>
																				<td onClick="location.href='/admin/noticeDetail/${notice.n_id}'">${notice.n_title }</td>
																				<td onClick="location.href='/admin/noticeDetail/${notice.n_id}'">${notice.n_name }</td>
																				<td onClick="location.href='/admin/noticeDetail/${notice.n_id}'">${notice.n_date }</td>
																				<td><button type="button" class="btn waves-effect waves-light btn-primary btn-outline-primary" onclick="noticeDelete('${notice.n_id }')">삭제</button></td>
																			</tr>
																		</tbody>
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
												<li><a href='<c:url value="/admin/noticeList${pageMaker.makeQuery(pageMaker.startPage-1)}"/>'>
													<span style="font-weight: bold;">&nbsp;[이전]&nbsp;</span></a></li><span class="col-md-1"></span>
											</c:if>
											<c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="pageNum">
												<c:if test="${pageNum eq pageMaker.cri.page}"><li><a href='<c:url value="/admin/noticeList${pageMaker.makeQuery(pageNum)}"/>'>
												<span id="pagingCur" style="background-color: #7971ea; display:inline-block; height: 30px; width: 30px; border-radius: 50%; font-weight: bold; color: white; padding : 5px;">&nbsp;${pageNum}&nbsp;</span></a></li><span class="col-md-1"></span></c:if>
												<c:if test="${pageNum ne pageMaker.cri.page}"><li><a href='<c:url value="/admin/noticeList${pageMaker.makeQuery(pageNum)}"/>'>
												<span>&nbsp;${pageNum}&nbsp;</span></a></li><span class="col-md-1">   </span></c:if>
												
											</c:forEach>
											<c:if test="${pageMaker.next && pageMaker.endPage >0 }">
												<li><a href='<c:url value="/admin/noticeList${pageMaker.makeQuery(pageMaker.endPage+1)}"/>'>
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

function noticeDelete(n_id) {
	var con = confirm("삭제하시겠습니까?");
	if(con == true){
		location.href = '/admin/noticeDelete/' + n_id;
	}
}
   	
</script>
</body>

</html>
