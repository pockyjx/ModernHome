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
<script type="text/javascript">
	function popSub(form) {
		form.taget = opener.name;
		form.submit();
		self.close();
	}
</script>

<body>
	
<%-- 	${liList} <hr> --%>
<c:choose>
	<c:when test="${empty param.work_id}">
		<form id="fr" action="/production/instruct/add" method="get" target="add">
	</c:when>
	<c:when test="${!empty param.work_id}">
		<form id="fr" action="/production/instruct/modify" method="get" target="add">
	</c:when>
</c:choose>
		<table border="1">
			<tr>
				<th>라인번호</th>
				<td>
					<c:if test="${empty param.work_id}">
						<input type="hidden" name="oo_num" value="${param.oo_num}">
					</c:if>
					<c:if test="${!empty param.work_id}">
						<input type="hidden" name="work_id" value="${param.work_id}">
					</c:if>
					<select id="selectLnum" name="line_num">
						<option value="">라인을 선택하세요.</option>
						<c:forEach var="lnum" items="${liList}">
							<c:if test="${lnum.use_yn == 'Y'}">
								<option value="${lnum.line_num}">${lnum.line_num}</option>
							</c:if>
						</c:forEach>
					</select>
				</td>
			</tr>
		</table>
		<button class="btn btn-primary m-2" onclick="window.close();">확인</button>
	</form>
	
</body>
</html>