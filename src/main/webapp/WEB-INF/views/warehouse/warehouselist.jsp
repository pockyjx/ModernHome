<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>창고 관리</title>
</head>
<body>
		<h2>창고 관리</h2>
			<fieldset>
               	<form name="search" method="get" action="">
                   	<span>창고 구분
						<input type="checkbox" name="wh_type_ma">자재
                   		<input type="checkbox" name="wh_type_pro">완제품
                   	</span>
		       		<span>창고명 : 
		       			<input type="text" name="wh_name" placeholder="창고 이름을 입력하세요">
		       		</span>
		      		<button class="btn btn-primary" type="submit" id="IconButton6"><a>조회</a></button>
             	</form>
             </fieldset>  
             
		<h2>창고</h2>
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
			  	<c:forEach var="vo" items="${warehouseList}">
					<tr>
						<td><input type="checkbox"></td>
				    	<td>${vo.wh_id}</td>
				    	<td>${vo.wh_num}</td>
				    	<td>${vo.wh_name}</td>
				    	<td>${vo.wh_type}</td>
				   		<td>${vo.wh_tel}</td>
				   		<td>${vo.emp_id}</td>
				    </tr>
			    </c:forEach>
			</table>
		
		
		
</body>
</html>