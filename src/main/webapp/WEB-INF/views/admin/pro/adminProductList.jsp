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
                              <div class="form-inline">
                                 <select id="searchType" name="searchType">
                                    <option value="all">전체</option>
                                    <option value="i">상품번호</option>
                                    <option value="n">상품명</option>
                                   <!--  <option value="p"></option> -->
				
                                 </select> <input class="form-control" type="text" id="keyword"
                                    name="keyword" value="${pageMaker.cri.keyword}"
                                    placeholder="검색어를 입력하세요" />
                                 <button id="searchBtn" class="btn btn-primary">Search</button>
                              </div>

							<!-- <div id="product_order_list">
								<p>
			<a href="javascript:recentlist();">최신순</a>&nbsp&nbsp&nbsp|&nbsp&nbsp&nbsp
			<a href="javascript:pricelist();">낮은가격</a>&nbsp&nbsp&nbsp|&nbsp&nbsp&nbsp
			<a href="javascript:pricelistdesc();">높은가격</a> </p>
		</div>	 -->


                              <!-- Basic table card start -->
                              <div class="card">
                                 <div class="card-header">
                                    <h5>상품목록</h5>
                                 </div>
                                 <div class="card-block table-border-style">
                                    <div class="table-responsive">
                                       							<table class="table table-hover">
														<thead>
															<tr>
																<th width="100">번호</th>
																<th width="100">상품명</th>
																<th width="100">상품가격</th>
																<th width="100">구매가능수량</th>
																<th width="100">대여가능수량</th>
																<th width="100">판매완료수량</th>
																<th width="100">추천수</th>
																<th width="100">카테고리</th>
																<th width="100">메인사진</th>
																<th width="100">서브사진</th>
																<th width="100">등록일</th>
																<!-- <th width="100">수정</th>
																<th width="100">삭제</th> -->
															</tr>
                                          </thead>

                                          <c:forEach var="list" items="${productList}" begin="0"
                                             end="10" step="1" varStatus="status">

                                             <tbody>
                                                <tr onclick="location.href='/admin/pro/productDetail/${list.p_id }'" style="cursor:hand" >
                                                   <td scope="row"><a
                                                      href="memDetail?m_id=${list.p_id }">${list.p_id }</a></td>
                                                   <td >${list.p_name}</td>
																	<td><fmt:formatNumber value="${list.p_price}"
																			pattern="###,###,###" />원</td>
																	<td>${list.p_canBuy}</td>
																	<td>${list.p_canRent}</td>
																	<td>${list.p_soldCount}</td>
																	<td>${list.p_recommand}</td>
																	<td>${list.p_category}</td>
																	<td><img src="/resources/common/images/ufologo.jpg"></td>
																	<td><img src="/resources/common/images/ufologo.jpg"></td>
																	<td><fmt:formatDate value="${list.p_regdate}"
																			pattern="YYYY-MM-dd" /></td>
																	<!-- <td><button type="button" id="btnEdit"
																			onClick="location.href='/admin/pro/productUpdate'"
																			value="상품수정" class="btn btn-dark">수정</button>
																	<td><button type="button" id="btnDel"
																			onClick="location.href='/admin/pro/productDelete'"
																			value="상품삭제" class="btn btn-dark">삭제</button> -->
																</tr>
                                             </tbody>
                                          </c:forEach>

                                       </table>
                                       <br>
                                       <!-- page start -->
                                       <ul class="btn-group pagination">
                                          <c:if test="${pageMaker.prev }">
                                             <li><a
                                                href='<c:url value="/admin/mem/memList?page=${pageMaker.startPage-1 }"/>'><i
                                                   class="fa fa-chevron-left"></i></a></li>
                                          </c:if>
                                          <c:forEach begin="${pageMaker.startPage }"
                                             end="${pageMaker.endPage }" var="pageNum">
                                             <li><a
                                                href='<c:url value="/admin/mem/memList?page=${pageNum }"/>'><i
                                                   class="fa">${pageNum }</i></a></li>
                                          </c:forEach>
                                          <c:if test="${pageMaker.next && pageMaker.endPage >0 }">
                                             <li><a
                                                href='<c:url value="/admin/mem/memList?page=${pageMaker.endPage+1 }"/>'><i
                                                   class="fa fa-chevron-right"></i></a></li>
                                          </c:if>
                                       </ul>
                                       <!-- page end -->


                                    </div>
                                 </div>
                              </div>
                           </div>
                        </div>
                        <!-- Page-body end -->
                     </div>
                  </div>
               </div>
            </div>
         </div>
      </div>
   </div>


   


   <%@ include file="/WEB-INF/views/adminFooter.jsp"%>
</html>