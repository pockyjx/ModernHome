<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<!-- Favicon -->
<link rel="icon" href="/resources/img/faviconn.svg" type="image/x-icon">

<!-- Font -->
<link rel="stylesheet" as="style" crossorigin 
href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.8/dist/web/static/pretendard.css" />

<style type="text/css">
    * {
        font-family: Pretendard, -apple-system, BlinkMacSystemFont, system-ui, Roboto, "Helvetica Neue", "Segoe UI", "Apple SD Gothic Neo", "Noto Sans KR", "Malgun Gothic", "Apple Color Emoji", "Segoe UI Emoji", "Segoe UI Symbol", sans-serif;
    }
</style>
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">
<link href="/resources/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
<link href="/resources/lib/tempusdominus/css/tempusdominus-bootstrap-4.min.css" rel="stylesheet" />
<link href="/resources/css/bootstrap.min.css" rel="stylesheet">
<link href="/resources/css/style.css" rel="stylesheet">

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" />
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="//code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$(".table-pr tr").click(function() {
			var work_id = $(this).find("td:eq(0)").text();
			var work_num = $(this).find("td:eq(1)").text();
			var pro_id = $(this).find("td:eq(2)").text();
			var pro_num = $(this).find("td:eq(3)").text();
			var pro_name = $(this).find("td:eq(4)").text();
			var work_cnt = $(this).find("td:eq(6)").text();
			var df_type = $(this).find("td:eq(7)").text();
			var qc_id = $(this).find("td:eq(8)").text();
			var df_cnt = $(this).find("td:eq(9)").text();
			
			opener.document.getElementsByName("work_id")[0].value = work_id;
			opener.document.getElementById("code1").value = work_num;
			opener.document.getElementById("code1").setAttribute("name", "work_num");
			opener.document.getElementsByName("pro_id")[0].value = pro_id;
			opener.document.getElementById("code2").value = pro_num;
			opener.document.getElementById("code2").setAttribute("name", "pro_num");
			opener.document.getElementById("code3").value = pro_name;
			opener.document.getElementById("code3").setAttribute("name", "pro_name");
			opener.document.getElementById("dfTypePop").value = df_type;
			opener.document.getElementsByName("qc_id")[0].value = qc_id;
			opener.document.getElementsByName("df_cnt")[0].value = df_cnt;
			
			window.close();
		});
		
		$(".table-ma tr").click(function() {
			var rec_id = $(this).find("td:eq(0)").text();
			var rec_num = $(this).find("td:eq(1)").text();
			var ma_id = $(this).find("td:eq(2)").text();
			var ma_num = $(this).find("td:eq(3)").text();
			var ma_name = $(this).find("td:eq(4)").text();
			var rec_cnt = $(this).find("td:eq(5)").text();
			var df_type = $(this).find("td:eq(7)").text();
			var qc_id = $(this).find("td:eq(8)").text();
			var df_cnt = $(this).find("td:eq(10)").text();
			
			opener.document.getElementsByName("rec_id")[0].value = rec_id;
			opener.document.getElementById("code1").value = rec_num;
			opener.document.getElementById("code1").setAttribute("name", "rec_num");
			opener.document.getElementsByName("ma_id")[0].value = ma_id;
			opener.document.getElementById("code2").value = ma_num;
			opener.document.getElementById("code2").setAttribute("name", "ma_num");
			opener.document.getElementById("code3").value = ma_name;
			opener.document.getElementById("code3").setAttribute("name", "ma_name");
			opener.document.getElementById("dfTypePop").value = df_type;
			opener.document.getElementsByName("qc_id")[0].value = qc_id;
			opener.document.getElementsByName("df_cnt")[0].value = df_cnt;
			
			window.close();
		});
		
		$(".table-mrpr tr").click(function() {
			var mr_id = $(this).find("td:eq(0)").text();
			var pr_id = $(this).find("td:eq(1)").text();
			var mr_num = $(this).find("td:eq(2)").text();
			var pr_num = $(this).find("td:eq(3)").text();
			var ma_id = $(this).find("td:eq(4)").text();
			var pro_id = $(this).find("td:eq(5)").text();
			var ma_num = $(this).find("td:eq(6)").text();
			var pro_num = $(this).find("td:eq(7)").text();
			var ma_name = $(this).find("td:eq(8)").text();
			var pro_name = $(this).find("td:eq(9)").text();
			var mr_cnt = $(this).find("td:eq(10)").text();
			var pr_cnt = $(this).find("td:eq(11)").text();
			var df_type = $(this).find("td:eq(12)").text();
			var qc_id = $(this).find("td:eq(13)").text();
			var df_cnt = $(this).find("td:eq(15)").text();
			
			console.log(mr_id);
			console.log(pr_id);

			if(mr_id !== null && mr_id !== ""){
				opener.document.getElementsByName("mr_id")[0].value = mr_id;
				opener.document.getElementById("code1").value = mr_num
				opener.document.getElementById("code1").setAttribute("name", "mr_num");
				opener.document.getElementsByName("ma_id")[0].value = ma_id;
				opener.document.getElementById("code2").value = ma_num;
				opener.document.getElementById("code2").setAttribute("name", "ma_num");
				opener.document.getElementById("code3").value = ma_name;
				opener.document.getElementById("code3").setAttribute("name", "ma_name");
			}
			if(pr_id !== null && pr_id !== ""){
				opener.document.getElementsByName("pr_id")[0].value = pr_id;
				opener.document.getElementById("code1").value = pr_num
				opener.document.getElementById("code1").setAttribute("name", "pr_num");
				opener.document.getElementsByName("pro_id")[0].value = ma_id;
				opener.document.getElementById("code2").value = pro_num;
				opener.document.getElementById("code2").setAttribute("name", "pro_num");
				opener.document.getElementById("code3").value = pro_name;
				opener.document.getElementById("code3").setAttribute("name", "pro_name");
			}
			opener.document.getElementById("dfTypePop").value = df_type;
			opener.document.getElementsByName("qc_id")[0].value = qc_id;
			opener.document.getElementsByName("df_cnt")[0].value = df_cnt;
			
			window.close();
		});
	});
	
	// 체크박스 중복 X
	function handleCheckbox(checkbox, value) {
		const checkboxes = document.getElementsByName('df_type');
		
		// 다른 체크박스 중에서 선택된 체크박스를 제외하고 체크 해제
		checkboxes.forEach(function(cb) {
			if(cb !== checkbox && cb.checked) {
				cb.checked = false;
			}
		});
		
// 		console.log(value);
		
		// 테이블 숨기기
		if(checkbox.checked) {
			if(value === '공정검사') {
				$(".table-pr").show();
				$(".table-ma").hide();
				$(".table-mrpr").hide();
			} else if(value === '수입검사') {
				$(".table-ma").show();
				$(".table-pr").hide();
				$(".table-mrpr").hide();
			}else if(value === '출고검사') {
				$(".table-mrpr").show();
				$(".table-pr").hide();
				$(".table-ma").hide();
			}
		} else {
			$(".table-pr").hide();
			$(".table-ma").hide();
			$(".table-mrpr").hide();
		}
	}
</script>

<body>

<div class="col-sm-10 bg-light text-center col-form-label table align-middle" style="display: flex; justify-content: center;">
	<label><input type="checkbox" name="df_type" value="공정검사" class="form-check-input" 
		onclick="handleCheckbox(this, '공정검사')"> 공정검사 </label>
	<label><input type="checkbox" name="df_type" value="수입검사" class="form-check-input" 
		onclick="handleCheckbox(this, '수입검사')"> 수입검사 </label>
	<label><input type="checkbox" name="df_type" value="출고검사" class="form-check-input" 
		onclick="handleCheckbox(this, '출고검사')"> 출고검사 </label>
</div>
	

<div class="table-pr bg-light text-center rounded p-4 mx-3" style="display: none">
	<h3 class="m-4" style="text-align: center;">작업지시 목록</h3>
	
	<table class="table align-middle table-bordered table-hover mb-0">
		<tr>
			<th style="background-color: rgba(0,0,0,0.075);">작업지시 코드</th>
			<th style="background-color: rgba(0,0,0,0.075);">품목 코드</th>
			<th style="background-color: rgba(0,0,0,0.075);">품목명</th>
			<th style="background-color: rgba(0,0,0,0.075);">라인 코드</th>
			<th style="background-color: rgba(0,0,0,0.075);">지시 수량</th>
			<th colspan="5" style="background-color: rgba(0,0,0,0.075);">불량 수량</th>
		</tr>
		<c:forEach var="wi" items="${wiList}">
			<tr>
				<td style="display: none">${wi.work_id}</td>
				<td>${wi.work_num}</td>
				<td style="display: none">${wi.pro_id}</td>
				<td>${wi.pro_num}</td>
				<td>${wi.pro_name}</td>
				<td>${wi.line_num}</td>
				<td>${wi.work_cnt}</td>
				<td style="display: none">공정검사</td>
				<td style="display: none">${wi.qc_id}</td>
				<td>${wi.df_cnt}</td>
			</tr>
		</c:forEach>
	</table>
</div>
	
<div class="table-ma bg-light text-center rounded p-4 mx-3" style="display: none">
	<h3 class="m-4" style="text-align: center;">입고 목록</h3>
	
	<table class="table align-middle table-bordered table-hover mb-0">
		<tr>
			<th style="background-color: rgba(0,0,0,0.075);">입고 코드</th>
			<th style="background-color: rgba(0,0,0,0.075);">자재 코드</th>
			<th style="background-color: rgba(0,0,0,0.075);">자재명</th>
			<th style="background-color: rgba(0,0,0,0.075);">입고 수량</th>
			<th style="background-color: rgba(0,0,0,0.075);">입고 등록일</th>
			<th style="background-color: rgba(0,0,0,0.075);">거래처</th>
			<th colspan="5" style="background-color: rgba(0,0,0,0.075);">불량 수량</th>
		</tr>
		<c:forEach var="rec" items="${recList}">
			<tr>
				<td style="display: none">${rec.rec_id}</td>
				<td>${rec.rec_num}</td>
				<td style="display: none">${rec.ma_id}</td>
				<td>${rec.ma_num}</td>
				<td>${rec.ma_name}</td>
				<td>${rec.rec_cnt}</td>
				<td>${fn:substring(rec.rec_date, 0, 10)}</td>
				<td style="display: none">수입검사</td>
				<td style="display: none">${rec.qc_id}</td>
				<td>${rec.clt_name}</td>
				<td>${rec.df_cnt}</td>
			</tr>
		</c:forEach>
	</table>
</div>
	
<div class="table-mrpr bg-light text-center rounded p-4 mx-3" style="display: none">
	<h3 class="m-4" style="text-align: center;">출고 목록</h3>
	
	<table class="table align-middle table-bordered table-hover mb-0">
		<tr>
			<th style="background-color: rgba(0,0,0,0.075);">출고 코드</th>
			<th style="background-color: rgba(0,0,0,0.075);">품목 코드</th>
			<th style="background-color: rgba(0,0,0,0.075);">품목명</th>
			<th style="background-color: rgba(0,0,0,0.075);">출고 수량</th>
			<th style="background-color: rgba(0,0,0,0.075);">창고명</th>
			<th colspan="12" style="background-color: rgba(0,0,0,0.075);">불량 수량</th>
		</tr>
		<c:forEach var="mrpr" items="${mrprList}">
			<tr>
				<td style="display: none">${mrpr.mr_id}</td>
				<td style="display: none">${mrpr.pr_id}</td>
				<td <c:if test="${empty mrpr.mr_id}">style="display: none"</c:if>>${mrpr.mr_num}</td>
				<td <c:if test="${!empty mrpr.mr_id}">style="display: none"</c:if>>${mrpr.pr_num}</td>
				<td style="display: none">${mrpr.ma_id}</td>
				<td style="display: none">${mrpr.pro_id}</td>
				<td <c:if test="${empty mrpr.mr_id}">style="display: none"</c:if>>${mrpr.ma_num}</td>
				<td <c:if test="${empty mrpr.pr_id}">style="display: none"</c:if>>${mrpr.pro_num}</td>
				<td <c:if test="${empty mrpr.mr_id}">style="display: none"</c:if>>${mrpr.ma_name}</td>
				<td <c:if test="${empty mrpr.pr_id}">style="display: none"</c:if>>${mrpr.pro_name}</td>
				<td <c:if test="${empty mrpr.mr_id}">style="display: none"</c:if>>${mrpr.mr_cnt}</td>
				<td <c:if test="${empty mrpr.pr_id}">style="display: none"</c:if>>${mrpr.pr_cnt}</td>
				<td style="display: none">출고검사</td>
				<td style="display: none">${mrpr.qc_id}</td>
				<td>${mrpr.wh_name}</td>
				<td>${mrpr.df_cnt}</td>
			</tr>
		</c:forEach>
	</table>
</div>

</body>
</html>