<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    

<!-- Required Jquery -->
<script type="text/javascript" src="/resources/assets/js/jquery/jquery.min.js"></script>
<script type="text/javascript" src="/resources/assets/js/jquery-ui/jquery-ui.min.js "></script>
<script type="text/javascript" src="/resources/assets/js/popper.js/popper.min.js"></script>
<script type="text/javascript" src="/resources/assets/js/bootstrap/js/bootstrap.min.js "></script>
<script type="text/javascript" src="/resources/assets/pages/widget/excanvas.js "></script>
<!-- waves js -->
<script src="/resources/assets/pages/waves/js/waves.min.js"></script>
<!-- jquery slimscroll js -->
<script type="text/javascript" src="/resources/assets/js/jquery-slimscroll/jquery.slimscroll.js "></script>
<!-- modernizr js -->
<script type="text/javascript" src="/resources/assets/js/modernizr/modernizr.js "></script>
<!-- slimscroll js -->
<script type="text/javascript" src="/resources/assets/js/SmoothScroll.js"></script>
<script src="/resources/assets/js/jquery.mCustomScrollbar.concat.min.js "></script>
<!-- Chart js -->
<script type="text/javascript" src="/resources/assets/js/chart.js/Chart.js"></script>
<!-- amchart js -->
<script src="https://www.amcharts.com/lib/3/amcharts.js"></script>
<script src="/resources/assets/pages/widget/amchart/gauge.js"></script>
<script src="/resources/assets/pages/widget/amchart/serial.js"></script>
<script src="/resources/assets/pages/widget/amchart/light.js"></script>
<script src="/resources/assets/pages/widget/amchart/pie.min.js"></script>
<script src="https://www.amcharts.com/lib/3/plugins/export/export.min.js"></script>
<!-- menu js -->
<script src="/resources/assets/js/pcoded.min.js"></script>
<script src="/resources/assets/js/vertical-layout.min.js "></script>
<!-- custom js -->
<script type="text/javascript" src="/resources/assets/pages/dashboard/custom-dashboard.js"></script>
<script type="text/javascript" src="/resources/assets/js/script.js "></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>



<!-- admin logout confirm -->
<script>
		$(function(){
			$('#logout').click(function(){
				if(!confirm('정말로 로그아웃하시겠습니까?')){
					return false;
				}
			}
			)
		})

		/*paging function*/
		$(function() {
			//perPageNum select 박스 설정
			setPerPageNumSelect();

			//등록, 삭제 후 문구 처리
			var result = '${result}';
			$(function() {
				if (result === 'registerOK') {
					$('#registerOK').removeClass('hidden');
					$('#registerOK').fadeOut(2000);
				}
				if (result === 'removeOK') {
					$('#removeOK').removeClass('hidden');
					$('#removeOK').fadeOut(2000);
				}
			})

			//prev 버튼 활성화, 비활성화 처리
			var canPrev = '${pageMaker.prev}';
			if (canPrev !== 'true') {
				$('#page-prev').addClass('disabled');
			}

			//next 버튼 활성화, 비활성화 처리
			var canNext = '${pageMaker.next}';
			if (canNext !== 'true') {
				$('#page-next').addClass('disabled');
			}

			//현재 페이지 파란색으로 활성화
			var thisPage = '${pageMaker.cri.page}';
			//매번 refresh 되므로 다른 페이지 removeClass 할 필요는 없음->Ajax 이용시엔 해야함
			$('#page' + thisPage).addClass('active');
		})

		function setPerPageNumSelect() {
			var perPageNum = "${pageMaker.cri.perPageNum}";
			var $perPageSel = $('#perPageSel');
			var thisPage = '${pageMaker.cri.page}';
			$perPageSel.val(perPageNum).prop("selected", true);
			//PerPageNum가 바뀌면 링크 이동
			$perPageSel.on('change', function() {
				//pageMarker.makeQuery 사용 못하는 이유: makeQuery는 page만을 매개변수로 받기에 변경된 perPageNum을 반영못함
				window.location.href = "listPage?page=" + thisPage
						+ "&perPageNum=" + $perPageSel.val();
			})
		}
</script>
<footer class="site-footer border-top" style="margin-top: 100px;">

      <div class="container">
        <div class="row">
          <div class="col-md-12 col-lg-12 col-xs-12">
          
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
            Copyright &copy;<script data-cfasync="false" src="/cdn-cgi/scripts/5c5dd728/cloudflare-static/email-decode.min.js"></script><script>document.write(new Date().getFullYear());</script> All rights reserved | ThisWebSite is made with <i class="icon-heart" style="color:red;" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank" class="text-primary" style="font-weight: bold;">Team UFO(김수정, 지승빈, 공병찬, 김성훈, 김신영, 이정노)</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<i class="icon-heart" style="color:red;" aria-hidden="true"></i><a href="/" id="goadmin">바로가기</a>
            <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
            </p>
          </div>
          
        </div>
      </div>
      </div>
      </div>
    </footer>