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
<style>
 .col-md-3 { font-size : 13px; }
 .margin { margin-top: 100px; }
 .padding{padding-top: 21px;}
 .goadmin{ align : center; }
</style>

<script>

	/*고객productList function*/
	

	$('#sortPh').on('click', function(){
     	var url = "/member/pro/productList/sort/pricehigh";
    	 $("#tempList").load(url, function(){
      	  $("#ulList").html($("#tempList").html());
       	  $("#tempList").html(""); 
     	});
	});
	$('#sortPl').on('click', function(){
     	var url = "/member/pro/productList/sort/pricelow";
    	 $("#tempList").load(url, function(){
      	  $("#ulList").html($("#tempList").html());
       	  $("#tempList").html(""); 
     	});
	});
	$('#sortRc').on('click', function(){
     	var url = "/member/pro/productList/sort/recommand";
    	 $("#tempList").load(url, function(){
      	  $("#ulList").html($("#tempList").html());
       	  $("#tempList").html(""); 
     	});
	});
	

	//신영-메뉴bar 가격조회
	   $('#priceSearch').on('click', function(){
	        var minPrice = $('#minPrice option:selected').val();
	        var maxPrice = $('#maxPrice option:selected').val();       
	     	
	        if(minPrice != "" && maxPrice != ""){
	        	if(minPrice )
	        var url = '/member/pro/productList/priceSearchRent/' + minPrice +'/'+ maxPrice;
	        
	          $("#tempList").load(url, function(){
	          $("#ulList").html($("#tempList").html());
	           $("#tempList").html(""); 
	       });
	        }
	        else{
	        	 action_popup.confirm("조회하실 가격을 선택해 주세요.", function (res) {
	        	 document.getElementsByName("minPrice")[0].focus();
	 	        })
	        }
	   });
	   $('#priceSearchBuy').on('click', function(){
	        var minPriceBuy = $('#minPriceBuy option:selected').val();
	        var maxPriceBuy = $('#maxPriceBuy option:selected').val();       
	     
	        if(minPriceBuy != "" && maxPriceBuy != ""){
	        var url = '/member/pro/productList/priceSearchBuy/' + minPriceBuy +'/'+ maxPriceBuy;
	        
	          $("#tempList").load(url, function(){
	          $("#ulList").html($("#tempList").html());
	          $("#tempList").html(""); 
	       });
	        }
	        else{
	        	 action_popup.confirm("조회하실 가격을 선택해 주세요.", function (res) {
	        	 document.getElementsByName("minPriceBuy")[0].focus();
	 	        })
	        }
	   });
	   
	   
	    $(".modal_close").on("click", function () {
	           action_popup.close(this);
	       });
	    
	    
	   //신영-가격 직접입력 조회
	   $('#selfSearchRent').on('click', function(){
	      
	      var selfminprice = $('input[name=selfminprice]').val();
	      var selfmaxprice = $('input[name=selfmaxprice]').val();
	       
	        if(selfminprice != "" && selfmaxprice != ""){
	        var url = '/member/pro/productList/priceSearchRent/' + selfminprice +'/'+ selfmaxprice;
	          $("#tempList").load(url, function(){
	          $("#ulList").html($("#tempList").html());
	           $("#tempList").html(""); 
	       });
	        }
	        else{
	        	action_popup.confirm("조회하실 가격을 입력해 주세요.", function (res) {
		        document.getElementsByName("selfminprice")[0].focus();
	        	})
	        }
	        
	   });
	   $('#selfSearchBuy').on('click', function(){
		      
	      var selfminprice = $('input[name=selfminpriceBuy]').val();
	      var selfmaxprice = $('input[name=selfmaxpriceBuy]').val();
	      
	        if(selfminprice != "" && selfmaxprice != ""){
	        var url = '/member/pro/productList/priceSearchBuy/' + selfminprice +'/'+ selfmaxprice;
	          $("#tempList").load(url, function(){
	          $("#ulList").html($("#tempList").html());
	           $("#tempList").html(""); 
	       });
		        }
		        else{
		        	action_popup.confirm("조회하실 가격을 입력해 주세요.", function (res) {
			        document.getElementsByName("selfminprice")[0].focus();
		        	})
		        }
		        
		   });
	//신영-최근본상품 퀵메뉴bar
	 /* $(document).ready(function(){
        var currentPosition = parseInt($("#slidemenu").css("top"));
        $(window).scroll(function() {
            var position = $(window).scrollTop(); // 현재 스크롤바의 위치값을 반환합니다.
            $("#slidemenu").stop().animate({"top":position+currentPosition+"px"},700);
        });
    }); */
	 //신영-상품클릭시 조회수 증가
	 function productReadUpdate(p_id) {			
			var p_id = p_id;			
			location.href = '/member/pro/productList/readUpdate/' + p_id;
			 }
			 
	//신영-모달창 pop
	var action_popup = {
	    timer: 500,
	    confirm: function (txt, callback) {
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
	        $(".dimLayer").css('height', $(document).height()).attr("target", type);
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
	var newValue;
    // 모든 텍스트의 변경에 반응합니다.
    $("#keyword").on("change paste", function() {      
    
       newValue = $(this).val();  
       location.href = '/member/pro/productList/' + newValue;       
    }); 
    
    $(function() {
		$('ul.tab li').click(function() {
			var activeTab = $(this).attr('data-tab');
			$('ul.tab li').removeClass('current');
			$('.tabcontent').removeClass('current');
			$(this).addClass('current');
			$('#' + activeTab).addClass('current');
		})
	});
  //공통 둥둥이 배너 실행
	$('.main_moving_banner').length && common.bann.init();
 
	var parser = new UserAgentUtil(navigator.userAgent);
	// alert(parser.getBrowser().name + " : " + parser.getBrowser().version);
 	if (parser.getBrowser().name.indexOf("msie") >= 0 && (parser.getBrowser().version.startWith("8") || parser.getBrowser().version.startWith("7"))) {
		$(".infoUpgr").show();
	}
 	
    //승빈 탈퇴 막기 메시지 end
	/*
	$(function(){
			$('#resign').click(function(){
				if(!confirm('정말로 탈퇴하시겠습니까?')){
					return false;
				}
				
			}
			)
		})
	*/
		
	
	//승빈 탈퇴 막기 메시지 end
	
	

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
            Copyright &copy;<script data-cfasync="false" src="/cdn-cgi/scripts/5c5dd728/cloudflare-static/email-decode.min.js"></script>
            <script>document.write(new Date().getFullYear());</script>
            All rights reserved | ThisWebSite is made with <i class="icon-heart" style="color:red;" aria-hidden="true">
            </i> by <a href="https://colorlib.com" target="_blank" class="text-primary" style="font-weight: bold;">
            Team UFO(김수정, 지승빈, 공병찬, 김성훈, 김신영, 이정노)</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<!-- <i class="icon-heart" style="color:red;" 
            aria-hidden="true"></i> --><a href="/admin" id="goadmin">바로가기</a>
            <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
            </p>
          </div>
          
        </div>
      </div>
      </div>
      </div>
    </footer>