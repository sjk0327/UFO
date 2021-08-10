<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   



<!DOCTYPE html>
<html>
<head>
    <title>회원가입</title>
     <%@ include file="/WEB-INF/views/adminHeader.jsp" %>
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
                                        <h3 class="text-center txt-primary">Sign up</h3>
                                    </div>
                                </div>
                                <div class="form-group form-primary">
                                    <input type="text" name="m_id" class="form-control" required="required" onchange="check_input()">
                                    <span class="form-bar"></span>
                                    <label class="float-label">아이디</label>
                                </div>
                                <div class="form-group form-primary">
                                    <input type="text" name="m_name" class="form-control" required="required" onchange="check_input()">
                                    <span class="form-bar"></span>
                                    <label class="float-label">이름</label>
                                </div>
                                <div class="form-group form-primary">
                                    <input type="text" name="email" class="form-control" required="required" onchange="check_input()">
                                    <span class="form-bar"></span>
                                    <label class="float-label">Your Email Address</label>
                                </div>
                                <div class="row">
                                    <div class="col-sm-6">
                                        <div class="form-group form-primary">
                                            <input type="password" id="pw" name="m_pw" class="form-control" onchange="check_pw()" required="required">
                                            <span class="form-bar"></span>
                                            <label class="float-label">비밀번호</label>
                                        </div>
                                    </div>
                                    <div class="col-sm-6">
                                        <div class="form-group form-primary">
                                            <input type="password" id="pw_check" class="form-control" onchange="check_pw()" required="required">
                                            <span class="form-bar"></span>
                                            <label class="float-label">비밀번호 확인</label>
                                            <span id="check"></span>
                                        </div>
                                    </div>
                                </div>
                                <div class="row m-t-30">
                                    <div class="col-md-12">
                                        <button type="button" class="btn btn-primary btn-md btn-block waves-effect text-center m-b-20">Sign up now</button>
                                    </div>
                                </div>
                                <hr/>
                                <div class="row">
                                    <div class="col-md-10">
                                        <p class="text-inverse text-left m-b-0">Thank you.</p>
                                        <p class="text-inverse text-left"><a href="index.html"><b>Back to website</b></a></p>
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
    function check_input(){
        var inp = document.getElementsByTagName('input');
        var par = inp.parentNode;
        if(inp.value == "" ){
            par.className ="form-group form-primary";  
        }else{
            par.className = "form-group form-success form-satic_label";
        }
    }
</script>

 <script>
    function check_pw(){
       var pw = document.getElementById('pw').value;
        var SC = ["!","@","#","$","%","`","~"];
        var check_SC = 0;

        if(pw.length < 6 || pw.length > 19){
            window.alert('비밀번호는 6글자 이상, 19글자 이하만 이용 가능합니다.');
            document.getElementById('pw').value='';
        }

        for(var i = 0; i < SC.length; i++){
            if(pw.indexOf(SC[i]) != -1) check_SC = 1;
        }

        if(document.getElementById('pw').value !='' && document.getElementById('pw_check').value!=''){
            if(document.getElementById('pw').value==document.getElementById('pw_check').value){
                document.getElementById('check').innerHTML='비밀번호가 일치합니다.'
                document.getElementById('check').style.color='blue';
            }
            else{
                document.getElementById('check').innerHTML='비밀번호가 일치하지 않습니다.';
                document.getElementById('check').style.color='red';
                
            }
        }
    }
</script>

          <!--  if(check_SC == 0){
            window.alert('특수문자가 들어가 있지 않습니다.')
            document.getElementById('pw').value='';
        }-->


</body>

</html>