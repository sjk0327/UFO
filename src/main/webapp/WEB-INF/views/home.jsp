<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
  <head>
    <title>UFO</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- Favicon icon -->
<link rel="shortcut icon" type="image/x-icon" href="/resources/Images/ufo_purple_favi.ico" />
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Mukta:300,400,700"> 
    <link rel="stylesheet" href="resources/common/fonts/icomoon/style.css">

    <link rel="stylesheet" href="resources/common/css/bootstrap.min.css">
    <link rel="stylesheet" href="resources/common/css/magnific-popup.css">
    <link rel="stylesheet" href="resources/common/css/jquery-ui.css">
    <link rel="stylesheet" href="resources/common/css/owl.carousel.min.css">
    <link rel="stylesheet" href="resources/common/css/owl.theme.default.min.css">


    <link rel="stylesheet" href="resources/common/css/aos.css">

    <link rel="stylesheet" href="resources/common/css/style.css">
    
    
    
    
    <style type="text/css">
   #container {
	width:210px;
	margin:0 auto;
	text-align:left;
}
.tab {
	list-style: none;
	margin: 0;
	padding: 0;
	overflow: hidden;
}
/* Float the list items side by side */
.tab li {
	float: left;
}
/* Style the links inside the list items */
.tab li a {
	display: inline-block;
	color: #000;
	text-align: center;
	text-decoration: none;
	padding: 9px 13px;
	font-size: 12px;
	transition:0.3s;
}
/* Style the tab content */
.tabcontent {
	display: none;
	background-color: rgb(246,246,246);
	padding: 6px -20px;
	color:#F6F6F6;
	text-align:left;
}
ul.tab li.current{
	background-color: rgb(246,246,246);
	color: #F6F6F6;
}
.tabcontent.current {
	display: block;
}
.small1 { width: 100px; height: 100px; }
.small2 { width: 80px; height: 80px; align:center;}
.mb-1 { font-size : 18px; }
.blackColoer { color : red;}
#searchType {
   width: 85px;
   height: 38px;
   padding-left: 8px;
   font-size: 13px;
   color: #585858;
   border-radius: 5px;
}
#slidemenu{background:#12cf3d;position:absolute;width:100px;top:50px;right:10px;}
#imghover:hover { margin:0px ; border:2px solid #888; }  
* {padding: 0;margin: 0;}
body, html {height: 100%;}
.modal .btn{cursor: pointer;border: 1px solid #999999;text-align: center;border-radius: 5px;outline: none;font-weight: 500;}
.dimLayer{display: block;width: 100%;background-color: rgba(0, 0, 0, 0.3);position: fixed;left: 0;top: 0px;margin: 0;padding: 0;z-index: 9998;}
.modal{width: 600px;height: 252px;border-radius: 10px;padding: 80px 24px;box-sizing: border-box;text-align: center;}
.modal-section{background: #ffffff;box-sizing: border-box;display: none;position: absolute;top: 50%;left: 50%;-webkit-transform: translate(-50%, -50%);
-ms-transform: translate(-50%, -50%);-moz-transform: translate(-50%, -50%);-o-transform: translate(-50%, -50%);
transform: translate(-50%, -50%);display: none;z-index: 9999;}
.menu_msg{font-size: 21px;font-weight: 500;}
.enroll_box p{padding-bottom: 56px;}
.gray_btn {width: 90px;background: #ffffff;color: #999999;height: 36px;line-height: 36px;transition: 0.5s;font-size: 17px;}
.pink_btn {width: 90px;background: #7971ea;color: #fff;height: 36px;line-height: 36px;transition: 0.5s;font-size: 17px;border: none;}
#mainMenuList {text-align: center; width:100%; height:94px; background-color:#f4f4f4; padding-bottom: -15px;}
#mainMenuList ul {text-align: center; width:1200px; margin:0 auto; padding:-16px 0;}
#mainMenuList ul:after {content:""; display:block; clear:both;}
#mainMenuList ul li {float:left; height:120px; width:15%; text-align:center;}
#mainMenuList ul li p {padding:10px 0 12px 0; text-align:center; font-weight:700;}
#mainMenuList ul li a {display:block; font-size:18px; letter-spacing:-1px; font-weight:700;}
#mainMenuList ul li a:hover {color:#8A2BE2; text-decoration:none;}
#listClick:hover { border: solid 2px #4B0082; color:#f26617; }
ul{ list-style:none;}
.mb-1 {
  transform: scale(1);
  -webkit-transform: scale(1);
  -moz-transform: scale(1);
  -ms-transform: scale(1);
  -o-transform: scale(1);
  transition: all 0.5s ease-in-out;  /* 서서히 확대 */
}
.mb-1:hover {
  transform: scale(1.1);
  -webkit-transform: scale(1.1);
  -moz-transform: scale(1.1);
  -ms-transform: scale(1.1);
  -o-transform: scale(1.1);
}
.inp_division { font-weight:700; }
#margin { margin:20px; padding:80px; }
#minPrice { height: 32px; width: 81px; }
#maxPrice { height: 32px; width: 81px; }
#minPriceBuy{ height: 32px; width: 81px; }
#maxPriceBuy{ height: 32px; width: 81px; }
#selfminprice{ height: 32px; width: 81px; }
#selfmaxprice{ height: 32px; width: 81px; }
#priceSearch { height: 32px; width: 90px; font-size: 14px; text-align:"center"; }
#selfSearchRent { height: 32px; width: 90px; font-size: 14px; text-align:"center"; }
#selfSearchBuy { height: 32px; width: 90px; font-size: 14px; text-align:"center"; }
#priceSearchBuy { height: 32px; width: 90px; font-size: 14px; text-align:"center"; }
#selfSearch { height: 32px; width: 90px; font-size: 14px; text-align:"center"; }
#textdeco {text-decoration: line-through;}
    .site-navbar{
    position:sticky;
    top: 0px;
    }
    .js-logo-clone{
    
    font-size:50pt;
    }
    .site-navigation text-right text-md-center{
    padding : -50px;
    }
    </style>
  </head>
  <body>
  
  <div class="site-wrap">
   <%@ include file="/WEB-INF/views/customerHeader.jsp" %>
    <header class="site-navbar" role="banner">
      <nav class="site-navigation text-right text-md-center" role="navigation" style="background-color:#f4f4f4;">
        <div class="container">
          <ul class="site-menu js-clone-nav d-none d-md-block">
            <li class="has-children">
              <div class="row">
          <div class="col-md-12">
            <div class="site-section site-blocks-2">
                <div class="row justify-content-center text-center mb-5">
                  <div class="col-md-7 site-section-heading pt-4">
                    <h2></h2>
                  </div>
                </div>
                <div class="container">
                 <div class="row">
                 <div class="col-md-12">
  <div id="mainMenuList" style="text-align:center;" >
	<ul>		
				<li class="mb-1"><a href="/member/pro/productList/" ><img src="/resources/common/images/total.png" /><p>전체리스트</p></a></li>
		<li class="mb-1"><a href="/member/pro/productList?keyword=스마트폰" ><img src="/resources/common/images/phone.png" /><p>스마트폰</p></a></li>
		<li class="mb-1"><a href="/member/pro/productList?keyword=노트북" ><img src="/resources/common/images/laptop.png" /><p>노트북</p></a></li>  
		<li class="mb-1"><a href="/member/pro/productList?keyword=카메라" ><img src="/resources/common/images/camera.png" /><p>카메라</p></a></li>  
		<li class="mb-1"><a href="/member/pro/productList?keyword=스마트워치" ><img src="/resources/common/images/watch.png" /><p>스마트워치</p></a></li>  
		<li class="mb-1"><a href="/member/pro/productList?keyword=태블릿" ><img src="/resources/common/images/tablet.png" /><p>태블릿PC</p></a></li>    		
  </ul>   
</div>
        </div>   </div>   </div>
            </div>
          </div>
        </div>
        
      </nav>
    </header>
       <!--  <div class="row align-items-start align-items-md-center justify-content-end">
          <div class="col-md-5 text-center text-md-left pt-5 pt-md-0">
            <h1 class="mb-2">Finding Your Perfect Shoes</h1>
            <div class="intro-text text-center text-md-left">
              <p class="mb-4">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus at iaculis quam. Integer accumsan tincidunt fringilla. </p>
              <p> -->
                <!-- <a href="/member/pro/productList" class="btn btn-sm btn-primary">Shop Now</a> -->
              </p>
            </div>
          </div>
        </div>
      </div>
    </div>

    <div class="site-section site-section-sm site-blocks-1">
      <div class="container">
        <div class="row">
          <div class="col-md-6 col-lg-4 d-lg-flex mb-4 mb-lg-0 pl-4" data-aos="fade-up" data-aos-delay="">
            <div class="icon mr-4 align-self-start">
              <span class="icon-truck"></span>
            </div>
            <div class="text">
              <h2 class="text-uppercase">Free Shipping</h2>
              <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus at iaculis quam. Integer accumsan tincidunt fringilla.</p>
            </div>
          </div>
          <div class="col-md-6 col-lg-4 d-lg-flex mb-4 mb-lg-0 pl-4" data-aos="fade-up" data-aos-delay="100">
            <div class="icon mr-4 align-self-start">
              <span class="icon-refresh2"></span>
            </div>
            <div class="text">
              <h2 class="text-uppercase">Free Returns</h2>
              <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus at iaculis quam. Integer accumsan tincidunt fringilla.</p>
            </div>
          </div>
          <div class="col-md-6 col-lg-4 d-lg-flex mb-4 mb-lg-0 pl-4" data-aos="fade-up" data-aos-delay="200">
            <div class="icon mr-4 align-self-start">
              <span class="icon-help"></span>
            </div>
            <div class="text">
              <h2 class="text-uppercase">Customer Support</h2>
              <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus at iaculis quam. Integer accumsan tincidunt fringilla.</p>
            </div>
          </div>
        </div>
      </div>
    </div>
<div
  id="kakao-talk-channel-chat-button"
  data-channel-public-id="_xlGxlxcs"
  data-title="consult"
  data-size="large"
  data-color="yellow"
  data-shape="pc"
  data-support-multiple-densities="true"
></div>
    <div class="site-section site-blocks-2">
      <div class="container">
        <div class="row">
          <div class="col-sm-6 col-md-6 col-lg-4 mb-4 mb-lg-0" data-aos="fade" data-aos-delay="">
            <a class="block-2-item" href="#">
              <figure class="image">
                <img src="resources/common/images/women.jpg" alt="" class="img-fluid">
              </figure>
              <div class="text">
                <span class="text-uppercase">Collections</span>
                <h3>Women</h3>
              </div>
            </a>
          </div>
          <div class="col-sm-6 col-md-6 col-lg-4 mb-5 mb-lg-0" data-aos="fade" data-aos-delay="100">
            <a class="block-2-item" href="#">
              <figure class="image">
                <img src="resources/common/images/children.jpg" alt="" class="img-fluid">
              </figure>
              <div class="text">
                <span class="text-uppercase">Collections</span>
                <h3>Children</h3>
              </div>
            </a>
          </div>
          <div class="col-sm-6 col-md-6 col-lg-4 mb-5 mb-lg-0" data-aos="fade" data-aos-delay="200">
            <a class="block-2-item" href="#">
              <figure class="image">
                <img src="resources/common/images/men.jpg" alt="" class="img-fluid">
              </figure>
              <div class="text">
                <span class="text-uppercase">Collections</span>
                <h3>Men</h3>
              </div>
            </a>
          </div>
        </div>
      </div>
    </div>

   <div class="site-section block-3 site-blocks-2 bg-light">
      <div class="container">
        <div class="row justify-content-center">
          <div class="col-md-7 site-section-heading text-center pt-4">
            <h2>Featured Products</h2>
          </div>
        </div>
        <div class="row">
          <div class="col-md-12">
            <div class="nonloop-block-3 owl-carousel">
              <div class="item">
                <div class="block-4 text-center">
                  <figure class="block-4-image">
                    <img src="resources/common/Images/shoe_1.jpg" alt="Image placeholder" class="img-fluid">
                  </figure>
                  <div class="block-4-text p-4">
                    <h3><a href="#">Tank Top</a></h3>
                    <p class="mb-0">Finding perfect t-shirt</p>
                    <p class="text-primary font-weight-bold">$50</p>
                  </div>
                </div>
              </div>
              <div class="item">
                <div class="block-4 text-center">
                  <figure class="block-4-image">
                    <img src="resources/common/Images/shoe_1.jpg" alt="Image placeholder" class="img-fluid">
                  </figure>
                  <div class="block-4-text p-4">
                    <h3><a href="#">Corater</a></h3>
                    <p class="mb-0">Finding perfect products</p>
                    <p class="text-primary font-weight-bold">$50</p>
                  </div>
                </div>
              </div>
              <div class="item">
                <div class="block-4 text-center">
                  <figure class="block-4-image">
                    <img src="resources/common/Images/shoe_1.jpg" alt="Image placeholder" class="img-fluid">
                  </figure>
                  <div class="block-4-text p-4">
                    <h3><a href="#">Polo Shirt</a></h3>
                    <p class="mb-0">Finding perfect products</p>
                    <p class="text-primary font-weight-bold">$50</p>
                  </div>
                </div>
              </div>
              <div class="item">
                <div class="block-4 text-center">
                  <figure class="block-4-image">
                    <img src="resources/common/Images/shoe_1.jpg" alt="Image placeholder" class="img-fluid">
                  </figure>
                  <div class="block-4-text p-4">
                    <h3><a href="#">T-Shirt Mockup</a></h3>
                    <p class="mb-0">Finding perfect products</p>
                    <p class="text-primary font-weight-bold">$50</p>
                  </div>
                </div>
              </div>
              <div class="item">
                <div class="block-4 text-center">
                  <figure class="block-4-image">
                    <img src="resources/common/Images/shoe_1.jpg" alt="Image placeholder" class="img-fluid">
                  </figure>
                  <div class="block-4-text p-4">
                    <h3><a href="#">Corater</a></h3>
                    <p class="mb-0">Finding perfect products</p>
                    <p class="text-primary font-weight-bold">$50</p>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>

    <div class="site-section block-8">
      <div class="container">
        <div class="row justify-content-center  mb-5">
          <div class="col-md-7 site-section-heading text-center pt-4">
            <h2>Big Sale!</h2>
          </div>
        </div>
        <div class="row align-items-center">
          <div class="col-md-12 col-lg-7 mb-5">
            <a href="#"><img src="resources/common/images/blog_1.jpg" alt="Image placeholder" class="img-fluid rounded"></a>
          </div>
          <div class="col-md-12 col-lg-5 text-center pl-md-5">
            <h2><a href="#">50% less in all items</a></h2>
            <p class="post-meta mb-4">By <a href="#">Carl Smith</a> <span class="block-8-sep">&bullet;</span> September 3, 2018</p>
            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quisquam iste dolor accusantium facere corporis ipsum animi deleniti fugiat. Ex, veniam?</p>
            <p><a href="#" class="btn btn-primary btn-sm">Shop Now</a></p>
          </div>
        </div>
      </div>
    </div>
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
    <%@ include file="/WEB-INF/views/customerFooter.jsp" %>

  </div>

  <script src="resources/common/js/jquery-3.3.1.min.js"></script>
  <script src="resources/common/js/jquery-ui.js"></script>
  <script src="resources/common/js/popper.min.js"></script>
  <script src="resources/common/js/bootstrap.min.js"></script>
  <script src="resources/common/js/owl.carousel.min.js"></script>
  <script src="resources/common/js/jquery.magnific-popup.min.js"></script>
  <script src="resources/common/js/aos.js"></script>

  <script src="resources/common/js/main.js"></script>
  <script type="text/javascript">
  /**
	 *  alert, confirm 대용 팝업 메소드 정의 <br/>
	 *  timer : 애니메이션 동작 속도 <br/>
	 *  alert : 경고창 <br/>
	 *  confirm : 확인창 <br/>
	 *  open : 팝업 열기 <br/>
	 *  close : 팝업 닫기 <br/>
	 */
	var action_popup = {
		timer : 500,
		confirm : function(txt, callback) {
			if (txt == null || txt.trim() == "") {
				console.warn("confirm message is empty.");
				return;
			} else if (callback == null || typeof callback != 'function') {
				console.warn("callback is null or not function.");
				return;
			} else {
				$(".type-confirm .btn_ok").on("click", function() {
					$(this).unbind("click");
					callback(true);
					action_popup.close(this);
				});
				this.open("type-confirm", txt);
			}
		},
		alert : function(txt) {
			if (txt == null || txt.trim() == "") {
				console.warn("confirm message is empty.");
				return;
			} else {
				this.open("type-alert", txt);
			}
		},
		open : function(type, txt) {
			var popup = $("." + type);
			popup.find(".menu_msg").text(txt);
			$("body").append("<div class='dimLayer'></div>");
			$(".dimLayer").css('height', $(document).height()).attr(
					"target", type);
			popup.fadeIn(this.timer);
		},
		close : function(target) {
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
			setTimeout(function() {
				dimLayer != null ? dimLayer.remove() : "";
			}, this.timer);
		}
	}
  </script>
  </body>
  <script>
  window.kakaoAsyncInit = function() {
    Kakao.Channel.createChatButton({
      container: '#kakao-talk-channel-chat-button',
    });
  };
  (function(d, s, id) {
    var js, fjs = d.getElementsByTagName(s)[0];
    if (d.getElementById(id)) return;
    js = d.createElement(s); js.id = id;
    js.src = 'https://developers.kakao.com/sdk/js/kakao.channel.min.js';
    fjs.parentNode.insertBefore(js, fjs);
  })(document, 'script', 'kakao-js-sdk');
</script>
</html>