<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>완제품 목록</title>
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
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<link rel="stylesheet" as="style" crossorigin 
    href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.8/dist/web/static/pretendard.css" />
    
    <style type="text/css">
        * {
            font-family: Pretendard, -apple-system, BlinkMacSystemFont, system-ui, Roboto, "Helvetica Neue", "Segoe UI", "Apple SD Gothic Neo", "Noto Sans KR", "Malgun Gothic", "Apple Color Emoji", "Segoe UI Emoji", "Segoe UI Symbol", sans-serif;
        }
    </style>
<script>
	$(document).ready(function() {
		
		$("tr").click(function() {
		var pro_id = $(this).find("td:eq(0)").text();
		var pro_num = $(this).find("td:eq(1)").text();
		var pro_name = $(this).find("td:eq(2)").text();
		var pro_price = $(this).find("td:eq(3)").text();
		
		opener.document.getElementById("pro_id").value = pro_id;
		opener.document.getElementById("pro_num").value = pro_num;
		opener.document.getElementById("pro_name").value = pro_name;
		opener.document.getElementById("pro_price").value = pro_price;
		
		opener.updateCltCost(); // clt_cost 값 업데이트
		
		window.close();

		});
	});

</script>

</head>
<body>

	<h1>완제품 목록</h1>
	
	<form action="" method="GET">
		<input type="hidden" name="txt" value="pro">
		<input type="hidden" name="pro_num" value="">
		
		<input type="text" placeholder="완제품명을 입력하세요." name="pro_name" value="${productVO.pro_name}">
		<input type="submit" value="검색">
	</form>	
	
	<table border="1">
	
		<tr>
			<th>완제품 id</th>
			<th>완제품 코드</th>
			<th>완제품명</th>
			<th>완제품가격</th>
		</tr>
		
		<c:forEach items="${popUpPro }" var="vo">
		<tr>
			<td>${vo.pro_id }</td>
			<td>${vo.pro_num }</td>
			<td>${vo.pro_name }</td>
			<td>${vo.pro_price }</td>
		</tr>
		</c:forEach>
	
	</table>
	
	
	<!-- 페이징 버튼 -->
	<nav aria-label="Page navigation example">
		<ul class="pagination justify-content-center pagination-sm">
		
			<c:if test="${pm.prev }">
			<li class="page-item">
				<a class="page-link" href="/client/addPopup?page=${pm.startPage-1 }&txt=pro&pro_num=${productVO.pro_num}&pro_name=${productVO.pro_name}" aria-label="Previous">
					<span aria-hidden="true">&laquo;</span>
				</a>
			</li>
			</c:if>
			
			<c:forEach begin="${pm.startPage }" end="${pm.endPage }" step="1" var="idx">
			<li 
				<c:out value="${pm.pageVO.page == idx ? 'class=page-item active': 'class=page-item'}" />
			>
				<a class="page-link" href="/client/addPopup?page=${idx}&pro_num=${productVO.pro_num}&pro_name=${productVO.pro_name}&txt=pro">${idx }</a>
			</li>
			</c:forEach>
			
			<c:if test="${pm.next && pm.endPage > 0}">
			<li class="page-item">
				<a class="page-link" href="client/addPopup?page=${pm.endPage+1 }&txt=pro&pro_num=${productVO.pro_num}&pro_name=${productVO.pro_name}" aria-label="Next">
				<span aria-hidden="true">&raquo;</span>
				</a>
			</li>
			</c:if>
			
		</ul>
	</nav>
	<!-- 페이징 버튼 -->
	
	
	

</body>
</html>