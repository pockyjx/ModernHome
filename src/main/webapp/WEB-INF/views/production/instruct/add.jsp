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
	
	<h1>/production/instruct/add.jsp</h1>
	<h2>작업지시서 작성</h2>
	
	<form method="post">
		<table border="1">
			<tr>
				<th>지시번호</th>
				<td><input type="text" name="work_num"></td>
				<th>수주번호</th>
				<td><input type="text" name="oo_num"></td>
			</tr>
			<tr>
				<th>품번</th>
				<td><input type="text" name="pro_num"></td>
				<th>수량</th>
				<td><input type="number" name="oo_cnt"></td>
			</tr>
			<tr>
				<th>품명</th>
				<td><input type="text" name="pro_name"></td>
				<th>단위</th>
				<td><input type="text" name="pro_unit"></td>
			</tr>
			<tr>
				<th>납기일</th>
				<td></td>
				<th>생산라인</th>
				<td><input type="text" name="line_num"></td>
			</tr>
			<tr>
				<th>납품지점</th>
				<td><input type="text" name="cli_name"></td>
				<th>작성일</th>
				<td></td>
			</tr>
			<tr>
				<th rowspan="2">원재료</th>
				<th>품목코드</th>
				<th>품목명</th>
				<th>수량</th>
			</tr>
			<tr>
				<td><input type="text" name="ma_num"></td>
				<td><input type="text" name="ma_name"></td>
				<td><!-- 일단 비워둠 --></td>
			</tr>
			<tr>
				<th colspan="4">
					<input type="button" value="취소" onclick="close">
					<input type="submit" value="저장">
				</th>
			</tr>
		</table>
	</form>
	
</body>
</html>