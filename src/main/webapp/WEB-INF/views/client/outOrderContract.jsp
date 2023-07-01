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
    
    <title>수주서</title>
    
		<h2>수주서</h2>
		
		<table border="1">
			<tr>
				<th>수주코드</th>
				<td>${contractList.oo_num}</td>
				<th>거래처(발주처)</th>
				<td>${contractList.clt_name}</td>
			</tr>
		</table>
			
		<br>
	
		<table border="1">	
			<tr>
				<th>완제품코드</th>
				<th>완제품명</th>
				<th>주문량</th>
				<th>수주금액</th>
				<th>수주일자</th>
				<th>출하일자</th>
				<th>담당자</th>
			</tr>
			<tr>
				<td>${contractList.pro_num}</td>
				<td>${contractList.pro_name}</td>
				<td>${contractList.oo_cnt}</td>
				<td>${contractList.clt_cost}</td>
				<td>${fn:substring(contractList.oo_start_date, 0, 10)}</td>
				<td>${fn:substring(contractList.oo_end_date, 0, 10)}</td>
				<td>${contractList.emp_name}</td>
			</tr>
		</table>
		
		<br>
		
		<input type="button" value="인쇄하기" id="print" onclick="window.print()"/>