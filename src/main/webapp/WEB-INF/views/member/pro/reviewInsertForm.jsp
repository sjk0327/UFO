<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%
   Cookie cookies1 = new Cookie("name","홍길동");
   Cookie cookies2 = new Cookie("age","20");
   System.out.println(cookies1.getValue());System.out.println(cookies2.getValue());
   Cookie[] cookies = request.getCookies();
       if(cookies != null && cookies.length > 0) {
        for(int i = 0; i < cookies.length; i++) {
          if(cookies[i].getName().equals("name")) {
             Cookie cookie = new Cookie("name","kka");
          }
       }
    }

%>
<!DOCTYPE html>
<html lang="en" >
  <head>
    <title>추천글 입력- UF&#38;O</title>
    <%@ include file="/WEB-INF/views/customerHeader.jsp"%>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
   
   
   
   
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Mukta:300,400,700"> 
    <link rel="stylesheet" href="/resources/common/fonts/icomoon/style.css">
   
    <link rel="stylesheet" href="/resources/common/css/bootstrap.min.css">
    <link rel="stylesheet" href="/resources/common/css/magnific-popup.css">
    <link rel="stylesheet" href="/resources/common/css/jquery-ui.css">
    <link rel="stylesheet" href="/resources/common/css/owl.carousel.min.css">
    <link rel="stylesheet" href="/resources/common/css/owl.theme.default.min.css">


    <link rel="stylesheet" href="/resources/common/css/aos.css">

    <link rel="stylesheet" href="/resources/common/css/style.css">
    <script src="https://code.jquery.com/jquery-3.5.0.js"></script>
    <script src="/resources/common/js/jquery-3.3.1.min.js"></script>
     <script src="/resources/common/js/jquery-ui.js"></script>
     <script src="/resources/common/js/popper.min.js"></script>
     <script src="/resources/common/js/bootstrap.min.js"></script>
     <script src="/resources/common/js/owl.carousel.min.js"></script>
   <script src="/resources/common/js/jquery.magnific-popup.min.js"></script>
    <script src="/resources/common/js/aos.js"></script>
    <script src="/resources/common/js/main.js"></script>
    <style>
.small1 { width: 100px; height: 100px; }
.small2 { width: 80px; height: 80px; align:center;}
.mb-1 { font-size : 18px; }

#searchType {
   width: 85px;
   height: 38px;
   padding-left: 8px;
   font-size: 13px;
   color: #585858;
   border-radius: 5px;
}
#slidemenu{background:#12cf3d;position:absolute;width:100px;top:50px;right:10px;}
#imghover:hover { margin:0px ; border:2px solid #888; }  
* {padding: 0;margin: 0;}
body, html {height: 100%;}
.modal .btn{cursor: pointer;border: 1px solid #999999;text-align: center;border-radius: 5px;outline: none;font-weight: 500;}
.dimLayer{display: block;width: 100%;background-color: rgba(0, 0, 0, 0.3);position: fixed;left: 0;top: 0px;margin: 0;padding: 0;z-index: 9998;}
.modal{width: 600px;height: 252px;border-radius: 10px;padding: 80px 24px;box-sizing: border-box;text-align: center;}
.modal-section{background: #ffffff;box-sizing: border-box;display: none;position: absolute;top: 50%;left: 50%;-webkit-transform: translate(-50%, -50%);-ms-transform: translate(-50%, -50%);-moz-transform: translate(-50%, -50%);-o-transform: translate(-50%, -50%);transform: translate(-50%, -50%);display: none;z-index: 9999;}
.menu_msg{font-size: 21px;font-weight: 500;}
.enroll_box p{padding-bottom: 56px;}
.gray_btn {width: 90px;background: #ffffff;color: #999999;height: 36px;line-height: 36px;transition: 0.5s;font-size: 17px;}
.pink_btn {width: 90px;background: #ed197a;color: #fff;height: 36px;line-height: 36px;transition: 0.5s;font-size: 17px;border: none;}
</style>
  </head>
  <body>
  
<ul id="tempList" style=" display:none"></ul>

  

    <div class="site-section">
    
      <div class="container"> 
        <div class="row mb-5">
          <div class="col-md-12 order-2">
       
         
           <form:form name= "reviewInsert" method="post" action="/member/pro/recommendInsert" modelAttribute="recVO">
                <div class="row imgIdDate" name="imgIdDate">
                 
                	<div class="col-2 profile" align="center">  
                	 <img src = /resources/Images/member/${userVO.m_img} alt="${userVO.m_img}" title="${userVO.m_img}" class="img-fluid img-circle">         
                	</div> 
                	<div class="col-10">
                	 <form:input type="hidden" path="v_mid" value="${userVO.m_id}"/>
                	 <form:input type="hidden" path="v_pid" value="${p_id}"/>
                	 
                	 <div>${userVO.m_id}</div>
                	 <div>
                	 작성일
                	 </div>
               	 	<input type="submit" value="확인"/>
                	</div>      		
                	                      
                </div>
 
                <div class="row" name="content">
                 <div class="col-12 reviewContent">
                 <br>
                <textarea rows="4" cols="50" name="v_content"></textarea>
                 </div>
                </div>                   
               </form:form>
            
        

       


            </div>
          </div>
        </div>

    
        
      </div>
     
  

  </div> 
 
  <script src="/resources/common/js/jquery-3.3.1.min.js"></script>
  <script src="/resources/common/js/jquery-ui.js"></script>
  <script src="/resources/common/js/popper.min.js"></script>
  <script src="/resources/common/js/bootstrap.min.js"></script>
  <script src="/resources/common/js/owl.carousel.min.js"></script>
  <script src="/resources/common/js/jquery.magnific-popup.min.js"></script>
  <script src="/resources/common/js/aos.js"></script>

  <script src="js/main.js"></script>

 
  </body>
   <%@ include file="/WEB-INF/views/customerFooter.jsp"%>
</html>