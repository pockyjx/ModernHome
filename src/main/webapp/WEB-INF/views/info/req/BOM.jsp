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



	<table border="1">
		
		<tr>
			<th>완제품 코드</th>
			<td>${BOMList[0].pro_num}</td>
			<th>완제품명</th>
			<td>${BOMList[0].pro_name}</td>
		</tr> 
	</table>
	
	<br>
	
	<table border="1">
	
		<tr>
			<th>자재 코드</th>
			<th>자재명</th>
			<th>소요량</th>
			<th>단위</th>
		</tr>
	
		<c:forEach items="${BOMList }" var="vo">
		<tr>
			<td>${vo.ma_num }</td>
			<td>${vo.ma_name }</td>
			<td>${vo.req_cnt }</td>
			<td>${vo.req_unit}</td>
		
		</tr>
		</c:forEach>	
	
	</table>
	
	<br>
	
	<input type="button" value="인쇄하기" id="print" onclick="window.print()"/>

</body>
</html>