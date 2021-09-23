<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.security.SecureRandom" %>
<%@ page import="java.math.BigInteger" %>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>회원가입 - UF&#38;O</title>
<%@ include file="/WEB-INF/views/adminHeader.jsp" %>
<script src="https://ajax.googleapis .com /ajax/libs/jquery/3 .5 .1 /jquery .min .js "></script >

	<style>
	 .filebox input[type="file"] {
	     position: absolute;
	     width: 1px;
	     height: 1px;
	     padding: 0;
	     margin: -1px;
	     overflow: hidden;
	     clip: rect(0, 0, 0, 0);
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
	 }
	
	 /* named upload */
	 .filebox .upload-name {
	     display: inline-block;
	     padding: .5em .75em;
	     /* label의 패딩값과 일치 */
	     font-size: inherit;
	     font-family: inherit;
	     line-height: normal;
	     vertical-align: middle;
	     background-color: #f5f5f5;
	     border: 1px solid #ebebeb;
	     border-bottom-color: #e2e2e2;
	     border-radius: .25em;
	 }
	
	 * {
	     padding: 0;
	     margin: 0;
	 }
	
	 body,
	 html {
	     height: 100%;
	 }
	
	 .modal .btn {
	     cursor: pointer;
	     border: 1px solid #999999;
	     text-align: center;
	     border-radius: 5px;
	     outline: none;
	     font-weight: 500;
	 }
	
	 .dimLayer {
	     display: block;
	     width: 100%;
	     background-color: rgba(0, 0, 0, 0.3);
	     position: fixed;
	     left: 0;
	     top: 0px;
	     margin: 0;
	     padding: 0;
	     z-index: 9998;
	 }
	
	 .modal {
	     width: 600px;
	     height: 252px;
	     border-radius: 10px;
	     padding: 80px 24px;
	     box-sizing: border-box;
	     text-align: center;
	 }
	
	 .modal-section {
	     background: #ffffff;
	     box-sizing: border-box;
	     display: none;
	     position: absolute;
	     top: 50%;
	     left: 50%;
	     -webkit-transform: translate(-50%, -50%);
	     -ms-transform: translate(-50%, -50%);
	     -moz-transform: translate(-50%, -50%);
	     -o-transform: translate(-50%, -50%);
	     transform: translate(-50%, -50%);
	     display: none;
	     z-index: 9999;
	 }
	
	 .menu_msg {
	     font-size: 21px;
	     font-weight: 500;
	 }
	
	 .enroll_box p {
	     padding-bottom: 56px;
	 }
	
	 .gray_btn {
	     width: 90px;
	     background: #ffffff;
	     color: #999999;
	     height: 36px;
	     transition: 0.5s;
	     font-size: 17px;
	 }
	
	 .pink_btn {
	     width: 90px;
	     background: #7971ea;
	     color: #fff;
	     height: 36px;
	     transition: 0.5s;
	     font-size: 17px;
	     border: none;
	 }
	</style>
</head >

<body themebg-pattern="theme1">
  	<section class="login-block">
		<!-- Container-fluid starts -->
		<div class="container">
			<div class="row">
				<div class="col-sm-12">
					<!-- Authentication card start -->

						<div class="text-center">

							<a href="/"><img class="picture" src="/resources/Images/UFO_black.png"
										alt="로고" style="width: 200px; height:90px;"></a>
						</div>
						<div class="auth-box card">
							<div class="card-block">
								<div class="row m-b-20">
									<div class="col-md-12">
										<h3 class="text-center">회원가입 완료</h3>
									</div>
								</div>

								<div class="form-group form-primary" style="text-align:center;">
									<h5 >회원 가입이 완료 되었습니다.</h5>
									
								</div>
								<div class="row m-t-25 text-left">
									<div class="col-12"></div>
								</div>
								<div class="row m-t-30">
									<div class="col-md-6">
										<input type="button" value="홈으로" onClick="location.href='/'"
											class="btn btn-primary btn-md btn-block waves-effect waves-light text-center m-b-20">
									</div>
									<div class="col-md-6">
										<input type="button" value="로그인" onClick="location.href='/login'"
											class="btn btn-primary btn-md btn-block waves-effect waves-light text-center m-b-20">
									</div>
								
								</div>
								
							</div>
						</div>
					<!-- end of form -->
				</div>
				<!-- end of col-sm-12 -->
			</div>
			<!-- end of row -->
		</div>
		<!-- end of container-fluid -->
	</section>
    <!-- confirm 모달을 쓸 페이지에 추가 start-->
    <section class="modal modal-section type-confirm">
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
    <section class="modal modal-section type-alert">
        <div class="enroll_box">
            <p class="menu_msg"></p>
        </div>
        <div class="enroll_btn">
            <button class="btn pink_btn modal_close">확인</button>
        </div>
    </section>
    <!-- alert 모달을 쓸 페이지에 추가 end-->





<script>


    /**
    *  alert, confirm 대용 팝업 메소드 정의 <br />
    *  timer : 애니메이션 동작 속도 <br />
    *  alert : 경고창 <br />
    *  confirm : 확인창 <br />
    *  open : 팝업 열기 <br />
    *  close : 팝업 닫기 <br />
    */
    var action_popup = {
        timer: 500, confirm: function (txt, callback) {
            if (txt == null || txt.trim() == "") {
                console.warn("confirm message is empty.");
                return;
            } else if (callback == null || typeof callback != 'function') {
                console.warn("callback is null or not function.");
                return;
            } else {
                $(".type-confirm .btn_ok").on("click", function () {
                    $(this).unbind("click");
                    callback(true);
                    action_popup.close(this);
                });
                this.open("type-confirm", txt);
            }
        },

        alert: function (txt) {
            if (txt == null || txt.trim() == "") {
                console.warn("confirm message is empty.");
                return;
            } else {
                this.open("type-alert", txt);
            }
        },

        open: function (type, txt) {
            var popup = $("." + type);
            popup.find(".menu_msg").text(txt);
            $("body").append("<div class='dimLayer'></div>");
            $(".dimLayer").css('height', $(document).height()).attr(
                "target", type);
            popup.fadeIn(this.timer);
        },

        close: function (target) {
            var modal = $(target).closest(".modal-section");
            var dimLayer;
            if (modal.hasClass("type-confirm")) {
                dimLayer = $(".dimLayer[target=type-confirm]");
            } else if (modal.hasClass("type-alert")) {
                dimLayer = $(".dimLayer[target=type-alert]")
            } else {
                console.warn("close unknown target.")
                return;
            }
            modal.fadeOut(this.timer);
            setTimeout(function () {
                dimLayer != null ? dimLayer.remove() : "";
            }, this.timer);
        }
    }
</script>




<%@ include file="/WEB-INF/views/adminFooter.jsp" %>
</body>

</html>