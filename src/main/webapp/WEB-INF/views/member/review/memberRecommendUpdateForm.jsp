<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html lang="en">

<head>
<title>내 리뷰 수정 페이지 - UF&#38;O</title>
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
	line-height: inherit;
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
	min-width: 100px;
	display: block;
	border-radius: 10px; 
	max-width: 50%;
	}
	.imgIdDate {
	margin-bottom :20px;
	}
	.recommendContent textarea {
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
    
    .page-wrapper {
       background-color: white;
       margin-top: 50px;
   }
    
    @media (max-width:575px) {   
    .profile {
    margin:auto;
    padding: inherit;
    }
    #nameLike{
    text-align:left;
    }
    .modal {
    width: 350px;
    }
    .btn.btn-primary{
    font-size: 10pt;
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
																		href="/member/mem/memRentList" role="tab">대여 내역</a>
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
											<div class="pcoded-inner-content col-xl-10">
												<div class="main-body">
													<div class="page-wrapper">
														<div class="page-body">
															<div class="container">
																	<form name="recommendUpdateForm" id="recommendDeleteForm" method="post"
																		action="/member/rec/recommendUpdate">
																		<div class="row imgIdDate" name="imgIdDate">

																			<div class="col-5 profile" align="center">
																				<img
																					src=/resources/Images/product/${oneRecommend.p_mainimg}
																					alt="${oneRecommend.p_mainimg}"
																					title="${oneRecommend.p_mainimg}"
																					class="img-fluid img-circle" style="cursor:pointer;" onclick='moveProduct()'>
																			</div>
																			<div class="col-7" id="nameLike">
																				<input type="hidden" name="v_id"
																					value="${oneRecommend.v_id}" /> 
																			    <input type="hidden" name="beforeUrl"
																			    	value="${beforeUrl}"/>
																				
																				<div style="color: black;">${oneRecommend.p_name}</div>	
																				<div>												
																					<c:if test="${oneRecommend.v_like eq 'none'}">
																						<a title="noselected"><img
																							src=/resources/Images/product/like1.jpg
																							id="like-o" class="like-o" width="50" height="50"
																							alt="likes" onclick='like()' /></a><input
																					type="hidden" name="v_like" value="none"
																					id="updatereviewLike">
																					</c:if>
																					<c:if test="${oneRecommend.v_like ne 'none'}">
																						<a title="likes"><img
																							src=/resources/Images/product/like2.jpg id="like"
																							class="like" width="50" height="50"
																							alt="noselected" onclick='likeCancel()' /></a><input
																					type="hidden" name="v_like" value="like"
																					id="updatereviewLike">
																					</c:if>
																				</div>	

																			</div>
																		</div>



																		<div class="row" name="content">
																			
																			<div class="col-12 recommendContent">
																				<br>
																				<textarea class="recommendContent" rows="3" cols="30" id="Recommendcontent" autofocus 
																				  required="required" placeholder="100글자 내로 작성하세요." maxlength="100" name="v_content" >${oneRecommend.v_content}</textarea>
																			</div>
																		</div>
																		<div style="text-align:right">
																		<input type="button" value="수정"
																			class="btn btn-primary" onclick='mySubmit(1);'>
																		<input type="button" value="삭제" class="btn btn-primary" formaction="/member/rec/recommendDelete"
																			onclick='mySubmit(2);'>
																		<button class="btn btn-primary"
																			onclick='history.back();'>뒤로가기</button>	
																			<hr style="border: solid 1px black;">												
																		</div>	
																	</form>
																	
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
			$('#nameLike').css('text-align' , "left");
		} else {
			$('#menuBar').attr('class' , "nav nav-tabs md-tabs");
			
		}
	});


	$(window).resize(function() {
		var size =$(window)[0].innerWidth;
		if(size > 1200) {
			$('#menuBar').attr('class' , "nav nav-tabs md-tabs tabs-left b-none");
			$('#nameLike').css('text-align' , "left");
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
 function moveProduct(){
	 location.href="/member/pro/productDetail/"+'${oneRecommend.v_pid}';
 }
//리뷰 삭제
 /* function recommendDelete() {
	
	
	
			$('#recommendDeleteForm').submit();
} 

//리뷰 업데이트
function recommendUpdate() {
	var text = document.getElementById('Recommendcontent').value
	if (text == '') {
		action_popup.alert('글을 잘성해주세요')
	} else {
	
	action_popup.confirm('수정하시겠습니까', function (res) {
		if (res) {			
			document.recommendUpdateForm.submit();
					
	
		 } 
	})	
	}
} */
function mySubmit(index) {
	if(index == 1) {
	document.recommendUpdateForm.action = '/member/rec/recommendUpdate';
	action_popup.confirm('수정하시겠습니까', function (res) {
		if (res) {			
			document.recommendUpdateForm.submit();					
		 } 
		})		
	}
	else if(index == 2) {
	document.recommendUpdateForm.action = '/member/rec/recommendDelete';
	action_popup.confirm('삭제하시겠습니까', function (res) {
		if (res) {			
			document.recommendUpdateForm.submit();					
		 } 
		})		
	} else {
		action_popup.alert('다시 확인 해주세요')
	}
	
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
	//textarea에 자동 포커스
	 /* window.onload = function(){
			 const Recommendcontent = document.getElementById('Recommendcontent');
			var content = "<c:out value='${oneRecommend.v_content}'/>";
			
			Recommendcontent.value = content;  
	if (content == '') {
		Recommendcontent.setAttribute('placeholder','입력란');
	}
}  */
	
		//리뷰글자수,줄 제한
		 $('#Recommendcontent').on('keyup',function() {
			var rows = $('#Recommendcontent').val().split('\n').length;
		    var maxRows = 3;
		    if( rows > maxRows){
		       action_popup.alert("3줄까지만 가능합니다");
		        modifiedText = $('#Recommendcontent').val().split("\n").slice(0, maxRows);
		        $('#Recommendcontent').val(modifiedText.join("\n"));
		    }
			
			
			
			if($(this).val().length > 100) {
			$(this).val($(this).val().substring(0,100));
			action_popup.alert("100자 이내로 작성해주세요.");
			
			}
			}); 
		

	</script>

	<%@ include file="/WEB-INF/views/customerFooter.jsp"%>
</body>

</html>