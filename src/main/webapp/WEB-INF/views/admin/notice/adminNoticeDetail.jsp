<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="en">


<head>
<title> 공지사항 상세 </title>

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
																	<form name="NoticeUpdate" action="/admin/notice/noticeUpdate" method="post" >
																	<input type="hidden" name="n_id" value="${noticeVO.n_id }" />
																<table class="table table-striped table-sm">
																	<tr>
																		<td class="danger" style="font-weight: bold;">글번호</td>
																		<td style="text-align: center; background-color: white;">${noticeVO.n_id }</td>
																		<td class="danger" style="font-weight: bold;">작성자</td>
																		<td style="text-align: center; background-color: white;">${noticeVO.n_name }</td>
																		<td class="danger" style="font-weight: bold;">작성일</td>
																		<td style="text-align: center; background-color: white;">${noticeVO.n_date }</td>
																		
																	</tr>
																	<tr>
																		<td class="danger" style="font-weight: bold;">제목</td>
																		<td colspan="5">
																		<input type="text" class="form-control"name="n_title" value="${noticeVO.n_title }"></td>
																	</tr>
											
																	<tr>
																		<td class="danger" style="font-weight: bold;">글내용</td>
																		<td colspan="5"><textarea name="n_content" class="form-control" rows="18" style="resize: none;">${noticeVO.n_content }</textarea></td>
																	</tr>
											
																	<tr>
																		<td colspan="7" class="text-center">
																		<input type="submit" value="수정" class="btn waves-effect waves-light btn-primary btn-outline-primary"> 
																		<input type="button" class="btn waves-effect waves-light btn-primary btn-outline-primary" onclick="location.href='/admin/noticeList'" value="글목록"></td>
																	</tr>
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
