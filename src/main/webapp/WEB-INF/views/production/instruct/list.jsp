<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/javascript">
	// https://recoderr.tistory.com/54 <- 참고해서 행 추가 만들기
	
	// 행 클릭
	function rowClick() {
		var table = document.getElementById("wiTbl");
		var rowList = table.rows;
		
		for(var i = 1; i < rowList.length; i++) {
			var row = rowList[i];
			var tdsNum = row.childElementCount;
			console.log(tdsNum);
			
			row.onclick = function() {
				return function() {
					var str = "";
					
					for(var j = 0; j < tdsNum; j++) {
						var rowValue = this.cells[j].innerHTML;
						str += rowValue + " ";
					}
					
					document.querySelector('p').innerText = str;
				}
			}(row);
		}
	}
</script>

</head>
<body>
	
	<h1>/production/instruct/list.jsp</h1>
	<h2>작업지시 목록</h2>
	
	<div>
		<button type="button">추가</button>
		<button type="button">수정</button>
		<button type="button">삭제</button>
		<button type="button">취소</button>
		<button type="button">저장</button>
	</div>
	
	<table border="1" id="wiTbl">
		<thead>
			<tr>
				<th>✅</th>
				<th>작업지시코드</th>
				<th>라인명</th>
				<th>품목코드</th>
				<th>품목명</th>
				<th>작업상태</th>
				<th>생산수량</th>
				<th>지시일자</th>
				<th>지시수량</th>
				<th>수주번호</th>
				<th>납품예정일</th>
				<th>담당자</th>
			</tr>
		</thead>
		
		<tbody>
			<c:forEach var="list" items="${instrList}">
				<tr>
					<td><input type="checkbox"></td>
					<td>${list.work_num}</td>
					<td>${list.line_id} <br>라인기본키로 라인명</td>
					<td>${list.pro_id} <br>완제품기본키로 완제품코드</td>
					<td>${list.pro_id} <br>완제품기본키로 완제품명</td>
					<td>${list.work_state}</td>
					<td>0</td>
					<td>${list.reg_date}</td>
					<td>${list.work_cnt}</td>
					<td>${list.out_or_id} <br>수주기본키로 수주번호</td>
					<td>${list.out_or_id} <br>수주기본키로 납품일자</td>
					<td>${list.emp_id} <br>사원번호로 담당자</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<p></p>
	
</body>
</html>