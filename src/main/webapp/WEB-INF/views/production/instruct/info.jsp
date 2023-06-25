<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../inc/header.jsp"%>
<%@ include file="../../inc/sidebar.jsp"%>
<%@ include file="../../inc/nav.jsp"%>
	
	<h2>작업지시서</h2>
	
<%-- 	${wiList} --%>
	
	<table border="1">
		<tr>
			<th>지시번호</th>
			<td>${wiList[0].work_num}</td>
			<th>수주번호</th>
			<td>${wiList[0].oo_num}</td>
		</tr>
		<tr>
			<th>품번</th>
			<td>${wiList[0].pro_num}</td>
			<th>수량</th>
			<td>${wiList[0].oo_cnt}</td>
		</tr>
		<tr>
			<th>품명</th>
			<td>${wiList[0].pro_name}</td>
			<th>단위</th>
			<td>${wiList[0].pro_unit}</td>
		</tr>
		<tr>
			<th>납기일</th>
			<td>${wiList[0].oo_end_date}</td>
			<th>생산라인</th>
			<td>${wiList[0].line_num}</td>
		</tr>
		<tr>
			<th>납품지점</th>
			<td>${wiList[0].clt_name}</td>
			<th>작성일</th>
			<td>
				<c:if test="${!empty wiList[0].update_date}">${wiList[0].update_date}</c:if>
				<c:if test="${empty wiList[0].update_date}">${wiList[0].reg_date}</c:if>
			</td>
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
	
<%@ include file="../../inc/footer.jsp"%>