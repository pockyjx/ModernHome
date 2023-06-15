<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
	$(document).ready(function() {
		// 버튼 클릭 시 행 추가
		$("#addRowButton").click(function() {
			var newRow = '<tr>' +
						 '<td><input type="checkbox"></td>' +
						 '<td><input type="text" name="work_num"></td>' +
						 '<td><input type="text" name="line_id"></td>' +
						 '<td><input type="text" name="pro_id"></td>' +
						 '<td><input type="text" name="pro_id"></td>' +
						 '<td>' +
						 '<select name="work_state">' +
						 '<option value="대기">대기</option>' +
						 '<option value="진행중">진행중</option>' +
						 '<option value="완료">완료</option>' +
						 '</select>' +
						 '</td>' +
						 '<td><input type="text" name="out_or_id"></td>' +
						 '<td><input type="text" name="reg_date"></td>' +
						 '<td><input type="text" name="work_cnt"></td>' +
						 '<td><input type="text" name="out_or_id"></td>' +
						 '<td><input type="text" name="out_or_id"></td>' +
						 '<td><input type="text" name="emp_id"></td>' +
						 '</tr>';
			$(".table-instrList").append(newRow);
		});
			
		// <th> 쪽 체크박스 클릭 시 해당 열의 <td> 부분의 행들을 선택하고 배경색 지정
		$(".table-instrList th input[type='checkbox']").click(function() {
			var checkbox = $(this);
			var isChecked = checkbox.prop('checked');
			var columnIndex = checkbox.parent().index() + 1; // 체크박스의 열 인덱스
			var table = checkbox.closest('table');
			var rows = table.find('tr');
			
			// <td> 부분의 행들을 선택하고 배경색 지정
			rows.each(function() {
			var checkboxTd = $(this).find('td:nth-child(' + columnIndex + ') input[type="checkbox"]');
				if (checkboxTd.length > 0) {
					checkboxTd.prop('checked', isChecked);
					if (isChecked) {
						$(this).addClass('selected');
					} else {
						$(this).removeClass('selected');
					}
				}
			});
		});
		
		// <td> 쪽 체크박스 클릭 시 행 선택
		$(".table-instrList td input[type='checkbox']").click(function() {
			var checkbox = $(this);
			var isChecked = checkbox.prop('checked');
			checkbox.closest('tr').toggleClass('selected', isChecked);
		});
		
		// 체크박스 클릭 시 선택된 행 삭제
		$(".table-instrList").on("click", "td input[type='checkbox']", function() {
			var checkbox = $(this);
			if(checkbox.prop("checked")) {
				checkbox.closest("tr").addClass("selected");
			}else {
				checkbox.closest("tr").removeClass("selected");
			}
		});
		
		// 선택된 행 삭제 버튼 클릭 시 행 삭제
		$("#deleteRowsButton").click(function() {
			var selectedRows = $(".table-instrList tr.selected");
			selectedRows.remove();
		});
	
	});
</script>
<style>
	.selected {
	    background-color: #b3ccff;
	}
</style>

</head>
<body>
	
	<h1>/production/instruct/list.jsp</h1>
	
	<h2>작업지시 조회</h2>
	<form method="get">
		작업상태
			<label><input type="checkbox" name="대기" checked> 대기</label>
			<label><input type="checkbox" name="진행중" checked> 진행중</label>
			<label><input type="checkbox" name="완료" checked> 완료</label>
		품목코드
			<input type="text" name="pro_num">
		지시일자
			
	</form>
	
	
	<h2>작업지시 목록</h2>
	<div>
		<button id="addRowButton">추가</button>
		<button>수정</button>
		<button id="deleteRowsButton">삭제</button>
		<button>취소</button>
		<button>저장</button>
	</div>
	
	<table border="1" class="table-instrList">
		<tr>
			<th><input type="checkbox"></th>
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
		
		<c:forEach var="list" items="${instrList}">
			<tr>
				<td><input type="checkbox"></td>
				<td>${list.work_num}</td>
				<td>${list.line_id} <br>라인기본키로 라인명</td>
				<td>${list.pro_id} <br>완제품기본키로 완제품코드</td>
				<td>${list.pro_id} <br>완제품기본키로 완제품명</td>
				<td>
					<select>
				       <option value="대기" <c:if test="${lise.work_state=='대기'}"> selected</c:if>>대기</option>
				       <option value="진행중" <c:if test="${lise.work_state=='진행중'}"> selected</c:if>>진행중</option>
				       <option value="완료" <c:if test="${lise.work_state=='완료'}"> selected</c:if>>완료</option>
				    </select>
				</td>
				<td>0 <br>수주기본키로 생산수량</td>
				<td>${list.reg_date}</td>
				<td>${list.work_cnt}</td>
				<td>${list.out_or_id} <br>수주기본키로 수주번호</td>
				<td>${list.out_or_id} <br>수주기본키로 납품일자</td>
				<td>${list.emp_id} <br>사원번호로 담당자</td>
			</tr>
		</c:forEach>
	</table>
	<p></p>
	
</body>
</html>