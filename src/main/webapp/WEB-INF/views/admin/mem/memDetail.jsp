<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <title> 관리자 회원 상세 정보 페이지 - UF&#38;O </title>
    <%@ include file="/WEB-INF/views/adminHeader.jsp" %>
</head>

  <body>
  
  <div id="pcoded" class="pcoded">
      <div class="pcoded-overlay-box"></div>
      <div class="pcoded-container navbar-wrapper">
          <%@ include file="/WEB-INF/views/adminNav.jsp" %>
          <div class="pcoded-main-container">
             <div class="pcoded-wrapper">
                <%@ include file="/WEB-INF/views/adminMenu.jsp" %>
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
                                                      <form:form class="form-material" action="/admin/mem/memDetail/${userVO.m_id }" method="post" modelAttribute="userVO">
                                                      <div class="row">
                                                         <div class="col-sm-4">
                                                            <!-- 사진 나오게 하고 찾아보기 버튼 -->
                                                            <img src="/resources/Images/tempProfileImage.jpg" class="img-fluid img-circle">
                                                            <input type="file" name="m_img" value="${userVO.m_img}"/>
                                                            
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
                                                                  <form:input type="text" id="postcode" path="m_addr" value="${fn:split(userVO.m_addr,',')[0]}" class="form-control" placeholder="우편번호" required="required"/>
                                                                  <span class="form-bar"></span>
                                                               </div>
                                                               <div class="col-sm-6">
                                                                  <input type="button" onclick="daumPostcode()" value="우편번호 찾기" class="btn btn-mat waves-effect waves-light btn-info "/>
                                                               </div>
                                                            </div>
                                                            <form:input type="text" id="address" path="m_addr" value="${fn:split(userVO.m_addr,',')[1]}" class="form-control" placeholder="주소" required="required"/>
                                                            <span class="form-bar"></span>
                                                            <div class="row">
                                                               <div class="col-sm-6">
                                                                  <form:input type="text" id="detailAddress" path="m_addr" value="${fn:split(userVO.m_addr,',')[2]}" class="form-control" placeholder="상세주소" required="required"/>
                                                                  <span class="form-bar"></span>
                                                               </div>
                                                               <div class="col-sm-6">
                                                                  <form:input type="text" id="extraAddress" path="m_addr" value="${fn:split(userVO.m_addr,',')[3]}" class="form-control" placeholder="참고항목"/>
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
                                                            <input type="submit" value="수정" class="btn btn-primary btn-round waves-effect waves-light">
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
                                                            <!-- 
                                                            <c:forEach var="list" items="${rentList }">
                                                            <tbody>
                                                               <tr onClick="location.href='/adminrentDetail'">
                                                               <td>
                                                                  <div class="d-inline-block align-middle">
                                                                     <img src="/resources/Images/tempProductImage.jpg" class="img-radius img-40 align-top m-r-15">
                                                                     <div class="d-inline-block">
                                                                     <h6>${list.r_pid }</h6>
                                                                     <p class="text-muted m-b-0">상품 카테고리?</p>
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
                                                               <c:set var="today" value="<%=new java.util.Date() %>" />
                                                               <c:set var="date"><fmt:formatDate value="${today }" pattern="yyyy-MM-dd"/></c:set>
                                                               D - <c:out value="${list.r_sdate}-${date}" />
                                                                  
                                                               </div>
                                                            </td>
                                                            <td class="text-right">
                                                               <label class="btn btn-primary">${list.r_state }</label>
                                                            </td>
                                                               </tr>
                                                            </tbody>
                                                         </c:forEach>
                                                            -->
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
                                                            <!-- 
                                                            <c:forEach var="list" items="${buyList }">
                                                            <tbody>
                                                               <tr onClick="location.href='/adminrentDetail'">
                                                               <tr>
                                                               <td>
                                                                  <div class="d-inline-block align-middle">
                                                                     <img src="/resources/Images/tempProductImage.jpg" class="img-radius img-40 align-top m-r-15">
                                                                     <div class="d-inline-block">
                                                                     <h6>${list.r_pid }</h6>
                                                                     <p class="text-muted m-b-0">상품 카테고리?</p>
                                                                  </div>
                                                               </div>
                                                            </td>
                                                            <td>
                                                               <div>
                                                                  ${list.r_sdate }
                                                               </div>
                                                            </td>
                                                            <td class="text-right">
                                                               <label class="btn btn-primary">상세구매내역</label>
                                                            </td>
                                                               </tr>
                                                            </tbody>
                                                            </c:forEach>
                                                            -->
                                                            
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
   <!-- 다음 우편번호 찾기 javaScript -->
   <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
   <script>
    function daumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('postcode').value = data.zonecode;
                document.getElementById("address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("detailAddress").focus();
            }
        }).open();
    }
</script>
    
    <%@ include file="/WEB-INF/views/adminFooter.jsp" %>
</body>

</html>