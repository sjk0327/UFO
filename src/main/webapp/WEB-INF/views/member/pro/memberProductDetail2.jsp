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
  #buyInfoVO{
  color:#343a40;
  }
	img{
	border-radius: 15px;
	}
	.reviewContent{
	border:5px;
	}
	textarea {
	border: none;
	outline:none;
	font-size: 1em;
	background-color:transparent;
	}
	 input {
    border: none;
    outline:none;
    text-align: right;
    
    }
	#amount {
	text-align: center;
	}

	select {    
	border: none; 
    outline:none;
    text-align-last: center;	
	}
	
	.img-with-text {
    text-align: justify;
    width: 400px;
    margin-top: 2em;
	}

	.centered{
	    margin-left: -15px;
	        width: 1140px;
	 display: flex;
	justify-content: center;
	}
	.nav li{
	width:570px;
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
	
	a {
	cursor:pointer;
	}
	
	.icon-heart-o, .icon-heart{
	font-size: 50px;
	color: red;
	
	}
	#info div {
	margin-top: 1px;}
	
	#like-o, #like {
	cursor: pointer;
	}
	#recommendation input{
	font-size: 30pt;
	text-align:left;
	}
	.profile img{ 
	height: auto;
	  max-width: 60px;
	  min-width: 100px;
	  display: block;
	border-radius: 30px; 
	}
	.imgIdDate {
	margin-bottom :20px;
	}
	.reviewContent textarea {
	width:100%; 
	resize: none; 
	overflow-y: hidden;
	}
	 #reviewContent textarea{
	width:69%; 
	}
	.subContainer{
	text-align: center;
	background-color:white;
	}
	.wrap textarea {
      width: 60%;
      height:auto;
      resize: none;
      overflow-y: hidden; 
      padding: 1.1em; 
      padding-bottom: 0.2em;
      line-height: 1.6;
    }
    .text-black{
    margin-top: revert;
    }
    #locateTop {
 	position: relative; bottom:75px; right:40px; 
	}
	#paging-div { float: left; width: 100%; margin: 0 auto; text-align: center; } /* 페이징가운데 */
	#paging-div ul { display: table; margin: auto; padding:0; } 
	#paging-div li { float: left; text-align: center; display:inline-block; }

* {padding: 0;margin: 0;}
body, html {height: 100%;}
.modal .btn{cursor: pointer;border: 1px solid #999999;text-align: center;border-radius: 5px;outline: none;font-weight: 500;}
.dimLayer{display: block;width: 100%;background-color: rgba(0, 0, 0, 0.3);position: fixed;left: 0;top: 0px;margin: 0;padding: 0;z-index: 9998;}
.mocdal{width: 500px;height: 252px;border-radius: 10px;padding: 80px 24px;box-sizing: border-box;text-align: center; }
.modal-section{background: #ffffff;box-sizing: border-box;display: none;position: fixed;top: 50%;left: 50%;-webkit-transform: translate(-50%, -50%);-ms-transform: translate(-50%, -50%);-moz-transform: translate(-50%, -50%);-o-transform: translate(-50%, -50%);transform: translate(-50%, -50%);display: none;z-index: 9999;}
.menu_msg{font-size: 21px;font-weight: 500;}
.enroll_box p{padding-bottom: 30px;}
.gray_btn {width: 90px;background: #ffffff;color: #999999;height: 36px;line-height: 36px;transition: 0.5s;font-size: 17px;}
.pink_btn {width: 90px;background: #ed197a;color: #fff;height: 36px;line-height: 36px;transition: 0.5s;font-size: 17px;border: none;}

 @media (max-width:575px) { 
 	#edit {
    font-size: 10pt;
    }  
    #delete {
    font-size: 10pt;
    } 
    .wrap textarea {
    width: 100%;  
    }
    #locateTop{
    right: 5px;
    }
   .enroll_box p{
   padding-bottom: 15px;
   }
   .menu_msg{
   font-size: 16pt;
   }
   .mocdal{
   width: 350px;
   }
   #reviewContent textarea {
    width: 100%;
	}
   .idDate{
   text-align: -webkit-right;
   }
   .nav li{
	width:185px;
	}
    .centered{
    width: 375px;
    margin-left: -17px;
    }
}





	
  </style>
 
    <%@ include file="/WEB-INF/views/customerHeader.jsp" %>
    
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
 	 <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
 	 <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
 	 <link rel="stylesheet" href="/resources/demos/style.css">
 	 <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>   
  </head>

  <body>

 	<c:forEach var="rentalList" items="${rentalListNow}">
	<input id="rentalIdNow" type="hidden" value="${rentalList.r_pid}">
	<input id="rentaldateNow" type="hidden" value="${rentalList.r_sdate}">
	<input id="rentalamountNow" type="hidden" value="${rentalList.r_rent}">
	<input id="productCanRent" type="hidden" value="${rentalList.p_canRent}">
	</c:forEach>
	
  <div class="site-wrap">
 
    <div class="site-section">
      <div class="container">
        <div class="row">
          <div class="col-md-5 mainContainer"><span>
            <img src=/resources/Images/product/${productVO.p_mainImg} alt="${productVO.p_mainImg}" title="${productVO.p_mainImg}" width="500px" height="500px" class="img-fluid">
          </div>
          
          <div class="col-md-1 mmodal">
          <!-- 모달창 구현 -->
	 <!-- confirm 모달을 쓸 페이지에 추가 start-->
        <section class="mocdal modal-section type-confirm">
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
        <section class="mocdal modal-section type-alert">
            <div class="enroll_box">
                <p class="menu_msg"></p>
            </div>
            <div class="enroll_btn">
                <button class="btn pink_btn modal_close">확인</button>
            </div>
        </section>
        <!-- alert 모달을 쓸 페이지에 추가 end-->
          </div>
          
          <div class="col-md-6" id="info">
   <form:form name="form" method="post" action="/member/rent/buy" modelAttribute="buyInfoVO">
            <form:input path="productId" id="p_id" value="${productVO.p_id}" hidden="true"/>
            <form:input path="productImg" id="productImg" value="${productVO.p_mainImg}" hidden="true"/>
            <input name="p_id" id="p_id" value="${productVO.p_id}" hidden="true"/>
            
   <h3 class="text-black site-top-icons">${productVO.p_name}</h3><hr>
    	  
<form:input type="text" path="productPrice" id="productPrice" value="${productVO.p_price}" hidden="true"/> 
<div class="row"><div class="col-5"><label>제품가격</label></div><div class="col-7" style="text-align:right;" ><fmt:formatNumber value="${productVO.p_price}" pattern="###,###,###" />원</div></div>            
<div class="row"><div class="col-5"><label>대여금액</label></div><div class="col-7" style="text-align:right;" ><fmt:formatNumber value="${productVO.p_price *0.05}" pattern="###,###,###" />원</div></div>                
<div class="row"><div class="col-5"><label>옵션선택</label></div><div class="col-7" style="text-align:right;" >
  <select id="buyType" name="buyType" onchange="changeStateSelect()">
  	<option value="optSel">옵션</option>
  	<option disabled>------</option>
  	<option value="구매">구매</option>
  	<option id="rent" value="대여">대여</option>
  	
  </select>
  </div></div>
<div class="row"><div class="col-5"><label for="amount">수량</labeL></div><div class="col-7" style="text-align:right;"><input type=hidden name="sell_price" value="${productVO.p_price}"/><input type=hidden name="rent_price" value="${productVO.p_price * 0.05}"/><input type=hidden name="original_price" value="${productVO.p_price}"/>
<input style="cursor:default;"type="number" id="amount" name="proamount" value="1" min="1" max="50"  onchange="change();"/></div></div>

 <div class="row" style="visibility:hidden;" id="labelDate"><div class="col-4" id="selectDate"><label id="choice" for="datepicker">대여일선택</labeL></div><div class="col-8" style="text-align:right;"><input type="text" name="rentdate"  readonly="readonly" required="required" placeholder="날짜를 선택해주세요" id="datepicker" hidden="false"></div></div>

 <div class="row"><div class="col-5"><label>배송방법</label></div><div class="col-7" style="text-align:right;" >택배</div></div>
  <div class="row"><div class="col-5"><label>배송비</label></div><div class="col-7" style="text-align:right;">2500원</div></div><hr>   
 <div class="row"><div class="col-5"><label></label></div><div class="col-7" style="text-align:right;">총액</div></div><hr>
<div class="row"><div class="col-5"><label>즉시구매</label></div><div class="col-7" style="text-align:right;"> <input style="text-decoration:line-through; color:gray;" type="text" name="originalsum" size="11" readonly/><span style="color:gray;">원</span><span style="color:red;">(-5%)</span><input type="text" name="buysum" size="11" readonly/>원</div></div>
<div class="row"><div class="col-5"><label>대여가격</label></div><div class="col-7" style="text-align:right;"><input type="text" name="rentsum" size="11" readonly/>원</div></div>
  
               
            <div id="buttonGroup" class="row">
             <div class="col-2">
             	<c:if test = "${wishListVO eq null}">
				<a id="wish"><span class="icon icon-heart-o"></span></a> 
				</c:if>
 				<c:if test = "${wishListVO ne null}">
 				<a id="wish"><span class="icon icon-heart"></span></a>
				</c:if> 
			</div>
             <div class="col-10"><input style="width:100%" type="button" id="cart" value="장바구니" class="buy-now btn btn-sm btn-primary"/></div>

				
			<div class="col-12"><input style="width:100%" type="button" value="결제" onclick="payment();" class="buy-now btn btn-sm btn-primary"/></div>			
			</div>
			
			
			

			
			
   </form:form>

          </div>
        </div>
      </div>
    </div>
    
    
    <div class="site-section block-3 site-blocks-2 bg-light">
     
      <div class="container ">
      <ul class="nav nav-tabs centered">
  <li class="nav-item">
    <a class="nav-link active" href="#productInfo" id="productInfo">상품정보</a>
  </li>
  <li class="nav-item">
    <a class="nav-link" href="#reviewTop">리뷰게시판 [${reviewCount}]</a>
  </li>
 
</ul>
        <div class="row justify-content-center">
          <div class="col-lg-12 col-sm-12 subContainer">
           <img src=/resources/Images/product/${productVO.p_subImg} width="700px" height="70%" 	 		
							alt="${ productVO.p_subImg }" title="${ productVO.p_subImg }" class="img-fluid thumbnailSub img-with-text">	
		  <div class="wrap"><textarea disabled rows="40" cols="10">${ productVO.p_content }</textarea></div>
		   <%-- <div style="text-align:left;"><p>${ productVO.p_content }</p></div>	 --%>
		  </div>
						  
          </div>
      
   
                
         <div class="site-section">
         
    	<div id="reviewTop" style="text-align: right; margin-top: 20px;">
      <ul class="nav nav-tabs centered">
  <li class="nav-item">
    <a class="nav-link " href="#productInfo">상세정보</a>
  </li>
  <li class="nav-item">
    <a class="nav-link active" href="#reviewTop" >리뷰게시판 [${reviewCount}]</a>
  </li>
 
</ul>
     <c:if test="${userVO ne null && oneReview eq null}">
      <button type="button"  style="margin-top:20px;" class="btn btn-primary" data-toggle="modal" data-target="#myModal">
    추천글작성
  </button>
  	</c:if>
  	<c:if test="${userVO eq null}">
      <button type="button"  style="visibility:hidden;">
    추천글작성
  </button>
  	</c:if>
  	 <c:if test="${userVO ne null && oneReview ne null}">
      <button type="button" style="visibility:hidden;" class="btn btn-primary" data-toggle="modal" data-target="#myModal">
    추천글작성
  </button>
  	</c:if>
  	

    	</div>			<!-- 리뷰모달 위에 버튼 태그도 -->
    	<div class="modal fade" id="myModal">
    <div class="modal-dialog modal-lg">
      <div class="modal-content">
      
        <!-- Modal Header -->
        <div class="modal-header">
          <h4 class="modal-title">추천글작성</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        
        <!-- Modal body -->
        <div class="modal-body">
           <div class="container"> 
        <div class="row mb-5">
          <div class="col-md-12 order-2">
       
         
           <form name= "reviewInsert" method="post" action="/member/pro/reviewInsert">
                <div class="row imgIdDate" name="imgIdDate">
                 
                	<div class="col-2 profile" align="center">  
                	 <img src = /resources/Images/member/${userVO.m_img} alt="${userVO.m_img}" title="${userVO.m_img}" class="img-fluid img-circle">         
                	</div> 
                	<div class="col-10">
                	 <input type="hidden" name="v_mid" value="${userVO.m_id}"/>
                	 <input type="hidden" name="v_pid" value="${productVO.p_id}"/>
                	 <input type="hidden" name="v_like" value="none" id="reviewLike">
      	    	 <div>${userVO.m_id}</div>
                	<div class="col-lg-6 sm-6" id="recommendation">     
          <c:if test = "${oneReview.v_like ne 'like'}">   
       <a title="likes"><img src=/resources/Images/product/like1.jpg id="like-o" class="like-o" width="50" height="50" alt="noselected" onclick= 'like();'/></a>
          </c:if>
           <c:if test = "${oneReview.v_like eq 'like'}">  	 
		<a title="noselected"><img src=/resources/Images/product/like2.jpg id="like" class="like" width="50" height="50" alt="likes" onclick= 'likeCancel();'/></a>      
		   </c:if>
	   </div>
               	 	
                	</div>      		
                	                      
                </div>
 
                <div class="row" name="content">
                 <div class="col-12 reviewContent">
                 <br>
                <textarea id="review" class="reviewContent" placeholder="내용을 입력해주세요(최대  100자)" rows="4" cols="50" name="v_content" maxlength="100" required="required"></textarea>
                 </div>
                </div>                   
    
            </div>
          </div>
        </div>
        </div>
        
        <!-- Modal footer -->
        <div class="modal-footer">
        <input type="submit" class="btn btn-secondary" value="확인"/>
          <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
        </div>
         </form>
      </div>
    </div>
  </div>	
   		   
     									<c:choose>				
										<c:when test="${recVO[0].v_id eq null}"><div>아직 작성된 리뷰가 없어요</div></c:when>
										<c:when test="${recVO[0].v_id ne null}">   </c:when></c:choose>
      <div class="container"> 
        <div class="row mb-5">
          <div class="col-md-12 order-2" id="reviewstart">
       
         
            <c:forEach var="recVO" items="${recVO}" begin="0" end="8" step="1" varStatus="status">           
               
                <div class="row imgIdDate" name="imgIdDate">
                 
                	<div class="col-2 profile" style="margin: auto;">  
                	 <img src = /resources/Images/member/${recVO.m_img} alt="${recVO.m_img}" title="${recVO.m_img}" class="img-fluid img-circle">         
                	</div> 
                	<div class="col-5 idDate" >
                	 <div>${recVO.v_mid}</div>
                	 <div>${recVO.v_date}</div> 
                	 <c:choose>
         				 <c:when test = "${recVO.v_like eq 'none'}">   
       						 <a title="noselected"><img src=/resources/Images/product/like1.jpg style="cursor:auto;" width="50" height="50" alt="likes" /></a>
      				     </c:when>
          			     <c:when test = "${recVO.v_like ne 'none'}">  	 
							 <a title="likes"><img src=/resources/Images/product/like2.jpg style="cursor:auto;" width="50" height="50" alt="noselected" /></a>      
						 </c:when>	
					  </c:choose>	       
                	</div>      		
          				 <div class="col-5" style="text-align:right;">        		 
		 				 <c:if test = "${recVO.v_mid eq userId}">
		  				     <button id="edit" type="button" style="margin-bottom:10px;" class="btn btn-primary" data-toggle="modal" data-target="#reviewModal">수정하기</button> 
		   				    <form method="post" name="reviewDeleteForm" action="/member/pro/reviewDelete/${oneReview.v_mid}/${oneReview.v_pid}">
		    				   <input id="delete" type="button" value="삭제하기" class="btn btn-primary" onclick='reviewDelete()'>	
		     				</form>  	  
		 				 </c:if>
					    </div>             
                </div>
 
                <div class="row" name="content">
                 <div class="col-12 reviewContent" id="reviewContent">
                <textarea disabled rows="3" cols="30">${recVO.v_content}</textarea>
                 </div>
                </div>
                
                <!--  
                <div  class="block-4 text-center border">
                  <figure class="block-4-image">
                    <a href="/member/pro/productDetail/${reviewList.v_pid}"><img src="/resources/img/iPad.jpg" alt="상품 사진" class="img-fluid"></a>
                  </figure>
                  <div class="block-4-text p-4">
                    <p> 상품코드  : <a href="/member/pro/productDetail/${reviewList.v_id}">${reviewList.v_mid}</a></p>
                    <p class="mb-0">${reviewList.v_pid}</p>
                    <p class="text-primary font-weight-bold" >${reviewList.v_content}</p>
                     </div>
                </div>  
                -->    <hr>      
             </c:forEach> 
                <!-- 페이징 start -->
										<div id = "paging-div">
										<ul class="btn-group pagination">
											<c:if test="${pageMaker.prev }">
												<li><a href='<c:url value="/member/pro/productDetail${pageMaker.makeQuery(pageMaker.startPage-1)}#reviewstart"/>'>
													<span style="font-weight: bold;">&nbsp;[이전]&nbsp;</span></a></li><span class="col-md-1"></span>
											</c:if>
											<c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="pageNum">
												<c:if test="${pageNum eq pageMaker.cri.page}"><li><a href='<c:url value="/member/pro/productDetail${pageMaker.makeQuery(pageNum)}#reviewstart"/>'>
												<span id="pagingCur" style="background-color: #7971ea; display:inline-block; height: 30px; width: 30px; border-radius: 50%; font-weight: bold; color: white; padding : 5px;">&nbsp;${pageNum}&nbsp;</span></a></li><span class="col-md-1"></span></c:if>
												<c:if test="${pageNum ne pageMaker.cri.page}"><li><a href='<c:url value="/member/pro/productDetail${pageMaker.makeQuery(pageNum)}#reviewstart"/>'>
												<span>&nbsp;${pageNum}&nbsp;</span></a></li><span class="col-md-1">   </span></c:if>
												
											</c:forEach>
											<c:if test="${pageMaker.next && pageMaker.endPage >0 }">
												<li><a href='<c:url value="/member/pro/productDetail${pageMaker.makeQuery(pageMaker.endPage+1)}#reviewstart"/>'>
													<span style="font-weight: bold;">&nbsp;[다음]&nbsp;</span></a></li><span class="col-md-1"></span>
											</c:if>
										</ul>
										</div>
										<!-- 페이징 end -->
      <!-- 리뷰 수정모달 -->      	
  <div class="modal fade" id="reviewModal">
    <div class="modal-dialog modal-lg">
      <div class="modal-content">
      
        <!-- Modal Header -->
        <div class="modal-header">
          <h4 class="modal-title">리뷰수정</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        
        <!-- Modal body -->
        <div class="modal-body">
           <div class="container"> 
        <div class="row mb-5">
          <div class="col-md-12 order-2">
       
         
           <form name= "reviewUpdate" method="post" action="/member/pro/reviewUpdate">
                <div class="row imgIdDate" name="imgIdDate">
                 
                	<div class="col-2 profile" align="center">  
                	 <img src = /resources/Images/member/${userVO.m_img} alt="${userVO.m_img}" title="${userVO.m_img}" class="img-fluid img-circle">         
                	</div> 
                	<div class="col-10">
                	 <input type="hidden" name="v_mid" value="${userVO.m_id}"/>
                	 <input type="hidden" name="v_pid" value="${productVO.p_id}"/>
              
      	    	 <div>${userVO.m_id}</div>
                	<div class="col-lg-6 sm-6" id="recommendation">     
          <c:if test = "${oneReview.v_like eq 'none'}">   
       <a title="noselected"><img src=/resources/Images/product/like1.jpg id="like-o" class="like-o" width="50" height="50" alt="likes" onclick= 'like()'/></a>
       <input type="hidden" name="v_like" value="none"
		id="updatereviewLike">   
          </c:if>
           <c:if test = "${oneReview.v_like ne 'none'}">  	 
		<a title="likes"><img src=/resources/Images/product/like2.jpg id="like" class="like" width="50" height="50" alt="noselected" onclick= 'likeCancel()'/></a>
		<input type="hidden" name="v_like" value="like"
		id="updatereviewLike">
		   </c:if>
	   </div>
               	 	
                	</div>      		
                	                      
                </div>
 
                <div class="row" name="content">
                 <div class="col-12 reviewContent">
                 <br>
                <textarea class="reviewContent" id="reviewEdit" rows="6"  cols="50" name="v_content" autofocus>${oneReview.v_content}</textarea>
                 </div>
                </div>                   
    
            </div>
          </div>
        </div>
        </div>
        
        <!-- Modal footer -->
        <div class="modal-footer">
        <input type="submit" class="btn btn-primary" value="확인"/>
          <button type="button" class="btn btn-primary" data-dismiss="modal">닫기</button>
        </div>
         </form>
      </div>
    </div>
  </div>	
 <!-- 여기까지 -->

       


            </div>
          </div>
        </div>

    
        
      </div>
             
                
                
                
        </div> 
        <div style="text-align:center; margin-top:40px;"><button type="button" class="btn btn-primary" onclick='productList()'>목록</button>&nbsp;&nbsp;&nbsp;
      </div>
    </div>
     						
				<a href="#" id="locateTop" style="display:scroll;">맨 위로<img src="/resources/Images/product/화살표.png" width="20px" height="20px"/></a>
			
		

		
			
    <%@ include file="/WEB-INF/views/customerFooter.jsp" %>
  </div>

	<script language="JavaScript">
	  
//개수에 따라서 가격변동시키는거. 렌탈리스트들
var original_price;
var sell_price;
var rent_price;
var amount;
var selectDate;
var stateSelect;
var selectValue;
var recommendCount;
window.onload = function() {
	original_price = document.form.original_price.value;
	sell_price = document.form.sell_price.value;
	rent_price = document.form.rent_price.value;
	amount = document.form.amount.value;
	document.form.buysum.value = sell_price;
	document.form.rentsum.value = rent_price;		
	change();	
	$('#datepicker').datepicker('setDate', 'today');	
	 $("#datepicker").datepicker({
	        dateFormat: 'yy-mm-dd' //달력 날짜 형태
	        ,showOtherMonths: true //빈 공간에 현재월의 앞뒤월의 날짜를 표시
	        ,showMonthAfterYear:true // 월- 년 순서가아닌 년도 - 월 순서
	        ,changeYear: true //option값 년 선택 가능
	        ,changeMonth: true //option값  월 선택 가능                
	        ,showOn: "both" //button:버튼을 표시하고,버튼을 눌러야만 달력 표시 ^ both:버튼을 표시하고,버튼을 누르거나 input을 클릭하면 달력 표시  
	        ,buttonImage: "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif" //버튼 이미지 경로
	        ,buttonImageOnly: true //버튼 이미지만 깔끔하게 보이게함
	        ,buttonText: "선택" //버튼 호버 텍스트              
	        ,yearSuffix: "년" //달력의 년도 부분 뒤 텍스트
	        ,monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 텍스트
	        ,monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 Tooltip
	        ,dayNamesMin: ['일','월','화','수','목','금','토'] //달력의 요일 텍스트
	        ,dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'] //달력의 요일 Tooltip
	        ,minDate: "-0D" //최소 선택일자(-1D:하루전, -1M:한달전, -1Y:일년전)
	        ,maxDate: "1M,+0y" //최대 선택일자(+1D:하루후, -1M:한달후, -1Y:일년후)  
	 		,showButtonPanel: true
	 		,currentText: '오늘 날짜'
	 		,closeText: '닫기'
	 		,nextText:"다음"
	 		,prevText:"이전"
	 		,onSelect: function (dateText, inst) {	
	 			
	 			var rentalList = "${rentalListNow[0]}"; //rental 된 게 없을 때 대여가능 수량 지정.
	 			if (rentalList == '') {
	 				var canRent = ${productVO.p_canRent}	
	 				
	 				document.getElementById("amount").setAttribute('max',canRent);			
	 				document.getElementById("amount").value=1;
	 				
	 			} else {
	 			
	 			
	 			var rentalIdNowList=document.querySelectorAll("#rentalIdNow");
	 			var rentalIdNowListLength = rentalIdNowList.length;
	 			var rentaldateNowList=document.querySelectorAll("#rentaldateNow");
	 			var rentalamountNowList=document.querySelectorAll("#rentalamountNow");	 
	 			var rentamount = document.getElementById("productCanRent").value;
	 			var canRental=0;
	 			var count=0;
	 			
	 			for(var k=0;k<rentalIdNowListLength;k++){
	 				var rentd=new Date(dateText);
	 				var rentd2=new Date(dateText);
	 				rentd.setDate(rentd.getDate() + 2);
	 				rentd2.setDate(rentd2.getDate() - 2);
	 				var rentdatenow=new Date(rentaldateNowList[k].value);
	 			if(document.getElementById("p_id").value==rentalIdNowList[k].value && (rentd<rentdatenow || rentd2>rentdatenow)){
	 				count+=rentalamountNowList[k].value*1
	 				}
	 			}
	 			canRental=rentamount*1+count;
	 				if (canRental == 0) { 	
	 				document.getElementById("amount").value=canRental;
	 				document.getElementById("amount").setAttribute('max',canRental);
	 				document.getElementById("amount").setAttribute('readonly','true');
	 				
	 				} 	else  {
	 				document.getElementById("amount").setAttribute('max',canRental);
	 				document.getElementById("amount").removeAttribute('readonly');
	 				document.getElementById("amount").value=1;}
	 				
	 		
	        } $("#amount").focus();
	 			}

	    });      
	 document.getElementById('datepicker').value = new Date().toISOString().substring(0, 10);	
	 document.getElementById("datepicker").removeAttribute('hidden');	
	 document.getElementById("choice").removeAttribute('hidden');

	 

}

function add () {
	hm = document.form.proamount;
	buysum = document.form.buysum;
	rentsum = document.form.rentsum;
	originalsum = document.form.originalsum;
	hm.value ++ ;

	sellprice= parseInt(hm.value) * sell_price * 0.95;
	 buysum.value=sellprice.toLocaleString('ko-KR');
	rentprice= parseInt(hm.value) * rent_price;
	rentsum.value =rentprice.toLocaleString('ko-KR');
	originalprice = parseInt(hm.value) * original_price;
	originalsum.value =originalprice.toLocaleString('ko-KR');
}

function del () {
	hm = document.form.proamount;
	buysum = document.form.buysum;
	rentsum = document.form.rentsum;
	originalsum = document.form.originalsum;
		if (hm.value > 1) {
			hm.value -- ;
			sellprice= parseInt(hm.value) * sell_price * 0.95;
			 buysum.value=sellprice.toLocaleString('ko-KR');
			rentprice= parseInt(hm.value) * rent_price;
			rentsum.value =rentprice.toLocaleString('ko-KR');
			originalprice = parseInt(hm.value) * original_price;
			originalsum.value =originalprice.toLocaleString('ko-KR');
		}
		
}

function change () {
	hm = document.form.proamount;
	buysum = document.form.buysum;
	rentsum = document.form.rentsum;
	rent_price = Math.floor(rent_price); //소수점버림
	originalsum = document.form.originalsum;
		if (hm.value < 0) {
			hm.value = 0;
		}		
		sellprice= parseInt(hm.value) * sell_price * 0.95;
		 buysum.value=sellprice.toLocaleString('ko-KR');
		rentprice= parseInt(hm.value) * rent_price;
		rentsum.value =rentprice.toLocaleString('ko-KR');
		originalprice = parseInt(hm.value) * original_price;
		originalsum.value =originalprice.toLocaleString('ko-KR');
	
  }//여기까지~~
  
//고객 상품목록으로가기
function productList() {
		location.href = '/member/pro/productList';		 
   }
 
//결제폼으로
function payment() {
	var uid = '<%=session.getAttribute("userInfo")%>';
	var buyType= document.getElementById('buyType').value;
	var proamount= document.getElementById('amount').value;
	var rentdate= document.getElementById('datepicker').value;
	
	 stateSelect = document.getElementById("buyType"); 
	 selectValue = stateSelect.options[stateSelect.selectedIndex].value; 
	if (proamount <= 0) {
		action_popup.alert('해당 날짜에는 대여가 어렵습니다.');
	} else {
	if (selectValue == "optSel") {
		action_popup.alert('옵션을 선택해주세요');
	} else { 
		if (uid == "null") {
			action_popup.confirm('로그인이 필요한 서비스입니다', function (res) {
        		if (res) {
        			location.href = '/member/rent/buy/${productVO.p_id}/${productVO.p_mainImg}/${productVO.p_price}/'+buyType+'/'+proamount+'/'+rentdate;
       		 } 
    		})
    		
    	} else {
				action_popup.confirm('결제를 진행하시겠습니까?', function (res) {
        		if (res) {
        			document.form.submit();		
       		 } 
    		})
    	}
		
	}
	}
}
//review에서 추천관련부분 #reviewLike는 리뷰추가할 때 추천
function like(){
	 if ($('#like-o').is(".like-o") === true){
		 $('.like-o').attr('src','/resources/Images/product/like2.jpg'); 
     	 $('.like-o').attr('class','like'); 
         $('#updatereviewLike').attr('value','like'); 
         $('#reviewLike').attr('value','like'); 
     	 action_popup.alert('추천하셨습니다');
	 } else {
		 $('.like').attr('src','/resources/Images/product/like1.jpg');
		 $('.like').attr('class','like-o');  
		 $('#updatereviewLike').attr('value','none'); 
		 $('#reviewLike').attr('value','none'); 
		 action_popup.alert("취소하셨습니다");
	 } 
}
function likeCancel(){
	 if ($('#like').is(".like") === true){
		 $('.like').attr('src','/resources/Images/product/like1.jpg');
		 $('.like').attr('class','like-o');  
		 $('#updatereviewLike').attr('value','none'); 
		 $('#reviewLike').attr('value','none');
		 action_popup.alert("취소하셨습니다");
		
		
	 } else {
		 $('.like-o').attr('src','/resources/Images/product/like2.jpg'); 
    	 $('.like-o').attr('class','like'); 
        $('#updatereviewLike').attr('value','like'); 
        $('#reviewLike').attr('value','like');
    	 action_popup.alert('추천하셨습니다');
		
	 } 
}
//리뷰 삭제
function reviewDelete() {
	action_popup.confirm('리뷰를 삭제하시겠습니까?', function (res) {
		if (res) {			
			document.reviewDeleteForm.submit();
	
		 } 
	})	
}

//ajax 위시리스트 추가
/* $('#wish').on('click', function(){
    var form = {
    		  p_id      : $("#p_id").val()
            , amount    : $("#amount").val()
    }    
    if ($('span').is(".icon-heart-o") === true){
    $.ajax({
        url: "/member/wishListInsert/${productVO.p_id}",
        type: "POST",
        data: form,
        success: function(data){   
        	$('.icon-heart-o').attr('class','icon-heart');
        	
        	
        	action_popup.confirm('WishList에 추가되었습니다.  확인해볼래요?', function (res) {
                if (res) {
                	location.href = '/member/rent/wishList';
                }
            })
        },
        error: function(){
        	action_popup.alert("위시리스트추가 실패");
        }				
    });                } else{ 
    	 				
      
      				 $.ajax({
         			  url: "/member/wishListDelete/${productVO.p_id}",
          			 type: "POST",
          		 data: form,
          			 success: function(data){ 
           	
          		 },
          		 error: function(){
          			$('.icon-heart').attr('class','icon-heart-o');
          			action_popup.alert("위시리스트에서 삭제됐습니다");
   		
          		 }
      			 });
    	
   				 }		
}); */
//ajax 위시리스트 추가
$('#wish').on('click', function(){
	var uid = '<%=session.getAttribute("userInfo")%>';
    var form = {
    		  p_id      : $("#p_id").val()
            , amount    : $("#amount").val()
    }    
    if ($('span').is(".icon-heart-o") === true){
    $.ajax({
        url: "/member/wishListInsert/${productVO.p_id}",
        type: "POST",
        data: form,
        success: function(data){
        	if (uid == "null") {
        		action_popup.confirm('로그인이 필요한 서비스입니다', function (res) {
                    if (res) {
                    	location.href = '/member/wishListInsert/${productVO.p_id}';
                    }
                })
        		
        	} else {
        	
        	$('.icon-heart-o').attr('class','icon-heart');
  	     	action_popup.confirm('위시리스트에 추가되었습니다. 확인해볼래요?', function (res) {
                if (res) {
                	location.href = '/member/rent/wishList';
                }
            })
        	}
        },
        error: function(){
        	action_popup.alert("위시리스트추가 실패");
        }				
    });                } else{ 
    	 				
      
      				 $.ajax({
         			  url: "/member/wishListDelete/${productVO.p_id}",
          			 type: "POST",
          		 data: form,
          			 success: function(data){ 
           	
          		 },
          		 error: function(){
          			$('.icon-heart').attr('class','icon-heart-o');
          			action_popup.alert("위시리스트에서 삭제됐습니다");
   		
          		 }
      			 });
    	
   				 }		
});

/* //ajax 장바구니꺼
$('#cart').on('click', function(){
	var stateSelect = document.getElementById("buyType"); 
	var selectValue = stateSelect.options[stateSelect.selectedIndex].value; 
	if (selectValue == "optSel") {
		action_popup.alert("옵션을 선택하세요");
  } else  {							
	   
    var form = {
    		  p_id      : $("#p_id").val()
            , amount    : $("#amount").val()
            , c_date    : $("#datepicker").val()
            , c_state    : $("#buyType").val()
    }
    $.ajax({
        url: "/member/cartInsert/${productVO.p_id}",
        type: "POST",
        data: form,
        success: function(data){
        	 action_popup.confirm("장바구니에 추가됐습니다.  장바구니 볼라우?", function (res) {
                if (res) {
                	location.href = '/member/rent/cartList';
                }
            })
    	   	 
        },
        error: function(){
        	action_popup.alert("장바구니 추가 :실패!");

        }
    });   }  
}); */
$('#cart').on('click', function(){
	var checkCart = "<c:out value='${cartVO}'/>";	
	var uid = '<%=session.getAttribute("userInfo")%>';
	var amount = document.getElementById("amount").value;
	var c_date = document.getElementById("datepicker").value;
	var c_state = document.getElementById("buyType").value;
	var stateSelect = document.getElementById("buyType"); 
	var selectValue = stateSelect.options[stateSelect.selectedIndex].value; 
	if (selectValue == "optSel") {	
		action_popup.alert("옵션을 선택하세요");		
 		 } else if (uid != "null" && checkCart != "" ){
			  action_popup.confirm("장바구니에 제품이 존재합니다. 장바구니를 확인하시겠습니까?", function (res) {
         		 if (res) {
          			location.href = '/member/rent/cartList';
        		  }
    		  })
 	 }	else  {							
	
    var form = {
    		  p_id      : $("#p_id").val()
            , amount    : $("#amount").val()
            , c_date    : $("#datepicker").val()
            , c_state    : $("#buyType").val()
    }
    $.ajax({
        url: "/member/cartInsert",
        type: "POST",
        data: form,
        success: function(data){
        	if (uid == "null") {
        		action_popup.confirm("로그인이 필요한 서비스입니다.", function (res) {
                    if (res) {
                    	location.href = '/member/cartInsert/${productVO.p_id}/'+amount+'/'+c_date+'/'+c_state;
                    }
                })
        		
        	} else {
        	 action_popup.confirm("장바구니에 추가됐습니다.  장바구니 볼라우?", function (res) {
                if (res) {
                	location.href = '/member/rent/cartList';
                }
            })
        	}
        },
        error: function(){
        	action_popup.alert("장바구니 추가 :실패!");

        }
    });   
    	
 	 } 
});



//대여 선택했을 때 달력나오게하는거.
function changeStateSelect(){ 
	stateSelect = document.getElementById("buyType"); 
	selectValue = stateSelect.options[stateSelect.selectedIndex].value; 
	if (selectValue == "대여") {	
	 $("#labelDate").css('visibility','visible');
	 $( "#datepicker" ).datepicker( "show" );
	 document.getElementById('datepicker').value = new Date().toISOString().substring(0, 10);	
	 document.getElementById("datepicker").removeAttribute('hidden');	
	 document.getElementById("choice").removeAttribute('hidden');


		var rentalList = "${rentalListNow[0]}"; //rental 된 게 없을 때 대여가능 수량 지정.
		if (rentalList == '') {
			var canRent = ${productVO.p_canRent}	
			
			document.getElementById("amount").setAttribute('max',canRent);			
			document.getElementById("amount").value=1;
			
		}
		

		
		//렌탈 된 것에 따라 대여가능 수량 지정.
		var rentalIdNowList=document.querySelectorAll("#rentalIdNow");
		var rentalIdNowListLength = rentalIdNowList.length;
		var rentaldateNowList=document.querySelectorAll("#rentaldateNow");
		var rentalamountNowList=document.querySelectorAll("#rentalamountNow");	 
		var rentamount = document.getElementById("productCanRent").value;
		var canRental=0;
		var count=0;
		
		for(var k=0;k<rentalIdNowListLength;k++){
			var rentd=new Date(document.getElementById("datepicker").value);
			var rentd2=new Date(document.getElementById("datepicker").value);
			rentd.setDate(rentd.getDate() + 2);
			rentd2.setDate(rentd2.getDate() - 2);
			var rentdatenow=new Date(rentaldateNowList[k].value);
		if(document.getElementById("p_id").value==rentalIdNowList[k].value && (rentd<rentdatenow || rentd2>rentdatenow)){
			count+=rentalamountNowList[k].value*1
			}
		}
		canRental=rentamount*1+count;
		
		if (canRental == 0) { 	
				document.getElementById("amount").value=0;
				document.getElementById("amount").setAttribute('max',canRental);
				document.getElementById("amount").setAttribute('readonly','true');			
				} 	else  {
				document.getElementById("amount").setAttribute('max',canRental);
				document.getElementById("amount").removeAttribute('readonly');
				document.getElementById("amount").value=1;}
		} else {
			document.getElementById("amount").setAttribute('max','50');
			$("#labelDate").css('visibility','hidden');
			document.getElementById("amount").removeAttribute('readonly');
			$("#amount").focus();
			
		}
}

$('#review').on('keyup',function() {
	var rows = $('#review').val().split('\n').length;
    var maxRows = 3;
    if( rows > maxRows){
       action_popup.alert("3줄까지만 가능합니다");
        modifiedText = $('#review').val().split("\n").slice(0, maxRows);
        $('#review').val(modifiedText.join("\n"));
    }
	
	
	
	if($(this).val().length > 100) {
	$(this).val($(this).val().substring(0,100));
	action_popup.alert("100자 이내로 작성해주세요.");
	
	}
	});

$('#reviewEdit').on('keyup',function() {
	var rows = $('#reviewEdit').val().split('\n').length;
    var maxRows = 3;
    if( rows > maxRows){
       action_popup.alert("3줄까지만 가능합니다");
        modifiedText = $('#reviewEdit').val().split("\n").slice(0, maxRows);
        $('#reviewEdit').val(modifiedText.join("\n"));
    }
	
	
	
	if($(this).val().length > 100) {
	$(this).val($(this).val().substring(0,100));
	action_popup.alert("100자 이내로 작성해주세요.");
	
	}
	});




$(function () {
    $(".modal_close").on("click", function () {
        action_popup.close(this);
    });  
});



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

//스크롤하면 '맨위로' 링크 나오게
	$(window).scroll(function() {
    if($(this).scrollTop() > 1000) {
      $("#locateTop").css('position','fixed');
      $("#locateTop").css('display','inline');
      
    }
    else {
      $("#locateTop").css('position','relative');
      $("#locateTop").css('display','none');
    }
  });

</script>
  
  





    
  </body>
</html>