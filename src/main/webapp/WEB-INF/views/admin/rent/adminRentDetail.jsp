<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
   <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>


<!DOCTYPE html>
<html lang="ko">

<head>
    <title>admin rent Detail </title>

<%@ include file="/WEB-INF/views/adminHeader.jsp" %>
<style type="text/css">
#returnbtn,#latebtn, #returnbtn:focus,#latebtn:focus, #returnbtn:visited,#latebtn:visited, #returnbtn:active,#latebtn:active {
	background-color: white !important;
	border: 1px solid #7971ea;
	color: #4d4d4d !important;
}

#returnbtn:hover,#latebtn:hover {
	background-color: white;
	border: 1px solid #1f7b70;
	color: #4d4d4d;
}

#returnbtn,#latebtn {
	border-radius: 0.25rem;
}
</style>
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

                        <div class="pcoded-inner-content">
      
                            <div class="main-body">
                                <div class="page-wrapper">
                       
                                    <div class="page-body">
                                        
                                        
                                        
                                        
                                        
                                        
                                        <div class="row">

                                            <!--  project and team member start -->
                                            <div class="col-xl-10 col-md-12">
                                                <div class="card table-card">
                                                    <div class="card-header">
                                                        <h5>${rentInfo.r_mid } 님의 ${rentInfo.r_pid } 대여/구매 현황</h5>
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
                              <h3 >${rentInfo.r_mid }</h3>
                              <h4>${memInfo.m_name }</h4>
                              <br>
                              <div>${memInfo.m_name } 님의 다른 대여/구매</div>
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
						대여일자 &nbsp;&nbsp;: &nbsp;&nbsp;${rentInfo.r_sdate }</div>
						<div class="col-md-1">
						|</div>
						<div class="col-md-6">대여 번호&nbsp;&nbsp; :&nbsp;&nbsp;  ${rentInfo.r_id }</div>
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
						<span class="col-md-2">${proInfo.p_id }</span>
						<span class="col-md-3">${proInfo.p_name }</span>
						<span class="col-md-2" style="font-weight: bold;">
						<c:if test="${rentInfo.r_state eq '대여중' || rentInfo.r_state eq '반납 요청'|| rentInfo.r_state eq '반납 완료'}">
						<%= "대여" %>
						</c:if>
						<c:if test="${rentInfo.r_state eq '구매 확정' || rentInfo.r_state eq '즉시 구매'}">
						<%= "구매" %>
						</c:if>
						</span>
						<span class="col-md-3">
						
						<c:if test="${rentInfo.r_state eq '대여중' || rentInfo.r_state eq '반납 요청'|| rentInfo.r_state eq '반납 완료'}">
						<fmt:parseNumber var="totalprice" value="${proInfo.p_price * 0.05 * rentInfo.r_rent}" integerOnly="true" />
						${totalprice}<%="원 (" %>${rentInfo.r_rent }<%="개)" %>
						</c:if>
						<c:if test="${rentInfo.r_state eq '구매 확정' || rentInfo.r_state eq '즉시 구매'}">
						<fmt:parseNumber var="totalprice" value="${proInfo.p_price * 0.95 * rentInfo.r_rent}" integerOnly="true" />
						${totalprice}<%="원 (" %>${rentInfo.r_rent }<%="개)" %>
						</c:if>

						
						
						
						</span>
						
						<!-- 상태 색깔 변경 로직 부분  추가-->
						<span class="col-md-2"> 
						<c:if test="${rentInfo.r_state eq '대여중'}">
						<fmt:parseDate var="tempToday" value="${rentInfo.r_sdate}" pattern="yyyy-MM-dd"/>
  						<fmt:parseNumber var="sdate" value="${tempToday.time / (1000*60*60*24)}" integerOnly="true"/>
   						<c:set var="now" value="<%=new java.util.Date()%>" />
    					<fmt:parseNumber var="today" value="${now.time / (1000*60*60*24)}" integerOnly="true"/>
						<c:if test="${sdate+3>=today}"><label class="btn btn-primary">대 여  중</label></c:if>
						<c:if test="${sdate+3<today}"><label class="btn btn-danger">연 체  중</label></c:if>
						</c:if>
						<c:if test="${rentInfo.r_state eq '즉시 구매' || rentInfo.r_state eq '구매 확정'}"><label class="btn btn-info">구매 완료</label></c:if>
						<c:if test="${rentInfo.r_state eq '반납 요청'}"><label class="btn btn-warning">반납 요청</label></c:if>
						<c:if test="${rentInfo.r_state eq '반납 완료'}"><label class="btn btn-success">반납 완료</label></c:if>
						</span>
						<!-- 상태 색깔 변경 로직 부분  끝 -->
						
						</div>
					</div>
				</div>
                 <br>
                 <div style="text-align: left; font-weight: bold; font-size: 15pt;">결제 정보 확인</div>
				<hr>
               
				<c:forEach var="buyInfo" items="${buyList}">
                   <div class="row">
					<div class="col">
						<div class="row">
						<span class="col-md-6" style="height: 150px; padding: 50px;">${buyInfo.b_how }</span>
						<span class="col-md-6" style="font-size: 13pt; color: white; height: 150px; padding: 5px; background-color: #7971ea">
						<div style="text-align: left;"><%= "상품 가격 : " %>${proInfo.p_price }<%="원" %></div>
						<div style="text-align: left;"><%= "대여 구매 정보 : " %>${buyInfo.b_state }</div>
						<div style="text-align: left;"><%= "수량 : " %>${buyInfo.b_amount }</div>
						<hr>
						<div style="font-size: 15pt; font-weight: bold; text-align: left;"><%= "결제 가격 : " %>
						
						<c:if test="${buyInfo.b_state eq '대여'}">
						<fmt:parseNumber var="totalprice" value="${proInfo.p_price * 0.05 * buyInfo.b_amount}" integerOnly="true" />
						${totalprice}<%="원 (" %>${buyInfo.b_amount }<%="개)" %>
						</c:if>
						<c:if test="${buyInfo.b_state eq '구매'}">
						<fmt:parseNumber var="totalprice" value="${proInfo.p_price * 0.95 * buyInfo.b_amount}" integerOnly="true" />
						${totalprice}<%="원 (" %>${buyInfo.b_amount }<%="개)" %>
						</c:if>
						<c:if test="${buyInfo.b_state eq '즉시 구매'}">
						<fmt:parseNumber var="totalprice" value="${proInfo.p_price * 0.95 * buyInfo.b_amount}" integerOnly="true" />
						${totalprice}<%="원 (" %>${buyInfo.b_amount }<%="개)" %>
						</c:if>
						</div>
						</span>
						</div>
					</div>
				</div>
					<hr>
				</c:forEach>
                   <br><br>
                 
                 
                  <div class="row">
					<div class="col-md-9"></div>
                  <div class="col-md-3">
                  
                  <form:form method="post" action="/admin/rent/returnConfirm" modelAttribute="rentInfo">
					<form:hidden path="r_id"/>
                		<c:if test="${rentInfo.r_state eq '반납 요청'}">
							<button type="submit" id="returnbtn"
							class="btn btn-info float-right btn-toggle switch">반납확인</button>
						</c:if>

				</form:form>
                
						  <form:form method="post" action="/admin/rent/sendLateMessage" modelAttribute="rentInfo">
					<form:hidden path="r_id"/>
					
				<c:if test="${rentInfo.r_state eq '대여중'}">
						<c:if test="${sdate+3<today}">
						<c:choose>
							<c:when test="${messageCount eq 0}">
								<button type="submit" id="latebtn"
								class="btn btn-info float-right btn-toggle switch">연체 알림 메세지 보내기</button>
							</c:when>
							<c:otherwise>
							<button type="submit" id="latebtn"
								class="btn btn-info float-right btn-toggle switch" disabled="disabled">연체 알림 메세지 보내기</button>
							</c:otherwise>
							</c:choose>
						</c:if>
						</c:if>

						
	


						</form:form>
	
</div>
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
    
    <script>
    $('#returnbtn').click(function() {
      				
      					if (confirm("해당 회원의 대여 제품을 반납 처리하시겠습니까?") == true){   
      						window.location='/admin/rent/returnConfirm';
      			  	  }else{   
      						 event.preventDefault();
      			           event.stopPropagation();

      			  	  };	
      				});
    
    $('#latebtn').click(function() {
			
			if (confirm("해당 회원에게 연체료 결제 주의 안내 메세지를 보내시겠습니까?") == true){   
	
	  	  }else{   
				 event.preventDefault();
	           event.stopPropagation();

	  	  };	
		});
    </script>
</body>

</html>
