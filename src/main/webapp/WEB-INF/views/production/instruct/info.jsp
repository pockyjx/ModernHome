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
	
	<h1>/production/instruct/info.jsp</h1>
	<h2>작업지시서 상세 출력</h2>
	
	${resultVO}
	
	<table border="1">
		<tr>
			<th>지시번호</th>
			<td>${resultVO.work_num}</td>
			<th>수주번호</th>
			<td>${resultVO.out_or_id} 수주기본키로 수주번호 확인@@</td>
		</tr>
		<tr>
			<th>품번</th>
			<td>${resultVO.pro_id} 완제품기본키로 완제품번호 확인@@</td>
			<th>수량</th>
			<td>${resultVO.work_cnt}</td>
		</tr>
		<tr>
			<th>품명</th>
			<td>${resultVO.pro_id} 완제품기본키로 완제품명 확인@@</td>
			<th>단위</th>
			<td>${resultVO.pro_id} 완제품기본키로 단위 확인@@</td>
		</tr>
		<tr>
			<th>납기일</th>
			<td>${resultVO.out_or_id} 수주기본키로 납기일 확인@@</td>
			<th>생산라인</th>
			<td>${resultVO.line_id} 라인기본키로 라인명 확인@@</td>
		</tr>
		<tr>
			<th>납품지점</th>
			<td>${resultVO.out_or_id} 수주기본키로 거래처 확인@@</td>
			<th>작성일</th>
			<td>${resultVO.reg_date}</td>
		</tr>
		<tr>
			<th rowspan="3">원재료</th>
			<th>품목코드</th>
			<th>품목명</th>
			<th>수량</th>
		</tr>
		
<%-- 		<c:forEach var="req" items="소요량으로 필요한 자재 & 수량 받아서 출력"> --%>
<!-- 			<tr> -->
<!-- 				<td></td> -->
<!-- 				<td></td> -->
<!-- 				<td></td> -->
<!-- 			</tr> -->
<%-- 		</c:forEach> --%>
		
	</table>
	
</body>
</html>