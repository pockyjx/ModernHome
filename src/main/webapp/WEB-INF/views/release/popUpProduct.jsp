<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
	$(document).ready(function() {
		const urlParams = new URL(location.href).searchParams;
		const txt = urlParams.get('txt');
		if(txt == "pro") {
		}else if(txt == "ps"){
			var ps_cnt = $('#ps_table').find("td:eq(1)").text();
			var wh_name = $('#ps_table').find("td:eq(2)").text();
			var wh_id = $('#ps_table').find("td:eq(3)").text();
			opener.document.getElementById("ps_cnt").value = Number(ps_cnt);
			opener.document.getElementById("ps_cnt").disabled = 'true';			
			opener.document.getElementById("wh_name").value = wh_name;
			opener.document.getElementById("wh_id").value = Number(wh_id);
			
			window.close();
		}else {
			window.close();
		}
		$("tr").click(function() {
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

			window.close();
		});
	});
</script>

</head>
<body>
<div id=oo>
		<c:if test="${param.txt == 'pro' }">

	<h1>수주 목록</h1>
	
	<table border="1">
	
		<tr>
			<th>수주코드</th>
			<th>납품처명</th>
			<th>완제품명</th>
			<th>주문수량</th>
			<th>납품일자</th>
		</tr>
<%-- 		${popUpPro } --%>
		<c:forEach items="${popUpPro }" var="vo">
		<tr>
			<td>${vo.outOrderVO.oo_num }</td>
			<td>${vo.clientVO.clt_name }</td>
			<td>${vo.productVO.pro_name }</td>
			<td>${vo.pr_cnt }</td>
			<td>${vo.outOrderVO.oo_end_date }</td>
			<td style="display: none;">${vo.pro_id }</td>
			<td style="display: none;">${vo.oo_id }</td>
		</tr>
		</c:forEach>
	
	</table>
		</c:if>
</div>
<div id=ps>
<c:if test="${param.txt == 'ps' }">
	<h1>재고 목록</h1>
	
	<table id="ps_table" border="1">
	
		<tr>
			<th>제품명</th>
			<th>현 재고</th>
			<th>창고명</th>
		</tr>
		<tr>
			<td>${vo.productVO.pro_name }</td>
			<td>${vo.productStockVO.ps_cnt }</td>
			<td>${vo.warehouseVO.wh_name }</td>
			<td style="display: none;">${vo.wh_id }</td>
		</tr>	
	</table>
</c:if>
</div>

</body>
</html>