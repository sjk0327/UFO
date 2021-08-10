<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html>

<head>
    <title> 관리자 상품 추가 페이지 - UF&#38;O </title>
 <style>
       
	input{
	border:none;
	text-align: right;
	}
	select {
	align: right;
	}
	
	.productInfo {
	text-align: left; 
	font-weight: bold; 
	font-size: 15pt;
	}
	
	.mainContainer, subContainer {
	 margin:auto;
	}
	
    </style>

  
<%@ include file="/WEB-INF/views/adminHeader.jsp" %>
  </head>
  
  <body>
  <!-- Pre-loader start -->
  <div class="theme-loader">
      <div class="loader-track">
          <div class="preloader-wrapper">
              <div class="spinner-layer spinner-blue">
                  <div class="circle-clipper left">
                      <div class="circle"></div>
                  </div>
                  <div class="gap-patch">
                      <div class="circle"></div>
                  </div>
                  <div class="circle-clipper right">
                      <div class="circle"></div>
                  </div>
              </div>
              <div class="spinner-layer spinner-red">
                  <div class="circle-clipper left">
                      <div class="circle"></div>
                  </div>
                  <div class="gap-patch">
                      <div class="circle"></div>
                  </div>
                  <div class="circle-clipper right">
                      <div class="circle"></div>
                  </div>
              </div>
            
              <div class="spinner-layer spinner-yellow">
                  <div class="circle-clipper left">
                      <div class="circle"></div>
                  </div>
                  <div class="gap-patch">
                      <div class="circle"></div>
                  </div>
                  <div class="circle-clipper right">
                      <div class="circle"></div>
                  </div>
              </div>
            
              <div class="spinner-layer spinner-green">
                  <div class="circle-clipper left">
                      <div class="circle"></div>
                  </div>
                  <div class="gap-patch">
                      <div class="circle"></div>
                  </div>
                  <div class="circle-clipper right">
                      <div class="circle"></div>
                  </div>
              </div>
          </div>
      </div>
  </div>
  <!-- Pre-loader end -->
  
  <div id="pcoded" class="pcoded">
      <div class="pcoded-overlay-box"></div>
      <div class="pcoded-container navbar-wrapper">
          <%@ include file="/WEB-INF/views/adminNav.jsp" %>

          <div class="pcoded-main-container">
              <div class="pcoded-wrapper">
    	<%@ include file="/WEB-INF/views/adminMenu.jsp" %>
                  
                  
                  
                  
                  
                  
                  
                  
                  <div class="pcoded-content">
                      <!-- Page-header start -->
         <div class="pcoded-inner-content">
      
                            <div class="main-body">
                                <div class="page-wrapper">
                       
                                    <div class="page-body">
                                        

         
                      <!-- Page-header end -->
       <form:form method="post" action="/admin/pro/productInsert/${ productVO.p_id }" name="insertForm" modelAttribute="productVO" enctype="multipart/form-data">
                     
    
                              
                                            <!--  project and team member start -->
                                            
              
                                            <div class="col-xl-10 col-md-12">
                                                <div class="card table-card">
                                                    <div class="card-header">
                                                        <h5>상품추가</h5>
                                                        
                                                    </div>
                                                    <div class="card-block">
                                                        <div class="table-responsive col-xl-12">
                                                            
   <div class="container-fluid col-xl-12" style="text-align: center;">
   

      <div class="col-lg-12">
         <div
            class="col-1 col-lg-1   flex-column flex-shrink-0 p-3 bg-light "
            style="width: 250px;"></div>

         <main class="col-12  ms-sm-auto col-lg-12">
         <div class="row g-5" id="topmarin">

            
                
                     <div class="col-12 row">
                    	 <div class="col-7 mainContainer">                     	
                           <img  width="80%" height="80%" class="img-fluid thumbnailMain"> 							   
                    	 </div>
                   	 <div class="col-5 productInfo"> <br><br>
                  
                   	<div class="row"> <div class="col-3"><label for="p_id">상품 I D</label></div><div class="col-9" ><form:input path="p_id" type="text" id="p_id" placeholder="id를 입력하세요"  required="required"/></div></div> 
                   	<div class="row"> <div class="col-3"><label for="p_name">상품이름</label></div><div class="col-9"><form:input path="p_name" type="text" id="p_name" placeholder="이름을 입력하세요"  required="required"/></div></div> 
					<div class="row"> <div class="col-3"><label for="p_price">상품가격</label></div><div class="col-9"><form:input path="p_price" type="text"  id="p_price" value="" placeholder="입력" required="required"/>원</div></div> 
					<div class="row"> <div class="col-3"><label for="p_canBuy">구매가능</label></div><div class="col-9"><form:input path="p_canBuy" type="number"  id="p_canBuy" value="" placeholder="입력"/>개</div></div> 
					<div class="row"> <div class="col-3"><label for="p_canRent">대여가능</label></div><div class="col-9"><form:input path="p_canRent" type="number"  id="p_canRent" value="" placeholder="입력"/>개</div></div> 
           		    <div class="row"> <div class="col-6"><label for="p_category">카테고리 </label></div><div class="col-6">
           		    <form:select path="p_category" id="p_category">
           		     <form:option value="스마트폰">스마트폰</form:option>
           		     <form:option value="노트북">노트북</form:option>
           		     <form:option value="태블릿">태블릿</form:option>
           		     <form:option value="스마트워치">스마트워치</form:option>
           		     <form:option value="카메라">카메라</form:option>
           		    </form:select>
           		 </div></div> 
           		 <div class="row"><div class="col-3"><label for="fileUploadMain">메인사진</label></div><div class="col-9"><input name="mainFile" type="file" accept="image/*" id="fileUploadMain"/></div></div> <br>
           		 <div class="row"><div class="col-3"><label for="fileUploadSub">서브사진</label></div><div class="col-9"><input name="subFile" type="file" accept="image/*" id="fileUploadSub" /></div></div>
           		 	 <hr>
					<input id="button" type="button" value="등록" class="btn waves-effect waves-light btn-primary btn-outline-primary" onclick="productInsert()">&nbsp;&nbsp;&nbsp;  
					<button id="button" type="button" class="btn waves-effect waves-light btn-primary btn-outline-primary" onclick='productList()'>목록</button>				
                   	  </div>                       
                   </div>
                   
                 	 <div class="rows col-12"><hr>
				  
				     </div>
                   <div class="rows col-12 subContainer" >	 				
				  	<img width="700px" height="50%" class="img-fluid thumbnailSub">						
				   </div>
				  
				   <div class="rows col-12"><br><br>
				   <pre><textarea name="p_content" cols="70" rows="70" placeholder="내용을 입력해주세요"style="border: none; font-size:13pt;">${ productVO.p_content }</textarea></pre>
				   </div>             
      </div>
      
         </main>
         <main class="col-12 col-lg-1 ms-sm-auto  px-md-4 bg-light"></main>
         </div>
   </div>                                                       
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
   				</form:form>
   				</div>
   				</div>
   				</div>
   				</div>
   				
                                            <!--  project and team member end -->
                                        </div>
                                    </div>
                                    <!-- Page-body end -->
                                </div>
                     
                            </div>
                        </div>
  <!--이 script 없으면 css 깨짐-->
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
 
  
    <%@ include file="/WEB-INF/views/adminFooter.jsp" %>
    
</body>

</html>
