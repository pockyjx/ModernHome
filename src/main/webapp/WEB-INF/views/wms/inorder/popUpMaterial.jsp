<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>발주 자재 팝업</title>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
	$(document).ready(function() {
		
		$("tr").click(function() {
	      var ma_id = $(this).find("td:eq(0)").text();
	      var ma_num = $(this).find("td:eq(1)").text();
	      var ma_name = $(this).find("td:eq(2)").text();
			
	      opener.document.getElementById("ma_id").value = ma_id;
	      opener.document.getElementById("ma_num").value = ma_num;
	      opener.document.getElementById("ma_name").value = ma_name;
	      
	      window.close();
	      
		});
	});
</script>

</head>
<body>

	<h1>자재 목록</h1>
	
	<table border="1">
	
		<tr>
			<th>자재 id</th>
			<th>자재 코드</th>
			<th>자재명</th>
		</tr>
		
		<c:forEach items="${popUpMate }" var="vo">
		<tr>
			<td>${vo.ma_id }</td>
			<td>${vo.ma_num }</td>
			<td>${vo.ma_name }</td>
		</tr>
		</c:forEach>
	
	</table>
		

</body>
</html>