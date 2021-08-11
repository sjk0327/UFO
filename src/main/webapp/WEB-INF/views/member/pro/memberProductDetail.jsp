<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
  <head>
    <title>UFO</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">


  <style>
	textarea {
	border: none;
	font-size: 1em;
	background-color:transparent;
	}
	 input {
    border: none;
    text-align: right;
    }

	.img-with-text {
    text-align: justify;
    width: 700px;
	}

	.img-with-text img {
    display: block;
    margin: 0 auto;
    }
    ul li {
     margin-top:50px;
     text-align: center;
 	 padding: 0;
    }      
    #buttonGroup{
    text-align: right;
    }
    .mainContainer{
	 margin:auto;	
	}
  </style>
    <%@ include file="/WEB-INF/views/customerHeader.jsp" %>
  </head>
  <body>
  
  <div class="site-wrap">
    

   

    <div class="site-section">
      <div class="container">
        <div class="row">
          <div class="col-md-6 mainContainer">
            <img src=/resources/Images/product/${productVO.p_mainImg} alt="${productVO.p_mainImg}" title="${productVO.p_mainImg}" width="500px" height="500px" class="img-fluid">
          </div>
          <div class="col-md-6" id="info">
   <form:form name="form" method="post" modelAttribute="productVO">
            <form:input path="p_id" value="${productVO.p_id}" hidden="true"/>
            <h2 class="text-black site-top-icons">${productVO.p_name}</h2><hr>
             
            
            
<div class="row"><div class="col-lg-5"><label>제품가격</label></div><div class="col-lg-7" style="text-align:right;" ><fmt:formatNumber value="${productVO.p_price}" pattern="###,###,###" />원</div></div>            
<div class="row"><div class="col-lg-5"><label>대여금액</label></div><div class="col-lg-7" style="text-align:right;" ><fmt:formatNumber value="${productVO.p_price *0.05}" pattern="###,###,###" />원</div></div>                
 <div class="row"><div class="col-lg-5"><label>수량</labeL></div><div class="col-lg-7" style="text-align:right;"><input type=hidden name="sell_price" value="${productVO.p_price}"/><input type=hidden name="rent_price" value="${productVO.p_price * 0.05}"/>
<input type="button" value=" - " onclick="del();"/><input type="text" name="amount" value="1" size="2"  onchange="change();"/><input type="button" value=" + " onclick="add();"></div></div>
 <div class="row"><div class="col-lg-4"><label for="datepicker">대여일선택</labeL></div><div class="col-lg-8" style="text-align:right;"><input type="date" name="r_sdate" id="datepicker"></div></div>
 <div class="row"><div class="col-lg-5"><label>배송방법</label></div><div class="col-lg-7" style="text-align:right;" >택배</div></div>
  <div class="row"><div class="col-lg-5"><label>배송비</label></div><div class="col-lg-7" style="text-align:right;">5000원</div></div><hr>   
 <div class="row"><div class="col-lg-5"><label></label></div><div class="col-lg-7" style="text-align:right;">총액</div></div><hr>
<div class="row"><div class="col-lg-5"><label>구매가격</label></div><div class="col-lg-7" style="text-align:right;"><input type="text" name="buysum" size="11" readonly/>원</div></div>
<div class="row"><div class="col-lg-5"><label>대여가격</label></div><div class="col-lg-7" style="text-align:right;"><input type="text" name="rentsum" size="11" readonly/>원</div></div>
  
               
            <div id="buttonGroup" >
           <!--  <a href="#" id="wish" class="buy-now btn btn-sm btn-primary" data-toggle="popover" data-placement="bottom" title="WishList" data-content="위시리스트에 추가되었습니다.">wishList</a> -->
            <input type="submit" onclick='wish()' value="위시리스트" formaction="/member/wishListInsert/${productVO.p_id}" class="buy-now btn btn-sm btn-primary"/>
            <input type="submit" value="장바구니" formaction="/member/cartInsert/${productVO.p_id}" class="buy-now btn btn-sm btn-primary"/>
			<input type="submit" value="Own" formaction="구매폼으로?" class="buy-now btn btn-sm btn-primary"/>
			<input type="submit" value="Use" formaction="대여" class="buy-now btn btn-sm btn-primary"/>
			</div>
   </form:form>
			</div>
          </div>
        </div>
      </div>
    </div>

    <div class="site-section block-3 site-blocks-2 bg-light">
     
      <div class="container ">
      <ul class="nav nav-tabs centered">
  <li class="nav-item">
    <a class="nav-link active" href="#productInfo">상세정보</a>
  </li>
  <li class="nav-item">
    <a class="nav-link" href="/member/recList">리뷰게시판</a>
  </li>
 
</ul>
        <div class="row justify-content-center">
          <div class="col-lg-12 col-sm-12 subContainer" style="text-align:center;">
           <img src=/resources/Images/product/${productVO.p_subImg} width="700px" height="70%" 	 		
							alt="${ productVO.p_subImg }" title="${ productVO.p_subImg }" class="img-fluid thumbnailSub img-with-text">	</div>
		<pre><div style="text-align:center;">${ productVO.p_content }</div></pre>					  
          </div>
         
        </div> 
        <div style="text-align:center;"><button type="button" class="btn btn-primary" onclick='productList()'>목록</button>&nbsp;&nbsp;&nbsp;
      </div>
    </div>

    <%@ include file="/WEB-INF/views/customerFooter.jsp" %>
  </div>

	<script language="JavaScript">
//개수에 따라서 가격변동시키는거.
var sell_price;
var rent_price;
var amount;


window.onload = function() {
	sell_price = document.form.sell_price.value;
	rent_price = document.form.rent_price.value;
	amount = document.form.amount.value;
	document.form.buysum.value = sell_price;
	document.form.rentsum.value = rent_price;
	
	change();
}

function add () {
	hm = document.form.amount;
	buysum = document.form.buysum;
	rentsum = document.form.rentsum;
	hm.value ++ ;

	sellprice= parseInt(hm.value) * sell_price;
	 buysum.value=sellprice.toLocaleString('ko-KR');
	rentprice= parseInt(hm.value) * rent_price;
	rentsum.value =rentprice.toLocaleString('ko-KR');
}

function del () {
	hm = document.form.amount;
	buysum = document.form.buysum;
	rentsum = document.form.rentsum;
		if (hm.value > 1) {
			hm.value -- ;
			sellprice= parseInt(hm.value) * sell_price;
			 buysum.value=sellprice.toLocaleString('ko-KR');
			rentprice= parseInt(hm.value) * rent_price;
			rentsum.value =rentprice.toLocaleString('ko-KR');
		}
		
}

function change () {
	hm = document.form.amount;
	buysum = document.form.buysum;
	rentsum = document.form.rentsum;
	rent_price = Math.floor(rent_price); //소수점버림
	
		if (hm.value < 0) {
			hm.value = 0;
		}		
		sellprice= parseInt(hm.value) * sell_price;
		 buysum.value=sellprice.toLocaleString('ko-KR');
		rentprice= parseInt(hm.value) * rent_price;
		rentsum.value =rentprice.toLocaleString('ko-KR');
		
  }//여기까지~~
  
//고객 상품목록으로가기
function productList() {
		location.href = '/member/pro/productList';		 
   }
function wish() {
	alert("위시리스트에 추가됐습니다");
}

//'request'라는 id를 가진 버튼 클릭 시 실행.
$("#request").click(function(){

        // json 형식으로 데이터 set
        var params = {
                  name      : $("#name").val()
                , sex       : $("#sex").val()
                , age       : $("#age").val()
                , tellPh    : $("#tellPh").val()
        }
            
        // ajax 통신
        $.ajax({
            type : "POST",            // HTTP method type(GET, POST) 형식이다.
            url : "/test/ajax",      // 컨트롤러에서 대기중인 URL 주소이다.
            data : params,            // Json 형식의 데이터이다.
            success : function(res){ // 비동기통신의 성공일경우 success콜백으로 들어옵니다. 'res'는 응답받은 데이터이다.
                // 응답코드 > 0000
                alert(res.code);
            },
            error : function(XMLHttpRequest, textStatus, errorThrown){ // 비동기 통신이 실패할경우 error 콜백으로 들어옵니다.
                alert("통신 실패.")
            }
        });
    });


</script>
  
  
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>




    
  </body>
</html>