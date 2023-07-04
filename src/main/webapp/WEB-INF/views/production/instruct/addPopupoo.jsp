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
		$("tr").click(function() {
			var oo_id = $(this).find("td:eq(0)").text();
			var oo_num = $(this).find("td:eq(1)").text();
			
			console.log(oo_id);
			console.log(oo_num);
			
			var opUrl = opener.location.href;
			var ooVal = "?oo_id=" + oo_id + "&oo_num=" + oo_num;
			var lineVal = "";
			
			// 부모창의 URL에 oo_id와 oo_num이 있으면 삭제
			if(opUrl.includes("?oo_id") && opUrl.includes("&oo_num")) {
				// 부모창 URL에 oo_id, oo_num 뒤에 line 관련 정보가 있으면 저장 후 삭제 
				if(opUrl.includes("&line_id") && opUrl.includes("&line_num")) {
					lineVal = "&line_id=" + new URLSearchParams(new URL(opUrl).search).get("line_id") 
								+ "&line_num=" + new URLSearchParams(new URL(opUrl).search).get("line_num");
					opUrl = opUrl.replace(/&line_id=[^&]+&line_num=[^&]+/, "");
				}
				opUrl = opUrl.replace(/\?oo_id=[^&]+&oo_num=[^&]+/, "");
			}
			
			opUrl += (lineVal === "") ? ooVal : ooVal + lineVal;
			opener.location.href = opUrl;
			window.close();
		});
	});
</script>

<body>
	
<h3 class="m-4" style="text-align: center;">수주 목록</h3>
	
<div class="bg-light text-center rounded p-4 m-3" style="margin-left:3rem; margin-right:3rem;">
	<table class="table align-middle table-bordered table-hover mb-0">
		<tr>
			<th style="background-color: rgba(0,0,0,0.075);">수주 코드</th>
			<th style="background-color: rgba(0,0,0,0.075);">품목 코드</th>
			<th style="background-color: rgba(0,0,0,0.075);">품목명</th>
			<th style="background-color: rgba(0,0,0,0.075);">거래처</th>
			<th style="background-color: rgba(0,0,0,0.075);">수주량</th>
			<th colspan="2" style="background-color: rgba(0,0,0,0.075);">출하 예정일</th>
		</tr>
		<c:forEach var="onum" items="${onumList}">
			<tr>
				<td style="display: none">${onum.oo_id}</td>
				<td>${onum.oo_num}</td>
				<td>${onum.pro_num}</td>
				<td>${onum.pro_name}</td>
				<td>${onum.clt_name}</td>
				<td>${onum.oo_cnt}</td>
				<td>${fn:substring(onum.oo_end_date, 0, 10)}</td>
			</tr>
		</c:forEach>
	</table>
</div>
	
</body>
</html>