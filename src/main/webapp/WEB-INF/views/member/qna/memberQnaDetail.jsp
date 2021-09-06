<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%
	Date nowTime = new Date();
	SimpleDateFormat sf = new SimpleDateFormat("yyyy. MM. dd HH:mm:ss");
%>


<!DOCTYPE html>
<html lang="en">
<head>
<title>UF&#38;O- Q &#38; A 상세페이지</title>
<%@ include file="/WEB-INF/views/adminHeader.jsp"%>
	<%@ include file="/WEB-INF/views/customerHeader.jsp"%>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Mukta:300,400,700">
<link rel="stylesheet" href="/resources/common/fonts/icomoon/style.css">

<link rel="stylesheet" href="/resources/common/css/bootstrap.min.css">
<link rel="stylesheet" href="/resources/common/css/magnific-popup.css">
<link rel="stylesheet" href="/resources/common/css/jquery-ui.css">
<link rel="stylesheet" href="/resources/common/css/owl.carousel.min.css">
<link rel="stylesheet"
	href="/resources/common/css/owl.theme.default.min.css">


<link rel="stylesheet" href="/resources/common/css/aos.css">

<link rel="stylesheet" href="/resources/common/css/style.css">

<style type="text/css">


:root {
  --border-size: 0.125rem;
  --duration: 500ms;
  --ease: cubic-bezier(0.215, 0.61, 0.355, 1);
  --font-family: monospace;
  --color-primary: white;
  --color-secondary: #555555;
  --color-tertiary: dodgerblue;
  --shadow: rgba(0, 0, 0, 0.1);
  --space: 1rem;
}


.multi-button {
  display: flex;
  width: 100%;
}

.multi-button button {
  flex-grow: 1;
  cursor: pointer;
  position: relative;
  font-weight: bold;
  border-radius: 8px;
  color: var(--color-secondary);
  background-color: var(--color-primary);
  font-size: 1em;
  font-family: var(--font-family);
  text-transform: lowercase;
  text-shadow: var(--shadow) 2px 2px;
  transition: flex-grow var(--duration) var(--ease);
}

.multi-button button + button {
  border-left: var(--border-size) solid black;
  margin-left: calc(var(--border-size) * -1);
}

.multi-button button:hover,
.multi-button button:focus {
  flex-grow: 2;
  color: white;
  outline: none;
  text-shadow: none;
  background-color: #7971ea;
}

.multi-button button:focus {
  outline: var(--border-size) dashed var(--color-primary);
  outline-offset: calc(var(--border-size) * -3);
}

.multi-button:hover button:focus:not(:hover) {
  flex-grow: 1;
  color: var(--color-secondary);
  background-color: var(--color-primary);
  outline-color: var(--color-tertiary);
}

.multi-button button:active {
  transform: translateY(var(--border-size));
}



.box {
	width: 100%;
	height: 70%;
}

.tabs-left, .tabs-left-content, .tabs-right, .tabs-right-content {
	display: table-cell !important;
}
.table.table-sm td, .table.table-sm th{
   padding: 5px 5px !important;
}

.mocdal .btn {
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

.mocdal {
	width: 600px;
	height: 252px;
	border-radius: 10px;
	padding: 80px 24px;
	box-sizing: border-box;
	text-align: center;
}

.mocdal-section {
	background: #ffffff;
	box-sizing: border-box;
	display: none;
	position: fixed;
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
	transition: 0.5s;
	font-size: 17px;
}

.pink_btn {
	width: 90px;
	background: #7971ea;
	color: #fff;
	height: 36px;
	transition: 0.5s;
	font-size: 17px;
	border: none;
}
</style>
</head>
<body>
	
	<div style="text-align: center;">
		<br><br>
		<h2 style="color: #666666; font-weight: bold;">Q &#38; A</h2>
		<br><br>
		<div class="row">
		<div class="col-xl-1 col-sm-12">
		</div>
		<!--  메뉴바 시작 -->
		
		<div class="col-xl-2 col-sm-12">
		<div class="container" style="text-align: center; margin: auto;">
			<div class="card">
				<div class="card-block">
		<div class="main-body">
		<div class="page-body">
			<!-- Page-body start -->
					<!-- Row start -->
					<div class="row">
						<div class="col-sm-12">
							<div class="sub-title" style="font-weight: bold; font-size: 20px;">Menu</div>
							<!-- Nav tabs -->
							<ul id="menuBar" class="nav nav-tabs md-tabs" role="tablist">
								<li class="nav-item"><a id="menu-1" class="nav-link"
									href="/member/noticeList" role="tab" style="font-weight: bold;">공지사항</a>
									<div class="slide"></div></li>
								<li class="nav-item"><a id="menu-2" class="nav-link active"
									href="/member/qna/qnaList" role="tab" style="font-weight: bold;">Q &#38; A</a>
									<div class="slide"></div></li>
								
							</ul>
						</div>
					</div>
					<!-- Row end -->
			</div>
			</div>
		</div>
		</div>
		</div>
		</div>
		
		<!-- 메뉴바 끝 -->
		<div class="col-xl-7 col-sm-12">
		<div class="container" style="text-align: center;">
		<div class="box">
			<input type="hidden" name="q_id"  value="${qnaVO.q_id }">
			<input type="hidden" name="q_mid" value="${qnaVO.q_mid }">
			<input type="hidden" name="q_mname"  value="${qnaVO.q_mname }">
			<input type="hidden" name="q_readCount"  value="${qnaVO.q_readCount }">
			<input type="hidden" name="q_reference"  value="${qnaVO.q_reference }">
			<input type="hidden" name="q_answer"  value="${qnaVO.q_answer }">
			<c:choose>
			<c:when test="${not empty userInfo}">
				<c:choose>
				<c:when test="${userInfo.m_id eq qnaVO.q_mid }">
				
					<table class="table table-sm">
						<tr>
							<td class="danger" style="font-weight: bold; color: #555555; background-color: #F2DEDE;">글번호</td>
							<td style="text-align: center; background-color: white; color: #555555;">${qnaVO.q_id }</td>
							<td class="danger" style="font-weight: bold; color: #555555; background-color: #F2DEDE;">작성자</td>
							<td style="text-align: center; background-color: white; color: #555555;">${qnaVO.q_mname }</td>
						</tr>
						<tr>
							<td class="danger" style="font-weight: bold; color: #555555; background-color: #F2DEDE;">카테고리</td>
							<td style="color: #555555;">${qnaVO.q_type }</td>	
							<td class="danger" style="font-weight: bold; color: #555555; background-color: #F2DEDE;">작성일</td>
							<td style="text-align: center; background-color: white; color: #555555;">${qnaVO.q_date }</td>
						</tr>
						<tr>
							<td class="danger" style="font-weight: bold; color: #555555;"></td>
							<td style="color: #555555;"></td>	
							<td class="danger" style="font-weight: bold; color: #555555; background-color: #F2DEDE;">조회수</td>
							<td style="text-align: center; background-color: white; color: #555555;">${qnaVO.q_readCount }</td>
						</tr>
						<tr>
							<td class="danger" style="font-weight: bold; color: #555555;">제목</td>
							<td colspan="3" style="color: #555555;">${qnaVO.q_title }</td>
						</tr>
	
						<tr>
							<td class="danger" style="font-weight: bold; color: #555555; background-color: #F2DEDE; vertical-align:middle;">글내용</td>
							<td colspan="3"><textarea name="q_content" class="form-control" rows="18" style="resize: none; background-color: white;" readOnly="readOnly">${qnaVO.q_content }</textarea></td>
						</tr>
					</table>
				
				</c:when>
				<c:otherwise>
					<table class="table table-sm">
						<tr>
							<td>비밀글 입니다.</td>
						</tr>
					</table>
				</c:otherwise>
				</c:choose>
				</c:when>
				<c:otherwise>
				<table class="table table-sm">
						<tr>
							<td>비밀글 입니다.</td>
						</tr>
					</table>
				</c:otherwise>
				</c:choose>
				<c:choose>
				<c:when test="${not empty userInfo}">
				<c:if test="${userInfo.m_id eq qnaVO.q_mid }">
					<div class="row text-center" style="width: 55%; margin: auto;">
					<div class="multi-button" >
						<button onClick="location.href='/member/qna/qnaList'">글 목 록</button><br>										  	
			  			<button onClick="qnaEditBtn()">글 수 정</button><br>
						<button onClick="qnaDeleteBtn()">글 삭 제</button><br>							  	
					</div>
					</div>
				</c:if>
				<c:if test="${userInfo.m_id ne qnaVO.q_mid }">
					<div class="row text-center" style="width: 150px; margin: auto;">
					<div class="multi-button" >
						<button onClick="javascript:history.back();">글 목 록</button><br>			  	
					</div>
					</div>
				</c:if>
				</c:when>
				<c:otherwise>
					<div class="row text-center" style="width: 150px; margin: auto;">
					<div class="multi-button" >
						<button onClick="javascript:history.back();">글 목 록</button><br>			  	
					</div>
					</div>
				</c:otherwise>
				</c:choose>
				</div>
			</div>
			</div>
		</div>
			
		<div class="col-xl-2 col-sm-12">
		</div>
		</div>
		
		<!-- confirm 모달을 쓸 페이지에 추가 start-->
	<section class="mocdal mocdal-section type-confirm">
		<div class="enroll_box">
			<p class="menu_msg"></p>
		</div>
		<div class="enroll_btn">
			<button class="btn pink_btn btn_ok">확인</button>
			<button class="btn gray_btn modal_close">취소</button>
		</div>
	</section>
	<!-- confirm 모달을 쓸 페이지에 추가 end-->
	
	<!-- confirmEdit 모달을 쓸 페이지에 추가 start-->
	<section class="mocdal mocdal-section type-confirmEdit">
		<div class="enroll_box">
			<p class="menu_msg"></p>
		</div>
		<div class="enroll_btn">
			<button class="btn pink_btn btn_ok">확인</button>
		</div>
	</section>
	<!-- confirmEdit 모달을 쓸 페이지에 추가 end-->
	
	<!-- alert 모달을 쓸 페이지에 추가 start-->
	<section class="mocdal mocdal-section type-alert">
		<div class="enroll_box">
			<p class="menu_msg"></p>
		</div>
		<div class="enroll_btn">
			<button class="btn pink_btn modal_close">확인</button>
		</div>
	</section>
	<!-- alert 모달을 쓸 페이지에 추가 end-->
        
	<%@ include file="/WEB-INF/views/customerFooter.jsp"%>

	<script src="/resources/common/js/jquery-3.3.1.min.js"></script>
	<script src="/resources/common/js/jquery-ui.js"></script>
	<script src="/resources/common/js/popper.min.js"></script>
	<script src="/resources/common/js/bootstrap.min.js"></script>
	<script src="/resources/common/js/owl.carousel.min.js"></script>
	<script src="/resources/common/js/jquery.magnific-popup.min.js"></script>
	<script src="/resources/common/js/aos.js"></script>

	<script src="/resources/common/js/main.js"></script>


	<script
		src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script>
	function qnaEditBtn(){
		action_popup.confirm("수정 하시겠습니까?",function(res) {
			if (res) {
				location.href="/member/qna/qnaEdit/" + ${qnaVO.q_id };
			} 
		});
	}
	function qnaDeleteBtn(){
		action_popup.confirm("삭제 하시겠습니까?",function(res) {
			if (res) {
				location.href="/member/qna/qnaDelete/" + ${qnaVO.q_id };
			} 
		});
	}
	
	$(document).ready(function(){
		
		var size =$(window)[0].innerWidth;
		if(size > 1200) {
			$('#menuBar').attr('class' , "nav nav-tabs md-tabs tabs-left b-none");
			$('#menuBar').attr('style' , "font-weight: bold;");
			$('.sub-title').attr('style', 'font-weight: bold; font-size: 15px;');
			$('#menu-1').attr('style', 'padding:20px 0 !important;');
			$('#menu-2').attr('style', 'padding:20px 0 !important;');
		} else {
			$('#menuBar').attr('class' , "nav nav-tabs md-tabs");
			$('#menuBar').attr('style' , "padding-top: 10px !important; padding-right: 0px !important; padding-bottom: 10px !important; padding-left: 0px !important;");
			$('.sub-title').attr('style', 'font-weight: bold; font-size: 15px; margin:0px;');
			$('#menu-1').attr('style', "font-weight: bold; padding-top: 10px !important; padding-right: 0px !important; padding-bottom: 10px !important; padding-left: 0px !important;");
			$('#menu-2').attr('style', "font-weight: bold; padding-top: 10px !important; padding-right: 0px !important; padding-bottom: 10px !important; padding-left: 0px !important;");
		}
	});


	$(window).resize(function() {
		console.log("id ${userInfo.m_id} / ${qnaVO.q_mid}");
		var size =$(window)[0].innerWidth;
		if(size > 1200) {
			$('#menuBar').attr('class' , "nav nav-tabs md-tabs tabs-left b-none");
			$('#menuBar').attr('style' , "font-weight: bold;");
			$('.sub-title').attr('style', 'font-weight: bold; font-size: 15px;');
			$('#menu-1').attr('style', 'padding:20px 0 !important;');
			$('#menu-2').attr('style', 'padding:20px 0 !important;');
		} else {
			$('#menuBar').attr('class' , "nav nav-tabs md-tabs");
			$('#menuBar').attr('style' , "padding-top: 10px !important; padding-right: 0px !important; padding-bottom: 10px !important; padding-left: 0px !important;");
			$('.sub-title').attr('style', 'font-weight: bold; font-size: 15px; margin:0px;');
			
			$('#menu-1').attr('style', "font-weight: bold; padding-top: 10px !important; padding-right: 0px !important; padding-bottom: 10px !important; padding-left: 0px !important;");
			$('#menu-2').attr('style', "font-weight: bold; padding-top: 10px !important; padding-right: 0px !important; padding-bottom: 10px !important; padding-left: 0px !important;");
		}
	});
	
	$(".modal_close").on("click", function() {
		action_popup.close(this);
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
		confirmEdit : function(txt, callback) {
			if (txt == null || txt.trim() == "") {
				console.warn("confirm message is empty.");
				return;
			} else if (callback == null || typeof callback != 'function') {
				console.warn("callback is null or not function.");
				return;
			} else {
				$(".type-confirmEdit .btn_ok").on("click", function() {
					$(this).unbind("click");
					callback(true);
					action_popup.close(this);
				});
				this.open("type-confirmEdit", txt);
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
			var modal = $(target).closest(".mocdal-section");
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
</body>

</html>
