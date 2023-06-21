<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>발주 거래처 팝업</title>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
	$(document).ready(function() {
		
		$("tr").click(function() {
	      var clt_id = $(this).find("td:eq(0)").text();
	      var clt_num = $(this).find("td:eq(1)").text();
	      var clt_name = $(this).find("td:eq(2)").text();
			
	      opener.document.getElementById("clt_id").value = clt_id;
	      opener.document.getElementById("clt_num").value = clt_num;
	      opener.document.getElementById("clt_name").value = clt_name;
	      
	      window.close();
	      
		});
	});
</script>


</head>
<body>

	<h1>거래처 목록</h1>
	
	<table border="1">
	
		<tr>
			<th>거래처 id</th>
			<th>거래처 코드</th>
			<th>거래처명</th>
		</tr>
		
		<c:forEach items="${popUpClt }" var="vo">
		<tr>
			<td>${vo.clt_id }</td>
			<td>${vo.clt_num }</td>
			<td>${vo.clt_name }</td>
		</tr>
		</c:forEach>
	
	</table>

</body>
</html>