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
	
<%-- 	${wiList}<br> --%>
<%-- 	${reqList} --%>
	
	<table border="1">
		<tr>
			<th>지시번호</th>
			<td>${wiList[0].work_num}</td>
			<th>수주번호</th>
			<td>${wiList[0].outOrderVO.oo_num}</td>
		</tr>
		<tr>
			<th>품번</th>
			<td>${wiList[0].productVO.pro_num}</td>
			<th>수량</th>
			<td>${wiList[0].outOrderVO.oo_cnt}</td>
		</tr>
		<tr>
			<th>품명</th>
			<td>${wiList[0].productVO.pro_name}</td>
			<th>단위</th>
			<td>${wiList[0].productVO.pro_unit}</td>
		</tr>
		<tr>
			<th>납기일</th>
			<td>${wiList[0].outOrderVO.oo_end_date}</td>
			<th>생산라인</th>
			<td>${wiList[0].lineVO.line_name}</td>
		</tr>
		<tr>
			<th>납품지점</th>
			<td>${wiList[0].clientVO.clt_name}</td>
			<th>작성일</th>
			<td>${wiList[0].reg_date}</td>
		</tr>
		<tr>
			<th rowspan="10">원재료</th>
			<th>품목코드</th>
			<th>품목명</th>
			<th>수량</th>
		</tr>
		<c:forEach var="list" items="${reqList}">
			<tr>
				<td>${list.ma_num}</td>
				<td>${list.ma_name}</td>
				<td>${list.req_cnt * list.work_cnt}</td>
			</tr>
		</c:forEach>
	</table>
	
</body>
</html>