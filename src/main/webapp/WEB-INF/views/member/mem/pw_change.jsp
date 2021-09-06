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
<title>비밀번호 변경</title>
<%@ include file="/WEB-INF/views/adminHeader.jsp"%>

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
	width: 500px;
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

</style>


<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js">
</script>


</head>
<body themebg-pattern="theme1">
	
	<section class="login-block">
		<!-- Container-fluid starts -->
		<div class="container">
			<div class="row">
				<div class="col-sm-12">
					<!-- Authentication card start -->

					<form class="md-float-material form-material" name="mach"
						action="/member/mem/pw_change" method="post" >
						<div class="text-center">
							<a href="/"><img src="/resources/assets/images/logo.png" width="200px" height="90px" alt="logo.png"></a>
						</div>
						<div class="auth-box card">
							<div class="card-block">
								<div class="row m-b-20">
									<div class="col-md-12">
										<h3 class="text-center">비밀번호 변경</h3>
									</div>
								</div>
								<div class="form-group form-primary form-static-label">
									<input type="password" id="oldPwd" name="pwd" required="required" placeholder="현재 비밀번호를 입력하세요" class="form-control" />
									 <span class="form-bar"></span> <label class="float-label">현재 비밀번호</label>
								</div>
							
								<div class="row m-t-25 text-left">
									<div class="col-12"></div>
								</div>
								<hr/>
								<div class="form-group form-primary form-static-label">
									<input type="password" id="pw" name="pwd" required="required" placeholder="새로운 비밀번호를 입력하세요" class="form-control" onkeyup="check_pw()"/>
									 <span class="form-bar"></span> <label class="float-label">새로운 비밀번호</label>
									 <span id="check_pw1"></span>
								</div>
							
								<div class="row m-t-25 text-left">
									<div class="col-12"></div>
								</div>
								
								<div class="form-group form-primary form-static-label">
									<input type="password" id="pw_check" name="pwd" required="required" placeholder="새로운 비밀번호를 입력하세요" class="form-control" onkeyup="check_pw()"/>
									 <span class="form-bar"></span> <label class="float-label">새로운 비밀번호 확인</label>
									 <span id="check_pw2"></span>
								</div>
							
								<div class="row m-t-25 text-left">
									<div class="col-12"></div>
								</div>
								<div class="row m-t-30">
									<div class="col-md-12">
										<input type="button" id="confirm" value="확인" onclick="changePwd()"
											class="btn btn-primary btn-md btn-block waves-effect waves-light text-center m-b-20">
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
	
	
	
	
	
<script>
function changePwd(){
	if(passCheck){
		document.mach.submit();
	}else{
		action_popup.alert("정보들을 제대로 입력해주세요.");
	}
}

// 비밀번호 체크
var passCheck = false;
function check_pw(){
   var pw = document.getElementById('pw').value;
            
    if(pw.length == 0 || pw == ""){
    	document.getElementById('check_pw1').innerHTML = '필수 정보입니다.';
    	document.getElementById('check_pw1').style.color='red';
    	passCheck = false;
    }else if(pw.length < 8 || pw.length > 17){
    	document.getElementById('check_pw1').innerHTML = '8~16자 영문 대 소문자, 숫자, 특수문자를 사용하세요.';
    	document.getElementById('check_pw1').style.color='red';
    	passCheck = false;
    }else{
    	document.getElementById('check_pw1').innerHTML = '';
    	
    	if(document.getElementById('pw').value !='' && document.getElementById('pw_check').value!=''){
            if(document.getElementById('pw').value==document.getElementById('pw_check').value){
                document.getElementById('check_pw2').innerHTML='비밀번호가 일치합니다.'
                document.getElementById('check_pw2').style.color='blue';
                passCheck = true;
            }
            else{
                document.getElementById('check_pw2').innerHTML='비밀번호가 일치하지 않습니다.';
                document.getElementById('check_pw2').style.color='red';
                passCheck = false;
            }
        }
    }
    
};



$(function() {
	$(document).ready(function() {
		var count = ${count};
		if(count == 2){
			action_popup.alert("비밀번호가 틀렸습니다.");
			document.getElementById('oldPwd').focus();
		}else if(count == 3){
			action_popup.confirmEdit("비밀번호가 변경되었습니다.", function(res) {
				if (res) {
					window.open("about:blank", "_self").close();
				} 
			});
		}
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
	function authKeyCompared(){
		var inputCode = $("#checkKey").val();
		var result = $("#check_authKey");
		
		if(inputCode == authKey ){
			result.text("인증번호가 일치합니다.");
			result.css("color","blue");
			emailCheck = true;
		} else{
			result.text("인증번호를 다시 확인해주세요.");
			result.css("color","red");
			emailCheck = false;
		}
	};
		 
		 
		 
		 
		 
		 
		 
	</script>

</body>
</html>