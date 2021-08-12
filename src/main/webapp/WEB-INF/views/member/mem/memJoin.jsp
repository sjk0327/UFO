<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   



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
                            <img src="/resources/assets/images/logo.png" alt="logo.png">
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
								<div class="form-group form-primary form-static-label row" style="width: 410px; padding-left: 15px;">
									<div class="col-sm-9" style="padding:0px;">
	                                    <input type="text" id="id" name="m_id" class="form-control" required="required" onchange="check_id()">
	                                    <span class="form-bar"></span>
	                                    <label class="float-label">아이디</label>
	                                   	<span id="check_id"></span>
									</div>
									<div class="col-sm-2" style="padding:0px 0px 0px 15px;">
	                                  	<input type="button" value="중복확인" onclick="duplicateIdCheck()" class="btn waves-effect waves-light btn-primary btn-outline-primary"/>
									<script>
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
									</script>
									</div>
								</div>
                                <div class="form-group form-primary form-static-label">
                                    <input type="password" id="pw" name="m_pw" class="form-control" onchange="check_pw()" required="required">
                                    <span class="form-bar"></span>
                                    <label class="float-label">비밀번호</label>
                                    <span id="check_pw1"></span>
                                </div>
                                <div class="form-group form-primary form-static-label">
                                    <input type="password" id="pw_check" class="form-control" onchange="check_pw()" required="required">
                                    <span class="form-bar"></span>
                                    <label class="float-label">비밀번호 재확인</label>
                                    <span id="check_pw2"></span>
                                </div>
                                <div class="form-group form-primary form-static-label">
                                    <input type="text" name="m_name" class="form-control" required="required">
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
                                <div class="form-group form-primary form-static-label row" style="width: 410px; padding-left: 15px;">
                                	
                                    <div class="col-sm-6" style="padding:0px;">
                                    	<input type="hidden" id="realEmail" name="m_email" value="" class="form-control" required="required" >
	                                    <input type="text" id="frontEmail" class="form-control" required="required" >
	                                    <span class="form-bar"></span>
	                                    <label class="float-label">이메일</label>
	                                    <span id="check_email"></span>
                                    </div>
                                    @
                                    <div class="col-sm-5">
                                    	<select id="backEmail">
                                    		<option value="" selected>선택해주세요.</option>
                                    		<option value="naver.com">naver.com</option>
                                    		<option value="daum.net">daum.net</option>
                                    		<option value="hanmail.net">hanmail.net</option>
                                    		<option value="gmail.com">gmail.com</option>
                                    	</select>
                                    </div>
                                </div>
                                <div class="form-group form-primary form-static-label row" style="width: 410px; padding-left: 15px;">
                                    <div class="col-sm-8" style="padding:0px;">
	                                    <input type="text" id="checkKey" onchange="authKeyCompared()" placeholder="인증번호 받기를 하면 활성화 됩니다." class="form-control" required="required" disabled>
	                                    <span class="form-bar"></span>
	                                    <label class="float-label">인증번호</label>
	                                    <span id="check_authKey"></span>
                                    </div>
                                    <div class="col-sm-3" style="padding:0px 0px 0px 11px;">
                                   		<input type="button" value="인증번호 받기" onclick="authKeySend()" class="btn waves-effect waves-light btn-primary btn-outline-primary"/>
                                		<script>
                                		var authKey = "";
                                		var emailFormCheck = false;
                                		var emailCheck = false;
                                		// 인증 번호 발송
										function authKeySend(){
                                			var realEmail = $('input#realEmail');
											var inputed = $('input#frontEmail').val();
											var select = $('select#backEmail').val();
											var checkInput = $('input#checkKey');
											
											console.log(inputed);
											
											var SC = ["!","@","#","$","%","`","~","^","&","*","(",")","+","=","\\","|","{","}",":",";","\"","\'",",","<",">","/","?"];
									        var check_SC = 0;
											
									        for(var i = 0; i < SC.length; i++){
									            if(inputed.indexOf(SC[i]) != -1) check_SC = 1;
									        }
											
											if(check_SC == 1 || select == ""){
												$("#check_email").css("color","red");
												$("#check_email").text("이메일을 제대로 입력해주세요.");
												emailFormCheck = false;
											}else{
												emailFormCheck = true;
											}
											
											if(emailFormCheck && (inputed.length > 0 || inputed != "")) {
												$("#check_email").text("");
												$.ajax({
													data : inputed + "@" + select,
													url : "/member/mem/memEmailCheck",
													type : "POST",
													dataType : "text",
													contentType: "application/json; charset=UTF-8",
													success : function(data) {
														alert('인증번호가 전송 되었습니다.');
														
														checkInput.attr("disabled", false);	
														checkInput.attr("placeholder", "");
														authKey = data;
														realEmail.value = inputed + "@" + select;
														console.log(authKey);
													},
												});
											}
										};
										
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
                                	</div>
                              	</div>

                                
                                <hr style="border-style:dotted;margin-bottom: 2.5em;"/>
                                
                               	<div class="form-group form-primary form-static-label row" style="width: 410px; padding-left: 15px;">
                                    <div class="col-sm-8" style="padding:0px;">
	                                    <input type="text" id="postcode" name="m_addr" class="form-control" placeholder="우편번호 찾기를 해주세요." readonly="readonly">
	                                    <span class="form-bar"></span>
	                                    <label class="float-label">우편번호</label>
                                    </div>
                                    <div class="col-sm-3" style="padding:0px 0px 0px 11px;">
                                   		<input type="button" value="우편번호 찾기" onclick="daumPostcode()" class="btn waves-effect waves-light btn-primary btn-outline-primary"/>
                                	</div>
                              	</div>
                             	<div class="form-group form-primary form-static-label">
                                    <input type="text" id="address" name="m_addr" class="form-control" placeholder="우편번호 찾기를 해주세요." readonly="readonly">
                                    <span class="form-bar"></span>
                                    <label class="float-label">주소</label>
                                </div>
                              	<div class="form-group form-primary form-static-label row" style="width: 410px; padding-left: 15px;">
                                    <div class="col-sm-6" style="padding:0px;">
	                                    <input type="text" id="detailAddress" name="m_addr" class="form-control">
	                                    <span class="form-bar"></span>
	                                    <label class="float-label">상세주소</label>
                                    </div>
                                    <div class="col-sm-6" style="padding:0px 0px 0px 15px;">
                                   		<input type="text" id="extraAddress" name="m_addr" class="form-control" readonly="readonly">
	                                    <span class="form-bar"></span>
	                                    <label class="float-label" style="padding-left: 15px;">참고항목</label>
                                	</div>
                              	</div>
                                <div class="form-group form-primary form-static-label">
                                    <input type="text" name="m_tel" class="form-control">
                                    <span class="form-bar"></span>
                                    <label class="float-label">전화번호</label>
                                </div>
                                
                                <div class="row m-t-30">
                                    <div class="col-md-12">
                                        <button type="button" onclick="signUp()" class="btn btn-primary btn-md btn-block waves-effect text-center m-b-20">가입하기</button>
                                        
                                        <script>
                                        function signUp(){
                                        	if(!idCheck){
                                        		alert("아이디 중복확인을 해주세요.")
                                        	}else if(!emailCheck){
                                        		alert("이메일 인증을 해주세요.")
                                        	}else if(idCheck && emailCheck){
                                        		document.signIn_form.submit();
                                        	}
                                        	
                                        }
                                        </script>
                                    </div>
                                </div>
                                <hr/>
                                <div class="row">
                                    <div class="col-md-10">
                                        <p class="text-inverse text-left m-b-0">Thank you.</p>
                                        <p class="text-inverse text-left"><a href="/"><b>메인화면으로</b></a></p>
                                    </div>
                                    <div class="col-md-2">
                                        <img src="/resources/assets/images/auth/Logo-small-bottom.png" alt="small-logo.png">
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
    </section>
<script>
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
    function check_pw(){
       var pw = document.getElementById('pw').value;
                
        if(pw.length == 0 || pw == ""){
        	document.getElementById('check_pw1').innerHTML = '필수 정보입니다.';
        	document.getElementById('check_pw1').style.color='red';
        }else if(pw.length < 8 || pw.length > 17){
        	document.getElementById('check_pw1').innerHTML = '8~16자 영문 대 소문자, 숫자, 특수문자를 사용하세요.';
        	document.getElementById('check_pw1').style.color='red';
        }else{
        	document.getElementById('check_pw1').innerHTML = '';
        }

		
        if(document.getElementById('pw').value !='' && document.getElementById('pw_check').value!=''){
            if(document.getElementById('pw').value==document.getElementById('pw_check').value){
                document.getElementById('check_pw2').innerHTML='비밀번호가 일치합니다.'
                document.getElementById('check_pw2').style.color='blue';
            }
            else{
                document.getElementById('check_pw2').innerHTML='비밀번호가 일치하지 않습니다.';
                document.getElementById('check_pw2').style.color='red';
                
            }
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
</script>

<%@ include file="/WEB-INF/views/adminFooter.jsp" %>         

</body>

</html>