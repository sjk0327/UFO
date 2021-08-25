<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>배송지목록</title>

<style>
table.type09 {
	width: 100%;
	border-collapse: collapse;
	text-align: center;
	line-height: 1.5;
}

table.type09 thead th {
	padding: 10px;
	font-weight: bold;
	vertical-align: top;
	color: #369;
	border-bottom: 3px solid #036;
}

table.type09 tbody th {
	padding: 10px;
	font-weight: bold;
	vertical-align: top;
	border-bottom: 1px solid #ccc;
	background: #f3f6f7;
}

table.type09 td {
	padding: 10px;
	vertical-align: top;
	border-bottom: 1px solid #ccc;
}
</style>



</head>
<body>

	<table class="type09">
		<thead>
			<tr>
				<th>이름</th>
				<th>전화번호</th>
				<th>주소</th>
				<th></th>
				<th></th>
				<th></th>
				<th>선택</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="list" items="${addrList}">
				<tr>
					<th><input id="name" name="name" type="text"value="${list.b_mname }"
						style="background-color: #f3f6f7; text-align: center; border: none; width: 80px" readonly /></th>

					<td><input id="tel" name="tel" type="text" value="${list.b_mtel }"
						style="background-color: #ffffff; text-align: center; border: none;" readonly /></td>

					<td><input type="text" id="postcode" name="m_addr" value="${fn:split(list.b_maddr,',')[0]}" placeholder="우편번호"
						style="background-color: #ffffff; border: none; width: 50px;" readonly></td>

					<td><input type="text" id="address" name="m_addr"value="${fn:split(list.b_maddr,',')[1]}" placeholder="주소"
						style="background-color: #ffffff; border: none;" readonly></td>

					<td><input type="text" id="extraAddress" name="m_addr" value="${fn:split(list.b_maddr,'(')[1]}" placeholder="참고사항"
						style="background-color: #ffffff; border: none; width: 280px" readonly></td>

					<td><input type="text" id="detailAddress" name="m_addr" value="${fn:split(list.b_maddr,',')[2]}" placeholder="상세주소"
						style="background-color: #ffffff; border: none;" readonly></td>

					<td><button type="button" onclick="setParent()">선택</button></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>

	<script type="text/javascript">
		function setParent() {

			opener.$("input:radio[id='radioType2']").prop("checked", true);
			opener.$("#radio2").show();
			opener.$("#radio1").hide();

			opener.document.getElementById("m_name2").value = document.getElementById("name").value;
			opener.document.getElementById("m_tel2").value = document.getElementById("tel").value;
			opener.document.getElementById("postcode55").value = document.getElementById("postcode").value;
			opener.document.getElementById("address55").value = document.getElementById("address").value;
			opener.document.getElementById("extraAddress55").value = document.getElementById("extraAddress").value;
			opener.document.getElementById("detailAddress55").value = document.getElementById("detailAddress").value;
			
			<c:forEach var="list" items="${alist}" varStatus="status">
			opener.document.getElementById("b_mname1${status.index}").value = document.getElementById("name").value;
			opener.document.getElementById("b_mname2${status.index}").value = document.getElementById("name").value;
			opener.document.getElementById("b_mtel1${status.index}").value = document.getElementById("tel").value;
			opener.document.getElementById("b_mtel2${status.index}").value = document.getElementById("tel").value;
			opener.document.getElementById("postcode11${status.index}").value = document.getElementById("postcode").value;
			opener.document.getElementById("postcode22${status.index}").value = document.getElementById("postcode").value;
			opener.document.getElementById("address11${status.index}").value = document.getElementById("address").value;
			opener.document.getElementById("address22${status.index}").value = document.getElementById("address").value;
			opener.document.getElementById("extraAddress11${status.index}").value = document.getElementById("extraAddress").value + "@@";
			opener.document.getElementById("extraAddress22${status.index}").value = document.getElementById("extraAddress").value + "@@";
			opener.document.getElementById("detailAddress11${status.index}").value = document.getElementById("detailAddress").value;
			opener.document.getElementById("detailAddress22${status.index}").value = document.getElementById("detailAddress").value;
			</c:forEach>

			window.open("about:blank", "_self").close();
		}
	</script>
</body>
</html>