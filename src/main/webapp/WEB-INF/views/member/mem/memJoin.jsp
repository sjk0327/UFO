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
     </style>
</head>

  <body themebg-pattern="theme1">
  <section class="login-block">
        <!-- Container-fluid starts -->
        <div class="container-fluid">
            <div class="row">
                <div class="col-sm-12">
                    <form class="md-float-material form-material">
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
                                <div class="form-group form-primary form-static-label row" style="width: 410px; padding-left: 15px;">
									<div class="col-sm-9" style="padding:0px;">
                                    <input type="text" id="id" name="m_id" class="form-control" required="required" onchange="check_id()">
                                    <span class="form-bar"></span>
                                    <label class="float-label">아이디</label>
                                    <span id="check"></span>
									</div>
									<div class="col-sm-2" style="padding:0px 0px 0px 15px;">
                                   	<input type="button" value="중복확인" onclick="duplicateIdCheck()" class="btn waves-effect waves-light btn-primary btn-outline-primary"/>
									<script>
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
													
													if(data.check > 0){
														$("#check").css("color","red");
														$("#check").text("이미 사용중인 아이디 입니다.");
													} else if(data.check == 0){
														$("#check").css("color","blue");
														$("#check").text("멋진 아이디 입니다.")
													}
												}
											});
										}else{
											$("#check").css("color","red");
											$("#check").text("아이디를 입력해주세요.");
										}
									};
									</script>
									
									</div>
                                </div>
                                <div class="form-group form-primary form-static-label">
                                    <input type="password" id="pw" name="m_pw" class="form-control" onchange="check_pw()" required="required">
                                    <span class="form-bar"></span>
                                    <label class="float-label">비밀번호</label>
                                    <span id="check_1"></span>
                                </div>
                                <div class="form-group form-primary form-static-label">
                                    <input type="password" id="pw_check" class="form-control" onchange="check_pw()" required="required">
                                    <span class="form-bar"></span>
                                    <label class="float-label">비밀번호 재확인</label>
                                    <span id="check_2"></span>
                                </div>
                                <div class="form-group form-primary form-static-label">
                                    <input type="text" name="m_name" class="form-control" required="required">
                                    <span class="form-bar"></span>
                                    <label class="float-label">이름</label>
                                </div>
                                <div class="form-group form-primary form-static-label row">
                                	<div class="col-sm-04" style="padding-left:16px;">
                                    	<input type="radio" name="m_gender" id="male_raido" class="only-sr checked" value="남자" checked >
                                    	<label for="male_raido">남자</label>
                                    </div>
                                    <div class="col-sm-04">
                                    	<input type="radio" name="m_gender" id="female_raido" class="only-sr checked" value="여자" >
                                    	<label for="female_raido">여자</label>
                                    </div>
                                    <div class="col-sm-04">
                                    	<input type="radio" name="m_gender" id="noChoice_raido" class="only-sr checked" value="여자" >
                                    	<label for="noChoice_raido" style="padding-left: 39px; padding-right: 39px;">선택안함</label>
                                    </div>
                               </div>
                                <div class="form-group form-primary form-static-label row" style="width: 410px; padding-left: 15px;">
                                    <div class="col-sm-7" style="padding:0px;">
	                                    <input type="text" id="email" name="m_email" class="form-control" required="required">
	                                    <span class="form-bar"></span>
	                                    <label class="float-label">이메일</label>
	                                    <span id="check"></span>
                                    </div>
                                    <div class="col-sm-3" style="padding:0px 0px 0px 15px;">
                                   		<input type="button" value="인증번호 받기" onclick="mailCheck()" class="btn waves-effect waves-light btn-primary btn-outline-primary"/>
                                		<script>
										function mailCheck(){
											var inputed = $('input#email').val();
											console.log(inputed);
											if(inputed.length > 0 || inputed != "") {
												$.ajax({
													data : inputed,
													url : "/member/mem/memEmailCheck",
													type : "POST",
													dataType : "JSON",
													contentType: "application/json; charset=UTF-8",
												});
												window.alert('인증번호가 전송 되었습니다.');
												isCertification=true;
											}else{
												$("#check").css("color","red");
												$("#check").text("이메일을 입력해주세요.");
											}
										};
										</script>
                                	</div>
                              	</div>
                              	<div class="form-group form-primary form-static-label">
                                    <input type="text" class="form-control" required="required">
                                    <span class="form-bar"></span>
                                    <label class="float-label">인증번호</label>
                                </div>
                                
                                <hr style="border-style:dotted;margin-bottom: 2.5em;"/>
                                
                               <div class="form-group form-primary form-static-label row" style="width: 410px; padding-left: 15px;">
                                    <div class="col-sm-7" style="padding:0px;">
	                                    <input type="text" id="postcode" name="m_addr" class="form-control" placeholder="우편번호 찾기를 해주세요." readonly="readonly">
	                                    <span class="form-bar"></span>
	                                    <label class="float-label">우편번호</label>
                                    </div>
                                    <div class="col-sm-3" style="padding:0px 0px 0px 15px;">
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
                                    <input type="text" name="m_tel" class="form-control" required="required">
                                    <span class="form-bar"></span>
                                    <label class="float-label">전화번호</label>
                                </div>
                                <div class="form-group form-static-label">
                                	<label>이미지</label>
                                	<input type="hidden" name="m_img" value="defaultImage.jpg"/>
                                    <input type="file" required="required">
                                </div>
                                <div class="row m-t-30">
                                    <div class="col-md-12">
                                        <button type="button" class="btn btn-primary btn-md btn-block waves-effect text-center m-b-20">가입하기</button>
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
    function check_id(){
    	var id = document.getElementById('id').value;
    	var SC = ["!","@","#","$","%","`","~","^","&","*","(",")","+","=","\\","|","{","}",":",";","\"","\'",",","<",".",">","/","?"];
        var check_SC = 0;
         
        for(var i = 0; i < SC.length; i++){
            if(id.indexOf(SC[i]) != -1) check_SC = 1;
        }
         
    	if(id.length == 0 || id == ""){
        	document.getElementById('check').innerHTML='필수 정보입니다.'
            document.getElementById('check').style.color='red';
        }else if(id.length < 5 || check_SC == 1){
        	document.getElementById('check').innerHTML='5~20자리의 영문 소문자, 숫자와 특수기호(_),(-)만 사용 가능합니다.'
            document.getElementById('check').style.color='red';
        }else {
        	document.getElementById('check').innerHTML='중복검사를 해주세요!';
            document.getElementById('check').style.color='green';
        }
    }
</script>

 <script>
    function check_pw(){
       var pw = document.getElementById('pw').value;
                
        if(pw.length == 0 || pw == ""){
        	document.getElementById('check_1').innerHTML = '필수 정보입니다.';
        	document.getElementById('check_1').style.color='red';
        }else if(pw.length < 8 || pw.length > 17){
        	document.getElementById('check_1').innerHTML = '8~16자 영문 대 소문자, 숫자, 특수문자를 사용하세요.';
        	document.getElementById('check_1').style.color='red';
        }else{
        	document.getElementById('check_1').innerHTML = '';
        }

		
        if(document.getElementById('pw').value !='' && document.getElementById('pw_check').value!=''){
            if(document.getElementById('pw').value==document.getElementById('pw_check').value){
                document.getElementById('check_2').innerHTML='비밀번호가 일치합니다.'
                document.getElementById('check_2').style.color='blue';
            }
            else{
                document.getElementById('check_2').innerHTML='비밀번호가 일치하지 않습니다.';
                document.getElementById('check_2').style.color='red';
                
            }
        }
    }
</script>

<%@ include file="/WEB-INF/views/adminFooter.jsp" %>         

</body>

</html>