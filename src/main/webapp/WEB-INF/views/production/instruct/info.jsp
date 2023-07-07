<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<link rel="stylesheet" as="style" crossorigin 
    href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.8/dist/web/static/pretendard.css" />
    
    <style type="text/css">
        * {
            font-family: Pretendard, -apple-system, BlinkMacSystemFont, system-ui, Roboto, "Helvetica Neue", "Segoe UI", "Apple SD Gothic Neo", "Noto Sans KR", "Malgun Gothic", "Apple Color Emoji", "Segoe UI Emoji", "Segoe UI Symbol", sans-serif;
        }
    </style>
<link rel="icon" href="/resources/img/faviconn.svg" type="image/x-icon">
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
			var line_id = $(this).find("td:eq(0)").text();
			var line_num = $(this).find("td:eq(1)").text();
			
			var opUrl = opener.location.href;
			
			// 부모창의 URL에 line_id와 line_num이 있으면 삭제
			if(opUrl.includes("&line_id") && opUrl.includes("&line_num")) {
				opUrl = opUrl.replace(/&line_id=[^&]+&line_num=[^&]+/, "");
			}
			
			opUrl += "&line_id=" + line_id + "&line_num=" + line_num;
			opener.location.href = opUrl;
			window.close();
		});
	});
</script>

<body>


<h3 class="m-4" style="text-align: center;">작업지시서</h3>
	
<div class="bg-light text-center rounded p-4 m-3">
	<div class="table-responsive">
		<table class="table align-middle table-bordered table-hover mb-0">
			<tr>
				<th style="background-color: rgba(0,0,0,0.075);">지시번호</th>
				<td>${wiList[0].work_num}</td>
				<th style="background-color: rgba(0,0,0,0.075);">수주번호</th>
				<td>${wiList[0].oo_num}</td>
			</tr>
			<tr>
				<th style="background-color: rgba(0,0,0,0.075);">품번</th>
				<td>${wiList[0].pro_num}</td>
				<th style="background-color: rgba(0,0,0,0.075);">수량</th>
				<td>${wiList[0].work_cnt}</td>
			</tr>
			<tr>
				<th style="background-color: rgba(0,0,0,0.075);">품명</th>
				<td>${wiList[0].pro_name}</td>
				<th style="background-color: rgba(0,0,0,0.075);">단위</th>
				<td>${wiList[0].pro_unit}</td>
			</tr>
			<tr>
				<th style="background-color: rgba(0,0,0,0.075);">납기일</th>
				<td>${fn:substring(wiList[0].oo_end_date, 0, 10)}</td>
				<th style="background-color: rgba(0,0,0,0.075);">생산라인</th>
				<td>${wiList[0].line_num}</td>
			</tr>
			<tr>
				<th style="background-color: rgba(0,0,0,0.075);">납품지점</th>
				<td>${wiList[0].clt_name}</td>
				<th style="background-color: rgba(0,0,0,0.075);">작성일</th>
				<td>
					<c:if test="${!empty wiList[0].update_date}">${fn:substring(wiList[0].update_date, 0, 10)}</c:if>
					<c:if test="${empty wiList[0].update_date}">${fn:substring(wiList[0].reg_date, 0, 10)}</c:if>
				</td>
			</tr>
			<tr>
				<th rowspan="10" style="background-color: rgba(0,0,0,0.075);">원재료</th>
				<th style="background-color: rgba(0,0,0,0.075);">품목코드</th>
				<th style="background-color: rgba(0,0,0,0.075);">품목명</th>
				<th style="background-color: rgba(0,0,0,0.075);">수량</th>
			</tr>
			<c:forEach var="list" items="${reqList}">
				<tr>
					<td>${list.ma_num}</td>
					<td>${list.ma_name}</td>
					<td>${list.req_cnt * list.work_cnt}</td>
				</tr>
			</c:forEach>
		</table>
	</div>
</div>

</body>
</html>