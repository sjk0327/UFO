<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   

<!-- 8월 12일 성훈 수정 -->

<!DOCTYPE html>
<html>
<head>
    <title>회원가입</title>
     <%@ include file="/WEB-INF/views/adminHeader.jsp" %>
     <style>
	input[type=radio]{
		width: 0;
	  height: 0;
	  position: absolute;
	  left: -9999px;
	}
	input[type=radio] + label{
	  margin: 0;
	  padding: .75em 52px;
	  box-sizing: border-box;
	  position: relative;
	  display: inline-block;
	  border: solid 1px #DDD;
	  background-color: #FFF;
	  line-height: 140%;
	  text-align: center;
	  box-shadow: 0 0 0 rgba(255, 255, 255, 0);
	  transition: border-color .15s ease-out,  color .25s ease-out,  background-color .15s ease-out, box-shadow .15s ease-out;
	  cursor: pointer;
	}
	input[type=radio]:checked + label{
		background-color: #4B9DEA;
	  color: #FFF;
	  box-shadow: 0 0 10px rgba(102, 179, 251, 0.5);
	  border-color: #4B9DEA;
	  z-index: 1;
	}
	
	.form-group {
	    margin-bottom: 2.5em;
	}

    .filebox input[type="file"] { 
        position: absolute; 
        width: 1px; 
        height: 1px; 
        padding: 0;
        margin: -1px; 
        overflow: hidden; 
        clip:rect(0,0,0,0); 
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
select {
	color: #0764ff;
	width: 180px;
	padding: .8em .5em;
	border: 1px solid #7971ea;
	font-family: inherit;
	background: url('/resources/img/selectArrow.jpg') no-repeat 95% 50%;
	border-radius: 0px;
	-webkit-appearance: none;
	-moz-appearance: none;
	appearance: none;
}
select::-ms-expand {
	display: none;
}

@media screen and (max-width:575px) {
	select {
		color: #0764ff;
		width: 395px;
		padding: .8em .5em;
		border: 1px solid #7971ea;
		font-family: inherit;
		background: url('/resources/img/selectArrow.jpg') no-repeat 95% 50%;
		border-radius: 0px;
		-webkit-appearance: none;
		-moz-appearance: none;
		appearance: none;
	}
	select::-ms-expand {
		display: none;
	}
	.spaceNeed {
		padding: 0px 0px 30px 0px !important;
	}
	.col-sm-8{
		padding: 0px 0px 10px 0px !important;
	}
	.col-sm-9{
		padding: 0px 0px 10px 0px !important;
	}
	input[type=button]{
		float:right;
	}
}
     </style>
</head>

  <body themebg-pattern="theme1">
  <section class="login-block">
        <!-- Container-fluid starts -->
        <div class="container-fluid">
            <div class="row">
                <div class="col-sm-12">
                    <form name="signIn_form" class="md-float-material form-material" action="/member/mem/memJoin" method="post" enctype="multipart/form-data">
                        <div class="text-center">
                            <a href="/"><img class="picture" src="/resources/Images/UFO_black.png"
										alt="로고" style="width: 200px; height:90px;"></a>
                        </div>
                        <div class="auth-box card">
                            <div class="card-block">
                                <div class="row m-b-20">
                                    <div class="col-md-12">
                                        <h3 class="text-center txt-primary">회원 가입</h3>
                                    </div>
                                </div>
								<div class="form-group form-static-label filebox">
									<div class="m_imgPreview">
                                		<img src="/resources/img/defaultProfile.jpg" class="img-fluid img-circle" alt="프로필 이미지" style="object-fit: cover; display: block;margin-left: auto;margin-right: auto;">
                                	</div>
                                	<input class="upload-name" value="파일선택" disabled="disabled" style="margin-left:85px;"/> 
							        <label for="input-file" style="margin-bottom:0px;">업로드</label> 
							        <input type="file" name="uploadFile" id="input-file" class="upload-hidden" />
                                	<input type="hidden" name="m_img" value="defaultImage.jpg" required="required"/>
                            	</div>
								<div class="form-group form-primary form-static-label row" style="width: 410px; margin-left: 0px;">
									<div class="col-sm-9" style="padding:0px;">
	                                    <input type="text" id="id" name="m_id" class="form-control" required="required" onkeyup="check_id()">
	                                    <span class="form-bar"></span>
	                                    <label class="float-label">아이디</label>
	                                   	<span id="check_id"></span>
									</div>
									<div class="col-sm-2" style="padding:0px 0px 0px 4px;">
	                                  	<input type="button" value="중복확인" onclick="duplicateIdCheck()" class="btn waves-effect waves-light btn-primary btn-outline-primary"/>
									</div>
								</div>
                                <div class="form-group form-primary form-static-label">
                                    <input type="password" id="pw" name="m_pw" class="form-control" onkeyup="check_pw()" required="required">
                                    <span class="form-bar"></span>
                                    <label class="float-label">비밀번호</label>
                                    <span id="check_pw1"></span>
                                </div>
                                <div class="form-group form-primary form-static-label">
                                    <input type="password" id="pw_check" class="form-control" onkeyup="check_pw()" required="required">
                                    <span class="form-bar"></span>
                                    <label class="float-label">비밀번호 재확인</label>
                                    <span id="check_pw2"></span>
                                </div>
                                <div class="form-group form-primary form-static-label">
                                    <input type="text" id="name" name="m_name" class="form-control" required="required">
                                    <span class="form-bar"></span>
                                    <label class="float-label">이름</label>
                                </div>
                                <div class="form-group form-primary form-static-label row">
                                	<div class="col-sm-04" style="padding-left:16px;">
                                    	<input type="radio" name="m_gender" id="male_raido" class="only-sr checked" value="남자">
                                    	<label for="male_raido">남자</label>
                                    </div>
                                    <div class="col-sm-04">
                                    	<input type="radio" name="m_gender" id="female_raido" class="only-sr checked" value="여자" >
                                    	<label for="female_raido">여자</label>
                                    </div>
                                    <div class="col-sm-04">
                                    	<input type="radio" name="m_gender" id="noChoice_raido" class="only-sr checked" value="선택안함"  checked >
                                    	<label for="noChoice_raido" style="padding-left: 39px; padding-right: 39px;">선택안함</label>
                                    </div>
                                </div>
                                <div class="form-group form-primary form-static-label row" style="width: 410px; margin-left: 0px;">
                                	
                                    <div class="col-sm-6" style="padding:0px;">
                                    	<input type="hidden" id="realEmail" name="m_email" value="" class="form-control" required="required" >
	                                    <input type="text" id="frontEmail" class="form-control" required="required" >
	                                    <span class="form-bar"></span>
	                                    <label class="float-label">이메일</label>
	                                    <span id="check_email"></span>
                                    </div>
                                    @
                                    <div class="col-sm-5">
                                    	<select id="backEmail" required>
                                    		<option value="" selected>선택해주세요.</option>
                                    		<option value="naver.com">naver.com</option>
                                    		<option value="daum.net">daum.net</option>
                                    		<option value="hanmail.net">hanmail.net</option>
                                    		<option value="gmail.com">gmail.com</option>
                                    	</select>
                                    </div>
                                </div>
                                <div class="form-group form-primary form-static-label row" style="width: 410px; margin-left: 0px;">
                                    <div class="col-sm-8" style="padding:0px;">
	                                    <input type="text" id="checkKey" onchange="authKeyCompared()" placeholder="인증번호 받기를 하면 활성화 됩니다." class="form-control" required="required" disabled>
	                                    <span class="form-bar"></span>
	                                    <label class="float-label">인증번호</label>
	                                    <span id="check_authKey"></span>
                                    </div>
                                    <div class="col-sm-3" style="padding:0px 0px 0px 4px;">
                                   		<input type="button" id="authBtn" value="인증번호 받기" onclick="authKeySend()" onmouseout="authBtnOut()" class="btn waves-effect waves-light btn-primary btn-outline-primary"/>
                                		<input type="button" id="timeBtn" value="" style="display:none;" onmouseover="timeBtnOver()" class="btn waves-effect waves-light btn-primary btn-outline-primary"/>
                                		<input type="button" id="completeBtn" value="" style="display:none;" class="btn waves-effect waves-light btn-primary btn-outline-primary"/>
                                	</div>
                              	</div>

                                
                                <hr style="border-style:dotted;margin-bottom: 2.5em;"/>
                                <input type="hidden" id="realAddress" name="m_addr"/>
                               	<div class="form-group form-primary form-static-label row" style="width: 410px; margin-left: 0px;">
                                    <div class="col-sm-8" style="padding:0px;">
	                                    <input type="text" id="postcode" name="addr" class="form-control" placeholder="우편번호 찾기를 해주세요." readonly="readonly">
	                                    <span class="form-bar"></span>
	                                    <label class="float-label">우편번호</label>
                                    </div>
                                    <div class="col-sm-3" style="padding:0px 0px 0px 4px;">
                                   		<input type="button" value="우편번호 찾기" onclick="daumPostcode()" class="btn waves-effect waves-light btn-primary btn-outline-primary"/>
                                	</div>
                              	</div>
                             	<div class="form-group form-primary form-static-label">
                                    <input type="text" id="address" name="addr" class="form-control" placeholder="우편번호 찾기를 해주세요." readonly="readonly">
                                    <span class="form-bar"></span>
                                    <label class="float-label">주소</label>
                                </div>
                              	<div class="form-group form-primary form-static-label row" style="width: 410px; margin-left: 0px;">
                                    <div class="col-sm-6 spaceNeed" style="padding:0px 15px 0px 0px;">
	                                    <input type="text" id="detailAddress" class="form-control" >
	                                    <span class="form-bar"></span>
	                                    <label class="float-label">상세주소</label>
                                    </div>
                                    <div class="col-sm-6" style="padding:0px 0px 0px 0px;">
                                   		<input type="text" id="extraAddress" name="addr" class="form-control" readonly="readonly">
	                                    <span class="form-bar"></span>
	                                    <label class="float-label">참고항목</label>
                                	</div>
                              	</div>
                                <div class="form-group form-primary form-static-label">
                                    <input type="text" id="phoneNum" name="m_tel" class="form-control" placeholder="- 빼고 적어주세요">
                                    <span class="form-bar"></span>
                                    <label class="float-label">전화번호</label>
                                </div>
                                
                                <div class="row m-t-30">
                                    <div class="col-md-12">
                                        <button type="button" onclick="signUp()" class="btn btn-primary btn-md btn-block waves-effect text-center m-b-20">가입하기</button>
                                    </div>
                                </div>
                                <hr/>
                                <div class="row">
                                    <div class="col-md-10">
                                        <p class="text-inverse text-left m-b-0">Thank you.</p>
                                        <p class="text-inverse text-left"><a href="/"><b>메인화면으로</b></a></p>
                                    </div>
                                    
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
                <!-- end of col-sm-12 -->
            </div>
            <!-- end of row -->
        </div>
        <!-- end of container-fluid -->
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
	
	<!-- confirmEdit 모달을 쓸 페이지에 추가 start-->
	<section class="modal modal-section type-confirmEdit">
		<div class="enroll_box">
			<p class="menu_msg"></p>
		</div>
		<div class="enroll_btn">
			<button class="btn pink_btn btn_ok">확인</button>
		</div>
	</section>
	<!-- confirmEdit 모달을 쓸 페이지에 추가 end-->

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
        
        
    </section>
<script>
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




//전화번호 자동 - 추가
var autoHypenPhone = function(str){
    str = str.replace(/[^0-9]/g, '');
    var tmp = '';
    if( str.length < 4){
        return str;
    }else if(str.length < 7){
        tmp += str.substr(0, 3);
        tmp += '-';
        tmp += str.substr(3);
        return tmp;
    }else if(str.length < 11){
        tmp += str.substr(0, 3);
        tmp += '-';
        tmp += str.substr(3, 3);
        tmp += '-';
        tmp += str.substr(6);
        return tmp;
    }else{              
        tmp += str.substr(0, 3);
        tmp += '-';
        tmp += str.substr(3, 4);
        tmp += '-';
        tmp += str.substr(7);
        return tmp;
    }

    return str;
}

var phoneNum = document.getElementById('phoneNum');

phoneNum.onkeyup = function(){
console.log(this.value);
this.value = autoHypenPhone( this.value ) ;  
}

	// 아이디 길이 체크
 	var idLength = false;
    function check_id(){
    	var id = document.getElementById('id').value;
    	var SC = ["!","@","#","$","%","`","~","^","&","*","(",")","+","=","\\","|","{","}",":",";","\"","\'",",","<",".",">","/","?"];
        var check_SC = 0;
         
        for(var i = 0; i < SC.length; i++){
            if(id.indexOf(SC[i]) != -1) check_SC = 1;
        }
         
    	if(id.length == 0 || id == ""){
        	document.getElementById('check_id').innerHTML='필수 정보입니다.'
            document.getElementById('check_id').style.color='red';
        	idLength = false;
        }else if(id.length < 5 || check_SC == 1){
        	document.getElementById('check_id').innerHTML='5~20자리의 영문 소문자, 숫자와 특수기호(_),(-)만 사용 가능합니다.'
            document.getElementById('check_id').style.color='red';
        	idLength = false;
        }else {
        	document.getElementById('check_id').innerHTML='중복검사를 해주세요!';
            document.getElementById('check_id').style.color='green';
            idLength = true;
        }
    };
    
    // 아이디 중복 확인 체크
	var idCheck = false;
	function duplicateIdCheck(){
		var inputed = $('input#id').val();
		console.log(inputed);
		if(inputed.length > 0) {
			$.ajax({
				data : inputed,
				url : "/member/mem/idCheck",
				type : "POST",
				dataType : "JSON",
				contentType: "application/json; charset=UTF-8",
				success : function(data) {
					if(idLength){
						if(data.check > 0){
							$("#check_id").css("color","red");
							$("#check_id").text("이미 사용중인 아이디 입니다.");
							idCheck = false;
						} else if(data.check == 0){
							$("#check_id").css("color","blue");
							$("#check_id").text("멋진 아이디 입니다.")
							idCheck = true;
						}
					}
				}
			});
		}else{
			$("#check_id").css("color","red");
			$("#check_id").text("아이디를 입력해주세요.");
			idCheck = false;
		}
	};
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
        	passCheck = false;
        }

		
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
    };
    
    
    //회원 가입 버튼 클릭시 중복검사, 이메일 인증 수행 여부 체크
    function signUp(){
    	var nameCheck = document.getElementById('name').value;
    	if(!idLength){
    		alert("아이디를 확인해주세요.");
    		document.getElementById('id').focus();
    	}else if(!idCheck){
    		alert("아이디 중복확인을 해주세요.");
    		document.getElementById('id').focus();
    	}else if(!passCheck){
    		alert("비밀번호를 확인해주세요.");
    		document.getElementById('pw').focus();
    	}else if(nameCheck == null || nameCheck == ""){
    		alert("이름은 필수 사항 입니다.");
    		document.getElementById('name').focus();
    	}else if(!authCheck){
    		alert("이메일 인증을 해주세요.");
    		document.getElementById('frontEmail').focus();
    	}else{
    		if(addrCheck){
    			if(document.getElementById("detailAddress").value == ""){
    				action_popup.alert("상세 주소를 적어주세요.");
					document.getElementById("detailAddress").focus();
    			}else{
    				addrCheck = false;
    			}
    		}
    		
    		if(!addrCheck)
    			document.signIn_form.submit();
    	}
    	
    };
    
 	// 인증 번호 발송
	var authKey = "";
	var emailFormCheck = false;
	var emailCheck = false;
	var authCheck = false;
	var isRunning = false;
	var timer = null;
	function authKeySend(){
		var realEmail = $('input#realEmail');
		var inputed = $('input#frontEmail').val();
		var select = $('select#backEmail').val();
		var checkInput = $('input#checkKey');
				
		var SC = ["!","@","#","$","%","`","~","^","&","*","(",")","+","=","\\","|","{","}",":",";","\"","\'",",","<",">","/","?"];
        var check_SC = 0;
		
        for(var i = 0; i < SC.length; i++){
            if(inputed.indexOf(SC[i]) != -1) check_SC = 1;
        }
		
		if(check_SC == 1 || select == "" || inputed == ""){
			$("#check_email").css("color","red");
			$("#check_email").text("이메일을 제대로 입력해주세요.");
			emailFormCheck = false;
		}else{
			$("#check_email").text("");
			emailFormCheck = true;
		}
		
		if(emailFormCheck && (inputed.length > 0 || inputed != "") && !authCheck) {
			$.ajax({
				data : inputed+"@"+select,
				url : "/member/mem/emailCheck",
				type : "POST",
				dataType : "JSON",
				contentType: "application/json; charset=UTF-8",
				success : function(data) {
					console.log("emailCheck : " + inputed+"@"+select);

					if(data.ufo){
						$("#check_email").css("color","red");
						$("#check_email").text("이미 사용중인 이메일 입니다.");
						emailCheck = false;
					} else{
						$("#check_email").text("");
						emailCheck = true;
						if(!isRunning){
							$.ajax({
								data : inputed + "@" + select,
								url : "/member/mem/memEmailSend",
								type : "POST",
								dataType : "text",
								contentType: "application/json; charset=UTF-8",
								success : function(data) {
									console.log("memEmailSend : " + inputed+"@"+select);
									action_popup.alert('인증번호가 전송 되었습니다.');
									
									checkInput.attr("disabled", false);	
									checkInput.attr("placeholder", "");
									authKey = data;
									realEmail.val(inputed + "@" + select);
									console.log(authKey);
									$('input#authBtn').attr("style","display:none;");
									$('input#timeBtn').attr("style","display:block;");
									startTimer(180, $('#timeBtn'));
								},
							});
						}else{
				    		clearInterval(timer);
				    		$('#timeBtn').val("03:00");
				    		startTimer(180, $('#timeBtn'));
					    }
					}
				}
			});
		}

	};
	
	    
	function startTimer(count, display) {
	            
	    		var minutes, seconds;
	            timer = setInterval(function () {
	            minutes = parseInt(count / 60, 10);
	            seconds = parseInt(count % 60, 10);
	     
	            minutes = minutes < 10 ? "0" + minutes : minutes;
	            seconds = seconds < 10 ? "0" + seconds : seconds;
	     
	            display.val(minutes + ":" + seconds);
	     
	            // 타이머 끝
	            if (--count < 0) {
	    	     clearInterval(timer);
	    	     action_popup.alert("시간초과");
	    	     display.val("시간초과");
	    	     $('input#checkKey').attr("disabled", true);
	    	     authKey="";
	    	     isRunning = false;
	            }
	        }, 1000);
	             isRunning = true;
	}
	
	function timeBtnOver(){
		if(isRunning){
			$('input#authBtn').val("시간 연장")
			$('input#authBtn').attr("style","display:block;");
			$('input#timeBtn').attr("style","display:none;");
		}else{
			$('input#authBtn').val("인증번호 받기")
			$('input#authBtn').attr("style","display:block;");
			$('input#timeBtn').attr("style","display:none;");
		}
	}
	function authBtnOut(){
		if(isRunning){
			$('input#authBtn').attr("style","display:none;");
			$('input#timeBtn').attr("style","display:block;");
		}
	}
	
	//인증 번호 확인
	function authKeyCompared(){
		var inputCode = $("#checkKey").val();
		var result = $("#check_authKey");
		
		if(inputCode == authKey ){
			$('input#completeBtn').val("인증 완료")
			$('input#completeBtn').attr("style","display:block;");
			$('input#timeBtn').attr("style","display:none;");
			$('input#authBtn').attr("style","display:none;");
			isRunning = false;
			clearInterval(timer);
			result.text("인증번호가 일치합니다.");
			result.css("color","blue");
			authCheck = true;
		} else{
			result.text("인증번호를 다시 확인해주세요.");
			result.css("color","red");
			authCheck = false;
		}
	};
    
    
    /*사진 미리 보여주기 함수 memberDetail*/
    $(document).ready(function(){ 
        var fileTarget = $('.upload-hidden'); 
        fileTarget.on('change', function(){ // 값이 변경되면 
            if(window.FileReader){ // modern browser 
                var filename = $(this)[0].files[0].name; 
            } else { // old IE 
                var filename = $(this).val().split('/').pop().split('\\').pop(); // 파일명만 추출 
            } // 추출한 파일명 삽입 
            $(this).siblings('.upload-name').val(filename); 
        }); 
    });

    var imgTarget = $('.upload-hidden');

    imgTarget.on('change', function(){
        var parent = $(this).parent();
        parent.children('.m_imgPreview').remove();

        if(window.FileReader){
            if(!$(this)[0].files[0].type.match(/image\//)) return;

            var reader = new FileReader(); 
            reader.onload = function(e){ 
                var src = e.target.result; 
                parent.prepend('<div class="m_imgPreview"><img src="' + src +'" class="img-fluid img-circle"></div>'); 
            
            } 
            reader.readAsDataURL($(this)[0].files[0]);
        }
    });
    
    
    
    /*다음 우편번호 찾기 javaScript */
	var addrCheck = false;
	function daumPostcode() {
		new daum.Postcode(
				{
					oncomplete : function(data) {
						// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

						// 각 주소의 노출 규칙에 따라 주소를 조합한다.
						// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
						var addr = ''; // 주소 변수
						var extraAddr = ''; // 참고항목 변수

						//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
						if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
							addr = data.roadAddress;
						} else { // 사용자가 지번 주소를 선택했을 경우(J)
							addr = data.jibunAddress;
						}

						// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
						if (data.userSelectedType === 'R') {
							// 법정동명이 있을 경우 추가한다. (법정리는 제외)
							// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
							if (data.bname !== ''
									&& /[동|로|가]$/g.test(data.bname)) {
								extraAddr += data.bname;
							}
							// 건물명이 있고, 공동주택일 경우 추가한다.
							if (data.buildingName !== ''
									&& data.apartment === 'Y') {
								extraAddr += (extraAddr !== '' ? ', '
										+ data.buildingName
										: data.buildingName);
							}
							// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
							if (extraAddr !== '') {
								extraAddr = ' (' + extraAddr + ')';
							}
							// 조합된 참고항목을 해당 필드에 넣는다.
							document.getElementById("extraAddress").value = extraAddr;

						} else {
							document.getElementById("extraAddress").value = '';
						}

						// 우편번호와 주소 정보를 해당 필드에 넣는다.
						document.getElementById('postcode').value = data.zonecode;
						document.getElementById("address").value = addr;
						// 커서를 상세주소 필드로 이동한다.
						document.getElementById("detailAddress").value = '';
						addrCheck = true;
						document.getElementById("detailAddress").focus();
					}					
				}).open();
	};
	
	$('#detailAddress').focusout(function(){
		var realAddr = $('input[name=addr]').eq(0).val() 
					+ "|" + $('input[name=addr]').eq(1).val()
					+ "|" + $('#detailAddress').val()
					+ "|" + $('input[name=addr]').eq(2).val();
		$('#realAddress').val(realAddr);
	});
    
    
	
    
    
</script>

<%@ include file="/WEB-INF/views/adminFooter.jsp" %>         

</body>

</html>