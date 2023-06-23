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
	
	<h2>재고 검색</h2>

	<fieldset>
		<form action="./stockSearchResult" method="GET">
			
			<label><b>창고명</b>
			<input type="text" name="wh_name"></label>
			
			<select name="itemOption">
				<option value="pro">완제품</option>
				<option value="material">자재</option>
			</select>
			
			<input type="text" name="search">
			<input type="submit" value="조회">
		</form>
	</fieldset>
	

<h2>자재 재고</h2>

	<table border="1">
		<tr>
			<th><input type="checkbox"> </th>
			<th>창고명</th>
			<th>자재 코드</th>
			<th>자재명</th>
			<th>현 재고</th>
			<th>단위</th>
		</tr>
		
		<c:forEach items="${msList }" var="vo">
		<tr>
			<td><input type="checkbox"> </th>
			<td>${vo.wh_name}</td>
			<td>${vo.ma_num }</td>
			<td>${vo.ma_name }</td>
			<td>${vo.ms_cnt }</td>
			<td>${vo.ma_unit }</td>
		</tr>
		</c:forEach>
	</table>
	


</body>
</html>