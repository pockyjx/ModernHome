<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>   

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h2>품목 검색</h2>

	

<h2>완제품 목록</h2>

	<table border="1">
	
		<tr>
			<td><input type="checkbox"></td>
			<th>품목 코드</th>
			<th>품목명</th>
			<th>품목 구분</th>
			<th>단위</th>
			<th>단가</th>
		</tr>
		
		<c:forEach items="${productList }" var="vo">
		<tr>
			<td><input type="checkbox"></td>
			<td>${vo.pro_num }</td>
			<td>${vo.pro_name }</td>
			<td>
				완제품
			</td>
			<td>${vo.pro_unit }</td>
			<td>${vo.pro_price }</td>
		</tr>
		</c:forEach>
	
	</table>

</body>
</html>