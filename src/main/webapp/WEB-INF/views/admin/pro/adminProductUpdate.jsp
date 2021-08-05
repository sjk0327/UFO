<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>관리자 상품 리스트</title>

<script>
	function searchCheck(frm) {
       if (frm.keyWord.value == "") {
       alert("검색 단어를 입력하세요.");
       frm.keyWord.focus();
       return;
    }
    frm.submit();
 }
	
	
</script>
</head>
<body>

	<h2>관리자 상품리스트</h2><p><a href="/member/pro/productList">고객 상품리스트로 이동</a></p>
		<div>
		 <div class="form-group col-md-2">
                  <select name="keyField" id="fieldName" class="form-control">
                     <option value="">전체</option>
                     <option value="p_name">상품명</option>
                     <option value="p_category">카테고리</option>
                  </select>
                  <input type="text" />
                  <input type="button" id="btnSearch" value="검색"/>
                  <button type="submit" id="btnAdd" onClick="location.href='/admin/pro/productInsert'" value="상품추가">상품추가</button>
               </div>
			
		</div>
		<div>
		<table border="1">
		
		<c:forEach var="row" items="${productList}">
			<tr>
				<th>상품번호</th>
				<th>상품명</th>
				<th>상품가격</th>
				<th>구매가능수량</th>
				<th>대여가능수량</th>
				<th>판매완료수량</th>
				<th>추천수</th>
				<th>카테고리</th>
				<th>메인사진</th> 
				<th>서브사진</th> 
				<th>상품등록일</th> 
				<th>수정</th> 
				<th>삭제</th> 
			</tr>
				
				<td>${row.p_id}</td>
				<td>${row.p_name}</td>
				<td><fmt:formatNumber value="${row.p_price}" pattern="###,###,###"/></td>
				<td>${row.p_canBuy}</td>
				<td>${row.p_canRent}</td>
				<td>${row.p_soldCount}</td>
				<td>${row.p_recommand}</td>
				<td>${row.p_category}</td>
				<td><img src="/resources/common/images/ufologo.jpg"></td>
				<td><img src="/resources/common/images/ufologo.jpg"></td>
				<td>${row.p_regdate}</td>
				<td><button type="button" id="btnEdit" onClick="location.href='/admin/pro/productUpdate'" value="상품수정">상품수정</button>
				<td><button type="button" id="btnDel" onClick="location.href='/admin/pro/productDelete'" value="상품삭제">상품삭제</button>
		</c:forEach>
		
		</table>
	</div>
	
</body>
</html>