<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html lang="en">

<head>
<title>내 정보 페이지 - UF&#38;O</title>
<%@ include file="/WEB-INF/views/adminHeader.jsp"%>
<%@ include file="/WEB-INF/views/customerHeader.jsp"%>

<style>
.filebox input[type="file"] {
	position: absolute;
	width: 1px;
	height: 1px;
	padding: 0;
	margin: -1px;
	overflow: hidden;
	clip: rect(0, 0, 0, 0);
	border: 0;
}

.filebox label {
	display: inline-block;
	padding: .5em .75em;
	color: #999;
	font-size: inherit;
	line-height: normal;
	vertical-align: middle;
	background-color: #fdfdfd;
	cursor: pointer;
	border: 1px solid #ebebeb;
	border-bottom-color: #e2e2e2;
	border-radius: .25em;
} /* named upload */
.filebox .upload-name {
	display: inline-block;
	padding: .5em .75em; /* label의 패딩값과 일치 */
	font-size: inherit;
	font-family: inherit;
	line-height: normal;
	vertical-align: middle;
	background-color: #f5f5f5;
	border: 1px solid #ebebeb;
	border-bottom-color: #e2e2e2;
	border-radius: .25em;
}

* {
	padding: 0;
	margin: 0;
}

body, html {
	height: 100%;
}

.modal .btn {
	cursor: pointer;
	border: 1px solid #999999;
	text-align: center;
	border-radius: 5px;
	outline: none;
	font-weight: 500;
}

.dimLayer {
	display: block;
	width: 100%;
	background-color: rgba(0, 0, 0, 0.3);
	position: fixed;
	left: 0;
	top: 0px;
	margin: 0;
	padding: 0;
	z-index: 9998;
}

.modal {
	width: 600px;
	height: 252px;
	border-radius: 10px;
	padding: 80px 24px;
	box-sizing: border-box;
	text-align: center;
}

.modal-section {
	background: #ffffff;
	box-sizing: border-box;
	display: none;
	position: absolute;
	top: 50%;
	left: 50%;
	-webkit-transform: translate(-50%, -50%);
	-ms-transform: translate(-50%, -50%);
	-moz-transform: translate(-50%, -50%);
	-o-transform: translate(-50%, -50%);
	transform: translate(-50%, -50%);
	display: none;
	z-index: 9999;
}

.menu_msg {
	font-size: 21px;
	font-weight: 500;
}

.enroll_box p {
	padding-bottom: 56px;
}

.gray_btn {
	width: 90px;
	background: #ffffff;
	color: #999999;
	height: 36px;
	line-height: 36px;
	transition: 0.5s;
	font-size: 17px;
}

.pink_btn {
	width: 90px;
	background: #7971ea;
	color: #fff;
	height: 36px;
	line-height: 36px;
	transition: 0.5s;
	font-size: 17px;
	border: none;
}

.pcoded[theme-layout="vertical"][vertical-placement="left"][vertical-nav-type="offcanvas"][vertical-effect="overlay"] .pcoded-content
	{
	margin-left: 0;
}

.pcoded[theme-layout="vertical"][vertical-placement="left"][vertical-nav-type="expanded"][vertical-effect="shrink"] .pcoded-content
	{
	margin-left: 0;
}

   .tabs-left, .tabs-left-content, .tabs-right, .tabs-right-content {
    display: table-cell;
	}
</style>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>

<body>
	<ul id="tempPage" style=" display:none"></ul>
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
				<div class="row">
					<!--  메뉴바 시작 -->
					<div class="col-xl-2 col-sm-12">
					<div class="card">
						<div class="card-block">
						    <!-- Row start -->
						    <div class="row">
						        <div class="col-sm-12">
						            <div class="sub-title" style="margin-bottom:0px;">Menu</div>
						            <!-- Nav tabs -->
						            <ul id="menuBar" class="nav nav-tabs md-tabs" role="tablist">
						                <li class="nav-item">
						                    <a class="nav-link" href="/member/mem/userInfo" role="tab">내 정보</a>
						                    <div class="slide"></div>
						                </li>
						                <li class="nav-item">
						                    <a class="nav-link" href="/member/mem/memRentList" role="tab">대역 내역</a>
						                    <div class="slide"></div>
						                </li>
						                <li class="nav-item">
						                    <a class="nav-link active" href="/member/mem/memBuyList" role="tab">구매 내역</a>
						                    <div class="slide"></div>
						                </li>
						                <li class="nav-item">
						                    <a class="nav-link" href="#MessageBox" role="tab">메시지 함</a>
						                    <div class="slide"></div>
						                </li>
						            </ul>
						        </div>
						    </div>
						    <!-- Row end -->
					    </div>
				  	</div>
					</div>
					<!-- 메뉴바 끝 -->
					<!--  sale analytics start -->
					<div class="col-xl-10 col-sm-12" id="changedPage">
					<!-- 회원 개인 정보 수정 가능하게끔 -->
	
					
					</div>
				</div>
			</div>
		</div>
		</div>
	</div>
	</div>
	</div>
	</div>
	</div>
	</div>
	<!-- confirm 모달을 쓸 페이지에 추가 start-->
	<section class="modal modal-section type-confirm">
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
	<section class="modal modal-section type-alert">
		<div class="enroll_box">
			<p class="menu_msg"></p>
		</div>
		<div class="enroll_btn">
			<button class="btn pink_btn modal_close">확인</button>
		</div>
	</section>
	<!-- alert 모달을 쓸 페이지에 추가 end-->




	<!--이 script 없으면 css 깨짐-->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script>
	$(document).ready(function(){
		var size =$(window)[0].innerWidth;
		if(size > 1200) {
			$('#menuBar').attr('class' , "nav nav-tabs md-tabs tabs-left b-none");
		} else {
			$('#menuBar').attr('class' , "nav nav-tabs md-tabs");
		}
	});


	$(window).resize(function() {
		var size =$(window)[0].innerWidth;
		if(size > 1200) {
			$('#menuBar').attr('class' , "nav nav-tabs md-tabs tabs-left b-none");
		} else {
			$('#menuBar').attr('class' , "nav nav-tabs md-tabs");
		}
	});

	function goBuyDetailPage(r_id){
	   	var url = '/member/mem/memBuyDetail/'+r_id;
    	 $("#tempPage").load(url, function(){
      	 $("#changedPage").html($("#tempPage").html());
      	 $("#tempPage").html("");
     	});
	}
	
		$(function() {
			//사용 예시 **************************
			$(document).on("click", "#confirm", function() {
				action_popup.confirm("탈퇴 하시겠습니까?", function(res) {
					if (res) {
						action_popup.alert("탈퇴가 되었습니다.");
						document.delete2.submit();
					} else {
						action_popup.alert("탈퇴에 실패하였습니다.");
					}
				})
			});

			$(document).on("click", "#update", function() {
				action_popup.confirm("수정 하시겠습니까?", function(upd) {
					if (upd) {
						action_popup.alert("수정이 되었습니다.");
						document.update.submit();
					} else {
						action_popup.alert("수정에 실패하였습니다.");
					}
				})
			});

			$(document).on("click", "#alert", function() {
				action_popup.alert("경고창 테스트!!!");
			});

			$(".modal_close").on("click", function() {
				action_popup.close(this);
			});
			//사용 예시 **************************
		});

		/**
		 *  alert, confirm 대용 팝업 메소드 정의 <br/>
		 *  timer : 애니메이션 동작 속도 <br/>
		 *  alert : 경고창 <br/>
		 *  confirm : 확인창 <br/>
		 *  open : 팝업 열기 <br/>
		 *  close : 팝업 닫기 <br/>
		 */
		var action_popup = {
			timer : 500,
			confirm : function(txt, callback) {
				if (txt == null || txt.trim() == "") {
					console.warn("confirm message is empty.");
					return;
				} else if (callback == null || typeof callback != 'function') {
					console.warn("callback is null or not function.");
					return;
				} else {
					$(".type-confirm .btn_ok").on("click", function() {
						$(this).unbind("click");
						callback(true);
						action_popup.close(this);
					});
					this.open("type-confirm", txt);
				}
			},

			alert : function(txt) {
				if (txt == null || txt.trim() == "") {
					console.warn("confirm message is empty.");
					return;
				} else {
					this.open("type-alert", txt);
				}
			},

			open : function(type, txt) {
				var popup = $("." + type);
				popup.find(".menu_msg").text(txt);
				$("body").append("<div class='dimLayer'></div>");
				$(".dimLayer").css('height', $(document).height()).attr(
						"target", type);
				popup.fadeIn(this.timer);
			},

			close : function(target) {
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
				setTimeout(function() {
					dimLayer != null ? dimLayer.remove() : "";
				}, this.timer);
			}
		}
	</script>

	<%@ include file="/WEB-INF/views/customerFooter.jsp"%>
</body>

</html>