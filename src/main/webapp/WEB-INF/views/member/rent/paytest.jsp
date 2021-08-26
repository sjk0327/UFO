
<%@page import="org.springframework.ui.Model"%>

<%@page import="org.springframework.web.servlet.ModelAndView"%>
<%@page import="com.use.first.buy.BuyVO"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
    String name = (String) request.getAttribute("m_id");
    String email = "sjk0868@naver.com";
    String phone = (String) request.getAttribute("m_tel");
    String address = (String) request.getAttribute("m_addr");
    int totalPrice = (Integer)request.getAttribute("total");
    
    BuyVO buyVO = (BuyVO)request.getAttribute("buyVO");
    String id = (String) request.getAttribute("m_id");
    String point = (String) request.getAttribute("m_point");
    
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
</head>
<body>
	<form id="bInsert" action="/customer/buyInsert" method="post" >
		<input type="hidden" name="m_id" value="<%=id %>"/>
		<input type="hidden" name="m_point" value="<%=point %>"/>
		<input type="hidden" name="total" value="<%=totalPrice %>"/>
		<input type="hidden" name="b_mid" value="${buyVO.b_mid }" />
		<input type="hidden" name="b_pid" value="${buyVO.b_pid }" />
		<input type="hidden" name="b_mname" value="${buyVO.b_mname }" />
		<input type="hidden" name="b_maddr" value="${buyVO.b_maddr }" />
		<input type="hidden" name="b_mtel" value="${buyVO.b_mtel }" />
		<input type="hidden" name="b_amount" value="${buyVO.b_amount }" />
		<input type="hidden" name="b_how" value="${buyVO.b_how }" />
		<input type="hidden" name="b_state" value="${buyVO.b_state }" />
		<input type="hidden" name="b_purchase" value="${buyVO.b_purchase }" />
		<input type="hidden" name="b_message" value="${buyVO.b_message }" />
		</form>
    <script>
    $(function(){
        var IMP = window.IMP; // 생략가능
        IMP.init('imp32059255'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
        var msg;
        
        IMP.request_pay({
            pg : 'kakaopay',
            pay_method : 'card',
            merchant_uid : 'merchant_' + new Date().getTime(),
            name : 'UFO Corporation',
            amount : <%=totalPrice%>,
            buyer_email : '<%=email%>',
            buyer_name : '<%=name%>',
            buyer_tel : '<%=phone%>',
            buyer_addr : '<%=address%>',
           // buyer_postcode : '123-456',
            //m_redirect_url : 'http://www.naver.com'
        }, function(rsp) {
            if ( rsp.success ) {
                //[1] 서버단에서 결제정보 조회를 위해 jQuery ajax로 imp_uid 전달하기
                jQuery.ajax({
                    url: "/payments/complete", //cross-domain error가 발생하지 않도록 주의해주세요
                    type: 'POST',
                    dataType: 'json',
                    data: {
                        imp_uid : rsp.imp_uid
                        //기타 필요한 데이터가 있으면 추가 전달
                    }
                }).done(function(data) {
                    //[2] 서버에서 REST API로 결제정보확인 및 서비스루틴이 정상적인 경우
                    if ( everythings_fine ) {
                        msg = '결제가 완료되었습니다.';
                        msg += '\n고유ID : ' + rsp.imp_uid;
                        msg += '\n상점 거래ID : ' + rsp.merchant_uid;
                        msg += '\결제 금액 : ' + rsp.paid_amount;
                        msg += '카드 승인번호 : ' + rsp.apply_num;
                        
                       
                        alert(msg);
                        
                    } else {
                        //[3] 아직 제대로 결제가 되지 않았습니다.
                        //[4] 결제된 금액이 요청한 금액과 달라 결제를 자동취소처리하였습니다.
                    }
                });
                
                document.getElementById('bInsert').submit();
            } else {
                msg = '결제에 실패하였습니다.다시 시도해주시기 바랍니다.\n';
                msg += '에러내용 : ' + rsp.error_msg;
                //실패시 이동할 페이지
                alert(msg);
                window.history.back();
            }
        });
        
    });
    
    
    </script>
 
</body>
</html>
