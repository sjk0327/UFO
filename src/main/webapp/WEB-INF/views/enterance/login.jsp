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
<title>로그인</title>
<%@ include file="/WEB-INF/views/adminHeader.jsp"%>

<style>
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

.mocdal {
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

<body themebg-pattern="theme1">
	<section class="login-block">
		<!-- Container-fluid starts -->
		<div class="container">
			<div class="row">
				<div class="col-sm-12">
					<!-- Authentication card start -->

					
						<div class="text-center">

							<a href="/"><img class="picture" src="/resources/Images/UFO_black.png"
										alt="로고" style="width: 200px; height:90px;"></a>

						</div>
						<div class="auth-box card">
							<div class="card-block">
							<br>
							<form class="md-float-material form-material"  name="loginForm" action="/login"	method="post" >
								<div class="row m-b-20">
									<div class="col-md-12">
										<h3 class="text-center">로그인</h3>
									</div>
								</div>
								<div class="form-group form-primary">
									<input type="text" id="idInput" name="m_id" class="form-control" onkeyup="if(window.event.keyCode==13){inputEnter()}" 
									required="required" tabindex="1" />
									<span class="form-bar"></span> <label class="float-label">ID</label>
									<span id="id-checker"></span>
								</div>
								<div class="form-group form-primary">
									<input type="password" id="pwdInput" name="m_pw" class="form-control" onkeyup="if(window.event.keyCode==13){inputEnter()}"
										required="required" tabindex="2"/>
									<span class="form-bar"></span> <label class="float-label">Password</label>
									<span id="pwd-checker"></span>
								</div>


								<div class="row m-t-25 text-left">
									<div class="col-12"></div>
								</div>
								<div class="col-12">
									<div class="forgot-phone text-right f-right">
										<a href="/member/mem/pw_auth" class="text-right f-w-600"> 비밀번호를 잊어버렸나요?</a>
									</div>
								</div>


								<div class="row m-t-30">
									<div class="col-md-12">
										<input type="button" value="로그인" onclick="loginCheck()" tabindex="3"
											class="btn btn-primary btn-md btn-block waves-effect waves-light text-center m-b-20">
									</div>
								</div>
								</form>


								<div class="row m-t-10">
									<div class="col-md-12">
										<a
											href="https://kauth.kakao.com/oauth/authorize?client_id=0ba57b2de5ae26e3cc0a370db0b7f98d&redirect_uri=http://www.ufo2021.link/kakaoLogin&response_type=code"><img
											src="/resources/img/kakaologin.png" width="100%"
											style="display: block; margin-left: auto; margin-right: auto;"></a>
									</div>
								</div>

								<div class="row m-t-10">
									<div class="col-md-12">
										<%
											String clientId = "AypoUOpXBiyt9Pz14zia";//애플리케이션 클라이언트 아이디값";
												String redirectURI = URLEncoder.encode("http://www.ufo2021.link/naverLogin", "UTF-8");
												SecureRandom random = new SecureRandom();
												String state = new BigInteger(130, random).toString();
												String apiURL = "https://nid.naver.com/oauth2.0/authorize?response_type=code";
												apiURL += "&client_id=" + clientId;
												apiURL += "&redirect_uri=" + redirectURI;
												apiURL += "&state=" + state;
												session.setAttribute("state", state);
										%>
										<a href="${url }"><img src="/resources/img/naverlogin.png"
											width="100%" height="80%"
											style="display: block; margin-left: auto; margin-right: auto;"></a>
									</div>
								</div>





								<hr />
								<div class="row">
									<div class="col-md-10">
										<p class="text-inverse text-left m-b-0"></p>
										<p class="text-inverse text-left">
											<a href="/member/mem/memJoin"><b>회원가입</b></a>
										</p>
									</div>
									<div class="col-md-10">
										<p class="text-inverse text-left m-b-0"></p>
										<p class="text-inverse text-left">
											<a href="/member/mem/id_auth" ><b>아이디 및 비밀번호  찾기</b></a>
										</p>
										
									</div>

								</div>
							</div>
						</div>
					<!-- end of form -->
				</div>
				<!-- end of col-sm-12 -->
			</div>
			<!-- end of row -->
		</div>
		<!-- end of container-fluid -->
	</section>

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
	
	<!-- confirmEdit 모달을 쓸 페이지에 추가 start-->
	<section class="mocdal modal-section type-confirmEdit">
		<div class="enroll_box">
			<p class="menu_msg"></p>
		</div>
		<div class="enroll_btn">
			<button class="btn pink_btn btn_ok">확인</button>
		</div>
	</section>
	<!-- confirmEdit 모달을 쓸 페이지에 추가 end-->

	<!-- alert 모달을 쓸 페이지에 추가 start-->
	<section class="mocdal modal-section type-alert">
		<div class="enroll_box">
			<p class="menu_msg"></p>
		</div>
		<div class="enroll_btn">
			<button class="btn pink_btn modal_close">확인</button>
		</div>
	</section>
	<!-- alert 모달을 쓸 페이지에 추가 end-->

	<%@ include file="/WEB-INF/views/adminFooter.jsp"%>
<script>
function inputEnter(){
	loginCheck();
}

function loginCheck(){
	var idInput = $('#idInput').val();
	var pwdInput = $('#pwdInput').val();
	console.log(idInput + " . " + pwdInput);
	
	if(idInput.length <= 0){
		document.getElementById('idInput').focus();
		document.getElementById('pwd-checker').innerHTML='';
		document.getElementById('id-checker').innerHTML='아이디를 입력해주세요.';
		document.getElementById('id-checker').style.color='red';
	}else if(pwdInput.length <= 0){
		document.getElementById('pwdInput').focus();
		document.getElementById('id-checker').innerHTML='';
		document.getElementById('pwd-checker').innerHTML='비밀번호를 입력해주세요.';
		document.getElementById('pwd-checker').style.color='red';
	}else{
		document.getElementById('id-checker').innerHTML='';
		document.getElementById('pwd-checker').innerHTML='';
		
		$.ajax({
			data : idInput +","+pwdInput,
			url : "/member/mem/loginCheck",
			type : "POST",
			dataType : "JSON",
			contentType: "application/json; charset=UTF-8",
			success : function(data) {
				if(data.check == 1){
					action_popup.confirmEdit("로그인에 성공하였습니다.", function(res) {
						if (res) {
							document.loginForm.submit();
						} 
					});
				} else if(data.check == 0){
					action_popup.alert("아이디 또는 비밀번호가 잘못 입력 되었습니다.");					
				}
			}
		});
	}
}


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
		$('.pink_btn').focus();
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
</body>

</html>



