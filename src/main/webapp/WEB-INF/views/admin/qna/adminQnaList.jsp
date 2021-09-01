<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

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
									<input type="button" id="button" class="btn waves-effect waves-light btn-primary btn-outline-primary" value="공지글작성" onClick="location.href='/admin/notice/noticeInsertForm';">
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
                                                            <span class="col-md-2 accordion-msg waves-effect waves-dark" style="text-align: center; font-weight: bold; font-size: 17px;">ID</span>
                                                            <span class="col-md-2 accordion-msg waves-effect waves-dark" style="text-align: center; font-weight: bold; font-size: 17px;">카테고리</span>
                                                            <span class="col-md-2 accordion-msg waves-effect waves-dark" style="text-align: center; font-weight: bold; font-size: 17px;">제목</span>
                                                            <span class="col-md-2 accordion-msg waves-effect waves-dark" style="text-align: center; font-weight: bold; font-size: 17px;">이름</span>
                                                            <span class="col-md-2 accordion-msg waves-effect waves-dark" style="text-align: center; font-weight: bold; font-size: 17px;">날짜</span>
                                                            <span class="col-md-2 accordion-msg waves-effect waves-dark" style="text-align: center; font-weight: bold; font-size: 17px;">답변여부</span>
                                                            </div>
                                                                <c:forEach var="qna" items="${qnaList}">
                                                                <div class="accordion-heading" role="tab" id="headingOne">
                                                                	<div class="row">
                                                                        <span class="col-md-2 accordion-msg waves-effect waves-dark" style="text-align: center;"><a data-toggle="collapse"
                                                                        data-parent="#accordion" href="#collapseOne${qna.q_id }" aria-expanded="true" aria-controls="collapseOne">${qna.q_id }</a></span>
																	    <span class="col-md-2 accordion-msg waves-effect waves-dark" style="text-align: center;"><a data-toggle="collapse"
                                                                        data-parent="#accordion" href="#collapseOne${qna.q_id }" aria-expanded="true" aria-controls="collapseOne">${qna.q_type }</a></span>
																	    <span class="col-md-2 accordion-msg waves-effect waves-dark" style="text-align: center;"><a data-toggle="collapse"
                                                                        data-parent="#accordion" href="#collapseOne${qna.q_id }" aria-expanded="true" aria-controls="collapseOne">${qna.q_title }</a></span>
																	    <span class="col-md-2 accordion-msg waves-effect waves-dark" style="text-align: center;"><a data-toggle="collapse"
                                                                        data-parent="#accordion" href="#collapseOne${qna.q_id }" aria-expanded="true" aria-controls="collapseOne">${qna.q_mname }</a></span>
																	    <span class="col-md-2 accordion-msg waves-effect waves-dark" style="text-align: center;"><a data-toggle="collapse"
                                                                        data-parent="#accordion" href="#collapseOne${qna.q_id }" aria-expanded="true" aria-controls="collapseOne">${qna.q_date }</a></span>
																	    <span class="col-md-2 accordion-msg waves-effect waves-dark" style="text-align: center;"><a data-toggle="collapse"
                                                                        data-parent="#accordion" href="#collapseOne${qna.q_id }" aria-expanded="true" aria-controls="collapseOne">${qna.q_answer }</a></span>
																	</div>
																	      
																	      
                                                            </div>
                                                            <div id="collapseOne${qna.q_id }" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingOne" style="text-align: center;">
                                                                <div class="accordion-content accordion-desc">
                                                                <textarea name="q_content" rows="5" class="form-control" style="resize: none; font-size:15px; font-weight:bold; background-color: white; color: black; text-align: center; border:1px solid #555555; border-radius: 10px;" disabled>${qna.q_content }</textarea> 
                                                                </div>
                                                                <div class="accordion-content accordion-desc">
                                                                <textarea name="q_content" rows="5" class="form-control" style="resize: none; font-size:15px; background-color: white; color: #666666; text-align: center; border:1px solid #aaaaaa; border-radius: 10px;"></textarea> 
                                                                <br>
                                                                <input type="button" value="등록">
                                                                <button>수정</button>
                                                                <button>삭제</button>
                                                                </div>
                                                            </div>
                                                            </c:forEach>
                                                        </div>
                                                        </div>
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
