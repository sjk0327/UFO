<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>


<!DOCTYPE html>
<html lang="en">

<head>
<title> 관리자 상품 리스트 페이지 - UF&#38;O </title>
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
						</select>&nbsp;
						<input type="text" id="keyword" name="keyword" value="${pageMaker.cri.keyword}" placeholder="검색어를 입력하세요"/>&nbsp;
						<button id="button" class="btn waves-effect waves-light btn-primary btn-outline-primary">검색</button>&nbsp;
						<input type="button" id="button" class="btn waves-effect waves-light btn-primary btn-outline-primary" value="전체보기" onClick="location.href='/admin/pro/productList';"> 
						 &nbsp; 
   				<input type="button" id="button" class="btn waves-effect waves-light btn-primary btn-outline-primary" value="상품등록" onclick="location.href='/admin/pro/productInsertForm'" /> 
      			&nbsp;
      			
      			&nbsp;
      			<!--  <input type="submit"  value="선택삭제" onclick="location.href='/admin/pro/productDelete2'" />  -->
                         </form>    
                      </div>
                      	<div>
											<br>
										</div>




                      <!-- Basic table card start -->
                      <div class="card">
                         <div class="card-header">                                 	
                            	<h5>상품목록</h5>                           	
                         </div>
                         <div class="card-block table-border-style">
                            <div class="table-responsive">
                            <form name="delList" id="form" action="/admin/pro/productDelete2">
                           <input type="button" id="button" class="btn waves-effect waves-light btn-primary btn-outline-primary" value="선택삭제" onclick="checkboxArr();"/>  
                             	<div>
									<br>
								</div>
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
             <form id="sort" name="btnUpdate" method="post" action="/admin/pro/productUpdate/${p_id }"> 
					 <input type="hidden" id="p_id" name="p_id" />
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
					<td onclick="event.cancelBubble=true"><input type="text" size="10" fmt:formatNumber value="${list.p_canBuy}" pattern="###,###,###"  />개</td>
					<td onclick="event.cancelBubble=true"><input type="text" size="10" fmt:formatNumber value="${list.p_canRent}" pattern="###,###,###" />개</td>
					<!-- <td><img src="/resources/common/images/ufologo.jpg"></td>	 -->															
					<td><fmt:formatDate value="${list.p_regdate}" pattern="YYYY-MM-dd" /></td>

					<td onclick="event.cancelBubble=true"><button type="button" id="button"
											onClick="productUpdate('${list.p_id}');"
											value="상품수정" class="btn waves-effect waves-light btn-primary btn-outline-primary">수정</button>
					<td onclick="event.cancelBubble=true"><button type="button" id="button"

											onClick="productDelete('${list.p_id}')"
											value="상품삭제" class="btn waves-effect waves-light btn-primary btn-outline-primary">삭제</button> 
				</tr> 
                         <!--  </form>      -->         
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
 





   <%@ include file="/WEB-INF/views/adminFooter.jsp"%>
</html>