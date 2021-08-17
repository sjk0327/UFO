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
