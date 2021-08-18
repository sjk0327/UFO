<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
   <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>


<!DOCTYPE html>
<html lang="ko">

<head>
    <title> 대여 상세 정보 페이지 - UF&#38;O </title>

	<%@ include file="/WEB-INF/views/adminHeader.jsp" %>
    <%@ include file="/WEB-INF/views/customerHeader.jsp" %>
<style type="text/css">
	#username{
	color: white;
	text-decoration: underline;
	}
	#username:hover {
		font-weight: bold;
	}
	
	.btn-link {
	    border: none;
	    outline: none;
	    background: none;
	    cursor: pointer;
	    color: white;
	    padding: 0;
	    text-decoration: underline;
	    font-family: inherit;
	    font-size: inherit;
	}
	.btn-link:hover {
		font-weight: bold;
		color: white;
	}
	
	.table{
		text-align: center;
	}


	@media screen and (min-width: 768px) {
		.division_line { 
			border-right: solid;
			color: gray;
		} 
	}

	@media screen and (max-width:768px) {
		.table {
			table-layout: fixed;
			width: 100%;
			text-align: center;
			font-size: 15px;
		}
		
		.table th {
			background: #ccc;
		}
		
		.table td, .table th {
			padding: 10px 20px;
			border-top: 1px solid #ccc;
			word-break: break-all;
		}
		/*block*/
		.table--block thead {
			display: none;
		}
		.table--block tr {
			display: block;
			margin-bottom: 14px;
			border-top: none;
			padding-bottom: 0px !important; 
		}
		.table--block th, .table--block tbody td {
			display: block;
			position: relative;
			padding: 10px 0;
			padding-left: 30%;
			border-width: 0 0 1px 0;
			text-align: left;
		}
		.table--block tbody td:before {
			display: block;
			position: absolute;
			left: 0;
			top: 0;
			width: 30%;
			padding: 10px 0;
			background: #ccc;
		}
		.table--block th, .table--block tbody td {
		    display: block;
		    position: relative;
		    padding: 10px 0;
		    padding-left: 30%;
		    border-width: 0 0 1px 0;
		    text-align: center; 

		}
		.table--block tbody td.content {
		    display: block;
		    position: relative;
		    padding: 10px 0;
		    padding-left: 30%;
		    border-width: 0 0 1px 0;
		    text-align: left; 
		    margin-right: 50px

		}
		.table--block tbody td {
			text-align:right;
			padding-right:100px;
		}
		.table--block tbody td:nth-child(5):before {
		   display: block;
		   position: absolute;
		   left: 0;
		   top: 0;
		   width: 30%;
		   padding: 20px 0px 17px 0px;
		   background: #ccc;
		}
		
		
		.table--block td:nth-child(1):before {
			content: '상품 번호';
			text-align: center; 
		}
		.table--block td:nth-child(2):before {
			content: '상품 정보';
			text-align: center;
		}
		.table--block td:nth-child(3):before {
			content: '금 액';
			text-align: center;
		}
		.table--block td:nth-child(4):before {
			content: '수 량';
			text-align: center;
		}
		.table--block td:nth-child(5):before {
			content: '진행 상태';
			text-align: center; 
		}
	}
.pcoded[theme-layout="vertical"][vertical-placement="left"][vertical-nav-type="offcanvas"][vertical-effect="overlay"] .pcoded-content {
  margin-left: 0; }
.pcoded[theme-layout="vertical"][vertical-placement="left"][vertical-nav-type="expanded"][vertical-effect="shrink"] .pcoded-content {
  margin-left: 0;
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
	<div class="main-body">
		<div class="page-wrapper">
			<div class="page-body">
				<div class="row">
				<!--  project and team member start -->
					<div class="col-xl-12 col-md-12">
					<div class="card table-card">
					<div class="card-header">
						<h5>${rentInfo.r_mid } 님의 ${rentInfo.r_pid } 대여 현황</h5>
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
	                <script src="https://kit.fontawesome.com/848d8f1fa9.js"></script>
  					<div class="container-fluid col-xl-12" style="text-align: center;">
					<div class="col-lg-12">
        			<div class="col-1 col-lg-1   flex-column flex-shrink-0 p-3 bg-light " style="width: 250px;"></div>

				    <main class="col-12  ms-sm-auto col-lg-12">
						<div class="row" id="topmarin">
							<div class="col-sm-12" style="padding:0px 0px 15px 0px;">
								<div style="border-bottom:solid 1px; text-align: center; font-weight: bold; font-size: 15pt;">대여 정보</div>
							</div>
							<div class="col-sm-12"  style="padding-bottom: 15px;">
							<div class="row" style="font-size: 13pt; font-weight: bold;height: 50px; padding: 10px;border: solid; color: gray;height:fit-content;">
							<div class="col-md-6 division_line" >
							<div class="row">
								<div class="col-md-6 division_line">대여일자</div>
								<div class="col-md-6">${rentInfo.r_sdate }</div>
							</div>
							</div>
							<div class="col-md-6">
							<div class="row">
									<div class="col-md-6 division_line">대여 번호</div>
									<div class="col-md-6">${rentInfo.r_id }</div>
								</div>
							</div>
							</div>
					       	</div>   
			           		<div class="table">
			       			<table class="table table-striped table-sm table--block" id="testab">
			       			<thead>
			       				<tr>
			       					<th class="one">상품 번호</th>
			       					<th class="two">상품 정보</th>
			       					<th>금&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;액 </th>
			       					<th>수&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;량</th>
			       					<th>진행 상태</th>
			       				</tr>
			       			</thead>
			       			<tbody>
			       				<tr>
			       					<td>${proInfo.p_id }</td>
			     					<td>${proInfo.p_name }</td>
			     					<td>
			     						<c:if test="${rentInfo.r_state eq '대여중' || rentInfo.r_state eq '반납 요청'|| rentInfo.r_state eq '반납 완료'}">
										<fmt:parseNumber var="totalprice" value="${proInfo.p_price * 0.05 * rentInfo.r_rent}" integerOnly="true" />
										${totalprice}<%="원" %>
										</c:if>
									
									</td>
			     					<td>${rentInfo.r_rent }<%="개" %></td>
			     					<td style="padding: 9.6px 0px;">
			     						<!-- 상태 색깔 변경 로직 부분  추가-->
									<span class="col-md-2"> 
									<c:if test="${rentInfo.r_state eq '대여중'}">
										<fmt:parseDate var="tempToday" value="${rentInfo.r_sdate}" pattern="yyyy-MM-dd"/>
										<fmt:parseNumber var="sdate" value="${tempToday.time / (1000*60*60*24)}" integerOnly="true"/>
										<c:set var="now" value="<%=new java.util.Date()%>" />
										<fmt:parseNumber var="today" value="${now.time / (1000*60*60*24)}" integerOnly="true"/>
										
										<c:if test="${sdate+3>=today}"><label class="btn btn-primary rent-state-btn-label">대 여  중</label></c:if>
										<c:if test="${sdate+3<today}"><label class="btn btn-danger late-state-btn-label">연 체  중</label></c:if>
									</c:if>
									<c:if test="${rentInfo.r_state eq '반납 요청'}"><label class="btn btn-warning request-state-btn-label">반납 요청</label></c:if>
									<c:if test="${rentInfo.r_state eq '반납 완료'}"><label class="btn btn-success return-state-btn-label">반납 완료</label></c:if>
									</span>
									<!-- 상태 색깔 변경 로직 부분  끝 -->
			       					</td>
			       				</tr>
			       			</tbody>
			       			</table>
			       			</div>
					       	<div class="col-sm-12" style="padding:0px 0px 15px 0px;">		
								<div style="border-bottom:solid 1px; text-align: center; font-weight: bold; font-size: 15pt;">결제 정보 확인</div>
							</div>
							<hr>
							<c:forEach var="buyInfo" items="${buyList}">
							<div class="col-sm-12" style="padding-bottom: 15px;">
								<div class="row">
									<div class="col-md-6" style="height: 150px; padding: 50px;">${buyInfo.b_how }</div>
									<div class="col-md-6" style="font-size: 13pt; color: white; padding: 5px; background-color: #7971ea">
										<div style="text-align: left;"><%= "상품 가격 : " %>${proInfo.p_price }<%="원" %></div>
										<div style="text-align: left;"><%= "대여 구매 정보 : " %>${buyInfo.b_state }</div>
										<div style="text-align: left;"><%= "수량 : " %>${buyInfo.b_amount }</div>
										<hr>
										<div style="font-size: 15pt; font-weight: bold; text-align: left;"><%= "결제 가격 : " %>
										
										<c:if test="${buyInfo.b_state eq '대여'}">
										<fmt:parseNumber var="totalprice" value="${proInfo.p_price * 0.05 * buyInfo.b_amount}" integerOnly="true" />
										${totalprice}<%="원 (" %>${buyInfo.b_amount }<%="개)" %>
										</c:if>
										</div>
									</div>
								</div>
							</div>
							<hr>
							</c:forEach>
							<div class="col-sm-12" style="float:right;">
							<c:if test="${rentInfo.r_state eq '대여중'}">
		        			<c:if test="${sdate+3>=today}">
			     				<form:form method="post" action="/member/mem/memRentReturn" modelAttribute="rentInfo" style="float:right;">
								<form:hidden path="r_id"/>
								<input type="button" id="returnButton"  data-toggle="modal" data-target="#returnModal" 
								class="btn waves-effect waves-light btn-primary btn-outline-primary" style="margin-left:15px" value="반납하기">
								</form:form>
								<!-- The Modal start-->
							   	<div class="modal" id="returnModal">
									<div class="modal-dialog">
										<div class="modal-content">
											<!-- Modal Header -->
											<div class="modal-header">
											  <h4 class="modal-title">반납 확인창</h4>
											  <button type="button" class="close" data-dismiss="modal">&times;</button>
											</div>
											<!-- Modal body -->
											<div class="modal-body">
												위의 상품을 반납하시겠습니까?
											</div>
											<!-- Modal footer -->
											<div class="modal-footer">
											  <button type="button" class="btn btn-success" data-dismiss="modal" onClick="returnRental(${rentInfo.r_id})">확인</button>
											      <button type="button" class="btn btn-danger" data-dismiss="modal">취소</button>
										    </div>
										</div>
									</div>
								</div>
								<!-- The Modal end-->
							</c:if>
							<c:if test="${sdate+3<today}">
								<form:form method="post" action="/member/mem/memRentLate" modelAttribute="rentInfo" style="float:right;">
								<form:hidden path="r_id"/>
								<button type="button" id="lateButton" data-toggle="modal" data-target="#lateFeeModal" 
								class="btn waves-effect waves-light btn-primary btn-outline-primary" style="margin-left:15px">연체료 납부 후 반납</button>
								</form:form>
								<!-- The Modal start-->
							   	<div class="modal" id="lateFeeModal">
									<div class="modal-dialog">
										<div class="modal-content">
											<!-- Modal Header -->
											<div class="modal-header">
											  <h4 class="modal-title">연체료 납부 확인창</h4>
											  <button type="button" class="close" data-dismiss="modal">&times;</button>
											</div>
											<!-- Modal body -->
											<div class="modal-body">
												연체료가 있습니다. 연체료를 납부 후 반납이 진행됩니다.
											</div>
											<!-- Modal footer -->
											<div class="modal-footer">
											  <button type="button" class="btn btn-success" data-dismiss="modal" onClick="lateFeeRental()">확인</button>
											      <button type="button" class="btn btn-danger" data-dismiss="modal">취소</button>
										    </div>
										</div>
									</div>
								</div>
								<!-- The Modal end-->
							</c:if>
							<c:if test="${sdate+1>=today}">
								<form:form method="post" action="/member/mem/memRentRefund" modelAttribute="rentInfo" style="float:right;">
								<form:hidden path="r_id"/>
								<button type="button" id="refundButton" data-toggle="modal" data-target="#refundModal"
								class="btn waves-effect waves-light btn-primary btn-outline-primary" style="margin-left:15px">환불하기</button>
								</form:form>
								<!-- The Modal start-->
							   	<div class="modal" id="refundModal">
									<div class="modal-dialog">
										<div class="modal-content">
											<!-- Modal Header -->
											<div class="modal-header">
											  <h4 class="modal-title">환불 확인창</h4>
											  <button type="button" class="close" data-dismiss="modal">&times;</button>
											</div>
											<!-- Modal body -->
											<div class="modal-body">
												위의 상품을 환불하시겠습니까?
											</div>
											<!-- Modal footer -->
											<div class="modal-footer">
											  <button type="button" class="btn btn-success" data-dismiss="modal" onClick="refundRental()">확인</button>
											      <button type="button" class="btn btn-danger" data-dismiss="modal">취소</button>
										    </div>
										</div>
									</div>
								</div>
								<!-- The Modal end-->
			     			</c:if>
							</c:if>
							
			     			
			     			
			     			
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
<script>
function returnRental(r_id){
	console.log(r_id + " 반납 요청으로 변경");
	$.ajax({
		data : r_id,
		url : "/member/mem/memRentReturn",
		type: "POST",
		dataType: "JSON",
		contentType: "application/json; charset=UTF-8",
		success : function(data) {
			if(data.check > 0){
				$('.rent-state-btn-label').attr("class", "");
				$('.rent-state-btn-label').attr("class", "btn btn-warning request-state-btn-label");
				$('.rent-state-btn-label').text("반납 요청");
			}else{
				$('#returnModal .modal-dialog .modal-content .modal-body').text("반납에 실패 하였습니다.");
				$('#returnModal .modal-dialog .modal-content .modal-footer .btn-success').css("display", "none");
				$('#returnModal .modal-dialog .modal-content .modal-footer .btn-danger').text("확인");
				$('#returnModal').model("show");
				
			}
		}
	});
}

function lateFeeRental(){
	console.log("연체료 납부 요청으로 변경");
}
function refundRental(){
	console.log("환불 요청으로 변경");
}
</script>
    <%@ include file="/WEB-INF/views/customerFooter.jsp" %>
    
</body>

</html>
