<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <title>Shoppers &mdash; Colorlib e-Commerce Template</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Mukta:300,400,700"> 
    <link rel="stylesheet" href="fonts/icomoon/style.css">

    <link rel="stylesheet" href="/resources/common/css/bootstrap.min.css">
    <link rel="stylesheet" href="/resources/common/css/magnific-popup.css">
    <link rel="stylesheet" href="/resources/common/css/jquery-ui.css">
    <link rel="stylesheet" href="/resources/common/css/owl.carousel.min.css">
    <link rel="stylesheet" href="/resources/common/css/owl.theme.default.min.css">


    <link rel="stylesheet" href="/resources/common/css/aos.css">

    <link rel="stylesheet" href="/resources/common/css/style.css">
  
  <style>
	textarea {
	border: none;
	font-size: 1em;
	background-color:transparent;
	}

	
  </style>
    <%@ include file="/WEB-INF/views/customerHeader.jsp" %>
  </head>
  <body>
  
  <div class="site-wrap">
    

   

    <div class="site-section">
      <div class="container">
        <div class="row">
          <div class="col-md-6">
            <img src=/resources/Images/product/${productVO.p_mainImg} alt="${productVO.p_mainImg}" title="${productVO.p_mainImg}" width="80%" height="80%" class="img-fluid">
          </div>
          <div class="col-md-6">
            <form:input path="p_id" value="${productVO.p_id}" hidden="true"/>
            <h2 class="text-black site-top-icons">${productVO.p_name}</h2><hr>
            <p><strong class="text-primary h4"><fmt:formatNumber value="${productVO.p_price}" pattern="###,###,###" />원</strong></p>            
            <p><strong class="text-primary h4">대여료 ${productVO.p_price* 0.05}원</strong></p>   
            <div class="mb-6">
              <div class="input-group mb-3" style="max-width: 120px;">
              <div class="input-group-prepend">
                <button class="btn btn-outline-primary js-btn-minus" type="button">&minus;</button>
              </div>
              <input type="text" class="form-control text-center" value="1" placeholder="" aria-label="Example text with button addon" aria-describedby="button-addon1">
              <div class="input-group-append">
                <button class="btn btn-outline-primary js-btn-plus" type="button">&plus;</button>
              </div>
            </div>

            </div>
            <div name="buttonGroup">
            <a href="member/rent/rentList" class="buy-now btn btn-sm btn-primary">WishList</a>
			<a href="member/buy" class="buy-now btn btn-sm btn-primary">Own</a>
			 <a href="member/rent/rentInsert" class="buy-now btn btn-sm btn-primary">Use</a>
			</div>
          </div>
        </div>
      </div>
    </div>

    <div class="site-section block-3 site-blocks-2 bg-light">
     
      <div class="container ">
      
        <div class="row justify-content-center ">
          
           <img src=/resources/Images/product/${productVO.p_subImg} width="700px" height="70%"  	 		
							alt="${ productVO.p_subImg }" title="${ productVO.p_subImg }" class="img-fluid thumbnailSub" >							  
          </div>
          <div style="text-align:center;"><pre><textarea cols="85" rows="30" disabled="true">${ productVO.p_content }</textarea></pre></div>
        </div> 
        <div><button type="button" class="btn btn-primary" onclick='productList()'>목록</button>&nbsp;&nbsp;&nbsp;
      </div>
    </div>

    <footer class="site-footer border-top">
      
    </footer>
  </div>

  <script src="/resources/common/js/jquery-3.3.1.min.js"></script>
  <script src="/resources/common/js/jquery-ui.js"></script>
  <script src="/resources/common/js/popper.min.js"></script>
  <script src="/resources/common/js/bootstrap.min.js"></script>
  <script src="/resources/common/js/owl.carousel.min.js"></script>
  <script src="/resources/common/js/jquery.magnific-popup.min.js"></script>
  <script src="/resources/common/js/aos.js"></script>

  <script src="/resources/common/js/main.js"></script>
    
  </body>
</html>