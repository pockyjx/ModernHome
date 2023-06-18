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
	
	<h1>소요량 관리</h1>
	
	<fieldset>
		<form action="" method="GET">
				
			<select name="option">
				<option value="all">전체</option>
				<option value="pro_name">완제품명</option>
				<option value="ma_name">자재명</option>
<!-- 				<option value="req_num">소요량 코드</option> -->
			</select>
			
			<label><input type="text" name="search"></label>
			<input type="submit" value="조회">
		</form>
	</fieldset>

	<hr>
	
	<h2>소요량</h2>
	
	<button id="addRowButton">추가</button>
	<button id="deleteRowsButton">삭제</button>
	
	<table class="table-reqList" border="1">
		
		<tr>
			<th><input type="checkbox"></th>
			<th>소요량 코드</th>
			<th>완제품 코드</th>
			<th>완제품명</th>
			<th>자재 코드</th>
			<th>자재명</th>
			<th>소요량</th>
			<th>단위</th>
			<th>등록일</th>
			<th>등록자</th>
			<th>수정일</th>
			<th>수정자</th>
		</tr>
		
		<c:forEach var="vo" items="${reqList }">
		<tr>	
			<td><input type="checkbox"></td>
			<td>${vo.req_num }</td>
			<td>${vo.productVO.pro_id }</td>
			<td>${vo.productVO.pro_name }</td>
			<td>${vo.materialVO.ma_id }</td>
			<td>${vo.materialVO.ma_name }</td>
			<td>${vo.req_cnt }</td>
			<td>${vo.req_unit }</td>
			<td>${vo.req_reg_date }</td>
			<td>${vo.emp_id }</td>
			<td>${vo.req_update_date }</td>
			<td>${vo.update_emp_id }</td>
		</tr>	
		</c:forEach>
		
	</table>
	
</body>
</html>