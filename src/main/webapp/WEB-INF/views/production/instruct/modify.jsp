<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>작업지시서 수정</title>
</head>

<!-- Google Web Fonts -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Heebo:wght@400;500;600;700&display=swap" rel="stylesheet">
<!-- Icon Font Stylesheet -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">
<!-- Libraries Stylesheet -->
<link href="/resources/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
<link href="/resources/lib/tempusdominus/css/tempusdominus-bootstrap-4.min.css" rel="stylesheet" />
<!-- Customized Bootstrap Stylesheet -->
<link href="/resources/css/bootstrap.min.css" rel="stylesheet">
<!-- Template Stylesheet -->
<link href="/resources/css/style.css" rel="stylesheet">

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" />
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="//code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<script>
	$(document).on("click", "td[id='line_num']", function() {
		window.name = "add";
		var url = window.location.href;
		var wiVal = new URLSearchParams(new URL(url).search).get('work_id');
		console.log(wiVal);
		window.open('/production/instruct/addPopup?txt=li&work_id=' + wiVal, 'popup', 'width=400, height=200, top=300, left=650, location=no, status=no');
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

	$(document).on("click", "#addSubmint", function() {
		var lnumVal = $("input[name='line_num']").val();
		console.log(lnumVal);
		
		if(lnumVal == null) {
			alert("라인번호를 선택해주세요.");
			return false;
		}
		
		// 서버에 저장할 데이터 전송을 위한 ajax
		var formValue = $("form[name='modifyForm']").serialize();
		
		$.ajax({
			url : "${contextPath}/production/instruct/modify",
			type : "POST",
			data : formValue,
			success : function() {
				alert("작업지시서 수정이 완료되었습니다.");
				opener.location.reload();
				self.close();
			},
			error : function() {
				alert("작업지시서 수정이 실패했습니다!");
			}
		});
	});
</script>

<body>

<div class="d-flex align-items-center justify-content-between mb-2">
	<h3 class="m-4">작업지시서 수정</h3>
</div>

<div class="bg-light text-center rounded p-4 m-3">
	<form name="modifyForm" action="/production/instruct/modify" method="post">
		<table class="table text-start align-middle table-bordered table-hover mb-0">
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
				<td><input type="text" class="form-control" name="work_cnt" id="wcntInput" value="${wiList[0].work_cnt}"></td>
			</tr>
			<tr>
				<th>품명</th>
				<td>${wiList[0].pro_name}</td>
				<th>작업상태</th>
				<td>
					<select name="work_state" class="form-control">
						<option value="대기" <c:if test="${wiList[0].work_state == '대기'}">selected</c:if>>대기</option>
						<option value="진행중" <c:if test="${wiList[0].work_state == '진행중'}">selected</c:if>>진행중</option>
						<option value="완료" <c:if test="${wiList[0].work_state == '완료'}">selected</c:if>>완료</option>
					</select>
				</td>
			</tr>
			<tr>
				<th>납기일</th>
				<td>${fn:substring(wiList[0].oo_end_date, 0, 10)}</td>
				<th>생산라인</th>
				<td id="line_num">
					<input type="text" class="form-control" name="line_num" value="${(empty param.line_num) ? wiList[0].line_num : param.line_num}" readonly>
				</td>
			</tr>
			<tr>
				<th>납품지점</th>
				<td>${wiList[0].clt_name}</td>
				<th>작성일</th>
				<td>
					<c:if test="${!empty wiList[0].update_date}">${fn:substring(wiList[0].update_date, 0, 10)}</c:if>
					<c:if test="${empty wiList[0].update_date}">${fn:substring(wiList[0].reg_date, 0, 10)}</c:if>
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
		<input type="hidden" name="pro_id" value="${wiList[0].pro_id}">
		<input type="hidden" name="req_id" value="${wiList[0].req_id}">
		<input type="hidden" name="oo_id" value="${wiList[0].oo_id}">
		<input type="hidden" name="clt_id" value="${wiList[0].clt_id}">
		<input type="hidden" name="emp_id" value="${sessionScope.emp_id}">
		<input type="hidden" name="line_id" value="${(empty param.line_id) ? wiList[0].line_id : param.line_id}">
		<div>
			<input type="button" value="취소" class="btn btn-secondary m-2" onclick="window.close();">
			<input type="button" value="수정" id="addSubmint" class="btn btn-success m-2"> 
		</div>
	</form>
</div>
	
</body>
</html>