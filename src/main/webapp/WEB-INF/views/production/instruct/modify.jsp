<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" />
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="//code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<script>
	$(document).on("click", "td[id='line_num']", function() {
		window.name = "add";
		var url = window.location.href;
		var onumVal = new URLSearchParams(new URL(url).search).get('oo_num');
		console.log(onumVal);
	});
	
	$(document).ready(function() {
		var cntVal = 1;
		var reqValArr = [];
		
		$("#wcntInput").on('input', function() {
			cntVal = parseInt($(this).val());
		});
		
		$(".cl_req_cnt").each(function(idx) {
			reqValArr[idx] = parseInt($(this).text());
		});
		
		$("#wcntInput").on('change', function() {
			$(".cl_req_cnt").each(function(idx) {
				if(cntVal) {
					if(reqValArr[idx]) {
						var reqVal = reqValArr[idx];
						var mulResult = reqVal * cntVal;
						$(this).text(mulResult);
					}
				}
			});
		});
	});
</script>

<body>
	
	<h1>/production/instruct/modify.jsp</h1>
	<h2>작업지시서 수정</h2>
${wiList} <br> 
<%-- ${reqList} <br>  --%>
<%-- ${param.work_id} --%>
	<form method="post">
		<table border="1">
			<tr>
				<th>지시번호</th>
				<td>${wiList[0].work_num}</td>
				<th>수주번호</th>
				<td id="oo_num">${wiList[0].oo_num}</td>
			</tr>
			<tr>
				<th>품번</th>
				<td>${wiList[0].pro_num}</td>
				<th>수량</th>
				<td><input type="text" name="work_cnt" id="wcntInput" value="${wiList[0].work_cnt}"></td>
			</tr>
			<tr>
				<th>품명</th>
				<td>${wiList[0].pro_name}</td>
				<th>작업상태</th>
				<td>
					<select name="work_state">
						<option value="대기" <c:if test="${wiList[0].work_state == '대기'}">selected</c:if>>대기</option>
						<option value="진행중" <c:if test="${wiList[0].work_state == '진행중'}">selected</c:if>>진행중</option>
						<option value="완료" <c:if test="${wiList[0].work_state == '완료'}">selected</c:if>>완료</option>
					</select>
				</td>
			</tr>
			<tr>
				<th>납기일</th>
				<td>${wiList[0].oo_end_date}</td>
				<th>생산라인</th>
				<td id="line_num">
					<input type="text" name="line_num" value="${wiList[0].line_num}">
				</td>
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
			<c:forEach var="req" items="${reqList}">
				<tr>
					<td>${req.ma_num}</td>
					<td>${req.ma_name}</td>
					<td class="cl_req_cnt">${req.req_cnt}</td>
				</tr>
			</c:forEach>
		</table>
		<input type="hidden" name="pro_id" value="${reqList[0].pro_id}">
		<input type="hidden" name="req_id" value="${reqList[0].req_id}">
		<input type="hidden" name="oo_id" value="${reqList[0].oo_id}">
		<input type="hidden" name="clt_id" value="${reqList[0].clt_id}">
		<input type="hidden" name="emp_id" value="${reqList[0].emp_id}">
		<div>
			<input type="button" value="취소" onclick="history.back();">
			<input type="submit" value="수정">
		</div>
	</form>
	
</body>
</html>