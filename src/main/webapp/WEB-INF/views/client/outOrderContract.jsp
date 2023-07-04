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
    
    <h3 class="m-4" style="text-align: center;">수주서</h3>
		
		<div class="bg-light text-center rounded p-4" style="margin-left:3rem; margin-right:3rem;">
		
		<table border="1" class="table align-middle table-bordered table-hover mb-0">
			<tr>
				<th style="background-color: rgba(0,0,0,0.075); text-align: center;">수주코드</th>
				<td style="text-align: center;">${contractList.oo_num}</td>
				<th style="background-color: rgba(0,0,0,0.075); text-align: center;">거래처(발주처)</th>
				<td style="text-align: center;">${contractList.clt_name}</td>
			</tr>
		</table>
			
		<br>
	
		<table border="1" class="table align-middle table-bordered table-hover mb-0">	
			<tr>
				<th style="background-color: rgba(0,0,0,0.075); text-align: center;">완제품코드</th>
				<th style="background-color: rgba(0,0,0,0.075); text-align: center;">완제품명</th>
				<th style="background-color: rgba(0,0,0,0.075); text-align: center;">주문량</th>
				<th style="background-color: rgba(0,0,0,0.075); text-align: center;">수주금액</th>
				<th style="background-color: rgba(0,0,0,0.075); text-align: center;">수주일자</th>
				<th style="background-color: rgba(0,0,0,0.075); text-align: center;">출하일자</th>
				<th style="background-color: rgba(0,0,0,0.075); text-align: center;">담당자</th>
			</tr>
			
			<tr>
				<td style="text-align: center;">${contractList.pro_num}</td>
				<td style="text-align: center;">${contractList.pro_name}</td>
				<td style="text-align: center;">${contractList.oo_cnt}</td>
				<td style="text-align: center;">${contractList.clt_cost}</td>
				<td style="text-align: center;">${fn:substring(contractList.oo_start_date, 0, 10)}</td>
				<td style="text-align: center;">${fn:substring(contractList.oo_end_date, 0, 10)}</td>
				<td style="text-align: center;">${contractList.emp_name}</td>
			</tr>
		</table>
		
		<br>
		
		<input type="button" value="인쇄하기" id="print" onclick="window.print()" class="btn btn-primary m-3"/>
		</div>