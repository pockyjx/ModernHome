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

<link href="/resources/img/favicon.ico" rel="icon">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Heebo:wght@400;500;600;700&display=swap" rel="stylesheet">
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
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
			var line_id = $(this).find("td:eq(5)").text();
			var line_num = $(this).find("td:eq(6)").text();
			var work_cnt = $(this).find("td:eq(7)").text();
			var df_type = $(this).find("td:eq(8)").text();
			var qc_id = $(this).find("td:eq(9)").text();
			
			opener.document.getElementsByName("work_id")[0].value = work_id;
// 			opener.document.getElementsByName("work_num")[0].value = work_num;
			opener.document.getElementsByName("pro_id")[0].value = pro_id;
			opener.document.getElementsByName("pro_num")[0].value = pro_num;
			opener.document.getElementsByName("pro_name")[0].value = pro_name;
			opener.document.getElementsByName("line_id")[0].value = line_id;
			opener.document.getElementById("lnumPop").value = line_num;
// 			opener.document.getElementsByName("work_cnt")[0].value = work_cnt;
			opener.document.getElementById("dfTypePop").value = df_type;
			opener.document.getElementsByName("qc_id")[0].value = qc_id;
			
			window.close();
		});
		
		$(".table-ma tr").click(function() {
			var rec_id = $(this).find("td:eq(0)").text();
			var rec_num = $(this).find("td:eq(1)").text();
			var ma_id = $(this).find("td:eq(2)").text();
			var ma_num = $(this).find("td:eq(3)").text();
			var ma_name = $(this).find("td:eq(4)").text();
			var rec_cnt = $(this).find("td:eq(5)").text();
			var rec_in_state = $(this).find("td:eq(6)").text();
			var df_type = $(this).find("td:eq(7)").text();
			var qc_id = $(this).find("td:eq(8)").text();
			var clt_name = $(this).find("td:eq(9)").text();
			
			opener.document.getElementsByName("rec_id")[0].value = rec_id;
// 			opener.document.getElementsByName("rec_num")[0].value = rec_num;
			opener.document.getElementsByName("ma_id")[0].value = ma_id;
			opener.document.getElementsByName("ma_num")[0].value = ma_num;
			opener.document.getElementsByName("ma_name")[0].value = ma_name;
// 			opener.document.getElementsByName("rec_cnt")[0].value = rec_cnt;
// 			opener.document.getElementsByName("rec_in_state")[0].value = rec_in_state;
			opener.document.getElementById("dfTypePop").value = df_type;
			opener.document.getElementsByName("qc_id")[0].value = qc_id;
			opener.document.getElementsByName("clt_name")[0].value = clt_name;
			
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
		
		// 테이블 숨기기
		if(checkbox.checked) {
			if(value === '완제품') {
				$(".table-pr").show();
				$(".table-ma").hide();
			} else if(value === '자재') {
				$(".table-ma").show();
				$(".table-pr").hide();
			}
		} else {
			$(".table-pr").hide();
			$(".table-ma").hide();
		}
	}
</script>

<body>

<div class="col-sm-10">
	<label><input type="checkbox" name="df_type" value="완제품" class="form-check-input" 
		onclick="handleCheckbox(this, '완제품')"> 완제품</label>
	<label><input type="checkbox" name="df_type" value="자재" class="form-check-input" 
		onclick="handleCheckbox(this, '자재')"> 자재</label>
</div>
	
<%-- ${wiList} <hr> ${resList} --%>

<table class="table-pr table text-start align-middle table-bordered table-hover mb-0" style="display: none">
	<tr>
		<th colspan="9">작업지시 내역</th>
	</tr>
	<c:forEach var="wi" items="${wiList}">
		<tr>
			<td style="display: none">${wi.work_id}</td>
			<td>${wi.work_num}</td>
			<td style="display: none">${wi.pro_id}</td>
			<td>${wi.pro_num}</td>
			<td>${wi.pro_name}</td>
			<td style="display: none">${wi.line_id}</td>
			<td>${wi.line_num}</td>
			<td>${wi.work_cnt}</td>
			<td style="display: none">완제품</td>
			<td style="display: none">${wi.qc_id}</td>
		</tr>
	</c:forEach>
</table>

<table class="table-ma table text-start align-middle table-bordered table-hover mb-0" style="display: none">
	<tr>
		<th colspan="9">입고 내역</th>
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
			<td style="display: none">자재</td>
			<td style="display: none">${rec.qc_id}</td>
			<td>${rec.clt_name}</td>
		</tr>
	</c:forEach>
</table>

</body>
</html>