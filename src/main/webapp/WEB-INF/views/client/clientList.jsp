<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h1>거래처조회</h1>
<!-- 	http://localhost:8088/client/clientList -->
	<form action="" method="GET">
	상호명 <input type="text" name="clt_name">
	대표자 <input type="text" name="clt_rep">
	
	<span>업종유형
	<input type="checkbox" name="clt_sort" value="수주">수주
	<input type="checkbox" name="clt_sort" value="발주">발주
	</span>
			
	<input type="submit" value="조회">
	</form>
		

	<table border="1">
		<tr>
			<td>거래처코드</td>
			<td>구분</td>
			<td>상호명</td>
			<td>대표자</td>
			<td>연락처</td>
			<td>주소지</td>
			<td>우편번호</td>
			<td>이메일</td>
		</tr>
		<c:forEach var="clientList" items="${clientList }">
		<tr>
			<td>${clientList.clt_id }</td>
			<td>${clientList.clt_sort }</td>
			<td>${clientList.clt_name }</td>
			<td>${clientList.clt_rep }</td>
			<td>${clientList.clt_tel }</td>
			<td>${clientList.clt_adr }</td>
			<td>${clientList.clt_post }</td>
			<td>${clientList.clt_email }</td>
		</tr>
		</c:forEach>
	</table>


</body>
</html>