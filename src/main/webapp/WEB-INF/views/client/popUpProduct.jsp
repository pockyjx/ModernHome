<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
	$(document).ready(function() {
		
		$("tr").click(function() {
	      var pro_id = $(this).find("td:eq(0)").text();
	      var pro_num = $(this).find("td:eq(1)").text();
	      var pro_name = $(this).find("td:eq(2)").text();
			
	      opener.document.getElementById("pro_id").value = pro_id;
	      opener.document.getElementById("pro_num").value = pro_num;
	      opener.document.getElementById("pro_name").value = pro_name;
	      
	      window.close();
	      
		});
	});
</script>

</head>
<body>

	<h1>완제품 목록</h1>
	
	<table border="1">
	
		<tr>
			<th>완제품 id</th>
			<th>완제품 코드</th>
			<th>완제품명</th>
		</tr>
		
		<c:forEach items="${popUpPro }" var="vo">
		<tr>
			<td>${vo.pro_id }</td>
			<td>${vo.pro_num }</td>
			<td>${vo.pro_name }</td>
		</tr>
		</c:forEach>
	
	</table>

</body>
</html>