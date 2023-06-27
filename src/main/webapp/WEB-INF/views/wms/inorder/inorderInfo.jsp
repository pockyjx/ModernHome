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
			<tr>
				<th>거래처 코드</th>
				<td>${inorderList[0].clt_id}</td>
				<th>거래처명</th>
				<td>${inorderList[0].clt_name}</td>
			</tr>
			<tr>
				<th>자재코드</th>
				<td>${inorderList[0].ma_num}</td>
				<th>자재명</th>
				<td>${inorderList[0].ma_name}</td>
				<th>발주량</th>
				<td>${inorderList[0].io_cnt}</td>
				<th>단위</th>
				<td>${inorderList[0].io_unit}</td>
				<th>총금액</th>
				<td>${inorderList[0].io_amount}</td>
			</tr>
		
		</table>
		
		
</body>
</html>