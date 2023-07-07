<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<link rel="stylesheet" as="style" crossorigin 
    href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.8/dist/web/static/pretendard.css" />
    
    <style type="text/css">
        * {
            font-family: Pretendard, -apple-system, BlinkMacSystemFont, system-ui, Roboto, "Helvetica Neue", "Segoe UI", "Apple SD Gothic Neo", "Noto Sans KR", "Malgun Gothic", "Apple Color Emoji", "Segoe UI Emoji", "Segoe UI Symbol", sans-serif;
        }
    </style>
<link rel="icon" href="/resources/img/faviconn.svg" type="image/x-icon">
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">
<link href="/resources/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
<link href="/resources/lib/tempusdominus/css/tempusdominus-bootstrap-4.min.css" rel="stylesheet" />
<link href="/resources/css/bootstrap.min.css" rel="stylesheet">
<link href="/resources/css/style.css" rel="stylesheet">

<title>완제품 팝업</title>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
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

	<h3 class="m-4" style="text-align: center;">완제품 목록</h3>
	
	<form action="" method="GET">
		<div class="row row" style="margin-left:3rem; margin-top: 3rem;">
				<input type="hidden" name="txt" value="pro">
				<input type="hidden" name="pro_num" value="">
		
			<div class="col-sm-5">
				<input type="text" placeholder="완제품명을 입력하세요." name="pro_name" value="${productVO.pro_name}" class="form-control">
			</div>
			
			<div class="col-auto">
				<button class="btn btn-primary m-3" type="submit" style="width:60px;">검색</button>
			</div>
			
		</div>
	</form>	
	
	<div class="bg-light text-center rounded p-4" style="margin-left:3rem; margin-right:3rem;">
		<table border="1" class="table-outOrderList table align-middle table-bordered table-hover mb-0">
			<tr>
				<th style="background-color: rgba(0,0,0,0.075); text-align: center;">완제품 id</th>
				<th style="background-color: rgba(0,0,0,0.075); text-align: center;">완제품 코드</th>
				<th style="background-color: rgba(0,0,0,0.075); text-align: center;">완제품명</th>
				<th style="background-color: rgba(0,0,0,0.075); text-align: center;">완제품 가격</th>
			</tr>
			
			<c:forEach items="${popUpPro }" var="vo">
			<tr>
				<td style="text-align: center;">${vo.pro_id }</td>
				<td style="text-align: center;">${vo.pro_num }</td>
				<td style="text-align: center;">${vo.pro_name }</td>
				<td style="text-align: center;">${vo.pro_price }</td>
			</tr>
			</c:forEach>
		</table>
	</div>
	<br>
	
	<!-- 페이징 버튼 -->
	<nav aria-label="Page navigation example">
		<ul class="pagination justify-content-center pagination-sm" style="margin-top:0rem;">
		
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