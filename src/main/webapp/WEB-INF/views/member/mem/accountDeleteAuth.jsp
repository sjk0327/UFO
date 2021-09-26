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
<title>회원 탈퇴 - UF&#38;O</title>
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

.text-center {
	width: 900px;
	align: center;
}

.auth-box card {
	width: 650px;
	align: center;
}

.card {
	width: 800px;
}

.card-block {
	width: 1000px;
	align: center;
}

.login-block .auth-box {
	max-width: 2500px;
}
</style>
<script src="https://ajax.googleapis .com /ajax/libs/jquery/3 .5 .1 /jquery .min .js "></script >

</head>
<body themebg-pattern="theme1">
	<section class="login-block">
		<!-- Container-fluid starts -->
		<div class="container">
			<div class="row">
				<div class="col-sm-12">
					<!-- Authentication card start -->
						<form:form class="form-material" name="delete2"
						action="/member/mem/userDelete/${userInfo.m_id }" method="post"
						enctype="multipart/form-data" modelAttribute="userVO">
						
					
						<form:hidden path="m_id" value="${userInfo.m_id }"
							class="form-control form-control-center form-control-round form-control-bold" />

						<div class="auth-box card">
							<div class="card-block1">
								<br>
								<div class="row m-b-20">
									<div class="col-md-12">
										<h4 class="text">
											<strong>&nbsp;&nbsp;회원탈퇴에 앞서 유의사항 및 안내를 <br>&nbsp;&nbsp;반드시
												읽고 진행해 주세요.
											</strong>
										</h4>
									</div>
								</div>
								<br>


								<form name=Join action="/" onSubmit="return CheckForm(this)">
									<!-- 아이디 재사용 금지 -->
									<div class="card">
										<div class="card-block">

											<h5>UFO 아이디는 재사용 및 복구 불가 안내</h5>
											<br> 회원 탈퇴 진행 시 본인을 포함한 타인 모두 <br> 아이디 재사용이나 복구가
											불가능합니다.<br> 신중히 선택하신 후 결정해 주세요.<br> <br> <input
												type="checkbox" name="chk1"
												id="chk1" value="약관동의" /> 약관동의


										</div>
									</div>


									<!-- 내정보 및 개인형 서비스 이용기록 삭제 안내  -->
									<div class="card">
										<div class="card-block">

											<h5>내 정보 및 개인형 서비스 이용 삭제 안내</h5>
											<br> 내 정보및 개인형 서비스 이용 기록이 모두 삭제되며,<br> 삭제된 데이터는
											복구되지 않습니다.<br> 신중히 선택하신 후 결정해 주세요.<br> <br> <input
												type="checkbox" name="chk2"
												id="chk2" value="약관동의" /> 약관동의
										</div>
									</div>

									<!-- 내정보 및 개인형 서비스 이용기록 삭제 안내  -->
									<div class="card">
										<div class="card-block">

											<h5>게시판형 서비스에 등록한 게시글 삭제 불가 안내</h5>
											<br> 삭제를 원하는 게시글이 있다면 반드시 회원 탈퇴 전 <br> 비공개 처리하거나
											삭제하시기 바랍니다.<br> 탈퇴 후에는 회원정보가 삭제되어<br> 본인 여부를 확인할 수
											있는 방법이 없어,<br> 게시글을 임의로 삭제해드릴 수 없습니다.<br> <br>
											<input type="checkbox" name="chk3"
												id="chk3" value="약관동의" /> 약관동의
										</div>
									</div>
								</form>

								<div class="form-group form-primary form-static-label">
									<input type="password" id="passinput" name="passinput"
										required="required" placeholder="&nbsp;&nbsp;현재 비밀번호를 입력하세요"
										class="form-control" /> <span class="form-bar"></span> <label
										class="float-label">&nbsp;&nbsp;현재 비밀번호</label>
								</div>


								<div class="row m-t-25 text-left">
									<div class="col-12"></div>
								</div>



								<!-- 버튼 -->
								<div style="float: right; padding-bottom: 100px">
									<input type="button" id="deleteConfirm" value="회원탈퇴"
										class="btn waves-effect waves-light btn-primary btn-outline-primary">
								</div>
					

					<div class="row">
						<div class="col-md-10">
							<p class="text-inverse text-left m-b-0"></p>
							<p class="text-inverse text-left">
								<a href="/"><b>&nbsp;&nbsp;처음으로</b></a>
						</div>

					</div>
				</div>
			</div>


</form:form>

		</div>
</div>
</div>


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
			$(document).on("click", "#deleteConfirm", function() {
				var passinput = $('#passinput').val();
				var chk1 = $('#chk1').is(":checked")
				var chk2 = $('#chk2').is(":checked")
				var chk3 = $('#chk3').is(":checked")
				if(chk1 == false || chk2 == false || chk3 == false){
					console.log(chk1 + " / " + chk2 + " / " + chk3);
					action_popup.alert("약관동의 해주세요.");
				}else if(passinput == ''){
					action_popup.alert("비밀번호를 확인해주세요.");
				}else{
					action_popup.confirm("탈퇴하시 겠습니까?", function(res) {
						if (res) {
							action_popup.alert("탈퇴 되었습니다.");
							document.delete2.submit();
						}
					});
				}
			});
			//사용 예시 **************************

			$(document).on("click", "#alert", function() {
				action_popup.alert("현재 비밀번호를 작성해주세요.");
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





	<%@ include file="/WEB-INF/views/adminFooter.jsp"%>
</body>
</html>