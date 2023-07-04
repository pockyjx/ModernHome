<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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