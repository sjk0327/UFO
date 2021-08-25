<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<div class="card table-card">
	<div class="card-header">
		<h5>${rentInfo.r_mid }님의${rentInfo.r_pid } 대여 현황</h5>
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
					<div
						class="col-1 col-lg-1   flex-column flex-shrink-0 p-3 bg-light "
						style="width: 250px;"></div>

					<main class="col-12  ms-sm-auto col-lg-12">
						<div class="row" id="topmarin">
							<div class="col-sm-12" style="padding: 0px 0px 15px 0px;">
								<div
									style="border-bottom: solid 1px; text-align: center; font-weight: bold; font-size: 15pt;">대여
									정보</div>
							</div>
							<div class="col-sm-12" style="padding-bottom: 15px;">
								<div class="row"
									style="font-size: 13pt; font-weight: bold; height: 50px; padding: 10px; border: solid; color: gray; height: fit-content;">
									<div class="col-md-6 division_line">
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
								<table class="table table-striped table-sm table--block"
									id="testab">
									<thead>
										<tr>
											<th class="one">상품 번호</th>
											<th class="two">상품 정보</th>
											<th>금&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;액</th>
											<th>수&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;량</th>
											<th>진행 상태</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td>${proInfo.p_id }</td>
											<td>${proInfo.p_name }</td>
											<td><c:if
													test="${rentInfo.r_state eq '대여중' || rentInfo.r_state eq '반납 요청'|| rentInfo.r_state eq '반납 완료' || rentInfo.r_state eq '환불 요청' || rentInfo.r_state eq '환불 완료'}">
													<fmt:parseNumber var="totalprice"
														value="${proInfo.p_price * 0.05 * rentInfo.r_rent}"
														integerOnly="true" />
										${totalprice}<%="원"%>
												</c:if></td>
											<td>${rentInfo.r_rent }<%="개"%></td>
											<td style="padding: 9.6px 0px;">
												<!-- 상태 색깔 변경 로직 부분  추가--> <span class="col-md-2"> <c:if
														test="${rentInfo.r_state eq '대여중'}">
														<fmt:parseDate var="tempToday" value="${rentInfo.r_sdate}"
															pattern="yyyy-MM-dd" />
														<fmt:parseNumber var="sdate"
															value="${tempToday.time / (1000*60*60*24)}"
															integerOnly="true" />
														<c:set var="now" value="<%=new java.util.Date()%>" />
														<fmt:parseNumber var="today"
															value="${now.time / (1000*60*60*24)}" integerOnly="true" />
														 
										<c:out  value="<script type='text/javascript'>alert(${sdate } + ':' +${today });</script>" escapeXml="fasle"/>
										
														<c:if test="${sdate+3>=today}">
															<label class="btn btn-primary rent-state-btn-label">대
																여 중</label>
														</c:if>
														<c:if test="${sdate+3<today}">
															<label class="btn btn-danger late-state-btn-label">연
																체 중</label>
														</c:if>
													</c:if> <c:if test="${rentInfo.r_state eq '반납 요청'}">
														<label class="btn btn-warning request-state-btn-label">반납
															요청</label>
													</c:if> <c:if test="${rentInfo.r_state eq '반납 완료'}">
														<label class="btn btn-success return-state-btn-label">반납
															완료</label>
													</c:if> <c:if test="${rentInfo.r_state eq '환불 요청'}">
														<label class="btn btn-warning return-state-btn-label">환불
															요청</label>
													</c:if> <c:if test="${rentInfo.r_state eq '환불 완료'}">
														<label class="btn btn-success return-state-btn-label">환불
															완료</label>
													</c:if>
											</span> <!-- 상태 색깔 변경 로직 부분  끝 -->
											</td>
										</tr>
									</tbody>
								</table>
							</div>
							<div class="col-sm-12" style="padding: 0px 0px 15px 0px;">
								<div
									style="border-bottom: solid 1px; text-align: center; font-weight: bold; font-size: 15pt;">결제
									정보 확인</div>
							</div>
							<hr>
							<c:forEach var="buyInfo" items="${buyList}">
								<div class="col-sm-12" style="padding-bottom: 15px;">
									<div class="row">
										<div class="col-md-6" style="height: 150px; padding: 50px;">${buyInfo.b_how }</div>
										<div class="col-md-6"
											style="font-size: 13pt; color: white; padding: 5px; background-color: #7971ea">
											<div style="text-align: left;"><%="상품 가격 : "%>${proInfo.p_price }<%="원"%></div>
											<div style="text-align: left;"><%="대여 구매 정보 : "%>${buyInfo.b_state }</div>
											<div style="text-align: left;"><%="수량 : "%>${buyInfo.b_amount }</div>
											<hr>
											<div
												style="font-size: 15pt; font-weight: bold; text-align: left;"><%="결제 가격 : "%>

												<c:if test="${buyInfo.b_state eq '대여'}">
													<fmt:parseNumber var="totalprice"
														value="${buyInfo.b_purchase}" integerOnly="true" />
										${totalprice}<%="원 ("%>${buyInfo.b_amount }<%="개)"%>
												</c:if>
												<c:if test="${buyInfo.b_state eq '환불 요청'}">
													<fmt:parseNumber var="totalprice"
														value="${buyInfo.b_purchase}" integerOnly="true" />
										${totalprice}<%="원 ("%>${buyInfo.b_amount }<%="개)"%>
												</c:if>
												<c:if test="${buyInfo.b_state eq '환불 완료'}">
													<fmt:parseNumber var="totalprice"
														value="${buyInfo.b_purchase}" integerOnly="true" />
										${totalprice}<%="원 ("%>${buyInfo.b_amount }<%="개)"%>
												</c:if>
											</div>
										</div>
									</div>
								</div>
								<hr>
							</c:forEach>
							<!-- confirm 모달을 쓸 페이지에 추가 start-->
							<section class="mocdal modal-section type-confirm">
								<div class="enroll_box">
									<p class="menu_msg"></p>
								</div>
								<div class="enroll_btn">
									<button class="btn pink_btn btn_ok">확인</button>
									<button class="btn gray_btn modal_close">취소</button>
								</div>
							</section>
							<!-- confirm 모달을 쓸 페이지에 추가 end-->
							<!-- alert 모달을 쓸 페이지에 추가 start-->
							<section class="mocdal modal-section type-alert">
								<div class="enroll_box">
									<p class="menu_msg"></p>
								</div>
								<div class="enroll_btn">
									<button class="btn pink_btn modal_close">확인</button>
								</div>
							</section>
							<!-- alert 모달을 쓸 페이지에 추가 end-->
							<div class="col-sm-12" style="float: right;">
								<button
									class="btn waves-effect waves-light btn-primary btn-outline-primary"
									id="buyButton" style="margin-left: 15px; float: right;">구매하기</button>
								<c:if test="${rentInfo.r_state eq '대여중'}">
									<c:if test="${sdate+3>=today}">
										<button
											class="btn waves-effect waves-light btn-primary btn-outline-primary"
											id="returnButton" style="margin-left: 15px; float: right;">반납하기</button>
									</c:if>
									<c:if test="${sdate+3<today}">
										<button
											class="btn waves-effect waves-light btn-primary btn-outline-primary"
											id="lateFeeButton" style="margin-left: 15px; float: right;">연체료
											납부 후 반납</button>
									</c:if>
									<c:if test="${sdate>=today}">
										<button
											class="btn waves-effect waves-light btn-primary btn-outline-primary"
											id="refundButton" style="margin-left: 15px; float: right;">환불하기</button>
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