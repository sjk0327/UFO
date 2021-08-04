<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <title> 관리자 회원 상세 정보 페이지 - UF&O </title>
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
                                                		<form:form class="form-material" action="memUpdate" method="post" modelAttribute="userInfo">
                                                		<div class="row">
                                                			<div class="col-sm-4">
                                                				<!-- 사진 나오게 하고 찾아보기 버튼 -->
                                                				<img src="/resources/Images/tempProfileImage.jpg" class="img-fluid img-circle">
                                                				
                                                			</div>
                                                			<div class="col-sm-8">
                                                				<div class="form-group row">
			                                                		<div class="col-sm-3 col-form-label">아이디</div>
		                                                			<div class="form-group form-primary form-static-label col-sm-9">
		                                                				<form:input type="text" path="m_id" class="form-control" placeholder="필수 항목 입니다." readonly="readonly"/>
		                                                				<span class="form-bar"></span>
		                                                			</div>
		                                                		</div>
		                                                		<div class="form-group row">
			                                                		<div class="col-sm-3 col-form-label">이 름</div>
		                                                			<div class="form-group form-primary form-static-label col-sm-9">
		                                                				<form:input type="text" path="m_name" class="form-control" placeholder="필수 항목 입니다." required="required"/>
		                                                				<span class="form-bar"></span>
		                                                			</div>
		                                                		</div>
		                                                		<div class="form-group row">
			                                                		<div class="col-sm-3 col-form-label">성별</div>
		                                                			<div class="form-group form-primary form-static-label col-sm-9">
		                                                				<form:input type="text" path="m_gender" class="form-control" placeholder="필수 항목 입니다." readonly="readonly"/>
		                                                				<span class="form-bar"></span>
		                                                			</div>
		                                                		</div>
		                                                		<div class="form-group row">
			                                                		<div class="col-sm-3 col-form-label">주소</div>
		                                                			<div class="form-group form-primary form-static-label col-sm-9">
		                                                				<form:input type="text" path="m_addr" class="form-control" placeholder="필수 항목 입니다." required="required"/>
		                                                				<span class="form-bar"></span>
		                                                			</div>
		                                                		</div>
		                                                		<div class="form-group row">
			                                                		<div class="col-sm-3 col-form-label">전화번호</div>
		                                                			<div class="form-group form-primary form-static-label col-sm-9">
		                                                				<form:input type="text" path="m_tel" class="form-control" placeholder="필수 항목 입니다." required="required"/>
		                                                				<span class="form-bar"></span>
		                                                			</div>
		                                                		</div>
		                                                		<div class="form-group row">
			                                                		<div class="col-sm-3 col-form-label">이메일</div>
		                                                			<div class="form-group form-primary form-static-label col-sm-9">
		                                                				<form:input type="text" path="m_email" class="form-control" placeholder="필수 항목 입니다." required="required"/>
		                                                				<span class="form-bar"></span>
		                                                			</div>
		                                                		</div>
		                                                		<div class="form-group row">
			                                                		<div class="col-sm-3 col-form-label">포인트</div>
		                                                			<div class="form-group form-primary form-static-label col-sm-9">
		                                                				<form:input type="text" path="m_point" class="form-control" placeholder="필수 항목 입니다." required="required"/>
		                                                				<span class="form-bar"></span>
		                                                			</div>
		                                                		</div>
		                                                		<div class="form-group row">
			                                                		<div class="col-sm-3 col-form-label">가입날짜</div>
		                                                			<div class="form-group form-primary form-static-label col-sm-9">
		                                                				<form:input type="text" path="m_regdate" class="form-control" placeholder="필수 항목 입니다." readonly="readonly"/>
		                                                				<span class="form-bar"></span>
		                                                			</div>
		                                                		</div>
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
                                                            <tbody>
                                                            	<tr>
                                                            	<td>
                                                            		<div class="d-inline-block align-middle">
                                                            			<img src="/resources/Images/tempProductImage.jpg" class="img-radius img-40 align-top m-r-15">
                                                            			<div class="d-inline-block">
	                                                						<h6>상품 이름</h6>
	                                                						<p class="text-muted m-b-0">상품 카테고리?</p>
	                                                					</div>
	                                                				</div>
	                                                			</td>
	                                                			<td>
	                                                				<div>
	                                                					빌린 날짜
	                                                				</div>
	                                                			</td>
	                                                			<td>
	                                                				<div>
	                                                					D - 2
	                                                				</div>
	                                                			</td>
	                                                			<td class="text-right">
	                                                				<label class="btn btn-primary">대 여  중</label>
	                                                			</td>
                                                            	</tr>
                                                            	<tr>
                                                            	<td>
                                                            		<div class="d-inline-block align-middle">
                                                            			<img src="/resources/Images/tempProductImage.jpg" class="img-radius img-40 align-top m-r-15">
                                                            			<div class="d-inline-block">
	                                                						<h6>상품 이름</h6>
	                                                						<p class="text-muted m-b-0">상품 카테고리?</p>
	                                                					</div>
	                                                				</div>
	                                                			</td>
	                                                			<td>
	                                                				<div>
	                                                					빌린 날짜
	                                                				</div>
	                                                			</td>
	                                                			<td>
	                                                				<div>
	                                                					D-day
	                                                				</div>
	                                                			</td>
	                                                			<td class="text-right">
	                                                				<label class="btn btn-warning">반납예정</label>
	                                                			</td>
                                                            	</tr>
                                                            	<tr>
                                                            	<td>
                                                            		<div class="d-inline-block align-middle">
                                                            			<img src="/resources/Images/tempProductImage.jpg" class="img-radius img-40 align-top m-r-15">
                                                            			<div class="d-inline-block">
	                                                						<h6>상품 이름</h6>
	                                                						<p class="text-muted m-b-0">상품 카테고리?</p>
	                                                					</div>
	                                                				</div>
	                                                			</td>
	                                                			<td>
	                                                				<div>
	                                                					빌린 날짜
	                                                				</div>
	                                                			</td>
	                                                			<td>
	                                                				<div>
	                                                					D + 5
	                                                				</div>
	                                                			</td>
	                                                			<td class="text-right">
	                                                				<label class="btn btn-danger">연 체  중</label>
	                                                			</td>
                                                            	</tr>
                                                            	<tr>
                                                            	<td>
                                                            		<div class="d-inline-block align-middle">
                                                            			<img src="/resources/Images/tempProductImage.jpg" class="img-radius img-40 align-top m-r-15">
                                                            			<div class="d-inline-block">
	                                                						<h6>상품 이름</h6>
	                                                						<p class="text-muted m-b-0">상품 카테고리?</p>
	                                                					</div>
	                                                				</div>
	                                                			</td>
	                                                			<td>
	                                                				<div>
	                                                					빌린 날짜
	                                                				</div>
	                                                			</td>
	                                                			<td>
	                                                				<div>
	                                                					
	                                                				</div>
	                                                			</td>
	                                                			<td class="text-right">
	                                                				<label class="btn btn-success">반납완료</label>
	                                                			</td>
                                                            	</tr>
                                                            	<tr>
                                                            	<td>
                                                            		<div class="d-inline-block align-middle">
                                                            			<img src="/resources/Images/tempProductImage.jpg" class="img-radius img-40 align-top m-r-15">
                                                            			<div class="d-inline-block">
	                                                						<h6>상품 이름</h6>
	                                                						<p class="text-muted m-b-0">상품 카테고리?</p>
	                                                					</div>
	                                                				</div>
	                                                			</td>
	                                                			<td>
	                                                				<div>
	                                                					빌린 날짜
	                                                				</div>
	                                                			</td>
	                                                			<td>
	                                                				<div>
	                                                					
	                                                				</div>
	                                                			</td>
	                                                			<td class="text-right">
	                                                				<label class="btn btn-info">구매완료</label>
	                                                			</td>
                                                            	</tr>
                                                            </tbody>
	                                                			
	                                                			
                                                			</table>
                                                		</div>
                                                	</div>
                                                </div>
                                               	<!-- 회원 구매 현황(간략) -->
                                               	<div class="card table-card">
                                                	<div class="card-header">
                                                		<h5>대여 현황</h5>
                                                	</div>
                                                	<div class="card-block">
                                                		<div class="table-responsive">
                                                            <table class="table table-hover">
                                                            <tbody>
                                                            	<tr>
                                                            	<td>
                                                            		<div class="d-inline-block align-middle">
                                                            			<img src="/resources/Images/tempProductImage.jpg" class="img-radius img-40 align-top m-r-15">
                                                            			<div class="d-inline-block">
	                                                						<h6>상품 이름</h6>
	                                                						<p class="text-muted m-b-0">상품 카테고리?</p>
	                                                					</div>
	                                                				</div>
	                                                			</td>
	                                                			<td>
	                                                				<div>
	                                                					구매날짜
	                                                				</div>
	                                                			</td>
	                                                			<td class="text-right">
	                                                				<label class="btn btn-primary">상세구매내역</label>
	                                                			</td>
                                                            	</tr>
                                                            </tbody>
	                                                			
	                                                			
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

    
    <%@ include file="/WEB-INF/views/adminFooter.jsp" %>
</body>

</html>
