<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
		
		

</head>
<body>
		<h2>품질현황 조회</h2>
		<form action="get"> 
			품질코드 <input type="text" name="qc_num">
			품질검사여부
				<select name="qc_yn">
					<option>전체</option>
					<option>대기</option>
					<option>진행중</option>
					<option>완료</option>
				</select>
			<div>
				<label>지시일자</label>
				<input type="date" name="startDate">
					~
				<input type="date" name="endDate">
			</div>
			<input type="submit" value="조회">
		</form>
		
		<h2>품질현황 목록</h2>
		
		<form>
		
			<input type="button" id="updateButton" value="수정">
			<input type="submit" id="submitButton" value="저장" formaction="regLine" formmethod="post" disabled="disabled">
			
			<table class="table-qualityList" border="1">
				<tr>
					<th>작업지시번호</th>
					<th>품질검사코드</th>
					<th>라인코드</th>
					<th>라인명</th>
					<th>품질코드</th>
					<th>품목명</th>
					<th>검수자</th>
					<th>검수일자</th>
					<th>검수량</th>
					<th>생산량</th>
					<th>검수상태</th>
				</tr>
				<c:forEach var="vo" items="${qualityList }">
					<tr>
						<td>${vo.work_num }</td>
						<td>${vo.qc_num }</td>
						<td>${vo.line_num }</td>
						<td>${vo.line_name }</td>
						<td>${vo.pro_num }</td>
						<td>${vo.pro_name }</td>
						<td>${vo.emp_id }</td>
						<td>${vo.qc_date }</td>
						<td>${vo.qc_cnt }</td>
						<td>${vo.prfrm_cnt }</td>
						<td>${vo.qc_yn }</td>
					</tr>
				</c:forEach>
			</table>
		</form>

</body>
</html>