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

		/*productList function*/
		function productDelete(p_id) {
			
			alert("id::" + p_id);
			
			
			var p_id = p_id;
			if (confirm('상품을 삭제하시겠습니까?')) {
				location.href = '/admin/pro/productDelete/' + p_id;
			}else{
				alert('삭제 취소하였습니다.');
				location.href ='/admin/pro/productList';
				 
				 //return false;
			 }
		}
		function productUpdate(p_id) {
			var p_id = p_id;
			if (confirm('상품을 수정하시겠습니까?')) {	
				location.href = '/admin/pro/productDetail/' + p_id;
			}
		}
		function productDeleteSeperate() {
			var p_id = p_id;
			if (confirm('상품을 수정하시겠습니까?')) {	
				location.href = '/admin/pro/productDetail/' + p_id;
			}
		}
		$(function(){
		    if($('input').is(":checked") == true){
		        $('b').text('체크된 상태');
		    }
		    if($('input').is(":checked") == false){
		        console.log('체크 안 된 상태');
		    }
		});
		
		 function allChk(obj){
		    var chkObj = document.getElementsByName("RowCheck");
		    var rowCnt = chkObj.length - 1;
		    var check = obj.checked;
		    if (check) {﻿
		        for (var i=0; i<=rowCnt; i++){
		         if(chkObj[i].type == "checkbox")
		             chkObj[i].checked = true;
		        }
		    	} else {
		        	for (var i=0; i<=rowCnt; i++) {
		        	 if(chkObj[i].type == "checkbox"){
		             chkObj[i].checked = false;
		         }
		        }
		    }
		}  
		 function checkboxArr() {
			 
			var array = new Array(); // 배열 선언
			
			
			$('input:checkbox[name=RowCheck]:checked').each(function() { // 체크된 체크박스의 value 값을 가지고 온다.
			    
				array.push(this.value);
			});
						
			$("#arrayParam").val(array);
				
			$("#form").attr("action", "/admin/pro/productDelete2");  
			$("#form").submit();
		}
		 
	
	 
 /*다음 우편번호 찾기 javaScript */
   
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
 
 
 
 
 
			/*사진 미리 보여주기 함수 memberDetail*/
			    $(document).ready(function(){ 
			        var fileTarget = $('.upload-hidden'); 
			        fileTarget.on('change', function(){ // 값이 변경되면 
			            if(window.FileReader){ // modern browser 
			                var filename = $(this)[0].files[0].name; 
			            } else { // old IE 
			                var filename = $(this).val().split('/').pop().split('\\').pop(); // 파일명만 추출 
			            } // 추출한 파일명 삽입 
			            $(this).siblings('.upload-name').val(filename); 
			        }); 
			    });
			
			    var imgTarget = $('.upload-hidden');
			
			    imgTarget.on('change', function(){
			        var parent = $(this).parent();
			        parent.children('.m_imgPreview').remove();
			
			        if(window.FileReader){
			            if(!$(this)[0].files[0].type.match(/image\//)) return;
			
			            var reader = new FileReader(); 
			            reader.onload = function(e){ 
			                var src = e.target.result; 
			                parent.prepend('<div class="m_imgPreview"><img src="' + src +'" class="img-fluid img-circle" alt="프로필 이미지" style="display: block;margin-left: auto;margin-right: auto;"></div>'); 
			            
			            } 
			            reader.readAsDataURL($(this)[0].files[0]);
			        }
			    });
			   


    /*productDetail function*/
   	jQuery(function($) {
   	    var targetText = "${productVO.p_category}";    
   	    var targetVal = $('#p_category option:contains(' + targetText + ')').val();   
   	    $('#p_category').val(targetVal);   
   	});

   	//상품삭제
   	function productDelete(p_id) {
   	if (confirm(' 상품을 삭제하시겠습니까?')) {
   		location.href = '/admin/pro/productDelete/${productVO.p_id }';
   	 }
      }
   	//상품수정
   	function productUpdate() {
   		if (confirm(' 상품을 수정하시겠습니까')) {
   			 var updateForm = document.updateForm ;            
   			 updateForm.submit();
   		 }
   	   }
   	
   	//상품목록으로가기
   	function productList() {
   			location.href = '/admin/pro/productList';		 
   	   }
   	
   	
   	//mainImg 파일업로드시 바로보이게
   	const mainImageFile = document.querySelector('#fileUploadMain');
   	mainImageFile.addEventListener('change', e => {
   	  const file = e.target.files[0];
   	  const mainImage = document.querySelector(".thumbnailMain");
   	  mainImage.src = window.URL.createObjectURL(file);
   	});
   	//subImg 파일업로드시 바로보이게
   	const subImageFile = document.querySelector('#fileUploadSub');
   	subImageFile.addEventListener('change', e => {
   	  const file = e.target.files[0];
   	  const subImage = document.querySelector(".thumbnailSub");
   	  subImage.src = window.URL.createObjectURL(file);
   	});

   	
   	/*productInsert function*/
   	//상품등록
   	function productInsert() {
   		if (confirm(' 상품을 추가하시겠습니까')) {
   			 var insertForm = document.insertForm ;            
   			 insertForm.submit();
   		 }
   	   }
   	
   	/*rentDetail function*/
    $('#returnbtn').click(function() {
      				
      					if (confirm("해당 회원의 대여 제품을 반납 처리하시겠습니까?") == true){   
      						window.location='/admin/rent/returnConfirm';
      			  	  }else{   
      						 event.preventDefault();
      			           event.stopPropagation();

      			  	  };	
      				});
    
    $('#latebtn').click(function() {
			
			if (confirm("해당 회원에게 연체료 결제 주의 안내 메세지를 보내시겠습니까?") == true){   
	
	  	  }else{   
				 event.preventDefault();
	           event.stopPropagation();

	  	  };	
		});
    

   	
 
</script>

