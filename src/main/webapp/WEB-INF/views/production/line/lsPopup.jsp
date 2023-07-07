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
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">
<link href="/resources/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
<link href="/resources/lib/tempusdominus/css/tempusdominus-bootstrap-4.min.css" rel="stylesheet" />
<link href="/resources/css/bootstrap.min.css" rel="stylesheet">
<link href="/resources/css/style.css" rel="stylesheet">

<body>

<div class="bg-light text-center rounded p-4 m-3">
	<div class="d-flex align-items-center justify-content-between mb-4">
		<h5>${lsList[0].line_num} 라인 가동 중지 내역</h5>
	</div>
	<table class="table text-start align-middle table-bordered table-hover mb-0">
		<tr>
			<th>상태 변경</th>
			<th>변경 사유</th>
			<th>변경일</th>
			<th>변경자</th>
		</tr>
		<c:forEach var="ls" items="${lsList}">
			<tr>
				<td>${ls.ls_yn}</td>
				<td>${ls.ls_rsns}</td>
				<td>${ls.reg_date}</td>
				<td>${ls.emp_name}</td>
			</tr>
		</c:forEach>
	</table>
</div>
	
</body>
</html>