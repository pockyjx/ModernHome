<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<link rel="stylesheet" as="style" crossorigin 
    href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.8/dist/web/static/pretendard.css" />
    
    <style type="text/css">
        * {
            font-family: Pretendard, -apple-system, BlinkMacSystemFont, system-ui, Roboto, "Helvetica Neue", "Segoe UI", "Apple SD Gothic Neo", "Noto Sans KR", "Malgun Gothic", "Apple Color Emoji", "Segoe UI Emoji", "Segoe UI Symbol", sans-serif;
        }
    </style>
<link rel="icon" href="/resources/img/favicon.svg" type="image/x-icon">
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">
<link href="/resources/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
<link href="/resources/lib/tempusdominus/css/tempusdominus-bootstrap-4.min.css" rel="stylesheet" />
<link href="/resources/css/bootstrap.min.css" rel="stylesheet">
<link href="/resources/css/style.css" rel="stylesheet">
    
    
<title>ModernHome</title>
   
	<h3 class="m-4" style="text-align: center;">발주서</h3>
		
		<div class="bg-light text-center rounded p-4" style="margin-left:3rem; margin-right:3rem;">
		
		<table border="1" class="table align-middle table-bordered table-hover mb-0">
			<tr>
				<th style="background-color: rgba(0,0,0,0.075); text-align: center;">발주코드</th>
				<td style="text-align: center;">${inorderList[0].io_num}</td>
				<th style="background-color: rgba(0,0,0,0.075); text-align: center;">거래처 코드</th>
				<td style="text-align: center;">${inorderList[0].clt_num}</td>
				<th style="background-color: rgba(0,0,0,0.075); text-align: center;">거래처명</th>
				<td style="text-align: center;">${inorderList[0].clt_name}</td>
			</tr>
		</table>
			
		<br>
	
		<table border="1" class="table align-middle table-bordered table-hover mb-0">	
			<tr>
				<th style="background-color: rgba(0,0,0,0.075); text-align: center;">자재코드</th>
				<th style="background-color: rgba(0,0,0,0.075); text-align: center;">자재명</th>
				<th style="background-color: rgba(0,0,0,0.075); text-align: center;">단가</th>
				<th style="background-color: rgba(0,0,0,0.075); text-align: center;">단위</th>
				<th style="background-color: rgba(0,0,0,0.075); text-align: center;">발주량</th>
				<th style="background-color: rgba(0,0,0,0.075); text-align: center;">총금액</th>
				<th style="background-color: rgba(0,0,0,0.075); text-align: center;">발주일자</th>
				<th style="background-color: rgba(0,0,0,0.075); text-align: center;">입고예정일</th>
				<th style="background-color: rgba(0,0,0,0.075); text-align: center;">담당자</th>
			</tr>
			
			<c:forEach var="vo" items="${inorderList}">
				<tr>
					<td style="text-align: center;">${vo.ma_num}</td>
					<td style="text-align: center;">${vo.ma_name}</td>
					<td style="text-align: center;">${vo.ma_price}</td>
					<td style="text-align: center;">${vo.io_unit}</td>
					<td style="text-align: center;">${vo.io_cnt}</td>
					<td style="text-align: center;">${vo.ma_price*vo.io_cnt}</td>
					<td style="text-align: center;">${fn:substring(vo.io_date, 0, 10)}</td>
					<td style="text-align: center;">${fn:substring(vo.rec_date, 0, 10)}</td>
					<td style="text-align: center;">${vo.emp_name}</td>
				</tr>
			</c:forEach>
		</table>
		
		<br>
		
		<input type="button" value="인쇄하기" id="print" onclick="window.print()" class="btn btn-primary m-3"/>
		</div>