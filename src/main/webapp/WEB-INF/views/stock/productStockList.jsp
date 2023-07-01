<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ include file="../inc/header.jsp"%>
<%@ include file="../inc/sidebar.jsp"%>
<%@ include file="../inc/nav.jsp"%>

<link rel="stylesheet" href="//code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" />

<form action="" method="GET" class="bg-light rounded p-3 m-3">

	<div class="row mb-3">
		<label class="col-sm-2 col-form-label">완제품코드</label>
		<div class="col-sm-10">
			<input type="text" name="pro_num" value="${psvo.pro_num }" class="form-control">
		</div>
	</div>
	
	<div class="row mb-3">
		<label class="col-sm-2 col-form-label">완제품명</label>
		<div class="col-sm-10">
			<input type="text" name="pro_name" value="${psvo.pro_name }" class="form-control">
			<button class="btn btn-primary m-2" type="submit" style="margin-left:200%;">조회</button>
		</div>
	</div>
</form>

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

<div class="d-flex align-items-center justify-content-between mb-2">  
	<h4 class="m-4">완제품 재고</h4> 
</div>

<div class="bg-light text-center rounded p-4 m-3">
	<div class="table-responsive">
		<table class="table align-middle table-bordered table-hover mb-0">
			<tr>
				<th style="background-color: rgba(0,0,0,0.075);">창고명</th>
				<th style="background-color: rgba(0,0,0,0.075);">완제품 코드</th>
				<th style="background-color: rgba(0,0,0,0.075);">완제품명</th>
				<th style="background-color: rgba(0,0,0,0.075);">현 재고</th>
				<th style="background-color: rgba(0,0,0,0.075);">단위</th>
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
	</div>
</div>

	<!-- 페이지 이동 버튼 -->
	
	<nav aria-label="Page navigation example">
  		<ul class="pagination justify-content-center pagination-sm">
  		
  			<c:if test="${pm.prev }">
			<li class="page-item">
				<a class="page-link" href="/stock/productStockList?page=${pm.startPage-1 }&pro_num=${psvo.pro_num}&pro_name=${psvo.pro_name}" aria-label="Previous">
       			<span aria-hidden="true">&laquo;</span>
      			</a>
    		</li>
    		</c:if>
    		
    		<c:forEach begin="${pm.startPage }" end="${pm.endPage }" step="1" var="idx">
    		<li 
    			<c:out value="${pm.pageVO.page == idx ? 'class=page-item active': 'class=page-item'}" />
    		>
    			<a class="page-link" href="/stock/productStockList?page=${idx}&pro_num=${psvo.pro_num}&pro_name=${psvo.pro_name}">${idx }</a>
    		</li>
    		</c:forEach>
			
			<c:if test="${pm.next && pm.endPage > 0}">
			<li class="page-item">
      			<a class="page-link" href="/stock/productStockList?page=${pm.endPage+1 }&pro_num=${psvo.pro_num}&pro_name=${psvo.pro_name}" aria-label="Next">
        		<span aria-hidden="true">&raquo;</span>
      			</a>
    		</li>
    		</c:if>
    		
  		</ul>
	</nav>
	
	<!-- 페이지 이동 버튼 -->

<%@ include file="../inc/footer.jsp"%>