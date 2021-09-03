<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<!DOCTYPE html>
<html lang="en">


<head>
<title> Q&A 리스트 </title>

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

										<form id="sort1" name="qnaListY" method="post" action="/admin/qnaList">
										<select id="searchType1" name="searchType" style="display: none;">
		                                    <option value="t" selected></option>
		                                    <option value="c"></option>
		                                 </select>&nbsp;
											<input type="hidden" id="keyword1" name="keyword" value="true" />
										</form>
										<form id="sort2" name="qnaListN" method="post" action="/admin/qnaList">
										<select id="searchType1" name="searchType" style="display: none;">
		                                    <option value="t"></option>
		                                    <option value="c" selected></option>
		                                 </select>&nbsp;
											<input type="hidden" id="keyword2" name="keyword" value="false" />
										</form>
										<button class="btn waves-effect waves-light btn-primary btn-outline-primary" onClick="location.href='/admin/qnaList';">전제보기</button>
										<button class="btn waves-effect waves-light btn-primary btn-outline-primary" onClick="answerY()">답변 Y</button>
										<button class="btn waves-effect waves-light btn-primary btn-outline-primary" onClick="answerN()">답변 N</button>

									<br><br>
										<div class="card">
											<div class="row">
												<!-- Multiple Open Accordion start -->
                                            <div class="col-lg-12">
                                                <div class="card">
                                                    <div class="card-header">
                                                        <h5 class="card-header-text">Q&A 리스트</h5>
                                                    </div>
                                                    <div class="card-block accordion-block">

                                                        <div id="accordion" role="tablist" aria-multiselectable="true">
                                                            <div class="accordion-panel">
                                                            <div class="row">
                                                            <span class="col-md-2 accordion-msg waves-effect waves-dark" style="text-align: center; font-weight: bold; font-size: 17px;">번호</span>
                                                            <span class="col-md-2 accordion-msg waves-effect waves-dark" style="text-align: center; font-weight: bold; font-size: 17px;">카테고리</span>
                                                            <span class="col-md-2 accordion-msg waves-effect waves-dark" style="text-align: center; font-weight: bold; font-size: 17px;">제목</span>
                                                            <span class="col-md-2 accordion-msg waves-effect waves-dark" style="text-align: center; font-weight: bold; font-size: 17px;">ID</span>
                                                            <span class="col-md-2 accordion-msg waves-effect waves-dark" style="text-align: center; font-weight: bold; font-size: 17px;">날짜</span>
                                                            <span class="col-md-2 accordion-msg waves-effect waves-dark" style="text-align: center; font-weight: bold; font-size: 17px;">답변여부</span>
                                                            </div>
                                                                <c:forEach var="qna" items="${qnaList}" varStatus="status">
                                                                <div class="accordion-heading" role="tab" id="headingOne">
                                                                	<div class="row">
                                                                        <span id="q_id${status.index }" class="col-md-2 accordion-msg waves-effect waves-dark" style="text-align: center;"><a data-toggle="collapse"
                                                                        data-parent="#accordion" href="#collapseOne${qna.q_id }" aria-expanded="true" aria-controls="collapseOne">${qna.q_id }</a></span>
                                                                        
																	    <span id="q_type${status.index }" class="col-md-2 accordion-msg waves-effect waves-dark" style="text-align: center;"><a data-toggle="collapse"
                                                                        data-parent="#accordion" href="#collapseOne${qna.q_id }" aria-expanded="true" aria-controls="collapseOne">${qna.q_type }</a></span>
                                                                        
																	    <span id="q_title${status.index }" class="col-md-2 accordion-msg waves-effect waves-dark" style="text-align: center;"><a data-toggle="collapse"
                                                                        data-parent="#accordion" href="#collapseOne${qna.q_id }" aria-expanded="true" aria-controls="collapseOne">${qna.q_title }</a></span>
                                                                        
																	    <span id="q_mid${status.index }" class="col-md-2 accordion-msg waves-effect waves-dark" style="text-align: center;"><a data-toggle="collapse"
                                                                        data-parent="#accordion" href="#collapseOne${qna.q_id }" aria-expanded="true" aria-controls="collapseOne">${qna.q_mid }</a></span>
                                                                        
																	    <span class="col-md-2 accordion-msg waves-effect waves-dark" style="text-align: center;"><a data-toggle="collapse"
                                                                        data-parent="#accordion" href="#collapseOne${qna.q_id }" aria-expanded="true" aria-controls="collapseOne">${qna.q_date }</a></span>
                                                                        
                                                                        
																	    <span id="q_answer" class="col-md-2 accordion-msg waves-effect waves-dark" style="text-align: center;"><a data-toggle="collapse"
                                                                        data-parent="#accordion" href="#collapseOne${qna.q_id }" aria-expanded="true" aria-controls="collapseOne">

                                                                        <c:if test="${qna.q_answer eq 'true'}"><label class="label label-primary" style="font-size: 10pt;">${qna.q_answer }</label></c:if>
                                                                        <c:if test="${qna.q_answer eq 'false'}"><label class="label label-danger" style="font-size: 10pt;">${qna.q_answer }</label></c:if>

                                                                        </a></span>
																	</div>
																	      
																	      
                                                            </div>
                                                            <div id="collapseOne${qna.q_id }" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingOne" style="text-align: center;">
                                                                <div class="accordion-content accordion-desc">
                                                                <textarea rows="5" class="form-control" style="resize: none; font-size:15px; font-weight:bold; background-color: white; color: black; text-align: center; border:1px solid #555555; border-radius: 10px;" disabled>${qna.q_content }</textarea> 
                                                                </div>
                                                                <div class="accordion-content accordion-desc">
                                                                
                                                                <c:choose>
                                                                <c:when test="${qna.q_answer eq true }">
                                                                <c:forEach var="answer" items="${qnaAnswer}" varStatus="status">
                                                                
                                                                <c:if test="${qna.q_id eq answer.q_reference }">
                                                                <textarea id="q_content${status.index }" name="q_content" rows="5" class="form-control" style="resize: none; font-size:15px; background-color: white; color: #666666; text-align: center; border:1px solid #aaaaaa; border-radius: 10px;">${answer.q_content }</textarea> 
                                                                <br>
                                                                <button class="btn waves-effect waves-light btn-primary btn-outline-primary" onClick="adminAnswerUpdate(${status.index },${answer.q_reference } )">수정</button>
                                                                <button class="btn waves-effect waves-light btn-primary btn-outline-primary" onClick="adminAnswerDelete(${answer.q_reference })">삭제</button>
                                                                </c:if>
                                                                
                                                                </c:forEach>
                                                                </c:when>

                                                                <c:when test="${qna.q_title eq '광고글 삭제' }">
                                                                </c:when>

                                                                <c:otherwise>
                                                                	<textarea id="q_content${status.index }" name="q_content" rows="5" class="form-control" style="resize: none; font-size:15px; background-color: white; color: #666666; text-align: center; border:1px solid #aaaaaa; border-radius: 10px;"></textarea> 
                                                                	<br>
                                                                	<input type="button" class="btn waves-effect waves-light btn-primary btn-outline-primary" value="등록" onClick="adminQna(${status.index })">

                                                                	<button class="btn waves-effect waves-light btn-primary btn-outline-primary" onClick="advertisementDelete(${qna.q_id })">광고글 삭제</button>

                                                                </c:otherwise>
                                                                </c:choose>
                                                               
                                                                </div>
                                                            </div>
                                                            </c:forEach>
                                                        </div>
                                                        </div>
                                                        <form:form name="adminQnaInsert" action="/admin/qnaInsert" commandName="QnaVO" method="post">

                                                        		<input type="hidden" id="q_mid-1" name="q_mid"/>

                                                        		<input type="hidden" name="q_mid" value="admin" />

                                                                <input type="hidden" name="q_mname" value="관리자" />
                                                                <input type="hidden" id="q_type-1" name="q_type" />
                                                                <input type="hidden" id="q_title-1" name="q_title" />
                                                                <input type="hidden" id="q_reference-1" name="q_reference" />
                                                                <input type="hidden" name="q_answer" value="true" />
                                                                <input type="hidden" id="q_content-1" name="q_content" />
                                                        </form:form>
                                                        
                                                        <form:form name="adminQnaUpdate" action="/admin/qnaUpdate" commandName="QnaVO" method="post">
                                                                <input type="hidden" id="q_reference-2" name="q_reference" />
                                                                <input type="hidden" id="q_content-2" name="q_content" />
                                                        </form:form>
                                                        
                                                        <form:form name="adminQnaDelete" action="/admin/qnaDelete" commandName="QnaVO" method="post">
                                                        		<input type="hidden" name="q_answer" value="false" />
                                                                <input type="hidden" id="q_reference-3" name="q_reference" />
                                                        </form:form>

                                                        
                                                        <form:form name="adminAdvertisementDelete" action="/admin/advertisementDelete" commandName="QnaVO" method="post">
                                                        		<input type="hidden" id="q_id-1" name="q_id" />
                                                        </form:form>

		                                            </div>
		                                        </div>
		                                    </div>
		                                </div>
                                <!-- Multiple Open Accordion ends -->
											</div>
										</div>

										<!-- 페이징 start -->
										<div id = "paging-div">
										<ul class="btn-group pagination">
											<c:if test="${pageMaker.prev }">
												<li><a href='<c:url value="/admin/qnaList${pageMaker.makeQuery(pageMaker.startPage-1)}"/>'>
													<span style="font-weight: bold;">&nbsp;[이전]&nbsp;</span></a></li><span class="col-md-1"></span>
											</c:if>
											<c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="pageNum">
												<c:if test="${pageNum eq pageMaker.cri.page}"><li><a href='<c:url value="/admin/qnaList${pageMaker.makeQuery(pageNum)}"/>'>
												<span id="pagingCur" style="background-color: #7971ea; display:inline-block; height: 30px; width: 30px; border-radius: 50%; font-weight: bold; color: white; padding : 5px;">&nbsp;${pageNum}&nbsp;</span></a></li><span class="col-md-1"></span></c:if>
												<c:if test="${pageNum ne pageMaker.cri.page}"><li><a href='<c:url value="/admin/qnaList${pageMaker.makeQuery(pageNum)}"/>'>
												<span>&nbsp;${pageNum}&nbsp;</span></a></li><span class="col-md-1">   </span></c:if>
												
											</c:forEach>
											<c:if test="${pageMaker.next && pageMaker.endPage >0 }">
												<li><a href='<c:url value="/admin/qnaList${pageMaker.makeQuery(pageMaker.endPage+1)}"/>'>
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
        
	<%@ include file="/WEB-INF/views/adminFooter.jsp"%>
	
<script type="text/javascript">

function adminQna(index) {
	

	document.getElementById("q_mid-1").value = document.getElementById("q_mid" + index).innerText;
	document.getElementById("q_type-1").value = document.getElementById("q_type" + index).innerText;
	document.getElementById("q_title-1").value = "[RE]" + document.getElementById("q_title" + index).innerText;
	document.getElementById("q_reference-1").value = document.getElementById("q_id" + index).innerText;
	document.getElementById("q_content-1").value = document.getElementById("q_content" + index).value;
	
	if(document.getElementById("q_content-1").value == ""){
		alert("답변을 입력해 주세요.");
	} else {
		var con = confirm("등록하시겠습니까?");
		if(con == true){
			document.adminQnaInsert.submit();
		}
	}
}

function adminAnswerUpdate(index, reference) {
	
	document.getElementById("q_reference-2").value = reference;
	document.getElementById("q_content-2").value = document.getElementById("q_content" + index).value;
	
	var con = confirm("수정하시겠습니까?");
	if(con == true){
		document.adminQnaUpdate.submit();
	}
}

function adminAnswerDelete(reference) {
	
	document.getElementById("q_reference-3").value = reference;
	
	var con = confirm("삭제하시겠습니까?");
	if(con == true){
		document.adminQnaDelete.submit();
	}
}


function advertisementDelete(q_id) {
	
	document.getElementById("q_id-1").value = q_id;
	
	var con = confirm("광고글을 삭제하시겠습니까?");
	if(con == true){
		document.adminAdvertisementDelete.submit();
	}
	
}

function answerY(){
	document.qnaListY.submit();
}

function answerN(){
	document.qnaListN.submit();
}



   	
</script>
</body>

</html>
