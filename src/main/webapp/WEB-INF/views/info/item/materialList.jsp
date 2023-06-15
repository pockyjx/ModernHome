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

	<fieldset>
		<form action="./itemSearchResult" method="POST">
			<b>품목 구분</b>
			<label><input type="radio" name="itemType" value="product">완제품</label>
			<label><input type="radio" name="itemType" value="material">자재</label>
			
			<select name="itemOption">
				<option value="name">품목명</option>
				<option value="num">품목코드</option>
			</select>
			
			<label><input type="text" name="search"></label>
			<input type="submit" value="조회">
		</form>
	</fieldset>



	<ul>
		<li><a href="./productList">완제품</a></li>
		<li><a href="./materialList">자재</a></li>
	</ul>
	
	<h2>자재 목록</h2>

	<table border="1">
	
		<tr>
			<td><input type="checkbox"></td>
			<th>품목 코드</th>
			<th>품목명</th>
			<th>품목 구분</th>
			<th>단위</th>
			<th>단가</th>
		</tr>
		
		<c:forEach items="${materialList }" var="vo">
		<tr>
			<td><input type="checkbox"></td>
			<td>${vo.ma_num }</td>
			<td>${vo.ma_name }</td>
			<td>
				완제품
			</td>
			<td>${vo.ma_unit }</td>
			<td>${vo.ma_price }</td>
		</tr>
		</c:forEach>
	
	</table>

</body>
</html>