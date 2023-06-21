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
	
<%-- 	${onumList} <hr> --%>
	
	<form id="fr" action="/production/instruct/add?oo_num=${onum.oo_num}" method="get" target="add">
		<table border="1">
			<tr>
				<th>수주번호</th>
				<td>
					<select id="selectOnum" name="oo_num">
						<option value="">수주번호를 선택하세요.</option>
						<c:forEach var="onum" items="${onumList}">
							<option value="${onum.oo_num}">${onum.oo_num}</option>
						</c:forEach>
					</select>
				</td>
			</tr>
		</table>
		<button class="btn btn-primary m-2" onclick="window.close();">확인</button>
	</form>
	
</body>
</html>