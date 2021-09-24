<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>UFO</title>


<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- Favicon icon -->
<link rel="shortcut icon" type="image/x-icon"
	href="/resources/Images/ufo_purple_favi.ico" />
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Mukta:300,400,700">

<!-- datepicker -->
<link rel="stylesheet"
	href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<!-- datepicker 여기까지 -->
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>


<style type="text/css">
.item:hover {
	cursor: pointer;
	margin: 0px;
	border: 2px solid #7971ea;
}

#kakao-talk-channel-chat-button {
	position: fixed;
	top: 800px;
	right: 30px;
}

ul.tab li.current {
	background-color: rgb(246, 246, 246);
	color: #F6F6F6;
}

.tabcontent.current {
	display: block;
}

.small1 {
	width: 100px;
	height: 100px;
}

.small2 {
	width: 80px;
	height: 80px;
	align: center;
}

.mb-1 {
	font-size: 18px;
}

.blackColoer {
	color: red;
}

#searchType {
	width: 85px;
	height: 38px;
	padding-left: 8px;
	font-size: 13px;
	color: #585858;
	border-radius: 5px;
}

ul {
	list-style: none;
}

#menu {
	position: sticky;
	top: 0px;
	z-index: 9999;
}


#Proname {
	width: 400px;
}

@media only screen and (max-width:768px) {
	#menu {
		position: sticky;
		top: 0px;
		z-index: 9998;
	}
	#Proname {
		width: 350px;
	}
	#kakao-talk-channel-chat-button {
		position: fixed;
		top: 750px;
		right: 10px;
		z-index: 9999;
	}
}
</style>
</head>
<body>
	<section>
		<div id="menu">
			<%@ include file="/WEB-INF/views/customerHeader.jsp"%></div>
		<div class="site-wrap">
			<div class="container">
				<div class="site-section block-8"
					style="background-image: url('resources/common/images/mint3.jpg')">
					<div class="row justify-content-center  mb-5">
						<div class="col-md-7 site-section-heading text-center pt-4">
							<h2></h2>
						</div>
					</div>

					<div class="row">
						<div class="col-lg-7"></div>
						<div class="col-md-5 col-lg-5 pl-md-5"
							style="background-color: white; border: solid; text-align: center;">
							<br>
							<h3>
								<a href="#"><strong>빠른 대여하기</strong></a>
							</h3>
							<form:form id="buyform" method="post" commandName="BuyInfoVO">
								<div style="float: left; font-weight: bold;">
									카테고리 : <select id="Category" onchange="chageCategory()" >
										<option value="선택" disabled="disabled" selected="selected">선택해주세요</option>
										<option value="스마트폰">스마트폰</option>
										<option value="노트북">노트북</option>
										<option value="카메라">카메라</option>
										<option value="스마트워치">스마트워치</option>
										<option value="태블릿">태블릿</option>
									</select>
								</div>
								<div style="float: left; text-align: left; font-weight: bold;">
									상품명 : <br><select id="Proname" onchange="chageProname()" style="width:300px;">
										<option value="선택">카테고리를 먼저 선택해주세요!</option>
									</select>
								</div>
								<br>
								<br>
								<br>
								<br>
								<div style="text-align: left; font-weight: bold;">
									대여일자 : <input id="rentdate" name="rentdate" type="text"
										value="" onchange="chageDate()" style="width: 100px;"
										disabled="disabled">
								</div>
								<div style="text-align: left; font-weight: bold;">
									대여수량 : <input id="rentamount" name="proamount" type="number"
										value="0" min="0" max="0"
										style="width: 50px; margin-top: 8pt;" onchange="chageAmount()">
								</div>
								<p class="post-meta mb-4"
									style="font-size: 15pt; color: #8c92a0; font-weight: bold;">
									결제 가격 &nbsp;<a href="#" id="totalprice"
										style="font-weight: bold; font-size: 15pt;">0</a><span
										class="block-8-sep" style="font-size: 15pt; font-weight: bold; color: #8c92a0;">원</span>
								</p>
								<input type="hidden" id="buyType" name="buyType" value="대여">
								<input type="hidden" id="productId" name="productId" value="">
								<input id="productPrice" name="productPrice" type="hidden"
									value="">
							</form:form>
							<p>
								<input type="button" id="purchase"
									class="btn btn-primary btn-sm" onclick="purchase()" value="결제"
									disabled="disabled">
							</p>
						</div>
					</div>
					<br>
				</div>



			</div>

			<div class="site-section site-section-sm site-blocks-1">
				<div class="container">
					<div class="row">
						<div class="col-md-6 col-lg-4 d-lg-flex mb-4 mb-lg-0 pl-4"
							data-aos="fade-up" data-aos-delay="">
							<div class="icon mr-4 align-self-start">
								<span class="icon-truck"></span>
							</div>
							<div class="text">
								<h2 class="text-uppercase">고객 맞춤 배송 서비스</h2>
								<p>
									대여 상품은 대여 예약일 오전 9시까지 고객님께 배송해드립니다!<br>(※당일대여 제외)
								</p>
							</div>
						</div>
						<div class="col-md-6 col-lg-4 d-lg-flex mb-4 mb-lg-0 pl-4"
							data-aos="fade-up" data-aos-delay="100">
							<div class="icon mr-4 align-self-start">
								<span class="icon-refresh2"><i></i></span>
							</div>
							<div class="text">
								<h2 class="text-uppercase">3일 체험 서비스</h2>
								<p>원하는 제품 어느 것이든 3일간 대여 후 체험이 가능합니다!</p>
							</div>
						</div>
						<div class="col-md-6 col-lg-4 d-lg-flex mb-4 mb-lg-0 pl-4"
							data-aos="fade-up" data-aos-delay="200">
							<div class="icon mr-4 align-self-start">
								<span class="icon-help"></span>
							</div>
							<div class="text">
								<h2 class="text-uppercase">고객 지원</h2>
								<p>평일 오전 9시부터 오후 6시까지 카카오톡 상담원 상시 대기 중!</p>
							</div>
						</div>
					</div>
				</div>
			</div>

			<div class="site-section block-3 site-blocks-2 bg-light">
				<div class="container">
					<div class="row justify-content-center">
						<div class="col-md-7 site-section-heading text-center pt-4">
							<h3 style="color: #25262a;">카테고리 별 최다 추천 상품</h3>
						</div>
					</div>
					<div class="row">
						<div class="col-md-12">
							<div class="nonloop-block-3 owl-carousel">
								<div class="item"
									onclick="location.href='/member/pro/productDetail/${smartphone.p_id}'">
									<div class="block-4 text-center">
										<figure class="block-4-image">
											<img src="/resources/Images/product/${smartphone.p_mainImg}"
												alt="Image placeholder" class="img-fluid"
												style="width: 346.66px; height: 246.06px;">
										</figure>
										<div class="block-4-text p-4">
											<h3>
												<a style="color: #8c92a0; font-weight: bold;" href="#">${fn:substring(smartphone.p_name,0,15) }<br>${fn:substringAfter(smartphone.p_name,fn:substring(smartphone.p_name,0,15)) }</a>
											</h3>
										</div>
										<p class="text-primary font-weight-bold"
											style="text-decoration: line-through;">
											원가 :
											<fmt:formatNumber value="${smartphone.p_price}"
												pattern="###,###,###" />
										</p>
										<p class="text-primary font-weight-bold">
											대여가 :
											<fmt:formatNumber value="${smartphone.p_price*0.05}"
												pattern="###,###,###" />
											원&nbsp;/&nbsp;즉시구매가 :
											<fmt:formatNumber value="${smartphone.p_price*0.95}"
												pattern="###,###,###" />
										</p>
									</div>
								</div>
								<div class="item"
									onclick="location.href='/member/pro/productDetail/${notebook.p_id}'">
									<div class="block-4 text-center">
										<figure class="block-4-image">
											<img src="/resources/Images/product/${notebook.p_mainImg}"
												alt="Image placeholder" class="img-fluid"
												style="width: 346.66px; height: 246.06px;">
										</figure>
										<div class="block-4-text p-4">
											<h3>
												<a style="color: #8c92a0; font-weight: bold;" href="#">${fn:substring(notebook.p_name,0,15)}<br>${fn:substringAfter(notebook.p_name,fn:substring(notebook.p_name,0,15))}</a>
											</h3>
										</div>

										<p class="text-primary font-weight-bold"
											style="text-decoration: line-through;">
											원가 :
											<fmt:formatNumber value="${notebook.p_price}"
												pattern="###,###,###" />
										</p>
										<p class="text-primary font-weight-bold">
											대여가 :
											<fmt:formatNumber value="${notebook.p_price*0.05}"
												pattern="###,###,###" />
											원&nbsp;/&nbsp;즉시구매가 :
											<fmt:formatNumber value="${notebook.p_price*0.95}"
												pattern="###,###,###" />
										</p>
									</div>
								</div>
								<div class="item"
									onclick="location.href='/member/pro/productDetail/${camera.p_id}'">
									<div class="block-4 text-center">
										<figure class="block-4-image">
											<img src="/resources/Images/product/${camera.p_mainImg}"
												alt="Image placeholder" class="img-fluid"
												style="width: 346.66px; height: 246.06px;">
										</figure>
										<div class="block-4-text p-4">
											<h3>
												<a style="color: #8c92a0; font-weight: bold;" href="#">${fn:substring(camera.p_name,0,15)}<br>${fn:substringAfter(camera.p_name,fn:substring(camera.p_name,0,15))}</a>
											</h3>
										</div>

										<p class="text-primary font-weight-bold"
											style="text-decoration: line-through;">
											원가 :
											<fmt:formatNumber value="${camera.p_price}"
												pattern="###,###,###" />
										</p>
										<p class="text-primary font-weight-bold">
											대여가 :
											<fmt:formatNumber value="${camera.p_price*0.05}"
												pattern="###,###,###" />
											원&nbsp;/&nbsp;즉시구매가 :
											<fmt:formatNumber value="${camera.p_price*0.95}"
												pattern="###,###,###" />
										</p>
									</div>
								</div>
								<div class="item"
									onclick="location.href='/member/pro/productDetail/${smartwatch.p_id}'">
									<div class="block-4 text-center">
										<figure class="block-4-image">
											<img src="/resources/Images/product/${smartwatch.p_mainImg}"
												alt="Image placeholder" class="img-fluid"
												style="width: 346.66px; height: 246.06px;">
										</figure>
										<div class="block-4-text p-4">
											<h3>
												<a style="color: #8c92a0; font-weight: bold;" href="#">${fn:substring(smartwatch.p_name,0,15)}<br>${fn:substringAfter(smartwatch.p_name,fn:substring(smartwatch.p_name,0,15))}</a>
											</h3>
										</div>

										<p class="text-primary font-weight-bold"
											style="text-decoration: line-through;">
											원가 :
											<fmt:formatNumber value="${smartwatch.p_price}"
												pattern="###,###,###" />
										</p>
										<p class="text-primary font-weight-bold">
											대여가 :
											<fmt:formatNumber value="${smartwatch.p_price*0.05}"
												pattern="###,###,###" />
											원&nbsp;/&nbsp;즉시구매가 :
											<fmt:formatNumber value="${smartwatch.p_price*0.95}"
												pattern="###,###,###" />
										</p>
									</div>
								</div>
								<div class="item"
									onclick="location.href='/member/pro/productDetail/${tablet.p_id}'">
									<div class="block-4 text-center">
										<figure class="block-4-image">
											<img src="/resources/Images/product/${tablet.p_mainImg}"
												alt="Image placeholder" class="img-fluid"
												style="width: 346.66px; height: 246.06px;">
										</figure>
										<div class="block-4-text p-4">
											<h3>
												<a style="color: #8c92a0; font-weight: bold;" href="#">${fn:substring(tablet.p_name,0,15)}<br>${fn:substringAfter(tablet.p_name,fn:substring(tablet.p_name,0,15))}</a>
											</h3>
										</div>

										<p class="text-primary font-weight-bold"
											style="text-decoration: line-through;">
											원가 :
											<fmt:formatNumber value="${tablet.p_price}"
												pattern="###,###,###" />
										</p>
										<p class="text-primary font-weight-bold">
											대여가 :
											<fmt:formatNumber value="${tablet.p_price*0.05}"
												pattern="###,###,###" />
											원&nbsp;/&nbsp;즉시구매가 :
											<fmt:formatNumber value="${tablet.p_price*0.95}"
												pattern="###,###,###" />
										</p>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<br>


			<div id="kakao-talk-channel-chat-button"
				data-channel-public-id="_xlGxlxcs" data-title="consult"
				data-size="large" data-color="yellow" data-shape="pc"
				data-support-multiple-densities="true"></div>

		</div>
	</section>
	<%@ include file="/WEB-INF/views/customerFooter.jsp"%>
</body>

<script type="text/javascript">
	$(function() {
		$('#rentdate').datepicker();
	})
	$('#rentdate')
			.datepicker(
					{
						dateFormat : 'yy-mm-dd' //달력 날짜 형태
						,
						showOtherMonths : true //빈 공간에 현재월의 앞뒤월의 날짜를 표시
						,
						showMonthAfterYear : true // 월- 년 순서가아닌 년도 - 월 순서
						,
						changeYear : true //option값 년 선택 가능
						,
						changeMonth : true //option값  월 선택 가능                
						,
						showOn : "text" //button:버튼을 표시하고,버튼을 눌러야만 달력 표시 ^ both:버튼을 표시하고,버튼을 누르거나 input을 클릭하면 달력 표시  
						,
						buttonImage : "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif" //버튼 이미지 경로
						,
						buttonImageOnly : true //버튼 이미지만 깔끔하게 보이게함
						,
						buttonText : "선택" //버튼 호버 텍스트              
						,
						yearSuffix : "년" //달력의 년도 부분 뒤 텍스트
						,
						monthNamesShort : [ '1월', '2월', '3월', '4월', '5월', '6월',
								'7월', '8월', '9월', '10월', '11월', '12월' ] //달력의 월 부분 텍스트
						,
						monthNames : [ '1월', '2월', '3월', '4월', '5월', '6월',
								'7월', '8월', '9월', '10월', '11월', '12월' ] //달력의 월 부분 Tooltip
						,
						dayNamesMin : [ '일', '월', '화', '수', '목', '금', '토' ] //달력의 요일 텍스트
						,
						dayNames : [ '일요일', '월요일', '화요일', '수요일', '목요일', '금요일',
								'토요일' ] //달력의 요일 Tooltip
						,
						minDate : "-0D" //최소 선택일자(-1D:하루전, -1M:한달전, -1Y:일년전)
						,
						maxDate : "+1M" //최대 선택일자(+1D:하루후, -1M:한달후, -1Y:일년후)  
						,
						showButtonPanel : true,
						currentText : '오늘 날짜',
						closeText : '닫기',
						nextText : "다음",
						prevText : "이전"

					});
	function chageCategory() {
		var category = document.getElementById("Category");
		var ca = category.options[category.selectedIndex].value;
		document.getElementById("rentdate").value = "";
		document.getElementById("rentdate")
				.setAttribute('disabled', 'disabled');
		$("#rentdate").datepicker("option", "showOn", "text");
		document.getElementById("rentamount").value = 0;
		document.getElementById("rentamount").setAttribute('max', "0");
		document.getElementById('totalprice').innerText = "0";

		$
				.ajax({
					method : "POST",
					url : "/index/productList",
					data : {
						ca : ca
					},
					dataType : "json",
					success : function(result) {
						var namelong = result.array;

						var htmltext = '<option value="선택" disabled="disabled" selected="selected">선택해주세요</option>';
						for (var k = 0; k < namelong; k++) {
							htmltext = htmltext
									+ '<option value="'+result.arrayid[k]+'">'
									+ result.arrayname[k] + '</option>'
						}
						document.getElementById('Proname').innerHTML = htmltext;
					},
					error : function(a, b, c) {
						//통신 실패시 발생하는 함수(콜백)
						alert("a:" + a + "b:" + b + "c:" + c);
					}
				});
	}
	function chageProname() {
		var proname = document.getElementById("Proname");

		document.getElementById("rentdate").value = new Date().toISOString()
				.substring(0, 10);
		document.getElementById("rentdate").setAttribute('min',
				new Date().toISOString().substring(0, 10));
		document.getElementById("rentdate").removeAttribute('disabled');
		$("#rentdate").datepicker("option", "showOn", "both");
		document.getElementById("rentamount").value = 0;
		document.getElementById("rentamount").setAttribute('max', "0");
		document.getElementById('totalprice').innerText = "0";
		$.ajax({
			method : "POST",
			url : "/index/calRentamount",
			data : {
				rentdate : document.getElementById("rentdate").value,
				p_id : proname.value
			},
			dataType : "json",
			success : function(result) {
				var canamount = result.canamount;

				document.getElementById("rentamount").setAttribute('max',
						canamount);
			},
			error : function(a, b, c) {
				//통신 실패시 발생하는 함수(콜백)
				alert("a:" + a + "b:" + b + "c:" + c);
			}
		});

	}

	function chageDate() {
		var rentdate = document.getElementById("rentdate");
		var proname = document.getElementById("Proname");
		document.getElementById("rentamount").value = 0;
		document.getElementById("rentamount").setAttribute('max', "0");
		document.getElementById('totalprice').innerText = "0";
		$.ajax({
			method : "POST",
			url : "/index/calRentamount",
			data : {
				rentdate : rentdate.value,
				p_id : proname.value
			},
			dataType : "json",
			success : function(result) {
				var canamount = result.canamount;

				document.getElementById("rentamount").setAttribute('max',
						canamount);
			},
			error : function(a, b, c) {
				//통신 실패시 발생하는 함수(콜백)
				alert("a:" + a + "b:" + b + "c:" + c);
			}
		});

	}

	function chageAmount() {
		var rentamount = document.getElementById("rentamount").value;
		var proname = document.getElementById("Proname");
		if (rentamount == 0) {
			document.getElementById("purchase").setAttribute('disabled',
					'disabled');
		} else {
			document.getElementById("purchase").removeAttribute('disabled');
		}
		$.ajax({
			method : "POST",
			url : "/index/calPrice",
			data : {
				rentamount : rentamount,
				p_id : proname.value
			},
			dataType : "json",
			success : function(result) {
				var rentPrice = result.rentPrice;
				document.getElementById('productPrice').value = rentPrice
				rentPrice = AddComma(rentPrice);
				document.getElementById('totalprice').innerText = rentPrice;
			},
			error : function(a, b, c) {
				//통신 실패시 발생하는 함수(콜백)
				alert("a:" + a + "b:" + b + "c:" + c);
			}
		});

	}

	function purchase() {

		document.getElementById('productId').value = document
				.getElementById('Proname').value;
		document.getElementById('buyform').setAttribute("action",
				"/member/rent/buy");
		document.getElementById('buyform').submit();

	}

	function AddComma(num) {
		var regexp = /\B(?=(\d{3})+(?!\d))/g;
		return num.toString().replace(regexp, ',');
	}
	window.kakaoAsyncInit = function() {
		Kakao.Channel.createChatButton({
			container : '#kakao-talk-channel-chat-button',
		});
	};
	(function(d, s, id) {
		var js, fjs = d.getElementsByTagName(s)[0];
		if (d.getElementById(id))
			return;
		js = d.createElement(s);
		js.id = id;
		js.src = 'https://developers.kakao.com/sdk/js/kakao.channel.min.js';
		fjs.parentNode.insertBefore(js, fjs);
	})(document, 'script', 'kakao-js-sdk');
</script>
</html>

