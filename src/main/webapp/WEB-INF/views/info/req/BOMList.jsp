<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script src="https://code.jquery.com/jquery-3.6.0.min.js">




</script>





</head>
<body>

	

	<table border="1" id="BOMList">
	
	<c:forEach var="vo" items="${BOMList}" >
	
		<tr>	
			<td><input type="checkbox" name="selectedReqId" value="${vo.req_id}"></td>
			<td rowspan="">
				<c:if test="${previousProId eq vo.pro_id }">
					${vo.pro_id }
					
				</c:if>
			</td>
			<td>${vo.pro_num }</td>
			<td>${vo.pro_name }</td>
			<td>${vo.ma_num }</td>
			<td>${vo.ma_name }</td>
			<td>${vo.req_cnt }</td>
			<td>${vo.req_unit }</td>
			<td>
				<c:if test="${!empty vo.req_update_date}">${fn:substring(vo.req_update_date, 0, 10) }</c:if>
				<c:if test="${empty vo.req_update_date}">${fn:substring(vo.req_reg_date, 0, 10) }</c:if>
			</td>
			<td>${vo.emp_name }</td>
		</tr>	
		
		<c:set var="previousProId" value="${vo.pro_id}" />
		
		</c:forEach>
	
	</table>

</body>
</html>