<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
		<h2>품질현황(자재) 조회</h2>
		<form action="" method="get">
			품질검사코드 <input type="text" name="qc_num">
			품질검사여부
				<select name="qc_yn">
					<option>전체</option>
					<option>대기</option>
					<option>진행중</option>
					<option>완료</option>
				</select>
			<div>
				<label>검수일자</label>
				<input type="date" name="startDate">
					~
				<input type="date" name="endDate">
			</div>
			<input type="submit" value="조회">
		</form>
		
		<h2>품질현황(자재) 목록</h2>
		
				<form id="materialQualityList">
			<span id="selectedCheckboxCount1">0</span>

			<input type="button" id="cancleButton1" value="취소" disabled="disabled">
			<input type="button" id="updateButton1" value="수정">
			<input type="submit" id="submitButton1" value="저장" formaction="updateMaterialQuality" formmethod="post" disabled="disabled">
			
			<table class="table-materialQualityList" border="1">
				<tr>
					<th><input type="checkbox"></th>
					<th>입고코드</th>
					<th>품질검사코드</th>
					<th>자재코드</th>
					<th>자재명</th>
					<th>검수자</th>
					<th>검수일자</th>
					<th>검수량</th>
					<th>입고량</th>
					<th>검수상태</th>
				</tr>
				<c:forEach var="mq" items="${materialQualityList }">
					<tr>
						<td><input type="checkbox" name="selectedEmpId" value="${mq.emp_id }"></td>
						<td>${mq.rec_num }</td>
						<td>${mq.qc_num }</td>
						<td>${mq.ma_num }</td>
						<td>${mq.ma_name }</td>
						<td>${mq.emp_name }</td>
						<td>${fn:substring(mq.qc_date,0,10) }</td>
						<td>${mq.qc_cnt }</td>
						<td>${mq.rec_cnt }</td>
						<td>${mq.qc_yn }</td>
					</tr>
				</c:forEach>
			</table>
		</form>
		
</body>
</html>