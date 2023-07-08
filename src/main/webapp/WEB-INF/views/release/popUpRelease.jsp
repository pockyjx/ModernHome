<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<link rel="icon" href="/resources/img/faviconn.svg" type="image/x-icon">
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">
<link href="/resources/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
<link href="/resources/lib/tempusdominus/css/tempusdominus-bootstrap-4.min.css" rel="stylesheet" />
<link href="/resources/css/bootstrap.min.css" rel="stylesheet">
<link href="/resources/css/style.css" rel="stylesheet">
<link rel="stylesheet" as="style" crossorigin 
    href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.8/dist/web/static/pretendard.css" />
    
    <style type="text/css">
        * {
            font-family: Pretendard, -apple-system, BlinkMacSystemFont, system-ui, Roboto, "Helvetica Neue", "Segoe UI", "Apple SD Gothic Neo", "Noto Sans KR", "Malgun Gothic", "Apple Color Emoji", "Segoe UI Emoji", "Segoe UI Symbol", sans-serif;
        }
    </style>
    
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
	$(document).ready(function() {
		const urlParams = new URL(location.href).searchParams;
		const txt = urlParams.get('txt');
		if(txt == "ps"){
			var ps_cnt = $('#ps_table').find("td:eq(1)").text();
			var wh_name = $('#ps_table').find("td:eq(2)").text();
			var wh_id = $('#ps_table').find("td:eq(3)").text();
			opener.document.getElementById("ps_cnt").value = Number(ps_cnt);
			opener.document.getElementById("ps_cnt").disabled = 'true';			
			opener.document.getElementById("wh_name").value = wh_name;
			opener.document.getElementById("wh_id").value = Number(wh_id);
			
			window.close();
		}else if(txt == "pro") {
		}else if(txt == "ma") {
		}else if(txt == "ms") {
			var ms_cnt = $('#ms_table').find("td:eq(1)").text();
			var wh_name = $('#ms_table').find("td:eq(2)").text();
			var wh_id = $('#ms_table').find("td:eq(3)").text();
			opener.document.getElementById("ms_cnt").value = Number(ms_cnt);
// 			opener.document.getElementById("ms_cnt").disabled = 'true';			
			opener.document.getElementById("wh_name").value = wh_name;
			opener.document.getElementById("wh_id").value = Number(wh_id);
			
			window.close();
		}
		else {
			window.close();
		}
		$("tr").click(function() {
			if(txt == "pro") {
				var oo_num = $(this).find("td:eq(0)").text();
				var clt_name = $(this).find("td:eq(1)").text();
				var pro_name = $(this).find("td:eq(2)").text();
				var oo_cnt = $(this).find("td:eq(3)").text();
				var oo_end_date = $(this).find("td:eq(4)").text();
				var pro_id = $(this).find("td:eq(5)").text();
				var oo_id = $(this).find("td:eq(6)").text();
				opener.document.getElementById("oo_num").value = oo_num;
				opener.document.getElementById("oo_num").disabled = 'true';
				opener.document.getElementById("clt_name").value = clt_name;
				opener.document.getElementById("pro_name").value = pro_name;
				opener.document.getElementById("oo_cnt").value = oo_cnt;
				opener.document.getElementById("oo_end_date").value = oo_end_date;
				opener.document.getElementById("pro_id").value = pro_id;
				opener.document.getElementById("oo_id").value = oo_id;
				opener.document.getElementById("ps_cnt").placeholder = "여기를 눌러 검색하세요";
	
				window.close();			
			}else if(txt == "ma") {
				var work_num = $(this).find("td:eq(0)").text();
				var ma_name = $(this).find("td:eq(1)").text();
				var mr_cnt = $(this).find("td:eq(2)").text();
				var reg_date = $(this).find("td:eq(3)").text();
				var ma_id = $(this).find("td:eq(4)").text();
				var work_id = $(this).find("td:eq(5)").text();
				opener.document.getElementById("work_num").value = work_num;
				opener.document.getElementById("ma_name").value = ma_name;
				opener.document.getElementById("mr_cnt").value = mr_cnt;
				opener.document.getElementById("reg_date").value = reg_date;
				opener.document.getElementById("ma_id").value = ma_id;
				opener.document.getElementById("work_id").value = work_id;
				opener.document.getElementById("ms_cnt").placeholder = "여기를 눌러 검색하세요";
	
				window.close();	
			}
		});
	});
</script>

<div id=oo>
	<c:if test="${param.txt == 'pro' }">
	
		<h3 class="m-4" style="text-align: center;">수주 목록</h3>
	
		<div class="bg-light text-center rounded p-4" style="margin-left:3rem; margin-right:3rem;">
			<table border="1" class="table-outOrderList table align-middle table-bordered table-hover mb-0">		
				<tr>
					<th style="background-color: rgba(0,0,0,0.075); text-align: center;">수주코드</th>
					<th style="background-color: rgba(0,0,0,0.075); text-align: center;">납품처명</th>
					<th style="background-color: rgba(0,0,0,0.075); text-align: center;">완제품명</th>
					<th style="background-color: rgba(0,0,0,0.075); text-align: center;">주문수량</th>
					<th style="background-color: rgba(0,0,0,0.075); text-align: center;">납품일자</th>
				</tr>
		<%-- 		${popUpPro } --%>
				<c:forEach items="${list }" var="vo">
				<tr>
					<td style="text-align: center;">${vo.outOrderVO.oo_num }</td>
					<td style="text-align: center;">${vo.clientVO.clt_name }</td>
					<td style="text-align: center;">${vo.productVO.pro_name }</td>
					<td style="text-align: center;">${vo.pr_cnt }</td>
					<td style="text-align: center;">${vo.outOrderVO.oo_end_date }</td>
					<td style="display: none;">${vo.pro_id }</td>
					<td style="display: none;">${vo.oo_id }</td>
				</tr>
				</c:forEach>
			</table>
		</div>
		
		<!-- 페이징 버튼 -->
	
	<nav aria-label="Page navigation example">
  		<ul class="pagination justify-content-center pagination-sm">
  		
  			<c:if test="${pm.prev }">
			<li class="page-item">
				<a class="page-link" href="/release/addPopup?page=${pm.startPage-1 }&txt=pro" aria-label="Previous">
       			<span aria-hidden="true">&laquo;</span>
      			</a>
    		</li>
    		</c:if>
    		
    		<c:forEach begin="${pm.startPage }" end="${pm.endPage }" step="1" var="idx">
    		<li class="<c:out value='${pm.pageVO.page == idx ? "page-item active" : "page-item"}' />">
    			<a class="page-link" href="/release/addPopup?page=${idx}&txt=pro">${idx }</a>
    		</li>
    		</c:forEach>
			
			<c:if test="${pm.next && pm.endPage > 0}">
			<li class="page-item">
      			<a class="page-link" href="/release/addPopup?page=${pm.endPage+1 }&txt=pro" aria-label="Next">
        		<span aria-hidden="true">&raquo;</span>
      			</a>
    		</li>
    		</c:if>
    		
  		</ul>
	</nav>
	
	<!-- 페이징 버튼 -->
		
		
	</c:if>
</div>

<div id=ps>
	<c:if test="${param.txt == 'ps' }">
	
		<h3 class="m-4" style="text-align: center;">재고 목록</h3>
		
		<div class="bg-light text-center rounded p-4" style="margin-left:3rem; margin-right:3rem;">
			<table border="1" class="table-psList table align-middle table-bordered table-hover mb-0" id="ps_table">		
				<tr>
					<th style="background-color: rgba(0,0,0,0.075); text-align: center;">제품명</th>
					<th style="background-color: rgba(0,0,0,0.075); text-align: center;">현 재고</th>
					<th style="background-color: rgba(0,0,0,0.075); text-align: center;">창고명</th>
				</tr>
				<tr>
					<td style="text-align: center;">${vo.productVO.pro_name }</td>
					<td style="text-align: center;">${vo.productStockVO.ps_cnt }</td>
					<td style="text-align: center;">${vo.warehouseVO.wh_name }</td>
					<td style="display: none;">${vo.wh_id }</td>
				</tr>	
			</table>
		</div>
	</c:if>
</div>

<div id=wn>
	<c:if test="${param.txt == 'ma' }">
	
		<h3 class="m-4" style="text-align: center;">작업지시 목록</h3>
	
		<div class="bg-light text-center rounded p-4" style="margin-left:3rem; margin-right:3rem;">
			<table border="1" class="table-List table align-middle table-bordered table-hover mb-0">	
				<tr>
					<th style="background-color: rgba(0,0,0,0.075); text-align: center;">작업지시코드</th>
					<th style="background-color: rgba(0,0,0,0.075); text-align: center;">자재명</th>
					<th style="background-color: rgba(0,0,0,0.075); text-align: center;">주문수량</th>
					<th style="background-color: rgba(0,0,0,0.075); text-align: center;">작업지시일자</th>
				</tr>
		<%-- 		${popUpPro } --%>
				<c:forEach items="${list }" var="vo">
				<tr>
					<td style="text-align: center;">${vo.workInstrVO.work_num }</td>
					<td style="text-align: center;">${vo.materialVO.ma_name }</td>
					<td style="text-align: center;">${vo.mr_cnt }</td>
					<td style="text-align: center;">${vo.workInstrVO.reg_date }</td>
					<td style="display: none;">${vo.ma_id }</td>
					<td style="display: none;">${vo.work_id }</td>
				</tr>
				</c:forEach>
			</table>
		</div>
		
		<!-- 페이징 버튼 -->
	
	<nav aria-label="Page navigation example">
  		<ul class="pagination justify-content-center pagination-sm">
  		
  			<c:if test="${pm.prev }">
			<li class="page-item">
				<a class="page-link" href="/release/addPopup?page=${pm.startPage-1 }&txt=ma" aria-label="Previous">
       			<span aria-hidden="true">&laquo;</span>
      			</a>
    		</li>
    		</c:if>
    		
    		<c:forEach begin="${pm.startPage }" end="${pm.endPage }" step="1" var="idx">
    		<li 
    			<c:out value="${pm.pageVO.page == idx ? 'class=page-item active': 'class=page-item'}" />
    		>
    			<a class="page-link" href="/release/addPopup?page=${idx}&txt=ma">${idx }</a>
    		</li>
    		</c:forEach>
			
			<c:if test="${pm.next && pm.endPage > 0}">
			<li class="page-item">
      			<a class="page-link" href="/release/addPopup?page=${pm.endPage+1 }&txt=ma" aria-label="Next">
        		<span aria-hidden="true">&raquo;</span>
      			</a>
    		</li>
    		</c:if>
    		
  		</ul>
	</nav>
	
	<!-- 페이징 버튼 -->
		
	</c:if>
</div>

<div id=ms>
	<c:if test="${param.txt == 'ms' }">
		<h1>재고 목록</h1>
		
		<table id="ms_table" border="1">	
			<tr>
				<th>제품명</th>
				<th>현 재고</th>
				<th>창고명</th>
			</tr>
			<tr>
				<td>${vo.materialVO.ma_name }</td>
				<td>${vo.materialStockVO.ms_cnt }</td>
				<td>${vo.warehouseVO.wh_name }</td>
				<td style="display: none;">${vo.wh_id }</td>
			</tr>	
		</table>
	</c:if>
</div>

</body>
</html>