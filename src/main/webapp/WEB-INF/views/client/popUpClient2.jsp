<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수주 거래처 목록</title>
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
        var pr_num = $(this).find("td:eq(0)").text();
        var oo_num = $(this).find("td:eq(1)").text();
        var clt_name = $(this).find("td:eq(2)").text();
        var pro_name = $(this).find("td:eq(3)").text();
        var oo_cnt = $(this).find("td:eq(4)").text();
        var oo_end_date = $(this).find("td:eq(5)").text();
        
        opener.document.getElementById("pr_num").value = pr_num;
        opener.document.getElementById("oo_num").value = oo_num;
        opener.document.getElementById("clt_name").value = clt_name;
        opener.document.getElementById("pro_name").value = pro_name;
        opener.document.getElementById("oo_cnt").value = oo_cnt;
        opener.document.getElementById("oo_end_date").value = oo_end_date;
        
        window.close();
    });
});
</script>

</head>
<body>

    <h1>발주 목록</h1>
    
    <table border="1">
    
        <tr>
            <th>출고 코드</th>
            <th>수주 코드</th>
            <th>거래처명</th>
            <th>완제품명</th>
            <th>출하량</th>
            <th>납기 예정일</th>
        </tr>
        
        <c:forEach items="${popUpOrderList }" var="vo">
            <tr>
                <td>${vo.pr_num }</td>
                <td>${vo.oo_num }</td>
                <td>${vo.clt_name }</td>
                <td>${vo.pro_name }</td>
                <td>${vo.oo_cnt }</td>
                <td>${vo.oo_end_date }</td>
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
				<a class="page-link" href="/client/addPopup?page=${pm.endPage+1 }&txt=pro&pro_num=${productVO.pro_num}&pro_name=${productVO.pro_name}" aria-label="Next">
				<span aria-hidden="true">&raquo;</span>
				</a>
			</li>
			</c:if>
			
		</ul>
	</nav>
	<!-- 페이징 버튼 -->

</body>
</html>