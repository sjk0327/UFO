<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en" >
  <head>
    <title>상품리스트(고객)</title>
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
</style>
  </head>
  <body>
<ul id="tempList" style=" display:none"></ul>

  <div class="site-wrap">
    <header class="site-navbar" role="banner">
      <nav class="site-navigation text-right text-md-center" role="navigation">
        <div class="container">
          <ul class="site-menu js-clone-nav d-none d-md-block">
            <li class="has-children">
              <div class="row">
          <div class="col-md-12">
            <div class="site-section site-blocks-2">
                <div class="row justify-content-center text-center mb-5">
                  <div class="col-md-7 site-section-heading pt-4">
                    <h2></h2>
                  </div>
                </div>
                


                <div class="row" id="picCategory" >
                  <div id="total" class="col-md-2 " data-aos="fade" data-aos-delay="">
                    <a id="total" class="block-2-item" href="/member/pro/productList/" >
                      <figure class="image" >
                     <img id="total"class="small2" src="/resources/common/images/total.jpg" alt="" class="img-fluid">
                    <%--  <img src=/resources/Images/product/${productVO.p_subImg} width="50%" height="50%"
				  	alt="${ productVO.p_subImg }" title="${ productVO.p_subImg }" class="img-fluid thumbnailSub"> --%>
                     </figure>
                     
                    </a>
                  </div>
            
                  <div class="col-md-2 " data-aos="fade" data-aos-delay="100">
                   	<a class="block-2-item" href="/member/pro/productList/스마트폰 ">
                  
                    <!-- <a class="block-2-item" href="/member/pro/productList/스마트폰" > -->
                      <figure class="image">
                        <img id="smartPhone" class="small1" src="/resources/common/images/phone.jpg" alt="" class="img-fluid">
                      </figure>
                      
                    </a>
                  </div>
                  <div class="col-md-2 " data-aos="fade" data-aos-delay="200">
                    <a class="block-2-item" href="/member/pro/productList/노트북" >
                      <figure class="image">
                        <img id="laptop" class="small1" src="/resources/common/images/laptop.jpg" alt="" class="img-fluid">
                      </figure>
                     
                    </a>
                  </div>
                  <div class="col-md-2 " data-aos="fade" data-aos-delay="200">
                    <a class="block-2-item" href="/member/pro/productList/카메라" >
                      <figure class="image">
                        <img id="camera" class="small1" src="/resources/common/images/camera.jpg" alt="" class="img-fluid">
                      </figure>
                      
                    </a>
                  </div>
                  <div class="col-md-2 " data-aos="fade" data-aos-delay="200">
                    <a class="block-2-item" href="/member/pro/productList/스마트워치" >
                      <figure class="image">
                        <img id="watch" class="small1" src="/resources/common/images/watch.jpg" alt="" class="img-fluid">
                      </figure>
                     
                    </a>
                  </div>
                  <div class="col-md-2 " data-aos="fade" data-aos-delay="200">
                    <a class="block-2-item" href="/member/pro/productList/태블릿" >
                      <figure class="image">
                        <img id="tablet" class="small1" src="/resources/common/images/tablet.jpg" alt="" class="img-fluid">
                      </figure>
                     
                    </a>
                  </div>
                  
                </div>
              
            </div>
          </div>
        </div>
        
      </nav>
    </header>

    <div class="bg-light py-3">
      <div class="container">
        <div class="row">
          <div class="col-md-12 mb-0"><a href="">Home</a> <span class="mx-2 mb-0">/</span> <strong class="text-black">Shop</strong></div>
        </div>
      </div>
    </div>
		
    <div class="site-section">
      <div class="container"> 
        <div class="row mb-5">
          <div class="col-md-9 order-2">
            <div class="row">
              <div class="col-md-12 mb-5">
                <div class="float-md-left mb-4"><h2 class="text-black h5">Shop All</h2></div>
                <div class="d-flex" id="sort">
                  <div class="dropdown mr-1 ml-md-auto">
                 
                    <button type="button" class="btn btn-secondary btn-sm"  id="sortPh" name="sortPh " aria-haspopup="true" aria-expanded="false">높은가격순</button>
                    <button type="button" class="btn btn-secondary btn-sm"  id="sortPl" name="sortPl " aria-haspopup="true" aria-expanded="false">낮은가격순</button>
                    <button type="button" class="btn btn-secondary btn-sm"  id="sortRecommand" name="sortRecommand " aria-haspopup="true" aria-expanded="false">추천순</button>
                  </div>
                <!--   <div class="btn-group">
                    <button type="button" class="btn btn-secondary btn-sm" 
                    				id="sortR" name="sortR" >추천순</button>
                    
                  </div> -->
                </div>
              </div>
            </div>
           
            <div class="row mb-5" id="ulList">
            
            
            
            
            <c:forEach var="list" items="${productList}" begin="0" end="10" step="1" varStatus="status">
			
              <div class="col-sm-6 col-lg-4 mb-4" data-aos="fade-up"onclick="location.href='/member/pro/productDetail/${list.p_id}'">             
                <div class="block-4 text-center border">
                  <figure class="block-4-image">
                    <a href="/member/pro/productDetail/${list.p_id}"><img src="/resources/img/iPad.jpg" alt="상품 사진" class="img-fluid"></a>
                  </figure>
                  <div class="block-4-text p-4">
                    <p> 상품코드  : <a href="/member/pro/productDetail/${list.p_id}">${list.p_id }</a></p>
                    <p class="mb-0">${list.p_name }</p>
                    <p class="text-primary font-weight-bold" >${list.p_category }</p>
                    <p class="text-primary font-weight-bold" >상품가격  : <fmt:formatNumber value="${list.p_price}" pattern="###,###,###" />원</p>
                  </div>
                </div>
              </div>
             </c:forEach> 
            
             
            <c:if test="${productList eq list}"> 
            
            
            <c:forEach var="list" items="${productList}" begin="0" end="10" step="1" varStatus="status">
			
              <div class="col-sm-6 col-lg-4 mb-4" data-aos="fade-up"onclick="location.href='/member/pro/productDetail/${list.p_id}'">             
                <div class="block-4 text-center border">
                  <figure class="block-4-image">
                    <a href="/member/pro/productDetail/${list.p_id}"><img src="/resources/img/iPad.jpg" alt="상품 사진" class="img-fluid"></a>
                  </figure>
                  <div class="block-4-text p-4">
                    <p> 상품코드  : <a href="/member/pro/productDetail/${list.p_id}">${list.p_id }</a></p>
                    <p class="mb-0">${list.p_name }</p>
                    <p class="text-primary font-weight-bold" >${list.p_category }</p>
                    <p class="text-primary font-weight-bold" >상품가격  : <fmt:formatNumber value="${list.p_price}" pattern="###,###,###" />원</p>
                  </div>
                </div>
              </div>
             </c:forEach> 
             </c:if>
             
             
             
              <c:if test="${productList eq rlist}"> 
   			<c:forEach var="list" items="${productList}" begin="0" end="10" step="1" varStatus="status">
			
              <div class="col-sm-6 col-lg-4 mb-4" data-aos="fade-up"onclick="location.href='/member/pro/productDetail/${list.p_id}'">             
                <div class="block-4 text-center border">
                  <figure class="block-4-image">
                    <a href="/member/pro/productDetail/${list.p_id}"><img src="/resources/img/iPad.jpg" alt="상품 사진" class="img-fluid"></a>
                  </figure>
                  <div class="block-4-text p-4">
                    <p> 상품코드  : <a href="/member/pro/productDetail/${list.p_id}">${list.p_id }</a></p>
                    <p class="mb-0">${list.p_name }</p>
                    <p class="text-primary font-weight-bold" >${list.p_category }</p>
                    <p class="text-primary font-weight-bold" >상품가격  : <fmt:formatNumber value="${list.p_price}" pattern="###,###,###" />원</p>
                  </div>
                </div>
              </div>
             </c:forEach> 
             </c:if>
		<!-- 상품리스트 페이징 처리  -->
            </div>
            <div class="row" data-aos="fade-up">
              <div class="col-md-12 text-center">
                <div class="site-block-27">
                  <ul>
                    <li><a href="#">&lt;</a></li>
                    <li class="active"><span>1</span></li>
                    <li><a href="#">2</a></li>
                    <li><a href="#">3</a></li>
                    <li><a href="#">4</a></li>
                    <li><a href="#">5</a></li>
                    <li><a href="#">&gt;</a></li>
                  </ul>
                </div>
              </div>
            </div>
          </div>

          <div class="col-md-3 order-1 mb-5 mb-md-0">
            <div class="border p-4 rounded mb-4">
              <h3 class="mb-3 h6 text-uppercase text-black d-block">Categories</h3>
              
              <ul class="list-unstyled mb-0">
                <li class="mb-1"><a href="/member/pro/productList/" class="d-flex"><span>전체</span> <span class="text-black ml-auto">(${totalCount})</span></a></li>
                <li class="mb-1"><a href="/member/pro/productList/스마트폰" class="d-flex"><span>핸드폰</span> <span class="text-black ml-auto">(${countSmartPhone})</span></a></li>
                <li class="mb-1"><a href="#" class="d-flex"><span>노트북</span> <span class="text-black ml-auto">(${countLaptop})</span></a></li>
                <li class="mb-1"><a href="#" class="d-flex"><span>카메라</span> <span class="text-black ml-auto">(${countCamera})</span></a></li>
                  <li class="mb-1"><a href="#" class="d-flex"><span>스마트워치</span> <span class="text-black ml-auto">(${countWatch})</span></a></li>
                   <li class="mb-1"><a href="#" class="d-flex"><span>태블릿</span> <span class="text-black ml-auto">(${count})</span></a></li>
              </ul>
            </div>

            <div class="border p-4 rounded mb-4">
              <div class="mb-4">
                <h3 class="mb-3 h6 text-uppercase text-black d-block">Filter by Price</h3>
                <div id="slider-range" class="border-primary"></div>
                <input type="text" name="text" id="amount" class="form-control border-0 pl-0 bg-white" disabled="" />
              </div>

             <!--   <div class="mb-4">
                <h3 class="mb-3 h6 text-uppercase text-black d-block">Size</h3>
                <label for="s_sm" class="d-flex">
                  <input type="checkbox" id="s_sm" class="mr-2 mt-1"> <span class="text-black">64</span>
                </label>
                <label for="s_md" class="d-flex">
                  <input type="checkbox" id="s_md" class="mr-2 mt-1"> <span class="text-black">Medium (1,282)</span>
                </label>
                <label for="s_lg" class="d-flex">
                  <input type="checkbox" id="s_lg" class="mr-2 mt-1"> <span class="text-black">Large (1,392)</span>
                </label>
              </div>
              -->

          <div class="mb-4">
            <h3 class="mb-3 h6 text-uppercase text-black d-block">Color</h3>
            <a href="#" class="d-flex color-item align-items-center" >
              <span class="bg-danger color d-inline-block rounded-circle mr-2"></span> <span class="text-black">Red (2,429)</span>
            </a>
            <a href="#" class="d-flex color-item align-items-center" >
              <span class="bg-success color d-inline-block rounded-circle mr-2"></span> <span class="text-black">Green (2,298)</span>
            </a>
            <a href="#" class="d-flex color-item align-items-center" >
              <span class="bg-info color d-inline-block rounded-circle mr-2"></span> <span class="text-black">Blue (1,075)</span>
            </a>
            <a href="#" class="d-flex color-item align-items-center" >
              <span class="bg-primary color d-inline-block rounded-circle mr-2"></span> <span class="text-black">Purple (1,075)</span>
            </a>
              </div>

            </div>
          </div>
        </div>
<
        <div class="row">
          <div class="col-md-12">
            <div class="site-section site-blocks-2">
                <div class="row justify-content-center text-center mb-5">
                  <div class="col-md-7 site-section-heading pt-4">
                    <h2>Categories</h2>
                  </div>
                </div>
                <div class="row">
                  <div class="col-sm-6 col-md-6 col-lg-4 mb-4 mb-lg-0" data-aos="fade" data-aos-delay="">
                    <a class="block-2-item" href="#">
                      <figure class="image">
                        <img src="/resources/common/images/women.jpg" alt="" class="img-fluid">
                      </figure>
                      <div class="text">
                        <span class="text-uppercase">Collections</span>
                        <h3>Women</h3>
                      </div>
                    </a>
                  </div>
                  <div class="col-sm-6 col-md-6 col-lg-4 mb-5 mb-lg-0" data-aos="fade" data-aos-delay="100">
                    <a class="block-2-item" href="#">
                      <figure class="image">
                        <img src="/resources/common/images/children.jpg" alt="" class="img-fluid">
                      </figure>
                      <div class="text">
                        <span class="text-uppercase">Collections</span>
                        <h3>Children</h3>
                      </div>
                    </a>
                  </div>
                  <div class="col-sm-6 col-md-6 col-lg-4 mb-5 mb-lg-0" data-aos="fade" data-aos-delay="200">
                    <a class="block-2-item" href="#">
                      <figure class="image">
                        <img src="/resources/common/images/men.jpg" alt="" class="img-fluid">
                      </figure>
                      <div class="text">
                        <span class="text-uppercase">Collections</span>
                        <h3>Men</h3>
                      </div>
                    </a>
                  </div>
                </div>
              
            </div>
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