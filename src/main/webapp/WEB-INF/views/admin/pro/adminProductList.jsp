<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>


<!DOCTYPE html>
<html lang="en">

<head>
<title> 관리자 상품 리스트 페이지 - UF&#38;O </title>
<%@ include file="/WEB-INF/views/adminHeader.jsp"%>
<style>
* {padding: 0;margin: 0;}
body, html {height: 100%;}
.modal .btn{cursor: pointer;border: 1px solid #999999;text-align: center;border-radius: 5px;outline: none;font-weight: 500;}
.dimLayer{display: block;width: 100%;background-color: rgba(0, 0, 0, 0.3);position: fixed;left: 0;top: 0px;margin: 0;padding: 0;z-index: 9998;}
.modal{width: 600px;height: 252px;border-radius: 10px;padding: 80px 24px;box-sizing: border-box;text-align: center;}
.modal-section{background: #ffffff;box-sizing: border-box;display: none;position: absolute;top: 50%;left: 50%;-webkit-transform: translate(-50%, -50%);-ms-transform: translate(-50%, -50%);-moz-transform: translate(-50%, -50%);-o-transform: translate(-50%, -50%);transform: translate(-50%, -50%);display: none;z-index: 9999;}
.menu_msg{font-size: 21px;font-weight: 500;}
.enroll_box p{padding-bottom: 56px;}
.gray_btn {width: 90px;background: #ffffff;color: #999999;height: 36px;line-height: 36px;transition: 0.5s;font-size: 17px;}
.pink_btn {width: 90px;background: #7971ea;color: #fff;height: 36px;line-height: 36px;transition: 0.5s;font-size: 17px;border: none;}
</style>

</head>

<body>
   <div id="pcoded" class="pcoded">
      <div class="pcoded-overlay-box"></div>
      <div class="pcoded-container navbar-wrapper">
         <%@ include file="/WEB-INF/views/adminNav.jsp"%>
         <div class="pcoded-main-container">
            <div class="pcoded-wrapper">
               <%@ include file="/WEB-INF/views/adminMenu.jsp"%>
               <div class="pcoded-content">
                  <div class="pcoded-inner-content">
                     <!-- Main-body start -->
                     <div class="main-body">
                        <div class="page-wrapper">
                           <!-- Page-body start -->
                           <div class="page-body">
                   <form id="sort" name="productSearch" method="get" action="/admin/pro/productList">
					
						<select id="searchType" name="Type">
							<option value="">검색조건</option>
							<option value="t">상품번호</option> 
							<option value="c">카테고리</option>
							<option value="w">상품명</option>
						</select>&nbsp;
						<input type="text" id="keyword" name="keyword" value="${pageMaker.cri.keyword}" placeholder="검색어를 입력하세요"/>&nbsp;
						<button id="button" class="btn waves-effect waves-light btn-primary btn-outline-primary">검색</button>&nbsp;
						<input type="button" id="button" class="btn waves-effect waves-light btn-primary btn-outline-primary" value="전체보기" onClick="location.href='/admin/pro/productList';"> 
						 &nbsp; 
   						<input type="button" id="button" class="btn waves-effect waves-light btn-primary btn-outline-primary" value="상품등록" onclick="location.href='/admin/pro/productInsertForm'" /> 
      					 &nbsp;
      					 &nbsp;
      			    </form>    
                      </div>
                      	<div>
						<br>
					</div>

  <div class="wrap">
       
        
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
    </div>


                      <!-- Basic table card start -->
                      <div class="card">
                         <div class="card-header">                                 	
                            	<h5>상품목록</h5>                           	
                         </div>
                         <div class="card-block table-border-style">
                            <div class="table-responsive">
                           <form name="delList" id="form">
                           <input type="button" id="button" 
                           		class="btn waves-effect waves-light btn-primary btn-outline-primary" value="선택삭제" onclick="checkboxArr();"/>  
                             	<div>
									<br>
								</div>
                           <input type="hidden" id="arrayParam" name="arrayParam"/>
                            <input type="hidden" id="p_id" name="p_id"/>
                               <table class="table table-hover">
						<thead>
							 <tr>
								<th width="100"><input id="allCheck" type="checkbox" onclick="allChk(this);"/></th>
								<th width="100">No.</th>
								<th width="100">상품명</th>
								<th width="100">상품가격</th>
								<th width="100">카테고리</th>
								<th width="100">구매가능수량</th>
								<th width="100">대여가능수량</th>
								<th width="100">등록일</th>
								<th width="100">수정</th>
								<th width="100">삭제</th>
							</tr>
							
                          </thead>


            <c:forEach var="list" items="${productList}" begin="0" end="10" step="1" varStatus="status">

               <tbody>
             <form id="sort" name="btnUpdate" method="post" action="/admin/pro/productUpdate/${p_id}"> 
					 <input type="hidden" id="p_id" name="p_id" />
                <tr style="cursor:hand" >
                     <td onclick="event.cancelBubble=true">
                     <input type="checkbox" id="checkboxup" name="RowCheck" value="${list.p_id }"></td>
                     <!-- <td scope="row"> -->
                    <%--  <td><a href="memDetail?m_id=${list.p_id }">${list.p_id }</a></td> --%>
                     <td onclick="event.cancelBubble=true">${list.p_id}</td>
                     <td onclick="location.href='/admin/pro/productDetail/${list.p_id }'">${list.p_name}<br>
                     <img src="/resources/img/${list.p_mainImg}" alt="${list.p_mainImg}" 
										title="${list.p_mainImg}" class="img-fluid"></td>
					<td onclick="location.href='/admin/pro/productDetail/${list.p_id }'"><fmt:formatNumber value="${list.p_price}" pattern="###,###,###" />원</td>
					<td onclick="location.href='/admin/pro/productDetail/${list.p_id }'">${list.p_category}</td>
					<td onclick="event.cancelBubble=true"><input type="text" id="p_canBuy_${list.p_id }" name="b1" size="10" value="${list.p_canBuy}" />개</td>
					<td onclick="event.cancelBubble=true"><input type="text" id="p_canRent_${list.p_id }" name="b2" size="10" value="${list.p_canRent}" />개</td>
					<!-- <td><img src="/resources/common/images/ufologo.jpg"></td>	 -->															
					<td onclick="location.href='/admin/pro/productDetail/${list.p_id }'"><fmt:formatDate value="${list.p_regdate}" pattern="YYYY-MM-dd" /></td>
					<td onclick="event.cancelBubble=true">
					<input type="button" id="button" onClick="productUpdateRow('${list.p_id}','${list.p_canBuy}','${list.p_canRent}');"
											<%-- onClick="productUpdate('${list.p_id}','${list.p_canBuy}','${list.p_canRent}');" --%>
											value="수정" class="btn waves-effect waves-light btn-primary btn-outline-primary">
					<td onclick="event.cancelBubble=true"><button type="button" id="button"
											onClick="productDelete('${list.p_id}');"
											value="상품삭제" class="btn waves-effect waves-light btn-primary btn-outline-primary">삭제</button> 
				</tr> 
				</form>
				
		
                       
              </tbody>
            </c:forEach>

                      </table>
                       </form> 
                      <br>
                      <!-- 페이징 start -->
                              <div id = "paging-div">
                              <ul class="btn-group pagination">
                                 <c:if test="${pageMaker.prev }">
                                    <li><a href='<c:url value="/admin/pro/productList${pageMaker.makeQuery(pageMaker.startPage-1)}"/>'>
                                       <span style="font-weight: bold;">&nbsp;[이전]&nbsp;</span></a></li><span class="col-md-1"></span>
                                 </c:if>
                                 <c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="pageNum">
                                    <c:if test="${pageNum eq pageMaker.cri.page}"><li><a href='<c:url value="/admin/pro/productList${pageMaker.makeQuery(pageNum)}"/>'>
                                    <span id="pagingCur" style="background-color: #7971ea; display:inline-block; height: 30px; width: 30px; border-radius: 50%; font-weight: bold; color: white; padding : 5px;">&nbsp;${pageNum}&nbsp;</span></a></li><span class="col-md-1"></span></c:if>
                                    <c:if test="${pageNum ne pageMaker.cri.page}"><li><a href='<c:url value="/admin/pro/productList${pageMaker.makeQuery(pageNum)}"/>'>
                                    <span>&nbsp;${pageNum}&nbsp;</span></a></li><span class="col-md-1">   </span></c:if>
                                    
                                 </c:forEach>
                                 <c:if test="${pageMaker.next && pageMaker.endPage >0 }">
                                    <li><a href='<c:url value="/admin/pro/productList${pageMaker.makeQuery(pageMaker.endPage+1)}"/>'>
                                       <span style="font-weight: bold;">&nbsp;[다음]&nbsp;</span></a></li><span class="col-md-1"></span></a></li>
                                 </c:if>
                              </ul>
                              </div>
                              <!-- 페이징 end -->
                     
                                    </div></div></div> </div>
                        </div>
                        <!-- Page-body end -->
                     </div>             </div>            </div>         </div>        </div>     </div>
 


<script type="text/javascript">
/*productList function*/
		function productDelete(p_id) {
			
			var p_id = p_id;
			if (confirm( '상품' + p_id + '를 삭제하시겠습니까?')) {
				location.href = '/admin/pro/productDelete/' + p_id;
			}else{
				alert('삭제 취소하였습니다.');
				location.href ='/admin/pro/productList';
				 
				 //return false;
			 }
		}
		
	   	//한줄 수정 다시 됌>_<
		function productUpdateRow(p_id,p_canBuy,p_canRent) {
	   		
			/* alert('p_id:::' + p_id);
			alert('p_canBuy::' + p_canBuy); 
			alert('p_canRent::' + p_canRent);  */
			
			var p_id = p_id;
			var p_canBuy2 = $("#p_canBuy_" + p_id).val();
			var p_canRent2 = $("#p_canRent_" + p_id).val(); 
			/* alert('p_canBuy2::' + p_canBuy2); 
			alert('p_canRent2::' + p_canRent2);  */
			
						
			if (confirm('상품을 수정하시겠습니까?')) {	
				location.href = '/admin/pro/productUpdate2/' + p_id +'/'+ p_canBuy2 +'/'+ p_canRent2;
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
			if (confirm('선택한 상품을 삭제하시겠습니까?')) {	
			var array = new Array(); // 배열 선언		
			$('input:checkbox[name=RowCheck]:checked').each(function() { // 체크된 체크박스의 value 값을 가지고 온다.			    
				array.push(this.value);
			});
						
			$("#arrayParam").val(array);				
			$("#form").attr("action", "/admin/pro/productDelete2");  
			$("#form").submit();
			}
		 }
		/*  $("#aa").on("click",function(e){
			 alert('g22');
		        e.preventDefault();    // 추가이벤트를 막아서 #의 최상위이동막음!!!
		        alert(1);
		}) */
		 function check_update(){
			 var is_use = document.getElementById('checkboxup');
			 is_use.disabled=false;
		 }
		
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
		 $(".modal_close").on("click", function () {
	           action_popup.close(this);
	       });
		 </script>

   <%@ include file="/WEB-INF/views/adminFooter.jsp"%>
</html>