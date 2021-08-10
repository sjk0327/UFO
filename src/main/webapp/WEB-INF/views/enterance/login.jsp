<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.security.SecureRandom" %>
<%@ page import="java.math.BigInteger" %>    
    
<!DOCTYPE html>
<html>
<head>
    <title>로그인</title>
   <%@ include file="/WEB-INF/views/adminHeader.jsp" %>
   
  

  </head>

  <body themebg-pattern="theme1">
    <section class="login-block">
        <!-- Container-fluid starts -->
        <div class="container">
            <div class="row">
                <div class="col-sm-12">
                    <!-- Authentication card start -->
                    
                        <form:form class="md-float-material form-material" action="admin" method="post"  modelAttribute="user">
                            <div class="text-center">
                                <img src="resources/assets/images/logo.png" alt="logo.png">
                            </div>
                            <div class="auth-box card">
                                <div class="card-block">
                                    <div class="row m-b-20">
                                        <div class="col-md-12">
                                            <h3 class="text-center">로그인</h3>
                                        </div>
                                    </div>
                                    <div class="form-group form-primary">
                                        <form:input path="m_id" class="form-control" required="required" />
                                        <span class="form-bar"></span>
                                        <label class="float-label">ID</label>
                                    </div>
                                    <div class="form-group form-primary">
                                        <form:password path="m_pw" class="form-control" required="required"/>
                                        <span class="form-bar"></span>
                                        <label class="float-label">Password</label>
                                    </div>
                                    
                                    
                                    <div class="row m-t-25 text-left">
                                        <div class="col-12">
                                           
                                        </div>
                                    </div>
                                    
                                    
                                    <div class="row m-t-30">
                                        <div class="col-md-12">
                                            <input type="submit" class="btn btn-primary btn-md btn-block waves-effect waves-light text-center m-b-20">
                                        </div>
                                    </div>
                                    
                                    
                                    
                                     <div  class="row m-t-10">
                                        <div class="col-md-12">
                                            <a href="https://kauth.kakao.com/oauth/authorize?client_id=0ba57b2de5ae26e3cc0a370db0b7f98d&redirect_uri=http://localhost:8090/kakaoLogin&response_type=code"><img src="/resources/img/kakaologin.png" width="75%" style="display: block;margin-left: auto;margin-right: auto;"></a>
                                        </div>
                                    </div>
                                    
                                    <div  class="row m-t-10">
                                        <div class="col-md-12">
                                        <%
    									String clientId = "AypoUOpXBiyt9Pz14zia";//애플리케이션 클라이언트 아이디값";
									    String redirectURI = URLEncoder.encode("http://localhost:8090/naverLogin", "UTF-8");
									    SecureRandom random = new SecureRandom();
									    String state = new BigInteger(130, random).toString();
									    String apiURL = "https://nid.naver.com/oauth2.0/authorize?response_type=code";
									    apiURL += "&client_id=" + clientId;
									    apiURL += "&redirect_uri=" + redirectURI;
									    apiURL += "&state=" + state;
									    session.setAttribute("state", state);
 										%>
                                            <a href="${url }"><img src="/resources/img/naverlogin.png" width="75%" style="display: block;margin-left: auto;margin-right: auto;"></a>
                                        </div>
                                    </div>
                                    
                                    
                                    
                                    
                                    
                                    
                                    
                                    
                                    
                                    
                                    
                                    
                                    
                                    
                                    
                                    
                                    
                                    
                                    
                                    
                                    
                                    <hr/>
                                    <div class="row">
                                        <div class="col-md-10">
                                            <p class="text-inverse text-left m-b-0"></p>
                                            <p class="text-inverse text-left"><a href="/"><b>회원가입</b></a></p>
                                        </div>
                                        <div class="col-md-2">
                                            <img src="resources/assets/images/auth/Logo-small-bottom.png" alt="small-logo.png">
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </form:form>
                        <!-- end of form -->
                </div>
                <!-- end of col-sm-12 -->
            </div>
            <!-- end of row -->
        </div>
        <!-- end of container-fluid -->
    </section>

   <%@ include file="/WEB-INF/views/adminFooter.jsp" %>

</body>

</html>



