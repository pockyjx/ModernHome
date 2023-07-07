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

<title>발주 팝업</title>

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
	      var ma_id = $(this).find("td:eq(6)").text();
			
	      opener.document.getElementById("io_id").value = io_id;
	      opener.document.getElementById("io_num").value = io_num;
	      opener.document.getElementById("ma_name").value = ma_name;
	      opener.document.getElementById("io_cnt").value = io_cnt;
	      opener.document.getElementById("rec_cnt").value = io_cnt;
	      opener.document.getElementById("clt_id").value = clt_id;
	      opener.document.getElementById("clt_name").value = clt_name;
	      opener.document.getElementById("ma_id").value = ma_id;
	      
	      window.close();
	      
		});
	});
</script>
	
	<h3 class="m-4" style="text-align: center;">발주 목록</h3>
	
	<div class="bg-light text-center rounded p-4" style="margin-left:3rem; margin-right:3rem; margin-top:2.5rem;">
		<table border="1" class="table-inorderList table align-middle table-bordered table-hover mb-0">
			<tr>
				<th style="background-color: rgba(0,0,0,0.075); text-align: center; display: none;">발주 id</th>
				<th style="background-color: rgba(0,0,0,0.075); text-align: center;">발주 코드</th>
				<th style="background-color: rgba(0,0,0,0.075); text-align: center;">자재명</th>
				<th style="background-color: rgba(0,0,0,0.075); text-align: center;">발주량</th>
				<th style="background-color: rgba(0,0,0,0.075); text-align: center;">거래처 id</th>
				<th style="background-color: rgba(0,0,0,0.075); text-align: center;">거래처명</th>
				<th style="background-color: rgba(0,0,0,0.075); text-align: center; display: none;">자재 id</th>
			</tr>
			
			<c:forEach items="${popUpIo }" var="vo">
				<c:if test="${vo.io_state.equals('완료') }">
					<tr>
						<td style="text-align: center; display: none;">${vo.io_id }</td>
						<td style="text-align: center;">${vo.io_num }</td>
						<td style="text-align: center;">${vo.ma_name }</td>
						<td style="text-align: center;">${vo.io_cnt }</td>
						<td style="text-align: center;">${vo.clt_id }</td>
						<td style="text-align: center;">${vo.clt_name }</td>
						<td style="text-align: center; display: none;">${vo.ma_id }</td>
					</tr>
				</c:if>
			</c:forEach>
		</table>
	</div>
	
	<br>
	
	<!-- 페이지 이동 버튼 -->
			<nav aria-label="Page navigation example">
		  		<ul class="pagination justify-content-center pagination-sm" style="margin-top:0rem;">
		  		
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