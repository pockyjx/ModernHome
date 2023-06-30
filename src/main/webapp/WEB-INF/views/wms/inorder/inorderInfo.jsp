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
    
    <title>발주서</title>
    
		<h2>발주서</h2>
		
		<table border="1">
			<tr>
				<th>발주코드</th>
				<td>${inorderList[0].io_num}</td>
				<th>거래처 코드</th>
				<td>${inorderList[0].clt_num}</td>
				<th>거래처명</th>
				<td>${inorderList[0].clt_name}</td>
			</tr>
		</table>
			
		<br>
	
		<table border="1">	
			<tr>
				<th>자재코드</th>
				<th>자재명</th>
				<th>발주량</th>
				<th>단위</th>
				<th>총금액</th>
				<th>발주일자</th>
				<th>입고예정일</th>
				<th>담당자</th>
			</tr>
			<c:forEach var="vo" items="${inorderList}">
				<tr>
					<td>${vo.ma_num}</td>
					<td>${vo.ma_name}</td>
					<td>${vo.io_cnt}</td>
					<td>${vo.io_unit}</td>
					<td>${vo.ma_price*vo.io_cnt}</td>
					<td>${fn:substring(vo.io_date, 0, 10)}</td>
					<td>${fn:substring(vo.rec_date, 0, 10)}</td>
					<td>${vo.emp_name}</td>
				</tr>
			</c:forEach>
		</table>
		
		<br>
		
		<input type="button" value="인쇄하기" id="print" onclick="window.print()"/>