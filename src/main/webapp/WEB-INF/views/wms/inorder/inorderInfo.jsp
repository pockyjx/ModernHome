<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
		
		<h2>발주서</h2>
		
		<table border="1">
			<tr>
				<th>발주코드</th>
				<td>${inorderList[0].io_num}</td>
			</tr>
		</table>
			
		<br>
	
		<table border="1">	
			<tr>
				<th>거래처 코드</th>
				<th>거래처명</th>
				<th>자재코드</th>
				<th>자재명</th>
				<th>발주량</th>
				<th>단위</th>
				<th>총금액</th>
			</tr>
			
			<c:forEach items="${inorderList }" var="vo">
			<tr>
				<td>${vo.clt_num}</td>
				<td>${vo.clt_name}</td>
				<td>${vo.ma_num}</td>
				<td>${vo.ma_name}</td>
				<td>${vo.io_cnt}</td>
				<td>${vo.io_unit}</td>
				<td>${vo.io_amount}</td>
			</tr>
			</c:forEach>
		</table>
		
		
		
</body>
</html>