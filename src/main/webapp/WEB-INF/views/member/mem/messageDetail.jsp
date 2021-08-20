<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>



<!DOCTYPE html>
<html lang="en">

<head>
<title> 메시지 페이지 - UF&#38;O </title>
<%@ include file="/WEB-INF/views/adminHeader.jsp"%>
<%@ include file="/WEB-INF/views/customerHeader.jsp"%>



</head>

<body>
	<!-- 회원 메시지함 -->
												<div class="card table-card">
													<div class="card-header">
														<h5>메시지함</h5>
													</div>
													<div class="card-block">
														<div class="table-responsive">
															<table class="table table-hover">

																<c:forEach var="messageVO" items="${messageVO }">
																	<tbody>
																		<tr>
																		<tr>
																			<td>
																				<div>

																					<div>
																						<h5>${messageVO.a_mid }&nbsp;회원님</h5>
																						<br>
																					</div>
																					<h5>${messageVO.a_title }</h5>
																				</div>
																			</td>
																		</tr>
																	</tbody>

																	<td>
																		<div>
																			<pre>${messageVO.a_content }</pre>
																		</div>
																	</td>
																</c:forEach>




															</table>



														</div>
													</div>
												</div>
												<!-- 회원 메시지함  끝-->

 
	





	<%@ include file="/WEB-INF/views/customerFooter.jsp"%>
</html>