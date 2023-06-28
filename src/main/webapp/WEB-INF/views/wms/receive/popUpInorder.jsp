<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
			<c:if test="${vo.io_state.equals('완료') }">
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
	
	<!-- 페이지 이동 버튼 -->
			<nav aria-label="Page navigation example">
		  		<ul class="pagination justify-content-center pagination-sm">
		  		
		  			<c:if test="${pm.prev }">
					<li class="page-item">
						<a class="page-link" href="/wms/receive/addPopup?page=${pm.startPage-1 }&istartDate=${istartDate}&iendDate=${iendDate}&rstartDate=${rstartDate}&rendDate=${rendDate}&ma_name=${ma_name}&io_state=${io_state}&txt=io" aria-label="Previous">
		       			<span aria-hidden="true">&laquo;</span>
		      			</a>
		    		</li>
		    		</c:if>
		    		
		    		<c:forEach begin="${pm.startPage }" end="${pm.endPage }" step="1" var="idx">
		    		<li 
		    			<c:out value="${pm.pageVO.page == idx ? 'class=page-item active': 'class=page-item'}" />
		    		>
		    				<a class="page-link" href="/wms/receive/addPopup?page=${idx}&istartDate=${istartDate}&iendDate=${iendDate}&rstartDate=${rstartDate}&rendDate=${rendDate}&ma_name=${ma_name}&io_state=${io_state}&txt=io">${idx }</a>
		    		</li>
		    		</c:forEach>
					
					<c:if test="${pm.next && pm.endPage > 0}">
					<li class="page-item">
		      			<a class="page-link" href="/wms/receive/addPopup?page=${pm.endPage+1 }&istartDate=${istartDate}&iendDate=${iendDate}&rstartDate=${rstartDate}&rendDate=${rendDate}&ma_name=${ma_name}&io_state=${io_state}&txt=io" aria-label="Next">
		        		<span aria-hidden="true">&raquo;</span>
		      			</a>
		    		</li>
		    		</c:if>
		    		
		  		</ul>
			</nav>
			<!-- 페이지 이동 버튼 -->
	
</body>
</html>