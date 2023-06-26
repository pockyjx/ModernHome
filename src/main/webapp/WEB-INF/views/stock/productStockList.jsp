<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ include file="../inc/header.jsp"%>
<%@ include file="../inc/sidebar.jsp"%>
<%@ include file="../inc/nav.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h1>재고 현황</h1>


<div>
	<ul class="nav nav-tabs">
	  <li class="nav-item">
	    <a class="nav-link" aria-current="page" href="/stock/materialStockList">자재</a>
	  </li>
	  <li class="nav-item">
	    <a class="nav-link active" href="/stock/productStockList">완제품</a>
		</li>
	</ul>
</div>

<hr>

	<h4>재고 검색</h4>

	<fieldset>
		<form action="" method="GET">

			<label><b>완제품코드</b> <input type="text" name="pro_num"></label>
			<label><b>완제품명</b> <input type="text" name="pro_name"></label>

			<input type="submit" value="조회">
		</form>
	</fieldset>


<hr>

<h4>완제품 재고</h4> 

	<table border="1">
		<tr>
			<th>창고명</th>
			<th>완제품 코드</th>
			<th>완제품명</th>
			<th>현 재고</th>
			<th>단위</th>
		</tr>
		
		<c:forEach items="${psList }" var="vo">
		<tr>
			<td>${vo.wh_name}</td>
			<td>${vo.pro_num }</td>
			<td>${vo.pro_name }</td>
			<td>${vo.ps_cnt }</td>
			<td>${vo.pro_unit }</td>
		</tr>
		</c:forEach>
	</table>

</body>
</html>

<%@ include file="../inc/footer.jsp"%>