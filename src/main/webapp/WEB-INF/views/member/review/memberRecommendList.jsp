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



.pcoded[theme-layout="vertical"][vertical-placement="left"][vertical-nav-type="expanded"][vertical-effect="shrink"] .pcoded-content
	{
	margin-left: 0;
}

   .tabs-left, .tabs-left-content, .tabs-right, .tabs-right-content {
    display: table-cell;
	}
	
	img{
	border-radius: 15px;
	}
	.reviewContent{
	border:5px;
	}
	textarea {
	border: none;
	outline:none;
	font-size: 1em;
	background-color:transparent;
	}
	#like-o, #like {
	cursor: pointer;
	}
	.profile img{ 
	height: 60px;
	  max-width: 60px;
	  min-width: 60px;
	  display: block;
	border-radius: 30px; 
	}
	.imgIdDate {
	margin-bottom :20px;
	}
	.reviewContent textarea {
	width:100%; 
	resize: none; 
	overflow-y: hidden;
	}
	.wrap textarea {
      width: 100%;
      height:auto;
      resize: none;
      overflow-y: hidden; /* prevents scroll bar flash */
      padding: 1.1em; /* prevents text jump on Enter keypress */
      padding-bottom: 0.2em;
      line-height: 1.6;
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
																<div class="sub-title" style="margin-bottom: 0px;">Menu</div>
																<!-- Nav tabs -->
																<ul id="menuBar" class="nav nav-tabs md-tabs"
																	role="tablist">
																	<li class="nav-item"><a class="nav-link active"
																		href="/member/mem/userInfo" role="tab">내 정보</a>
																		<div class="slide"></div></li>
																	<li class="nav-item"><a class="nav-link "
																		href="/member/mem/memRentList" role="tab">대역 내역</a>
																		<div class="slide"></div></li>
																	<li class="nav-item"><a class="nav-link"
																		href="/member/mem/memBuyList" role="tab">구매 내역</a>
																		<div class="slide"></div></li>
																	<li class="nav-item"><a class="nav-link"
																		href="#MessageBox" role="tab">메시지 함</a>
																		<div class="slide"></div></li>
																	<li class="nav-item"><a class="nav-link"
																		href="/member/rec/recommendList" role="tab">내 리뷰</a>
																		<div class="slide"></div></li>
																</ul>
															</div>
														</div>
														<!-- Row end -->
													</div>
												</div>
											</div>
											<!-- 메뉴바 끝 -->
											<!--  sale analytics start -->
											<div class="pcoded-inner-content">
												<div class="main-body">
													<div class="page-wrapper">
														<div class="page-body">

															<form id="sort" name="recSearch" method="post"
																action="/member/rec/recommendList">

																<select id="searchType" name="searchType">
																	<option value="">검색조건</option>
																	<option value="t"
																		<c:if test="${pageMaker.cri.searchType eq 't'}"> selected </c:if>>회원ID</option>
																	<option value="c"
																		<c:if test="${pageMaker.cri.searchType eq 'c'}"> selected </c:if>>제품ID</option>
																	<option value="w"
																		<c:if test="${pageMaker.cri.searchType eq 'w'}"> selected </c:if>>제품명</option>
																</select>&nbsp; <input type="text" id="keyword" name="keyword"
																	value="${pageMaker.cri.keyword}"
																	placeholder="검색어를 입력하세요" />&nbsp;

																<button id="button"
																	class="btn waves-effect waves-light btn-primary btn-outline-primary">검색</button>
																&nbsp; <input type="button" id="button"
																	class="btn waves-effect waves-light btn-primary btn-outline-primary"
																	value="전체보기"
																	onClick="location.href='/admin/rec/recList';">&nbsp;
															</form>
															<div>
																<br>
															</div>
															<!-- 리스트 나오는 부분 시작 -->
															<div class="container">
																<div class="row mb-5">
																	<div class="col-md-12 order-2">


																		<c:forEach var="recVO" items="${recommendList}"
																			begin="0" end="10" step="1" varStatus="status">
																			<hr>
																			<div class="row imgIdDate" name="imgIdDate">

																				<div class="col-2 profile" align="center">
																					<img
																						src=/resources/Images/member/${recVO.p_mainimg}
																						alt="${recVO.p_mainimg}"
																						title="${recVO.p_mainimg}"
																						class="img-fluid img-circle">
																				</div>
																				<div class="col-4">
																					<div>${recVO.p_name}</div>
																					<div>${recVO.v_date}</div>
																					<c:choose>
																						<c:when test="${recVO.v_like eq 'none'}">
																							<a title="noselected"><img
																								src=/resources/Images/product/like1.jpg
																								style="cursor: auto;" width="50" height="50"
																								alt="likes" /></a>
																						</c:when>
																						<c:when test="${recVO.v_like ne 'none'}">
																							<a title="likes"><img
																								src=/resources/Images/product/like2.jpg
																								style="cursor: auto;" width="50" height="50"
																								alt="noselected" /></a>
																						</c:when>
																					</c:choose>
																				</div>
																				<div class="col-6">
																					<button type="button" class="btn btn-primary"
																						data-toggle="modal" data-target="#reviewModal">수정하기</button>
																					<form method="post" name="reviewDeleteForm"
																						action="/member/rec/recommendDelete/${recVO.v_mid}/${recVO.v_pid}">
																						<input type="button" value="삭제하기"
																							class="btn btn-primary" onclick='reviewDelete()'>
																					</form>
																				</div>
																			</div>

																			<div class="row" name="content">
																				<div class="col-12 reviewContent" id="reviewContent">
																					<textarea disabled>${recVO.v_content}</textarea>
																				</div>
																			</div>

																		</c:forEach>
																		<!-- 페이징 start -->
																		<div id="paging-div">
																			<ul class="btn-group pagination">
																				<c:if test="${pageMaker.prev }">
																					<li><a
																						href='<c:url value="/member/rec/recommendList${pageMaker.makeQuery(pageMaker.startPage-1)}"/>'>
																							<span style="font-weight: bold;">&nbsp;[이전]&nbsp;</span>
																					</a></li>
																					<span class="col-md-1"></span>
																				</c:if>
																				<c:forEach begin="${pageMaker.startPage }"
																					end="${pageMaker.endPage }" var="pageNum">
																					<c:if test="${pageNum eq pageMaker.cri.page}">
																						<li><a
																							href='<c:url value="/member/rec/recommendList${pageMaker.makeQuery(pageNum)}"/>'>
																								<span id="pagingCur"
																								style="background-color: #7971ea; display: inline-block; height: 30px; width: 30px; border-radius: 50%; font-weight: bold; color: white; padding: 5px;">&nbsp;${pageNum}&nbsp;</span>
																						</a></li>
																						<span class="col-md-1"></span>
																					</c:if>
																					<c:if test="${pageNum ne pageMaker.cri.page}">
																						<li><a
																							href='<c:url value="/member/rec/recommendList${pageMaker.makeQuery(pageNum)}"/>'>
																								<span>&nbsp;${pageNum}&nbsp;</span>
																						</a></li>
																						<span class="col-md-1"> </span>
																					</c:if>

																				</c:forEach>
																				<c:if
																					test="${pageMaker.next && pageMaker.endPage >0 }">
																					<li><a
																						href='<c:url value="/member/rec/recommendList${pageMaker.makeQuery(pageMaker.endPage+1)}"/>'>
																							<span style="font-weight: bold;">&nbsp;[다음]&nbsp;</span>
																					</a></li>
																					<span class="col-md-1"></span>
																				</c:if>
																			</ul>
																		</div>
																		<!-- 페이징 end -->
																		<!-- 리뷰 수정모달 -->
																		<div class="modal fade" id="reviewModal">
																			<div class="modal-dialog modal-lg">
																				<div class="modal-content">

																					<!-- Modal Header -->
																					<div class="modal-header">
																						<h4 class="modal-title">리뷰수정</h4>
																						<button type="button" class="close"
																							data-dismiss="modal">&times;</button>
																					</div>

																					<!-- Modal body -->
																					<div class="modal-body">
																						<div class="container">
																							<div class="row mb-5">
																								<div class="col-md-12 order-2">


																									<form name="reviewUpdate" method="post"
																										action="/member/rec/recommendUpdate">
																										<div class="row imgIdDate" name="imgIdDate">

																											<div class="col-2 profile" align="center">
																												<img
																													src=/resources/Images/member/${recommendList.p_mainimg}
																													alt="${recommendList.p_mainimg}"
																													title="${recommendList.p_mainimg}"
																													class="img-fluid img-circle">
																											</div>
																											<div class="col-10">
																												<input type="hidden" name="v_mid"
																													value="${recommendList.v_mid}" /> <input
																													type="hidden" name="v_pid"
																													value="${recommendList.v_pid}" /> <input
																													type="hidden" name="v_like" value="none"
																													id="updatereviewLike">
																												<div>${recommendList.v_mid}</div>
																												<div class="col-lg-6 sm-6"
																													id="recommendation">
																													<c:if test="${recommendList.v_like eq 'none'}">
																														<a title="noselected"><img
																															src=/resources/Images/product/like1.jpg
																															id="like-o" class="like-o" width="50"
																															height="50" alt="likes" onclick='like()' /></a>
																													</c:if>
																													<c:if test="${recommendList.v_like ne 'none'}">
																														<a title="likes"><img
																															src=/resources/Images/product/like2.jpg
																															id="like" class="like" width="50"
																															height="50" alt="noselected"
																															onclick='likeCancel()' /></a>
																													</c:if>
																												</div>

																											</div>

																										</div>

																										<div class="row" name="content">
																											<div class="col-12 reviewContent">
																												<br>
																												<textarea class="reviewContent" rows="4"
																													cols="50" name="v_content">${recommendList.v_content}</textarea>
																											</div>
																										</div>
																								</div>
																							</div>
																						</div>
																					</div>

																					<!-- Modal footer -->
																					<div class="modal-footer">
																						<input type="submit" class="btn btn-secondary"
																							value="확인" />
																						<button type="button" class="btn btn-secondary"
																							data-dismiss="modal">닫기</button>
																					</div>
																					</form>
																				</div>
																			</div>
																		</div>
																		<!-- 여기까지 -->




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
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js">
	</script>
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
	
//review에서 추천관련부분 #reviewLike는 리뷰추가할 때 추천
function like(){
	 if ($('#like-o').is(".like-o") === true){
		 $('.like-o').attr('src','/resources/Images/product/like2.jpg'); 
     	 $('.like-o').attr('class','like'); 
         $('#updatereviewLike').attr('value','like'); 
         $('#reviewLike').attr('value','like'); 
     	 action_popup.alert('추천하셨습니다');
	 } else {
		 $('.like').attr('src','/resources/Images/product/like1.jpg');
		 $('.like').attr('class','like-o');  
		 $('#updatereviewLike').attr('value','none'); 
		 $('#reviewLike').attr('value','none'); 
		 action_popup.alert("취소하셨습니다");
	 } 
}
function likeCancel(){
	 if ($('#like').is(".like") === true){
		 $('.like').attr('src','/resources/Images/product/like1.jpg');
		 $('.like').attr('class','like-o');  
		 $('#updatereviewLike').attr('value','none'); 
		 $('#reviewLike').attr('value','none');
		 action_popup.alert("취소하셨습니다");
		
		
	 } else {
		 $('.like-o').attr('src','/resources/Images/product/like2.jpg'); 
    	 $('.like-o').attr('class','like'); 
        $('#updatereviewLike').attr('value','like'); 
        $('#reviewLike').attr('value','like');
    	 action_popup.alert('추천하셨습니다');
		
	 } 
}
//리뷰 삭제
function reviewDelete() {
	action_popup.confirm('리뷰를 삭제하시겠습니까?', function (res) {
		if (res) {			
			document.reviewDeleteForm.submit();
	
		 } 
	})	
}
	
	
	
	
	
	
	//모달	
		$(function() {

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

		});

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