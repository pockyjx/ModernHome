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

<h1>재고 현황</h1>

	<ul>
		<li><a href="./productStockList">완제품</a></li>
		<li><a href="./materialStockList">자재</a></li>
	</ul>

<h2>완제품 재고</h2> 

	<table border="1">
		<tr>
			<th><input type="checkbox"> </th>
			<th>창고명</th>
			<th>완제품 코드</th>
			<th>완제품명</th>
			<th>현 재고</th>
			<th>단위</th>
		</tr>
		
		<c:forEach items="${psList }" var="vo">
		<tr>
			<td><input type="checkbox"> </th>
			<td>${vo.warehouseVO.wh_name}</td>
			<td>${vo.pro_id }</td>
			<td>${vo.productVO.pro_name }</td>
			<td>${vo.ps_cnt }</td>
			<td></td>
		</tr>
		</c:forEach>
	</table>

</body>
</html>