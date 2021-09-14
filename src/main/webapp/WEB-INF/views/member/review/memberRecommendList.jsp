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
	max-width: 50%;
	min-width: 77px;
	display: block;
	border-radius: 10px; 
	margin: auto;
	}
	.imgIdDate {
	margin-bottom :20px;
	}
	.reviewContent textarea {
	width:90%; 
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
   #paging-div{
    display: flex;
	justify-content: center;
   }
   #paging-div li{
       margin: 10px;
   } 
   .page-wrapper {
       background-color: white;
       margin-top: 50px;
   }
   .centered {  
    text-align: center;
     margin-bottom: 20px;
    
    width: auto;
    display: flex;
    justify-content: center;
	}
	.nav li {
    width: 50%;
	}
	#active {
    color: #495057;
    background-color: #f3f3f3;
    border-color: #dee2e6 #dee2e6 #fff;
	}
    
    @media (max-width:575px) {
    #editButton {
        font-size: 0.8em;
    }
    #buttonDiv {
    padding: inherit;
    }
    .profile {
    margin:auto;
    padding: inherit;
    }
    .centered {
    width: auto;
    margin-left: -17px;
    justify-content: inherit;
	}	
	.nav li {
    width: 50%;
	}
    
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

			<div class="pcoded-main-container" style="background: #f3f3f3">
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
																	<li class="nav-item"><a class="nav-link"
																		href="/member/mem/userInfo" role="tab">내 정보</a>
																		<div class="slide"></div></li>
																	<li class="nav-item"><a class="nav-link "
																		href="/member/mem/memRentList" role="tab">대여 내역</a>
																		<div class="slide"></div></li>
																	<li class="nav-item"><a class="nav-link"
																		href="/member/mem/memBuyList" role="tab">구매 내역</a>
																		<div class="slide"></div></li>
																	<li class="nav-item"><a class="nav-link"
																		href="/member/mem/messageList" role="tab">메시지 함</a>
																		<div class="slide"></div></li>
																	<li class="nav-item"><a class="nav-link active"
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
											<div class="pcoded-inner-content col-xl-10" id="recommendListBox">
												<div class="main-body">
													<div class="page-wrapper">
														<div class="page-body">
										<c:choose>				
										<c:when test="${recommendList[0].v_id eq null}"><h1>등록된 추천글이 없어요</h1></c:when>
										<c:when test="${recommendList[0].v_id ne null}">
															</c:when></c:choose>
															<div>
																<br>
															</div>
															<!-- 리스트 나오는 부분 시작 -->
															<div class="container" id="recList">
																<div class="row mb-5">
																	<div class="col-md-12 order-2" >
 <ul class="nav nav-tabs centered">
  <li class="nav-item">
    <a class="nav-link" id="active" href="/member/rec/recommendList">내 리뷰</a>
  </li>
  <li class="nav-item">
    <a class="nav-link" href="/member/rec/canRecommendList" >작성가능리뷰</a>
  </li>
 
</ul>

																		<c:forEach var="recVO" items="${recommendList}"
																			begin="0" end="10" step="1" varStatus="status">
																			
																			<div class="row imgIdDate" name="imgIdDate" >

																				<div class="col-3 profile">
																					<img
																						src=/resources/Images/product/${recVO.p_mainimg}
																						alt="${recVO.p_mainimg}"
																						title="${recVO.p_mainimg}"
																						class="img-fluid img-circle">
																				</div>
																				<div class="col-6 namedate" id="namedate" align="left">					
																					<div style="text-align:left;">${recVO.p_name}</div>
																					<div style="text-align:left;">${recVO.v_date}</div>	
																					<div style="text-align:left;">
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
																				</div>
																				<div class="col-3" id="buttonDiv">
																					<button type="button" id="editButton" class="btn btn-primary" onclick='recommendEdit(${recVO.v_id})'>편집하기</button>																
																				</div>
																			</div>
<hr>
																			<div class="row" name="content">
																				<div class="col-12 reviewContent" id="reviewContent">
																					<textarea rows="3" cols="30" disabled>${recVO.v_content}</textarea> <hr style="border: solid 1px black;">
																			</div>
																			</div>
																		</c:forEach>
																		<!-- 페이징 start -->
																		<div id="paging-div">
																			<ul class="btn-group pagination">
																				<c:if test="${pageMaker.prev }">
																					<li><a
																						href='<c:url value="/member/rec/recommendList${pageMaker.makeQuery(pageMaker.startPage-1)}#recList"/>'>
																							<span style="font-weight: bold;">&nbsp;[이전]&nbsp;</span>
																					</a></li>
																					
																				</c:if>
																				<c:forEach begin="${pageMaker.startPage }"
																					end="${pageMaker.endPage }" var="pageNum">
																					<c:if test="${pageNum eq pageMaker.cri.page}">
																						<li><a
																							href='<c:url value="/member/rec/recommendList${pageMaker.makeQuery(pageNum)}#recList"/>'>
																								<span id="pagingCur"
																								style="background-color: #7971ea; display: inline-block; height: 30px; width: 30px; border-radius: 50%; font-weight: bold; color: white; padding: 5px;">&nbsp;${pageNum}&nbsp;</span>
																						</a></li>
																						
																					</c:if>
																					<c:if test="${pageNum ne pageMaker.cri.page}"> 
																						<li><a
																							href='<c:url value="/member/rec/recommendList${pageMaker.makeQuery(pageNum)}#recList"/>'>
																								<span>&nbsp;${pageNum}&nbsp;</span>
																						</a></li>
																						
																					</c:if>

																				</c:forEach>
																				<c:if
																					test="${pageMaker.next && pageMaker.endPage >0 }">
																					<li><a
																						href='<c:url value="/member/rec/recommendList${pageMaker.makeQuery(pageMaker.endPage+1)}#recList"/>'>
																							<span style="font-weight: bold;">&nbsp;[다음]&nbsp;</span>
																					</a></li>
																					
																				</c:if>
																			</ul>
																		</div>
																		<!-- 페이징 end -->
																		




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
			$('.namedate').css('text-align' , "left");
		} else {
			$('#menuBar').attr('class' , "nav nav-tabs md-tabs");
			$('.namedate').css('text-align' , "right");
		}
	});


	$(window).resize(function() {
		var size =$(window)[0].innerWidth;
		if(size > 1200) {
			$('#menuBar').attr('class' , "nav nav-tabs md-tabs tabs-left b-none");
			$('.namedate').css('text-align' , "left");
		} else {
			$('#menuBar').attr('class' , "nav nav-tabs md-tabs");
			$('.namedate').css('text-align' , "right");
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
function recommendDelete() {
	action_popup.confirm('추천글을 삭제하시겠습니까?', function (res) {
		if (res) {			
			document.recommendDeleteForm.submit();
	
		 } 
	})	
}
//리뷰 수정폼으로
function recommendEdit(v_id) {
	location.href='/member/rec/UpdateForm/'+v_id;
}
	
	
	
	
	
	
	//모달	
		$(function() {
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