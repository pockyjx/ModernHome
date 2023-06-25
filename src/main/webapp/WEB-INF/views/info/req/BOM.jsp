<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>



	<table border="1">
		
		<tr>
			<th>완제품 코드</th>
			<td>${BOMList[0].pro_num}</td>
			<th>완제품명</th>
			<td>${BOMList[0].pro_name}</td>
		</tr> 
	</table>
	
	<br>
	
	<table border="1">
	
		<tr>
			<th>자재 코드</th>
			<th>자재명</th>
			<th>소요량</th>
			<th>단위</th>
		</tr>
	
		<c:forEach items="${BOMList }" var="vo">
		<tr>
			<td>${vo.ma_num }</td>
			<td>${vo.ma_name }</td>
			<td>${vo.req_cnt }</td>
			<td>${vo.req_unit}</td>
		
		</tr>
		</c:forEach>	
	
	</table>

</body>
</html>