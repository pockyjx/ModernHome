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
<script src="//code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<script>
		var prtContent; // 프린트 하고 싶은 영역
		var initBody;  // body 내용 원본
		
		// 프린트하고 싶은 영역의 id 값을 통해 출력 시작
		$(document).ready(function() {
		    startPrint('print_content');
		});
		
		function startPrint(print_content) {
		    prtContent = document.getElementById(print_content);
		    window.onbeforeprint = beforePrint;
		    window.onafterprint = afterPrint;
		    window.print();
		}
		
		// 웹페이지 body 내용을 프린트하고 싶은 내용으로 교체
		function beforePrint() {
		    initBody = document.body.innerHTML;
		    document.body.innerHTML = prtContent.innerHTML;
		}
		
		// 프린트 후, 웹페이지 body 복구
		function afterPrint() {
		    document.body.innerHTML = initBody;
		}
</script>

<title>ModernHome</title>
<div id="print_content">
	<h3 class="m-4" style="text-align: center;">${BOMList[0].pro_name} 소요량</h3>

		<div class="bg-light text-center rounded p-4" style="margin-left:3rem; margin-right:3rem;">
		
		<table border="1" class="table align-middle table-bordered table-hover mb-0">
			<tr>
				<th style="background-color: rgba(0,0,0,0.075); text-align: center;">완제품 코드</th>
				<td style="text-align: center;">${BOMList[0].pro_num}</td>
				<th style="background-color: rgba(0,0,0,0.075); text-align: center;">완제품명</th>
				<td style="text-align: center;">${BOMList[0].pro_name}</td>
			</tr> 
		</table>
	
		<br>
	
		<table border="1" class="table align-middle table-bordered table-hover mb-0">
	
		<tr>
			<th style="background-color: rgba(0,0,0,0.075); text-align: center;">자재 코드</th>
			<th style="background-color: rgba(0,0,0,0.075); text-align: center;">자재명</th>
			<th style="background-color: rgba(0,0,0,0.075); text-align: center;">소요량</th>
			<th style="background-color: rgba(0,0,0,0.075); text-align: center;">단위</th>
		</tr>
	
		<c:forEach items="${BOMList }" var="vo">
		<tr>
			<td style="text-align: center;">${vo.ma_num }</td>
			<td style="text-align: center;">${vo.ma_name }</td>
			<td style="text-align: center;">${vo.req_cnt }</td>
			<td style="text-align: center;">${vo.req_unit}</td>
		</tr>
		</c:forEach>	
	</table>

	</div>
</div>

	<br>
	
	<div style="display: flex; justify-content: center;">
		<input type="button" value="인쇄하기" onclick="startPrint('print_content')" class="btn btn-primary m-3"/>
	</div>