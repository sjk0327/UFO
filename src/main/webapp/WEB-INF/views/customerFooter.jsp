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
	
	//메뉴bar 가격조회
	$('#priceSearch').on('click', function(){
     	
     	var minPrice = $('#minPrice option:selected').val();
     	var maxPrice = $('#maxPrice option:selected').val();    	
     	alert('최소금액' + minPrice + '최대금액' + maxPrice);
     	if(minPrice != "" && maxPrice != ""){
     	var url = '/member/pro/productList/priceSearch/' + minPrice +'/'+ maxPrice;
     	
   	 	$("#tempList").load(url, function(){
     	  $("#ulList").html($("#tempList").html());
      	  $("#tempList").html(""); 
    	});
     	}
     	else{
     		alert('최소금액 혹은 최대금액을 선택해주세요.');
     	}
	});
	//가격 직접입력 조회
	$('#selfSearch').on('click', function(p_price){
		alert('selfSearch 누름?');
		var selfminprice = $('input[name=selfminprice]').val();
     	var selfmaxprice = $('input[name=selfmaxprice]').val();    	
     	alert('최소금액' + selfminprice + '최대금액' + selfmaxprice);
     	
     	if(selfminprice != "" && selfmaxprice != ""){
     	var url = '/member/pro/productList/priceSearch/' + selfminprice +'/'+ selfmaxprice;
   	 	$("#tempList").load(url, function(){
     	  $("#ulList").html($("#tempList").html());
      	  $("#tempList").html(""); 
    	});
     	}
     	else{
     		alert('최소금액 혹은 최대금액을 입력해주세요.');
     	}
	});
	//최근본상품 퀵메뉴bar
	 $(document).ready(function(){
        var currentPosition = parseInt($("#slidemenu").css("top"));
        $(window).scroll(function() {
            var position = $(window).scrollTop(); // 현재 스크롤바의 위치값을 반환합니다.
            $("#slidemenu").stop().animate({"top":position+currentPosition+"px"},700);
        });
    });

	
	
	/* javascript:alert(document.cookie) 
	setcookie("goods_view", $_COOKIE['goods_view'].",".$_GET['idx']);
	// 쿠키 가져와서 최근본 상품 구현 중....
	function addCookie(id) {
		  var items = getCookie('productItems'); // 이미 저장된 값을 쿠키에서 가져오기
		  var maxItemNum = 5; // 최대 저장 가능한 아이템개수
		  var expire = 7; // 쿠키값을 저장할 기간
		  if (items) {
		    var itemArray = items.split(',');
		    if (itemArray.indexOf(id) != -1) {
		      // 이미 존재하는 경우 종료
		      console.log('Already exists.');
		    }
		    else {
		      // 새로운 값 저장 및 최대 개수 유지하기
		      itemArray.unshift(id);
		      if (itemArray.length > maxItemNum ) itemArray.length = 5;
		      items = itemArray.join(',');
		      setCookie('productItems', items, expire);
		    }
		  }
		  else {
		    // 신규 id값 저장하기
		    setCookie('productItems', id, expire);
		  }
		}
 */

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
            Copyright &copy;<script data-cfasync="false" src="/cdn-cgi/scripts/5c5dd728/cloudflare-static/email-decode.min.js"></script><script>document.write(new Date().getFullYear());</script> All rights reserved | ThisWebSite is made with <i class="icon-heart" style="color:red;" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank" class="text-primary" style="font-weight: bold;">Team UFO(김수정, 지승빈, 공병찬, 김성훈, 김신영, 이정노)</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<i class="icon-heart" style="color:red;" aria-hidden="true"></i><a href="/admin" id="goadmin">바로가기</a>
            <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
            </p>
          </div>
          
        </div>
      </div>
      </div>
      </div>
    </footer>