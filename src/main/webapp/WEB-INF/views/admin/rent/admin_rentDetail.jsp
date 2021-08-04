<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <title>admin rent Detail </title>
  
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
                                                        <h5>@@@ 님의 $$$ 대여/구매 현황</h5>
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
                              <h3 >고객 아이디</h3>
                              <h4>고객 이름</h4>
                              <br>
                              <div>@@@ 님의 다른 대여/구매</div>
                             </p>
                           
                        </div>
                        </div>
                    <div class="col-9">
                   
                    <div style="text-align: left; font-weight: bold; font-size: 15pt;">대여/구매 정보 상세보기</div>
                    <br>
                    <div style="border: solid; color: gray;">
						<div style="font-size: 13pt; font-weight: bold;">
						<div class="row" style="height: 50px; padding: 10px;">
						<div class="col-md-5">
						대여일자 &nbsp;&nbsp;: &nbsp;&nbsp;2021-08-04</div>
						<div class="col-md-1">
						|</div>
						<div class="col-md-6">대여 번호&nbsp;&nbsp; :&nbsp;&nbsp;  35</div>
						</div>
						</div>
</div>

                 <hr>
                 
                 
                 
             
                 <div class="row">
					<div class="col">
						<div class="row">
						<span class="col-md-2"><%= "상품 등록 번호" %></span>
						<span class="col-md-3"><%= "상품 정보" %></span>
						<span class="col-md-2"><%= "대여 / 구매" %></span>
						<span class="col-md-3"><%= "금액 (수량)" %></span>
						<span class="col-md-2"><%= "진행 상태" %></span>
						
						</div>
					</div>
				</div>

                
                   <div class="row bg-light" style="height: 200px; padding: 50px 0px 50px 0px;">
					<div class="col">
						<div class="row">
						<span class="col-md-2"><%= "p_h004" %></span>
						<span class="col-md-3"><%= "아이폰12" %></span>
						<span class="col-md-2" style="font-weight: bold;"><%= "대여" %></span>
						<span class="col-md-3"><%= "100000(2개)" %></span>
						<span class="col-md-2">   <label class="label label-danger" style="font-size: 12pt;">연체중</label></span>
						
						</div>
					</div>
				</div>
                 <br>
                 <div style="text-align: left; font-weight: bold; font-size: 15pt;">결제 정보 확인</div>
        
				<hr>
      
                

                
                   <div class="row">
					<div class="col">
						<div class="row">
						<span class="col-md-6" style="height: 150px; padding: 50px;"><%= "신용 카드" %></span>
						<span class="col-md-6" style="font-size: 13pt; color: white; height: 150px; padding: 5px; background-color: #7971ea">
						<div style="text-align: left;"><%= "상품 가격 : 1000000원" %></div>
						<div style="text-align: left;"><%= "대여 구매 정보 : 대여(가격의 5%)" %></div>
						<div style="text-align: left;"><%= "수량 : 2개" %></div>
						<hr>
						<div style="font-size: 15pt; font-weight: bold; text-align: left;"><%= "결제 가격 : 100000원" %></div>
						</span>
						
						
						</div>
					</div>
				</div>
                  
                   <br><br>
                 
                 
                  <div class="row">
					<div class="col-md-9"></div>
                  <div class="col-md-3"> <button>반납 확인</button></div>
                   </div>
                

                   
                   
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
   
                                            <!--  project and team member end -->
                                        </div>
                                    </div>
                                    <!-- Page-body end -->
                                </div>
                     
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
   
    <%@ include file="/WEB-INF/views/adminFooter.jsp" %>
</body>

</html>
