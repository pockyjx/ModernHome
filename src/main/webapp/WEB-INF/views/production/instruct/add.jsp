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
	// 클릭 시 팝업창 열기
	$(document).on("click", "input[name='oo_num']", function() {
		window.name = "add";
		window.open('/production/instruct/addPopup?txt=oo', 'popup', 'width=400, height=200, top=300, left=650, location=no, status=no');
	});
	
	$(document).on("click", "input[name='line_num']", function() {
		window.name = "add";
		var url = window.location.href;
		var onumVal = new URLSearchParams(new URL(url).search).get('oo_num');
		console.log(onumVal);
		
		if(onumVal == null) {
			alert("수주번호부터 선택해주세요.");
			return false;
		} else {
			window.open('/production/instruct/addPopup?txt=li&oo_num=${param.oo_num}', 'popup', 'width=400, height=200, top=300, left=650, location=no, status=no');
		}
	});
	
	$(document).ready(function() {
		$("#wcntInput").on('input', function() {
			var cntVal = $(this).val();
			$("#rcnt-wcnt").text(cntVal);
		});
	});
</script>

<body>
	
	<c:set var="now" value="<%=new java.util.Date()%>"/>
	<c:set var="today"><fmt:formatDate value="${now}" pattern="yyyy-MM-dd"/></c:set>
	
	<h1>/production/instruct/add.jsp</h1>
	<h2>작업지시서 작성</h2>
${reqList}
	<form method="post">
		<table border="1">
			<tr>
				<th>지시번호</th>
				<td><input type="text" name="work_num" value="${work_num}"></td>
				<th>수주번호</th>
				<td>
					<input type="text" name="oo_num" <c:if test='${!empty param.oo_num}'>value="${param.oo_num}"</c:if> readonly>
				</td>
			</tr>
			<tr>
				<th>품번</th>
				<td><input type="text" name="pro_num" <c:if test='${!empty param.oo_num}'>value="${reqList[0].pro_num}"</c:if> readonly></td>
				<th>수량</th>
				<td><input type="number" name="work_cnt" id="wcntInput"></td>
			</tr>
			<tr>
				<th>품명</th>
				<td><input type="text" name="pro_name" <c:if test='${!empty param.oo_num}'>value="${reqList[0].pro_name}"</c:if> readonly></td>
				<th>단위</th>
				<td><input type="text" name="pro_unit" <c:if test='${!empty param.oo_num}'>value="${reqList[0].pro_unit}"</c:if> readonly></td>
			</tr>
			<tr>
				<th>납기일</th>
				<td><input type="text" name="oo_end_date" <c:if test='${!empty param.oo_num}'>value="${reqList[0].oo_end_date}"</c:if> readonly></td>
				<th>생산라인</th>
				<td>
					<input type="text" name="line_num" <c:if test='${!empty param.line_num}'>value="${param.line_num}"</c:if> readonly>
				</td>
			</tr>
			<tr>
				<th>납품지점</th>
				<td><input type="text" name="clt_name" <c:if test='${!empty param.oo_num}'>value="${reqList[0].clt_name}"</c:if> readonly></td>
				<th>작성일</th>
				<td><input type="text" name="reg_date" value="<c:out value='${today}'/>"></td>
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
					<td id="rcnt-wcnt">${req.req_cnt}</td>
				</tr>
			</c:forEach>
		</table>
		<input type="hidden" name="pro_id" value="${reqList[0].pro_id}">
		<input type="hidden" name="req_id" value="${reqList[0].req_id}">
		<input type="hidden" name="oo_id" value="${reqList[0].oo_id}">
		<input type="hidden" name="clt_id" value="${reqList[0].clt_id}">
		<div>
			<input type="button" value="취소" onclick="history.back();">
			<input type="submit" value="저장">
		</div>
	</form>
	
</body>
</html>