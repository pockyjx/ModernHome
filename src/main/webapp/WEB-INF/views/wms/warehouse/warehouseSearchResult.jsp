<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>창고 검색 결과</title>
</head>
<body>
		<h2>창고 검색 결과</h2>
				<fieldset>
	               	<form action="./warehouseSearchResult" method="POST">
	                   	<b>창고 구분</b>
						<label><input type="radio" name="wh_type" value="material" checked>자재</label>
	                   	<label><input type="radio" name="wh_type" value="product">완제품</label>
			       		<label>창고명 : 
			       			<input type="text" name="search" placeholder="창고 이름을 입력하세요">
			       		</label>
			      		<input type="submit" value="조회">
	             	</form>
	             </fieldset>  
	             
		<h2>창고 검색 결과</h2>
			<button id="addRowButton">추가</button>
			<button id="deleteRowsButton">삭제</button>
			<table border="1">
				<tr>
					<th><input type="checkbox"></th>
			    	<th>창고번호</th>
			    	<th>창고코드</th>
			    	<th>창고이름</th>
			    	<th>창고구분</th>
			    	<th>창고연락처</th>
			    	<th>담당자</th>
				</tr>
				
				<!-- 창고 검색 결과 -->
				<c:if test="${whSearchList != null }">
				<c:forEach items="${whSearchList }" var="vo">
				<tr>
					<td><input type="checkbox"></td>
					<td>${vo.wh_id }</td>
					<td>${vo.wh_num }</td>
					<td>${vo.wh_name }</td>
					<td>${vo.wh_type }</td>
					<td>${vo.wh_tel }</td>
					<td>${vo.emp_id }</td>
				</tr>
				</c:forEach>
				</c:if>
				<!-- 창고 검색 결과 -->
			</table>
			
</body>
</html>