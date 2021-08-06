<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <title>관리자 상품관리</title>
   
   
   
  
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
         
                      <!-- Page-header end -->
       <form action="admin/pro/productUpdate" method="post" enctype="multipart/form-data">
                        <div class="pcoded-inner-content">
                            <!-- Main-body start -->
                            <div class="main-body">
                                <div class="page-wrapper">
                                    <!-- Page-body start -->
                                    <div class="page-body">
                                        <div class="row">

    
                              
                    
    
                                            <!--  project and team member start -->
                                            
              
                                            <div class="col-xl-10 col-md-12">
                                                <div class="card table-card">
                                                    <div class="card-header">
                                                        <h5>상품관리</h5>
                                                        <div class="card-header-right">
                                                            <ul class="list-unstyled card-option">
                                                                <li><i class="fa fa fa-wrench open-card-option"></i></li>
                                                                <li><i class="fa fa-window-maximize full-card"></i></li>
                                                                <li><i class="fa fa-refresh reload-card"></i></li>
                                                          
                                                            </ul>
                                                        </div>
                                                    </div>
                                                    <div class="card-block">
                                                        <div class="table-responsive col-xl-12">
                                                             <script src="https://kit.fontawesome.com/848d8f1fa9.js" crossorigin="anonymous"></script>
   <div class="container-fluid col-xl-12" style="text-align: center;">
   

      <div class="col-lg-12">
         <div
            class="col-1 col-lg-1   flex-column flex-shrink-0 p-3 bg-light "
            style="width: 250px;"></div>

         <main class="col-12  ms-sm-auto col-lg-12">
         <div class="row g-5" id="topmarin">

            <div class="col-md-12">
               <div class="container" >
                  <div class="row">
                
                     <div class="col-12">
                     <div class="row">
                     <div class="col-3">
                         <div class="p-4 mb-8 col-lg-12" style="background-color: #4e5a72; color: white;">
                          <p>
                              <img src=/resources/img/${ productInfo.p_mainImg } width="70%" height="60%"
							alt="${ productInfo.p_mainImg }" title="${ productInfo.p_mainImg }" class="img-fluid">
                              <br>
                             <input type=file name="mainImg" >
                             </p>
                           
                        </div>
                        </div>
                    <div class="col-9">
                   
                    <div style="text-align: left; font-weight: bold; font-size: 15pt;">
                    <input type="text" name="p_id" value="${ productInfo.p_id }" size="10"/>                  
                   
                    
                    </div>
                    <br>
                    <div>
					<input type="text" name="p_name" value="${ productInfo.p_name }" size="10"/>
					</div>

                 <div>
					<input type="text" name="p_price" value="${ productInfo.p_price }" size="10"/>
				</div>

                
                   <div class="row bg-light" style="height: 200px; padding: 50px 0px 50px 0px;">
					<div class="col">
						 <input type="text" name="p_canBuy" value="${ productInfo.p_canBuy }" size="10"/>
					</div>
				</div>
                 <br>
                 <div style="text-align: left; font-weight: bold; font-size: 15pt;">
           		   <input type="text" name="p_category" value="${ productInfo.p_category }" size="10"/>
                 </div>
        
				<hr>
             
                   <div class="row">
					<div class="col">
				  	<img src=/resources/img/${ productInfo.p_subImg } width="70%" height="60%"
							alt="${ productInfo.p_subImg }" title="${ productInfo.p_subImg }" class="img-fluid">
					 <br>
                             <input type=file name="subImg" >
					</div>
				   </div>
				   
				   <div>
				    <input type="text" name="p_content" value="${ productInfo.p_content }" style="width: 200px; height: 300px;"/>
				   </div>
				   <input type="submit" value="수정">&nbsp;&nbsp;&nbsp;<a href="admin/pro/productDelete?seq=${productInfo.p_id }">삭제</a>
                   </div>
           
                     </div>
                  </div>
      </div>
      </div>
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
   				</form>
                                            <!--  project and team member end -->
                                        </div>
                                    </div>
                                    <!-- Page-body end -->
                                </div>
                     
                            </div>
                        </div>

   
    <%@ include file="/WEB-INF/views/adminFooter.jsp" %>
</body>

</html>
