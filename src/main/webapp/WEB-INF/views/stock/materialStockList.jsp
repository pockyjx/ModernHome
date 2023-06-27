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
	    <a class="nav-link active" aria-current="page" href="/stock/materialStockList">자재</a>
	  </li>
	  <li class="nav-item">
	    <a class="nav-link" href="/stock/productStockList">완제품</a>
		</li>
	</ul>
</div>

<hr>

	<h4>재고 검색</h4>

	<fieldset>
		<form action="" method="GET">

			<label><b>자재코드</b> <input type="text" name="ma_num" value="${msvo.ma_num }"></label>
			<label><b>자재명</b> <input type="text" name="ma_name" value="${msvo.ma_name }"></label>

			<input type="submit" value="조회">
		</form>
	</fieldset>
	
<hr>

<h4>자재 재고</h4>

	<table border="1">
		<tr>
			<th>창고명</th>
			<th>자재 코드</th>
			<th>자재명</th>
			<th>현 재고</th>
			<th>단위</th>
		</tr>
		
		<c:forEach items="${msList }" var="vo">
		<tr>
			<td>${vo.wh_name}</td>
			<td>${vo.ma_num }</td>
			<td>${vo.ma_name }</td>
			<td>${vo.ms_cnt }</td>
			<td>${vo.ma_unit }</td>
		</tr>
		</c:forEach>
	</table>
	
	<!-- 페이지 이동 버튼 -->
	
	<nav aria-label="Page navigation example">
  		<ul class="pagination justify-content-center pagination-sm">
  		
  			<c:if test="${pm.prev }">
			<li class="page-item">
				<a class="page-link" href="/stock/materialStockList?page=${pm.startPage-1 }&ma_num=${msvo.ma_num}&ma_name=${msvo.ma_name}" aria-label="Previous">
       			<span aria-hidden="true">&laquo;</span>
      			</a>
    		</li>
    		</c:if>
    		
    		<c:forEach begin="${pm.startPage }" end="${pm.endPage }" step="1" var="idx">
    		<li 
    			<c:out value="${pm.pageVO.page == idx ? 'class=page-item active': 'class=page-item'}" />
    		>
    			<a class="page-link" href="/stock/materialStockList?page=${idx}&ma_num=${msvo.ma_num}&ma_name=${msvo.ma_name}">${idx }</a>
    		</li>
    		</c:forEach>
			
			<c:if test="${pm.next && pm.endPage > 0}">
			<li class="page-item">
      			<a class="page-link" href="/stock/materialStockList?page=${pm.endPage+1 }&ma_num=${msvo.ma_num}&ma_name=${msvo.ma_name}" aria-label="Next">
        		<span aria-hidden="true">&raquo;</span>
      			</a>
    		</li>
    		</c:if>
    		
  		</ul>
	</nav>
	
	<!-- 페이지 이동 버튼 -->

</body>
</html>

<%@ include file="../inc/footer.jsp"%>