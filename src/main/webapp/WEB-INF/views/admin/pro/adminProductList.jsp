<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>


<!DOCTYPE html>
<html lang="en">

<head>
<title>상품관리</title>
<%@ include file="/WEB-INF/views/adminHeader.jsp"%>


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
                   <form id="sort" name="productSearch" method="post" action="/admin/pro/productList">
					 <input type="hidden" id="rezNumA" name="rezNumA" />
						<select id="searchType" name="searchType">
							<option value="">검색조건</option>
							<option value="t">상품번호</option> 
							<option value="c">카테고리</option>
							<option value="w">상품명</option>
						</select>
						<input type="text" id="keyword" name="keyword" value="${pageMaker.cri.keyword}" placeholder="검색어를 입력하세요"/>
						<button id="searchBtn">검색</button>&nbsp;
						<input type="button" value="전체보기" onClick="location.href='/admin/pro/productList';"> 
						 &nbsp; 
   				<input type="button" value="상품등록" onclick="location.href='/admin/pro/productInsertForm'" /> 
      			&nbsp;
      			
      			&nbsp;
      			<!--  <input type="submit"  value="선택삭제" onclick="location.href='/admin/pro/productDelete2'" />  -->
                         </form>    
                      </div>



                      <!-- Basic table card start -->
                      <div class="card">
                         <div class="card-header">                                 	
                            	<h5>상품목록</h5>                           	
                         </div>
                         <div class="card-block table-border-style">
                            <div class="table-responsive">
                            <form name="delList" id="form" action="/admin/pro/productDelete2">
                           <input type="button"  value="선택삭제" onclick="checkboxArr();"/>  
                           <input type="hidden" id="arrayParam" name="arrayParam"/>
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

            <c:forEach var="list" items="${productList}" begin="0"
               end="10" step="1" varStatus="status">

               <tbody>
                <tr onclick="location.href='/admin/pro/productDetail/${list.p_id }'" style="cursor:hand" >
                     <td onclick="event.cancelBubble=true">
                     <input type="checkbox" name="RowCheck" value="${list.p_id }"></td>
                     <!-- <td scope="row"> -->
                    <%--  <td><a href="memDetail?m_id=${list.p_id }">${list.p_id }</a></td> --%>
                     <td onclick="event.cancelBubble=true">${list.p_id}</td>
                     <td>${list.p_name}<br>
                     <img src="/resources/img/${list.p_mainImg}" alt="${list.p_mainImg}" 
										title="${list.p_mainImg}" class="img-fluid"></td>
					<td><fmt:formatNumber value="${list.p_price}" pattern="###,###,###" />원</td>
					<td>${list.p_category}</td>
					<td><fmt:formatNumber value="${list.p_canBuy}" pattern="###,###,###" />개</td>
					<td><fmt:formatNumber value="${list.p_canRent}" pattern="###,###,###" />개</td>
					<!-- <td><img src="/resources/common/images/ufologo.jpg"></td>	 -->															
					<td><fmt:formatDate value="${list.p_regdate}" pattern="YYYY-MM-dd" /></td>
					<td onclick="event.cancelBubble=true"><button type="button" id="btnUpdate"
											onClick="productUpdate('${list.p_id}');"
											value="상품수정" class="btn btn-primary">수정</button>
					<td onclick="event.cancelBubble=true"><button type="button" id="btnDelete"
											onClick="productDelete('${list.p_id}')"
											value="상품삭제" class="btn btn-primary">삭제</button> 
				</tr> 
                                        
                                     </tbody>
                                  </c:forEach>

                      </table>
                       </form> 
                      <br>
                      <!-- page start -->
                      <ul class="btn-group pagination">
                         <c:if test="${pageMaker.prev }">
                            <li><a
                               href='<c:url value="/admin/pro/productList?page=${pageMaker.startPage-1 }"/>'><i
                                  class="fa fa-chevron-left"></i></a></li>
                         </c:if>
                         <c:forEach begin="${pageMaker.startPage }"
                            end="${pageMaker.endPage }" var="pageNum">
                            <li><a
                               href='<c:url value="/admin/pro/productList?page=${pageNum }"/>'><i
                                  class="fa">${pageNum }</i></a></li>
                         </c:forEach>
                         <c:if test="${pageMaker.next && pageMaker.endPage >0 }">
                            <li><a
                               href='<c:url value="/admin/pro/productList?page=${pageMaker.endPage+1 }"/>'><i
                                  class="fa fa-chevron-right"></i></a></li>
                         </c:if>
                      </ul>
                      <!-- page end -->


                                    </div></div></div> </div>
                        </div>
                        <!-- Page-body end -->
                     </div>             </div>            </div>         </div>        </div>     </div>
 
<script type="text/javascript">

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
	 
	
	 
	
</script>  




   <%@ include file="/WEB-INF/views/adminFooter.jsp"%>
</html>