<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


</head>
<body>
	<h1>팀원관리</h1>
	
	<!-- 세션테스트 -->
	${emp_id}
	${emp_rank}
	<!-- 세션테스트 -->
	
	
	<!-- 검색칸 -->
	<form action="" method="GET">
	사원번호 <input type="text" name="emp_id">
	이름 <input type="text" name="emp_name">
	직급
		<select name="emp_rank">
			<option>전체</option>
			<option>팀장</option>
			<option>대리</option>
			<option>사원</option>
		</select>
	상태
		<select name="emp_state">
			<option>전체</option>
			<option>재직</option>
			<option>휴직</option>
			<option>퇴직</option>
		</select>
		
		<input type="submit" value="조회">
	</form>
	<!-- 검색칸 -->
	
	
	<form action="auth" method="post">
	
	<table class="" border="1">
		<tr>
			<th>사진</th>
			<th>사원번호</th>
			<th>이름</th>
			<th>성별</th>
			<th>생년월일</th>
			<th>부서</th>
			<th>직급</th>
			<th>권한</th>
			<th>상태</th>
			<th>전화번호</th>
			<th>입사날짜</th>
			<th>퇴사날짜</th>
			<th>휴직날짜</th>
		</tr>
		<c:forEach var="empMng" items="${employeeManagement }">
		<tr>
			<td>사진</td>
			<td>${empMng.emp_id }</td>
			<td>${empMng.emp_name }</td>
			<td>${empMng.emp_gender }</td>
			<td>${fn:substring(empMng.emp_birth, 0, 10)}</td>
			<td>${empMng.emp_dept }</td>
			<td>${empMng.emp_rank }</td>
			
			<td>
			<c:choose>
				<c:when test="${empMng.emp_auth == 3}">
					<input type="checkbox" disabled="disabled" checked="checked">
				</c:when>
				<c:when test="${empMng.emp_auth == 2}">
					<input type="checkbox" checked="checked">
				</c:when>
				<c:when test="${empMng.emp_auth == 1}">
					<input type="checkbox">
				</c:when>
			</c:choose>
			</td>
			
			<td>${empMng.emp_state }</td>
			<td>${empMng.emp_tel }</td>
			
			<td>${fn:substring(empMng.emp_hire_date, 0, 10) }</td>
			<td>${fn:substring(empMng.emp_rsgnt_date, 0, 10) }</td>
			<td>${fn:substring(empMng.emp_start_leave_date, 0, 10) }</td>
			
		</tr>
		</c:forEach>
	
	</table>
	
	</form>
	
	
	
	
	
</body>
</html>