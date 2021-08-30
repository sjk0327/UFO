<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.net.URLEncoder"%>
<%@ page import="java.security.SecureRandom"%>
<%@ page import="java.math.BigInteger"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>인증번호 확인</title>
<%@ include file="/WEB-INF/views/adminHeader.jsp"%>

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

#menuBar {
	width: 400px;
	align: "center";
}

.card {
	width: 450px;
}
<
script

	
src
="https
:
//ajax
.googleapis
.com
/ajax/libs/jquery/3
.5
.1
/jquery
.min
.js
"
>
</
script
>
</style>




</head>
<body themebg-pattern="theme1">

	<section class="login-block">
		<!-- Container-fluid starts -->
		<div class="container">
			<div class="row">
				<div class="col-sm-12">
					<!-- Authentication card start -->

					<form class="md-float-material form-material" name="mach"
						action="/member/mem/id_set" method="post">
						<div class="text-center">
							<img src="resources/assets/images/logo.png" alt="logo.png">
						</div>
						<div class="auth-box card">
							<div class="card-block">
								<div class="row m-b-20">
									<!--  메뉴바 시작 -->
									<div class="card-block">
										<!-- Row start -->
										<div class="row">
											<div class="col-sm-12">
												<!-- Nav tabs -->
												<ul id="menuBar" class="nav nav-tabs md-tabs" role="tablist">
													<li class="nav-item"><a class="nav-link active"
														href="/member/mem/id_auth" role="tab">아이디 찾기</a>
														<div class="slide"></div></li>
													<li class="nav-item"><a class="nav-link "
														href="/member/mem/pw_auth" role="tab">비밀번호 찾기</a>
														<div class="slide"></div></li>
												</ul>
											</div>
										</div>
										<!-- Row end -->
									</div>
									<!-- 메뉴바 끝 -->





									<div class="col-md-12">
										<h3 class="text-center">인증번호 확인</h3>
									</div>
								</div>
								<input type="hidden" name="num" value="${num }">

								<div class="form-group form-primary">
									<input id="text" required="required" type="text"
										name="email_injeung" placeholder="인증번호를 입력하세요"
										class="form-control" /> <span class="form-bar"></span> <label
										class="float-label"></label>
								</div>

								<div class="row m-t-25 text-left">
									<div class="col-12"></div>
								</div>
								<div class="row m-t-30">
									<div class="col-md-12">
										<input type="submit" id="confirm" value="확인"
											class="btn btn-primary btn-md btn-block waves-effect waves-light text-center m-b-20">
									</div>
								</div>
								<hr />
								<div class="row">
									<div class="col-md-10">
										<p class="text-inverse text-left m-b-0"></p>
										<p class="text-inverse text-left">
											<a href="/"><b>처음으로</b></a>
										</p>
										<p class="text-inverse text-left">
											<a href="/member/mem/memJoin"><b>회원가입</b></a>
										</p>
										<p class="text-inverse text-left">
											<a href="/login"><b>로그인</b></a>
										</p>
									</div>

									<div class="col-md-2">
										<img src="resources/assets/images/auth/Logo-small-bottom.png"
											alt="small-logo.png">
									</div>
								</div>
							</div>
						</div>
					</form>
					<!-- end of form -->
				</div>
				<!-- end of col-sm-12 -->
			</div>
			<!-- end of row -->
		</div>
		<!-- end of container-fluid -->
	</section>





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





	<script>
		$(function() {
			//사용 예시 **************************

			$(document).on("click", "#confirm", function() {
				action_popup.confirm("확인 되었습니다.", function(res) {
					if (res) {
						action_popup.alert("발송 되었습니다.");
						document.mach.submit();
					} else {
						action_popup.alert("발송에 실패하였습니다.");
					}
				})
			});

			$(document).on("click", "#alert", function() {
				action_popup.alert("인증번호를 이메일로 발송 했습니다");
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

		//인증 번호 확인
		function authKeyCompared() {
			var inputCode = $("#checkKey").val();
			var result = $("#check_authKey");

			if (inputCode == authKey) {
				result.text("인증번호가 일치합니다.");
				result.css("color", "blue");
				emailCheck = true;
			} else {
				result.text("인증번호를 다시 확인해주세요.");
				result.css("color", "red");
				emailCheck = false;
			}
		};
	</script>

	<%@ include file="/WEB-INF/views/adminFooter.jsp"%>
</body>
</html>