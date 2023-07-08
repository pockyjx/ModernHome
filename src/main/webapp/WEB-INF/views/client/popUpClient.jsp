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

	<h3 class="m-4" style="text-align: center;">거래처 목록</h3>
	
	<form action="" method="GET">
		<div class="row row" style="margin-left:3rem; margin-top: 3rem;">
				<input type="hidden" name="txt" value="clt">
		
			<div class="col-sm-5">
				<input type="text" placeholder="거래처명을 입력하세요" name="clt_name" value="${clientVO.clt_name }" class="form-control" autofocus>
			</div>
			
			<div class="col-auto">
				<button class="btn btn-primary m-3" type="submit" style="width:60px;">검색</button>
			</div>
			
		</div>
	</form>
	
	<div class="bg-light text-center rounded p-4" style="margin-left:3rem; margin-right:3rem;">
		<table border="1" class="table-outOrderList table align-middle table-bordered table-hover mb-0">
			
			<tr>
				<th style="background-color: rgba(0,0,0,0.075); text-align: center;">거래처 id</th>
				<th style="background-color: rgba(0,0,0,0.075); text-align: center;">거래처 코드</th>
				<th style="background-color: rgba(0,0,0,0.075); text-align: center;">거래처명</th>
			</tr>
			
			<c:forEach items="${popUpClt }" var="vo">
				<c:if test="${vo.clt_sort.equals('수주') }">
					<tr>
						<td style="text-align: center;">${vo.clt_id }</td>
						<td style="text-align: center;">${vo.clt_num }</td>
						<td style="text-align: center;">${vo.clt_name }</td>
					</tr>
				</c:if>
			</c:forEach>
		</table>
	</div>
	<br>

	<!-- 페이징 버튼 -->
	<nav aria-label="Page navigation example">
		<ul class="pagination justify-content-center pagination-sm" style="margin-top:0rem;">
		
			<c:if test="${pm.prev }">
			<li class="page-item">
				<a class="page-link" href="/client/addPopup?page=${pm.startPage-1 }&txt=clt&clt_name=${clientVO.clt_name}" aria-label="Previous">
					<span aria-hidden="true">&laquo;</span>
				</a>
			</li>
			</c:if>
			
			<c:forEach begin="${pm.startPage }" end="${pm.endPage }" step="1" var="idx">
			<li 
				<c:out value="${pm.pageVO.page == idx ? 'class=page-item active': 'class=page-item'}" />
			>
				<a class="page-link" href="/client/addPopup?page=${idx}&txt=clt&clt_name=${clientVO.clt_name}">${idx }</a>
			</li>
			</c:forEach>
			
			<c:if test="${pm.next && pm.endPage > 0}">
			<li class="page-item">
				<a class="page-link" href="/client/addPopup?page=${pm.endPage+1 }&txt=clt&clt_name=${clientVO.clt_name}" aria-label="Next">
				<span aria-hidden="true">&raquo;</span>
				</a>
			</li>
			</c:if>
			
		</ul>
	</nav>
	<!-- 페이징 버튼 -->