<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>입고 발주 팝업</title>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
	$(document).ready(function() {
		
		$("tr").click(function() {
	      var io_id = $(this).find("td:eq(0)").text();
	      var io_num = $(this).find("td:eq(1)").text();
	      var ma_name = $(this).find("td:eq(2)").text();
	      var io_cnt = $(this).find("td:eq(3)").text();
	      var clt_id = $(this).find("td:eq(4)").text();
	      var clt_name = $(this).find("td:eq(5)").text();
			
	      opener.document.getElementById("io_id").value = io_id;
	      opener.document.getElementById("io_num").value = io_num;
	      opener.document.getElementById("ma_name").value = ma_name;
	      opener.document.getElementById("io_cnt").value = io_cnt;
	      opener.document.getElementById("clt_id").value = clt_id;
	      opener.document.getElementById("clt_name").value = clt_name;
	      
	      window.close();
	      
		});
	});
</script>

</head>
<body>
	
	<h1>발주 목록</h1>
	
	<table border="1">
	
		<tr>
			<th>발주 id</th>
			<th>발주 코드</th>
			<th>자재명</th>
			<th>발주량</th>
			<th>거래처 id</th>
			<th>거래처명</th>
		</tr>
		
		<c:forEach items="${popUpIo }" var="vo">
			<c:if test="${vo.io_state.equals('미완료') }">
				<tr>
					<td>${vo.io_id }</td>
					<td>${vo.io_num }</td>
					<td>${vo.ma_name }</td>
					<td>${vo.io_cnt }</td>
					<td>${vo.clt_id }</td>
					<td>${vo.clt_name }</td>
				</tr>
			</c:if>
		</c:forEach>
	
	</table>
	
</body>
</html>