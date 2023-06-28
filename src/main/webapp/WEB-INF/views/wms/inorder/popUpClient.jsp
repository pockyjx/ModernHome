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
<title>거래처 팝업</title>

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

	<h3>거래처 목록</h3>
	
	<form action="" method="GET">
		<input type="hidden" name="txt" value="clt">
		<input type="hidden" name="clt_num" value="">
		
		<input type="text" placeholder="거래처명을 입력하세요" name="clt_name" value="${cvo.clt_name }">
		<input type="submit" value="검색">
	</form>
	
	<table border="1">
	
		<tr>
			<th>거래처 id</th>
			<th>거래처 코드</th>
			<th>거래처명</th>
		</tr>
		
		<c:forEach items="${popUpClt }" var="vo">
			<c:if test="${vo.clt_sort.equals('발주') }">
				<tr>
					<td>${vo.clt_id }</td>
					<td>${vo.clt_num }</td>
					<td>${vo.clt_name }</td>
				</tr>
			</c:if>
		</c:forEach>
	
	</table>
	
	<br>
	
	<!-- 페이징 버튼 -->
	<nav aria-label="Page navigation example">
  		<ul class="pagination justify-content-center pagination-sm">
  		
  			<c:if test="${pm.prev }">
			<li class="page-item">
				<a class="page-link" href="/wms/inorder/addPopup?page=${pm.startPage-1 }&txt=clt&clt_num=${cvo.clt_num}&clt_name=${cvo.clt_name}" aria-label="Previous">
       			<span aria-hidden="true">&laquo;</span>
      			</a>
    		</li>
    		</c:if>
    		
    		<c:forEach begin="${pm.startPage }" end="${pm.endPage }" step="1" var="idx">
    		<li 
    			<c:out value="${pm.pageVO.page == idx ? 'class=page-item active': 'class=page-item'}" />
    		>
    			<a class="page-link" href="/wms/inorder/addPopup?page=${idx}&txt=clt&clt_num=${cvo.clt_num}&clt_name=${cvo.clt_name}">${idx }</a>
    		</li>
    		</c:forEach>
			
			<c:if test="${pm.next && pm.endPage > 0}">
			<li class="page-item">
      			<a class="page-link" href="/wms/inorder/addPopup?page=${pm.endPage+1 }&txt=clt&clt_num=${cvo.clt_num}&clt_name=${cvo.clt_name}" aria-label="Next">
        		<span aria-hidden="true">&raquo;</span>
      			</a>
    		</li>
    		</c:if>
    		
  		</ul>
	</nav>
	<!-- 페이징 버튼 -->

</body>
</html>