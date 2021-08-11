<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <title> 내 정보 페이지 - UF&#38;O </title>
    <%@ include file="/WEB-INF/views/adminHeader.jsp" %>
    <%@ include file="/WEB-INF/views/customerHeader.jsp" %>

    <style>
        .filebox input[type="file"] { 
            position: absolute; 
            width: 1px; 
            height: 1px; 
            padding: 0;
            margin: -1px; 
            overflow: hidden; 
            clip:rect(0,0,0,0); 
            border: 0; 
        } 
        .filebox label { 
            display: inline-block; 
            padding: .5em .75em; 
            color: #999; 
            font-size: inherit;
            line-height: normal; 
            vertical-align: middle; 
            background-color: #fdfdfd; 
            cursor: pointer; 
            border: 1px solid #ebebeb; 
            border-bottom-color: #e2e2e2; 
            border-radius: .25em; 
        } /* named upload */ 
        .filebox .upload-name { 
            display: inline-block; 
            padding: .5em .75em; /* label의 패딩값과 일치 */ 
            font-size: inherit;
            font-family: inherit; 
            line-height: normal; 
            vertical-align: middle; 
            background-color: #f5f5f5;
            border: 1px solid #ebebeb; 
            border-bottom-color: #e2e2e2;
            border-radius: .25em; 
        }
       
       
        
        

    </style>
    
</head>

  <body>
  
  <div id="pcoded" class="pcoded">
      <div class="pcoded-overlay-box"></div>
      <div class="pcoded-container navbar-wrapper">
        
          <div class="pcoded-main-container">
             <div class="pcoded-wrapper">
             
                  <div class="pcoded-content">
               <div class="pcoded-inner-content">
                            <!-- Main-body start -->
                            <div class="main-body">
                                <div class="page-wrapper">
                                    <!-- Page-body start -->
                                    <div class="page-body">
                                        <div class="row">

                                            <!--  sale analytics start -->
                                            <div class="col-xl-6 col-md-12">
                                                <!-- 회원 개인 정보 수정 가능하게끔 -->
                                                <div class="card">
                                                   <div class="card-header">
                                                      <h5>개인 정보</h5>
                                                   </div>
                                                   <div class="card-block">
                                                      <form:form class="form-material" action="/member/mem/userInfo/${userInfo.m_id }" method="post" enctype="multipart/form-data" modelAttribute="userVO">
                                                      <div class="row">
                                                         <div class="col-sm-4">
                                                            <!-- 사진 나오게 하고 찾아보기 버튼 -->
                                                            <div class="filebox"> 
														        <div class="m_imgPreview">
																	<img src="/resources/Images/member/${userInfo.m_img }" class="img-fluid img-circle">
														        </div>
														        <input class="upload-name" value="파일선택" disabled="disabled" /> 
														        <label for="input-file">업로드</label> 
														        <input type="file" name="uploadFile" id="input-file" class="upload-hidden" /> 
														    </div>
														   
                                                         </div>
                                                         <div class="col-sm-8">
                                                            <div class="form-group row">
                                                               <div class="col-sm-3 col-form-label">아이디</div>
                                                               <div class="form-group form-primary form-static-label col-sm-9">
                                                                  <form:input path="m_id" />
                                                                  <span class="form-bar"></span>
                                                               </div>
                                                            </div>
                                                            <div class="form-group row">
                                                               <div class="col-sm-3 col-form-label">이 름</div>
                                                               <div class="form-group form-primary form-static-label col-sm-9">
                                                                  <form:input type="text" path="m_name" class="form-control form-control-center form-control-round form-control-bold" placeholder="필수 항목 입니다." required="required"/>
                                                                  <span class="form-bar"></span>
                                                               </div>
                                                            </div>
                                                            <div class="form-group row">
                                                               <div class="col-sm-3 col-form-label">성별</div>
                                                               <div class="form-group form-primary form-static-label col-sm-9">
                                                                  <form:input type="text" path="m_gender" class="form-control form-control-center form-control-round form-control-bold" readonly="readonly"/>
                                                                  <span class="form-bar"></span>
                                                               </div>
                                                            </div>
                                                         </div>
                                                      </div>
                                                      <div class="form-group row">
                                                         <div class="col-sm-2 col-form-label">주소</div>
                                                         <div class="form-group form-primary form-static-label col-sm-10">
                                                         <!-- 주소 split 으로 나눠서 token 화 하기 -->
                                                            <div class="row">
                                                               <div class="col-sm-6">
                                                                  <form:input type="text" id="postcode" path="m_addr" value="${fn:split(userInfo.m_addr,',')[0]}" class="form-control" placeholder="우편번호" required="required"/>
                                                                  <span class="form-bar"></span>
                                                               </div>
                                                               <div class="col-sm-6">
                                                                  <input type="button" onclick="daumPostcode()" value="우편번호 찾기" class="btn btn-mat waves-effect waves-light btn-info " style="background-color: #7971ea;"/>
                                                               </div>
                                                            </div>
                                                            <form:input type="text" id="address" path="m_addr" value="${fn:split(userInfo.m_addr,',')[1]}" class="form-control" placeholder="주소" required="required"/>
                                                            <span class="form-bar"></span>
                                                            <div class="row">
                                                               <div class="col-sm-6">
                                                                  <form:input type="text" id="detailAddress" path="m_addr" value="${fn:split(userInfo.m_addr,',')[2]}" class="form-control" placeholder="상세주소" required="required"/>
                                                                  <span class="form-bar"></span>
                                                               </div>
                                                               <div class="col-sm-6">
                                                                  <form:input type="text" id="extraAddress" path="m_addr" value="${fn:split(userInfo.m_addr,',')[3]}" class="form-control" placeholder="참고항목"/>
                                                                  <span class="form-bar"></span>
                                                               </div>
                                                            </div>      
                                                         </div>
                                                      </div>
                                                      <div class="form-group row">
                                                         <div class="col-sm-2 col-form-label">전화번호</div>
                                                         <div class="form-group form-primary form-static-label col-sm-10">
                                                            <form:input type="text" path="m_tel" class="form-control form-control-center form-control-round form-control-bold" placeholder="필수 항목 입니다." required="required"/>
                                                            <span class="form-bar"></span>
                                                         </div>
                                                      </div>
                                                      <div class="form-group row">
                                                         <div class="col-sm-2 col-form-label">이메일</div>
                                                         <div class="form-group form-primary form-static-label col-sm-10">
                                                            <form:input type="text" path="m_email" class="form-control form-control-center form-control-round form-control-bold" placeholder="필수 항목 입니다." required="required"/>
                                                            <span class="form-bar"></span>
                                                         </div>
                                                      </div>
                                                      <div class="form-group row">
                                                         <div class="col-sm-2 col-form-label">포인트</div>
                                                         <div class="form-group form-primary form-static-label col-sm-10">
                                                            <form:input type="text" path="m_point" class="form-control form-control-center form-control-round form-control-bold" placeholder="필수 항목 입니다." required="required"/>
                                                            <span class="form-bar"></span>
                                                         </div>
                                                      </div>
                                                      <div class="form-group row">
                                                         <div class="col-sm-2 col-form-label">가입날짜</div>
                                                         
                                                         <!--<fmt:formatDate var="formatRegDate" value="${userVO.m_regdate}" pattern="yyyy년 MM월 dd일, HH시 MM분 SS초"/>
                                                            <input value="${formatRegDate}" class="form-control form-control-center form-control-round form-control-bold" placeholder="필수 항목 입니다." readonly="readonly"/>-->
                                                         <div class="form-group form-primary col-sm-10">
                                                            <form:input type="date" name="m_regdate" path="m_regdate"/>
                                                            <span class="form-bar"></span>
                                                         </div>
                                                      </div>
                                                      <div class="row">
                                                         <div>
                                                            <input type="submit" id="button" value="수정" class="btn waves-effect waves-light btn-primary btn-outline-primary">
                                                         </div>
                                                         <div>
                                                            <input type="submit" id="button" value="탈퇴" class="btn waves-effect waves-light btn-primary btn-outline-primary">
                                                         </div>
                                                      </div>
                                                      </form:form>
                                                   </div>
                                                </div>
                                            </div>
                                            <div class="col-xl-6 col-md-12">
                                            <!-- 여기 안에 두개를 넣어서 밑으로 두개 나오게 함 -->  
                                            
                                           <!-- 회원 대여 현황(간략) -->
                                           <div class="card table-card">
                                                   <div class="card-header">
                                                      <h5>대여 현황</h5>
                                                   </div>
                                                   <div class="card-block">
                                                      <div class="table-responsive">
                                                            <table class="table table-hover">
                                                             
                                                            <c:forEach var="list" items="${rentList }">
                                                            <tbody>
                                                               <tr onClick="location.href='/admin/rent/rentDetail/${list.r_id}'">
                                                               <td>
                                                                  <div class="d-inline-block align-middle">
                                                                     <img src="/resources/Images/tempProductImage.jpg" class="img-radius img-40 align-top m-r-15">
                                                                     <div class="d-inline-block">
                                                                     <h6>${list.p_name }</h6>
                                                                     <p class="text-muted m-b-0">상품 카테고리</p>
                                                                  </div>
                                                               </div>
                                                            </td>
                                                            <td>
                                                               <div>
                                                                  ${list.r_sdate }
                                                               </div>
                                                            </td>
                                                            <td>
                                                               <div>
                                                               
                                                               D - ${list.r_sdate}
                                                                  
                                                               </div>
                                                            </td>
                                                            <td class="text-right">
                                                            
                                                             
                                                              
                                                               	<c:if test="${list.r_state eq '대여중'}">
						<fmt:parseDate var="tempToday" value="${list.r_sdate}" pattern="yyyy-MM-dd"/>
  						<fmt:parseNumber var="sdate" value="${tempToday.time / (1000*60*60*24)}" integerOnly="true"/>
   						<c:set var="now" value="<%=new java.util.Date()%>" />
    					<fmt:parseNumber var="today" value="${now.time / (1000*60*60*24)}" integerOnly="true"/>
						<c:if test="${sdate+3>=today}"><label class="btn btn-primary">대 여  중</label></c:if>
						<c:if test="${sdate+3<today}"><label class="btn btn-danger">연 체  중</label></c:if>
						</c:if>
						<c:if test="${list.r_state eq '반납 요청'}"><label class="btn btn-warning">반납 요청</label></c:if>
						<c:if test="${list.r_state eq '반납 완료'}"><label class="btn btn-success">반납 완료</label></c:if>
                                                               
                                                       
                                                               
                                                            </td>
                                                               </tr>
                                                            </tbody>
                                                         </c:forEach>
                                                            
                                                         </table>
                                                      </div>
                                                   </div>
                                                </div>
                                                  <!-- 회원 구매 현황(간략) -->
                                                  <div class="card table-card">
                                                   <div class="card-header">
                                                      <h5>구매 현황</h5>
                                                   </div>
                                                   <div class="card-block">
                                                      <div class="table-responsive">
                                                            <table class="table table-hover">
                                                             
                                                            <c:forEach var="list" items="${purchaseList }">
                                                            <tbody>
                                                               <tr>
                                                               <tr onClick="location.href='/admin/rent/rentDetail/${list.r_id}'">
                                                               <td>
                                                                  <div class="d-inline-block align-middle">
                                                                     <img src="/resources/Images/tempProductImage.jpg" class="img-radius img-40 align-top m-r-15">
                                                                     <div class="d-inline-block">
                                                                     <h6>${list.p_name }</h6>
                                                                     <p class="text-muted m-b-0">상품 카테고리?</p>
                                                                  </div>
                                                               </div>
                                                            </td>
                                                            <td>
                                                               <div>
                                                                  ${list.r_pdate }
                                                               </div>
                                                            </td>
                                                            <td class="text-right">
                                                               	<c:if test="${list.r_state eq '즉시 구매'}"><label class="btn btn-info">즉시 구매</label></c:if>
																<c:if test="${list.r_state eq '구매 확정'}"><label class="btn btn-info2">구매 확정</label></c:if>
                                                            </td>
                                                               </tr>
                                                            </tbody>
                                                            </c:forEach>
                                                            
                                                            
                                                         </table>
                                                      </div>
                                                   </div>
                                                </div> <!-- 회원 메시지함 -->
                                                  <div class="card table-card">
                                                   <div class="card-header">
                                                      <h5>회원 메시지함</h5>
                                                   </div>
                                                   <div class="card-block">
                                                      <div class="table-responsive">
                                                            <table class="table table-hover">
                                                             
                                                            <c:forEach var="list" items="${purchaseList }">
                                                            <tbody>
                                                               <tr>
                                                               <tr onClick="location.href='/admin/rent/rentDetail/${list.r_id}'">
                                                               <td>
                                                                  <div class="d-inline-block align-middle">
                                                                     <img src="/resources/Images/tempProductImage.jpg" class="img-radius img-40 align-top m-r-15">
                                                                     <div class="d-inline-block">
                                                                     <h6>${list.p_name }</h6>
                                                                     <p class="text-muted m-b-0">상품 카테고리?</p>
                                                                  </div>
                                                               </div>
                                                            </td>
                                                            <td>
                                                               <div>
                                                                  ${list.r_pdate }
                                                               </div>
                                                            </td>
                                                            <td class="text-right">
                                                               	<c:if test="${list.r_state eq '즉시 구매'}"><label class="btn btn-info">즉시 구매</label></c:if>
																<c:if test="${list.r_state eq '구매 확정'}"><label class="btn btn-info2">구매 확정</label></c:if>
                                                            </td>
                                                               </tr>
                                                            </tbody>
                                                            </c:forEach>
                                                            
                                                            
                                                         </table>
                                                      </div>
                                                   </div>
                                                </div>
                                                
                                                
                                                
                                                
                                                
                                                
                                                
                                                
                                                
                                            </div>
                                            <!--  sale analytics end -->

                                        </div>
                                    </div>
                                    <!-- Page-body end -->
                                </div>
                                <div id="styleSelector"> </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
  <!--이 script 없으면 css 깨짐-->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <%@ include file="/WEB-INF/views/adminFooter.jsp" %>
    <%@ include file="/WEB-INF/views/customerFooter.jsp" %>
</body>

</html>