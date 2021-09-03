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
<title>UFO - QnA</title>
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


* {
	padding: 0;
	margin: 0;
}

body, html {
	height: 100%;
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

.box {
	width: 100%;
	height: 70%;
}

.tabs-left, .tabs-left-content, .tabs-right, .tabs-right-content {
	display: table-cell !important;
}


.md-tabs .nav-item a{
	padding: 
}


#qnaCategory{
    width: 150px;
    height: 38px;
    padding-left: 8px;
    font-size: 13px;
    color: #585858;
    border-radius: 5px;
}
#searchWord{
    width: 150px;
    height: 38px;
    padding-left: 8px;
    font-size: 13px;
    color: #585858;
    border-radius: 5px;
    border:1px #585858 solid;
}

</style>
</head>
<body>
	<%@ include file="/WEB-INF/views/adminHeader.jsp"%>
	<%@ include file="/WEB-INF/views/customerHeader.jsp"%>
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

		<input type="hidden" id="hiddenId" value="${userInfo.m_id }"/>

		<!-- 메뉴바 끝 -->
		<div class="col-xl-7 col-sm-12">
		<div class="container" style="text-align: center;">
		<div class="box">

		<form id="sort" name="qnaSearch" method="post" action="/member/qna/qnaList">
			<select id="searchType" name="searchType" onchange="searchTypeChange()">
                            <option value="">검색조건</option>
                            <option value="c" <c:if test="${pageMaker.cri.searchType eq 'c'}"> selected </c:if>>카테고리</option>
                            <option value="t" <c:if test="${pageMaker.cri.searchType eq 't'}"> selected </c:if>>제목</option>
                            <option value="n" <c:if test="${pageMaker.cri.searchType eq 'n'}"> selected </c:if>>작성자</option>
            </select>&nbsp;
			<select id="qnaCategory" name="keyword" style="display:none;">
				<option value="">선택해주세요</option>
				<option value="가입문의" <c:if test="${pageMaker.cri.keyword eq '가입문의'}"> selected </c:if>>가입문의</option>
                <option value="상품문의" <c:if test="${pageMaker.cri.keyword eq '상품문의'}"> selected </c:if>>상품문의</option>
                <option value="결제문의" <c:if test="${pageMaker.cri.keyword eq '결제문의'}"> selected </c:if>>결제문의</option>
                <option value="배송문의" <c:if test="${pageMaker.cri.keyword eq '배송문의'}"> selected </c:if>>배송문의</option>
			</select>
			<c:choose>
				<c:when test="${pageMaker.cri.searchType eq 'c'}">
					<input type="text" id="searchWord" name="keyword" value="" placeholder="검색어를 입력하세요" />&nbsp;
				</c:when>
				<c:otherwise>
					<input type="text" id="searchWord" name="keyword" value="${pageMaker.cri.keyword}" placeholder="검색어를 입력하세요" />&nbsp;
				</c:otherwise>
			</c:choose>

			<input type="button" id="searchBtn" value="검색" class="btn waves-effect waves-light btn-primary btn-outline-primary">&nbsp;
			<input type="button" id="button" class="btn waves-effect waves-light btn-primary btn-outline-primary" value="전체보기" onClick="location.href='/member/qna/qnaList';">&nbsp;
			<c:if test="${not empty userInfo }">
				<input type="button" id="searchMyQnaBtn" value="내가 쓴 문의글"class="btn waves-effect waves-light btn-primary btn-outline-primary">&nbsp;
			</c:if>

		</form>
			<table class="table table-hover table-sm">
				<thead style="background-color: #A0AFFF;">
					<tr style="color: #fffeee; font-weight: bold;">
						<th style="text-align: center; width: 10%;">번호</th>
						<th style="text-align: center; width: 15%;">카테고리</th>
						<th style="text-align: center; width: 40%;">제목</th>
						<th style="text-align: center; width: 10%;">작성자</th>
						<th style="text-align: center; width: 15%;">작성날짜</th>
						<th style="text-align: center; width: 10%;">조회수</th>
					</tr>
				</thead>
				<c:set var="num" value="${totalCount }"></c:set>
				<tbody>

				<c:choose>
				<c:when test="${totalCount > 0 }">
	            	<c:forEach var="qna" items="${qnaList }">
	               
	                  <tr style="text-align: center; color: #555555;" onClick="location.href='/member/qna/qnaDetail/${qna.q_id }'">
	                  
	                     <td>${num-(pageMaker.cri.page-1)*9 }</td>
	                     <td>${qna.q_type }</td>
	                     <td>${qna.q_title }</td>
	                     <td>${qna.q_mname }</td>
	                     <td>${qna.q_date }</td>
	                     <td>${qna.q_readCount }</td>
	                  </tr>
	              
	                <c:set var="num" value="${num-1 }"></c:set>
	           		</c:forEach>
           		</c:when>
           		<c:otherwise>
           			<c:if test="${pageMaker.cri.searchType ne ''}">
	           			<tr tr style="text-align: center; color: #555555;" >
	           				<td colspan="6"> 결과가 없습니다. </td>
	           			</tr>
           			</c:if>
           		</c:otherwise>
           		</c:choose>
             	</tbody>
			</table>
		</div>
		<c:if test="${not empty userInfo }">
		<div class="row" style="float:right; padding:15px;">
			<input type="button" id="qnaWriteBtn" value="글 쓰 기" onClick="location.href='/member/qna/qnaWrite';" class="btn waves-effect waves-light btn-primary btn-outline-primary"/>
		</div>
		</c:if>
		<br><br>

		</div>
		</div>
		<div class="col-xl-2 col-sm-12">
		</div>
		</div>
	<div class="row">
				<!-- 페이징 start -->
				<div id = "paging-div">
				<ul class="btn-group pagination">
					<c:if test="${pageMaker.prev }">

						<li><a href='<c:url value="/member/qna/qnaList${pageMaker.makeQuery(pageMaker.startPage-1)}"/>'>
							<span style="font-weight: bold;">&nbsp;[이전]&nbsp;</span></a></li><span class="col-md-1"></span>
					</c:if>
					<c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="pageNum">
						<c:if test="${pageNum eq pageMaker.cri.page}"><li><a href='<c:url value="/member/qna/qnaList${pageMaker.makeQuery(pageNum)}"/>'>
						<span id="pagingCur" style="background-color: #7971ea; display:inline-block; height: 30px; width: 30px; border-radius: 50%; font-weight: bold; color: white; padding : 2px;">&nbsp;${pageNum}&nbsp;</span></a></li><span class="col-md-1"></span></c:if>
						<c:if test="${pageNum ne pageMaker.cri.page}"><li><a href='<c:url value="/member/qna/qnaList${pageMaker.makeQuery(pageNum)}"/>'>

						<span>&nbsp;${pageNum}&nbsp;</span></a></li><span class="col-md-1">   </span></c:if>
						
					</c:forEach>
					<c:if test="${pageMaker.next && pageMaker.endPage >0 }">

						<li><a href='<c:url value="/member/qna/qnaList${pageMaker.makeQuery(pageMaker.endPage+1)}"/>'>

							<span style="font-weight: bold;">&nbsp;[다음]&nbsp;</span></a></li><span class="col-md-1"></span>
					</c:if>
				</ul>
				</div>
				<!-- 페이징 end -->
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

	function searchTypeChange(){
		var itemSelect = document.getElementById("searchType");
		var itemId = itemSelect.options[itemSelect.selectedIndex].value;
		
		if(itemId == 'c'){
			$("#qnaCategory").attr("style","display:unset");
			$("#searchWord").attr("style","display:none");
		}else{
			$("#qnaCategory").attr("style","display:none");
			$("#searchWord").attr("style","display:unset");
		}
	}
	
	
	$(document).on("click", "#searchBtn", function(){
		var searchTypeSelect = $('#searchType option:selected').val();
		var searchWordInput = $('#searchWord').val();
		var qnaCategorySelect = $('#qnaCategory option:selected').val();
		console.log("type :"+searchTypeSelect);
		console.log("word :"+searchWordInput);
		console.log("qnaType: " +qnaCategorySelect);
		if(searchTypeSelect == null || searchTypeSelect == ""){
			action_popup.alert("검색 조건 선택해주세요.");
		}else{
			if(searchTypeSelect == 'c'){
				if(qnaCategorySelect == null || qnaCategorySelect == ""){
					action_popup.alert("카테고리를 선택해주세요.");
				}else{
					document.qnaSearch.submit();
				}
			}else{
				if(searchWordInput == "") {
					action_popup.alert("검색어를 입력해주세요.");
				}else{
					document.qnaSearch.submit();
				}
			}
		}
	});
	
	$(document).on("click", "#searchMyQnaBtn", function(){
		var myId = $('#hiddenId').val();
		$('#searchType option:selected').val("i");
		$('#searchWord').val(myId);
		document.qnaSearch.submit();
	});
	
	
	$(".modal_close").on("click", function() {
		action_popup.close(this);
	});
	//사용 예시 **************************


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

		searchTypeChange();

	});


	$(window).resize(function() {
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

	</script>
</body>

</html>
