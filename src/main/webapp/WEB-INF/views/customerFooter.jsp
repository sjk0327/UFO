<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- Required Jquery -->
<script type="text/javascript" src="/resources/assets/js/jquery/jquery.min.js"></script>
<script type="text/javascript" src="/resources/assets/js/jquery-ui/jquery-ui.min.js "></script>
<script type="text/javascript" src="/resources/assets/js/popper.js/popper.min.js"></script>
<script type="text/javascript" src="/resources/assets/js/bootstrap/js/bootstrap.min.js "></script>
<script type="text/javascript" src="/resources/assets/pages/widget/excanvas.js "></script>
<style>
 .col-md-3 { font-size : 13px; }
 .margin { margin-top: 100px; }
 .padding{padding-top: 21px;}
</style>

<script>

	/*고객productList function*/
	function pricehigh() {
	
		alert('ajax...ㅋ..?');
		var sort = $('#sort').val();
		alert(sort);
		$.ajax({
			type : "POST", //요청 메소드 방식
			data : {"sort" : sort},
			url : "/member/pro/productList/sort",
			dataType : "json", //서버가 요청 URL을 통해서 응답하는 내용의 타입
			
			success : function(result) {
				if(result.error == true){
					alert("성공하였습니다.");
					
					location.href='/member/pro/productList/';
				}
				else{
					alert("실패하였습니다.");
					location.href='/member/pro/productList/';
				}
				
			},
			
			error : function(a, b, c) {
				
				alert(a + b + c);
			}
		});
		
	}
		





</script>
<footer class="site-footer border-top">

      <div class="container">
        <div class="row">
          <div class="col-md-12 col-lg-12">
          
           	<div class="row">
           	
          		<div class="col-md-2">
          		<h3 class="footer-heading mb-4">Company</h3>
              		<img src="/resources/common/images/ufologo.jpg" alt="Image placeholder" class="img-fluid rounded mb-4">
              	</div>
              	<div class="col-md-4">
              		<p><br><br>Use First Own 이라는 모토로 부담스러운 결정을<br> 덜어드리고 전자기기를 대여부터 구매까지<br> 빠르고 편리한 서비스를 제공합니다.</p>
              	</div>
         		 <div class="col-md-6 col-lg-6">
            		<div class="block-5 mb-5">
             	 <h2 class="footer-heading mb-4">Contact Us</h2>
              	<ul class="list-unstyled">
                <li class="address">서울시 금천구 가산동 월드메르디앙 2차 413호 KOSMO</li>
                <li class="phone"><a href="tel://23923929210">+2 123 4567</a></li>
                <li class="email"><a href="https://github.com/sjk0327/UFO.git">https://github.com/sjk0327/UFO.git</a></li>
              </ul>
         			</div>
    	     	</div>
        </div>
      <!--   <div class="row pt-5 mt-5 text-center"> -->
        <div class="row mt-5 text-center">
          <div class="col-md-12">
            <p>
            <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
            Copyright &copy;<script data-cfasync="false" src="/cdn-cgi/scripts/5c5dd728/cloudflare-static/email-decode.min.js"></script><script>document.write(new Date().getFullYear());</script> All rights reserved | ThisWebSite is made with <i class="icon-heart" style="color:red;" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank" class="text-primary" style="font-weight: bold;">Team UFO(김수정, 지승빈, 공병찬, 김성훈, 김신영, 이정노)</a>
            <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
            </p>
          </div>
          
        </div>
      </div>
      </div>
      </div>
    </footer>