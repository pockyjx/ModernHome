<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
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

<h3 class="m-4" style="text-align: center;">라인 목록</h3>

<div class="bg-light text-center rounded p-4 m-3" style="margin-left:3rem; margin-right:3rem;">
	<c:choose>
		<c:when test="${empty param.work_id}">
			<form id="fr" action="/production/instruct/add" method="get" target="add">
		</c:when>
		<c:when test="${!empty param.work_id}">
			<form id="fr" action="/production/instruct/modify" method="get" target="add">
		</c:when>
	</c:choose>
		<table class="table align-middle table-bordered table-hover mb-0">
			<tr>
				<th style="background-color: rgba(0,0,0,0.075);">라인 코드</th>
				<th colspan="2" style="background-color: rgba(0,0,0,0.075);">사용 유무</th>
			</tr>
			<c:forEach var="lnum" items="${liList}">
				<c:if test="${lnum.use_yn == 'Y'}">
					<tr>
						<td style="display: none">${lnum.line_id}</td>
						<td>${lnum.line_num}</td>
						<td>${lnum.use_yn == 'Y' ? "사용가능" : "사용불가"}</td>
					</tr>
				</c:if>
			</c:forEach>
		</table>
	</form>
</div>
	
</body>
</html>