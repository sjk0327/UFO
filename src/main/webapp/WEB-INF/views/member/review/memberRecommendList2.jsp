<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="en">


<head>
<title>내 리뷰 페이지 - UF&#38;O</title>

<%@ include file="/WEB-INF/views/adminHeader.jsp"%>

<style type="text/css">


* {padding: 0;margin: 0;}
body, html {height: 100%;}
.modal .btn{cursor: pointer;border: 1px solid #999999;text-align: center;border-radius: 5px;outline: none;font-weight: 500;}
.dimLayer{display: block;width: 100%;background-color: rgba(0, 0, 0, 0.3);position: fixed;left: 0;top: 0px;margin: 0;padding: 0;z-index: 9998;}
.mocdal{width: 500px;height: 252px;border-radius: 10px;padding: 80px 24px;box-sizing: border-box;text-align: center; }
.modal-section{background: #ffffff;box-sizing: border-box;display: none;position: fixed;top: 50%;left: 50%;-webkit-transform: translate(-50%, -50%);-ms-transform: translate(-50%, -50%);-moz-transform: translate(-50%, -50%);-o-transform: translate(-50%, -50%);transform: translate(-50%, -50%);display: none;z-index: 9999;}
.menu_msg{font-size: 21px;font-weight: 500;}
.enroll_box p{padding-bottom: 56px;}
.gray_btn {width: 90px;background: #ffffff;color: #999999;height: 36px;transition: 0.5s;font-size: 17px;}
.pink_btn {width: 90px;background: #ed197a;color: #fff;height: 36px;transition: 0.5s;font-size: 17px;border: none;}

	
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
									
										<form id="sort" name="recSearch" method="post"
											action="/admin/rec/recList">

										<select id="searchType" name="searchType">
                                    <option value="">검색조건</option>
                                    <option value="t" <c:if test="${pageMaker.cri.searchType eq 't'}">selected </c:if>>회원ID</option>
                                    <option value="c" <c:if test="${pageMaker.cri.searchType eq 'c'}"> selected </c:if>>제품ID</option>
                                    <option value="w" <c:if test="${pageMaker.cri.searchType eq 'w'}"> selected </c:if>>제품명</option>
                                 </select>&nbsp;
											<input type="text" id="keyword" name="keyword"  
												value="${pageMaker.cri.keyword}" placeholder="검색어를 입력하세요" />&nbsp;
								
											<button id="button" class="btn waves-effect waves-light btn-primary btn-outline-primary">검색</button>&nbsp;
											<input type="button" id="button" class="btn waves-effect waves-light btn-primary btn-outline-primary" value="전체보기" onClick="location.href='/admin/rec/recList';">&nbsp;
										</form>
										<div><br></div>
										<div class="card">
											<div class="row">
												<div class="col-sm-12">
													<!-- Hover table card start -->
													<div class="card">
														<div class="card-header">
															<h5>추천글리스트</h5>
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
																	<form name="RecUpdate" action="/admin/rec/recUpdate" >
																<table class="table table-hover">
																	<thead>
																		<tr>
																			<th>회원 ID</th>
																			<th>제품ID</th>
																			<th>제품명</th>
																			<th>코멘트</th>
																			<th>작성날짜</th>
																			<th></th>
																		</tr>
																	</thead>
																	<c:forEach var="list" items="${recList}">
																		<tbody>
																			<tr>
																				<td>${list.v_mid }</td>
																				<td>${list.v_pid }</td>
																				<td>${list.p_name }</td>
																				<td>${list.v_content }</td>
																				<td>${list.v_date }</td>
																				<c:if test="${list.v_content eq '관리자에 의해 삭제된 코멘트 입니다.'}">
																				<td></td>
																				</c:if>
																				<c:if test="${list.v_content ne '관리자에 의해 삭제된 코멘트 입니다.'}">
																				<td><button type="button" class="btn waves-effect waves-light btn-primary btn-outline-primary" onclick="recUpdate('${list.v_id }')">삭제</button></td>
																				</c:if>
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
										
										<div class="col-md-1 mmodal">
										<!-- confirm 모달을 쓸 페이지에 추가 start-->
									        <section class="mocdal modal-section type-confirm">
									            <div class="enroll_box">
									                <p class="menu_msg"></p>
									            </div>
									            <div class="enroll_btn">
									                <button class="btn pink_btn btn_ok">확인</button>
									                <button class="btn gray_btn modal_close">취소</button>
									            </div>
									        </section>
									        <!-- confirm 모달을 쓸 페이지에 추가 end-->
									
									        <!-- alert 모달을 쓸 페이지에 추가 start-->
									        <section class="mocdal modal-section type-alert">
									            <div class="enroll_box">
									                <p class="menu_msg"></p>
									            </div>
									            <div class="enroll_btn">
									                <button class="btn pink_btn modal_close">확인</button>
									            </div>
									        </section>
									        </div>
									 
										<!-- 페이징 start -->
										<div id = "paging-div">
										<ul class="btn-group pagination">
											<c:if test="${pageMaker.prev }">
												<li><a href='<c:url value="/admin/rec/recList${pageMaker.makeQuery(pageMaker.startPage-1)}"/>'>
													<span style="font-weight: bold;">&nbsp;[이전]&nbsp;</span></a></li><span class="col-md-1"></span>
											</c:if>
											<c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="pageNum">
												<c:if test="${pageNum eq pageMaker.cri.page}"><li><a href='<c:url value="/admin/rec/recList${pageMaker.makeQuery(pageNum)}"/>'>
												<span id="pagingCur" style="background-color: #7971ea; display:inline-block; height: 30px; width: 30px; border-radius: 50%; font-weight: bold; color: white; padding : 5px;">&nbsp;${pageNum}&nbsp;</span></a></li><span class="col-md-1"></span></c:if>
												<c:if test="${pageNum ne pageMaker.cri.page}"><li><a href='<c:url value="/admin/rec/recList${pageMaker.makeQuery(pageNum)}"/>'>
												<span>&nbsp;${pageNum}&nbsp;</span></a></li><span class="col-md-1">   </span></c:if>
												
											</c:forEach>
											<c:if test="${pageMaker.next && pageMaker.endPage >0 }">
												<li><a href='<c:url value="/admin/rec/recList${pageMaker.makeQuery(pageMaker.endPage+1)}"/>'>
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
   
function recUpdate(v_id) {
	action_popup.confirm("삭제하시겠습니까?", function (res) {
        if (res) {
            action_popup.alert("확인창을 눌렀습니다.");
        }
	location.href = '/admin/rec/recUpdate/' + v_id;
    })
}

$(".modal_close").on("click", function () {
    action_popup.close(this);
});

var action_popup = {
	    timer: 500,
	    confirm: function (txt, callback) {
	        if (txt == null || txt.trim() == "") {
	            console.warn("confirm message is empty.");
	            return;
	        } else if (callback == null || typeof callback != 'function') {
	            console.warn("callback is null or not function.");
	            return;
	        } else {
	            $(".type-confirm .btn_ok").on("click", function () {
	                $(this).unbind("click");
	                callback(true);
	                action_popup.close(this);
	            });
	            this.open("type-confirm", txt);
	        }
	    },

	    alert: function (txt) {
	        if (txt == null || txt.trim() == "") {
	            console.warn("confirm message is empty.");
	            return;
	        } else {
	            this.open("type-alert", txt);
	        }
	    },

	    open: function (type, txt) {
	        var popup = $("." + type);
	        popup.find(".menu_msg").text(txt);
	        $("body").append("<div class='dimLayer'></div>");
	        $(".dimLayer").css('height', $(document).height()).attr("target", type);
	        popup.fadeIn(this.timer);
	    },

	    close: function (target) {
	        var modal = $(target).closest(".modal-section");
	        var dimLayer;
	        if (modal.hasClass("type-confirm")) {
	            dimLayer = $(".dimLayer[target=type-confirm]");
	        } else if (modal.hasClass("type-alert")) {
	            dimLayer = $(".dimLayer[target=type-alert]")
	        } else {
	            console.warn("close unknown target.")
	            return;
	        }
	        modal.fadeOut(this.timer);
	        setTimeout(function () {
	            dimLayer != null ? dimLayer.remove() : "";
	        }, this.timer);
	    }
	}
	
</script>
</body>

</html>
