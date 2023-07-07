<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>작업지시서 작성</title>
</head>

<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
<link rel="stylesheet" as="style" crossorigin 
    href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.8/dist/web/static/pretendard.css" />
    
    <style type="text/css">
        * {
            font-family: Pretendard, -apple-system, BlinkMacSystemFont, system-ui, Roboto, "Helvetica Neue", "Segoe UI", "Apple SD Gothic Neo", "Noto Sans KR", "Malgun Gothic", "Apple Color Emoji", "Segoe UI Emoji", "Segoe UI Symbol", sans-serif;
        }
    </style>
<link rel="icon" href="/resources/img/faviconn.svg" type="image/x-icon">
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
	// 클릭 시 팝업창 열기
	$(document).on("click", "td[id='oo_num']", function() {
		window.name = "add";
		var left = (screen.width - 600) / 2;
		var top = (screen.height - 600) / 2;
		window.open('/production/instruct/addPopup?txt=oo', 'popup', 'width=600, height=600, top=' + top + ', left=' + left + ', location=no, status=no, scrollbars=yes');
	});
	
	$(document).on("click", "td[id='line_num']", function() {
		window.name = "add";
		var url = window.location.href;
		var onumVal = new URLSearchParams(new URL(url).search).get('oo_num');
		
		if(onumVal == null) {
			alert("수주번호 먼저 선택해주세요.");
			return false;
		} else {
			var left = (screen.width - 300) / 2;
			var top = (screen.height - 450) / 2;
			window.open('/production/instruct/addPopup?txt=li', 'popup', 'width=300, height=450, top=' + top + ', left=' + left + ', location=no, status=no, scrollbars=yes');
		}
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
		var url = window.location.href;
		var onumVal = new URLSearchParams(new URL(url).search).get('oo_num');
		var lnumVal = new URLSearchParams(new URL(url).search).get('line_num');
		console.log(onumVal);
		console.log(lnumVal);
		
		if(onumVal == null) {
			alert("수주번호를 선택해주세요.");
			return false;
		} else if(lnumVal == null) {
			alert("라인번호를 선택해주세요.");
			return false;
		}
		
		// 서버에 저장할 데이터 전송을 위한 ajax
		var formValue = $("form[name='addForm']").serialize();
		
		$.ajax({
			url : "${contextPath}/production/instruct/add",
			type : "POST",
			data : formValue,
			success : function() {
				
				Swal.fire({
					title: '작업지시서 작성이 완료되었습니다!',
					icon: 'success',
					confirmButtonColor: '#3085d6'
				}).then((result) => {
					if(result.isConfirmed) {
						opener.location.reload();
						self.close();
					}
				});
				
// 				alert("작업지시서 작성이 완료되었습니다.");
// 				opener.location.reload();
// 				self.close();
			},
			error : function() {
				alert("작업지시서 작성이 실패했습니다!");
			}
		});
	});
</script>

<body>
	
	<c:set var="now" value="<%=new java.util.Date()%>"/>
	<c:set var="today"><fmt:formatDate value="${now}" pattern="yyyy-MM-dd"/></c:set>

<h3 class="m-4" style="text-align: center;">작업지시서 작성</h3>

<div class="bg-light text-center rounded p-4 m-3">
	<div class="table-responsive">
		<form name="addForm" action="/production/instruct/add" method="post">
			<table class="table align-middle table-bordered table-hover mb-0">
				<tr>
					<th style="background-color: rgba(0,0,0,0.075);">지시번호</th>
					<td><input type="text" class="form-control" name="work_num" value="${idnum[0].work_num}" 
							 style="border: none; background: transparent;" readonly></td>
						
					<th style="background-color: rgba(0,0,0,0.075);">수주번호</th>
					<td id="oo_num">
						<input type="text" placeholder="(여기를 눌러 입력하세요)" class="form-control" name="oo_num" <c:if test='${!empty param.oo_num}'>value="${param.oo_num}"</c:if> readonly>
					</td>
				</tr>
				<tr>
					<th style="background-color: rgba(0,0,0,0.075);">품번</th>
					<td><input type="text" class="form-control" name="pro_num" <c:if test='${!empty param.oo_num}'>value="${reqList[0].pro_num}"</c:if> 
							 style="border: none; background: transparent;" readonly></td>
					<th style="background-color: rgba(0,0,0,0.075);">수량</th>
					<td><input type="number" class="form-control" name="work_cnt" id="wcntInput" <c:if test='${!empty param.oo_num}'>value="${reqList[0].oo_cnt}"</c:if>></td>
				</tr>
				<tr>
					<th style="background-color: rgba(0,0,0,0.075);">품명</th>
					<td><input type="text" class="form-control" name="pro_name" <c:if test='${!empty param.oo_num}'>value="${reqList[0].pro_name}"</c:if> 
							 style="border: none; background: transparent;" readonly></td>
					<th style="background-color: rgba(0,0,0,0.075);">단위</th>
					<td><input type="text" class="form-control" name="pro_unit" <c:if test='${!empty param.oo_num}'>value="${reqList[0].pro_unit}"</c:if> 
							 style="border: none; background: transparent;" readonly></td>
				</tr>
				<tr>
					<th style="background-color: rgba(0,0,0,0.075);">납기일</th>
					<td><c:if test='${!empty param.oo_num}'>${fn:substring(reqList[0].oo_end_date, 0, 10)}</c:if></td>
					<th style="background-color: rgba(0,0,0,0.075);">생산라인</th>
					<td id="line_num">
						<input type="text" placeholder="(여기를 눌러 입력하세요)"  class="form-control" name="line_num" <c:if test='${!empty param.line_num}'>value="${param.line_num}"</c:if> readonly>
					</td>
				</tr>
				<tr>
					<th style="background-color: rgba(0,0,0,0.075);">납품지점</th>
					<td><input type="text" class="form-control" name="clt_name" <c:if test='${!empty param.oo_num}'>value="${reqList[0].clt_name}"</c:if> 
							 style="border: none; background: transparent;" readonly></td>
					<th style="background-color: rgba(0,0,0,0.075);">작성일</th>
					<td><c:out value='${today}'/></td>
				</tr>
				<tr>
					<th rowspan="10" style="background-color: rgba(0,0,0,0.075);">원재료</th>
					<th style="background-color: rgba(0,0,0,0.075);">품목코드</th>
					<th style="background-color: rgba(0,0,0,0.075);">품목명</th>
					<th style="background-color: rgba(0,0,0,0.075);">수량</th>
				</tr>
				<c:forEach var="req" items="${reqList}">
					<tr>
						<td>${req.ma_num}</td>
						<td>${req.ma_name}</td>
						<td class="cl_req_cnt">${req.req_cnt}</td>
					</tr>
				</c:forEach>
			</table>
			<input type="hidden" name="work_id" value="${idnum[0].work_id}">
			<input type="hidden" name="pro_id" value="${reqList[0].pro_id}">
			<input type="hidden" name="req_id" value="${reqList[0].req_id}">
			<input type="hidden" name="clt_id" value="${reqList[0].clt_id}">
			<input type="hidden" name="emp_id" value="${sessionScope.emp_id}">
			<input type="hidden" name="oo_id" id="oo_id" <c:if test='${!empty param.oo_id}'>value="${param.oo_id}"</c:if> readonly>
			<input type="hidden" name="line_id" id="line_id" <c:if test='${!empty param.line_id}'>value="${param.line_id}"</c:if> readonly>
			<div>
				<input type="button" value="취소" class="btn btn-secondary m-2" onclick="window.close();">
				<input type="button" value="저장" id="addSubmint" class="btn btn-success m-2">
			</div>
		</form>
	</div>
</div>
	
</body>
</html>