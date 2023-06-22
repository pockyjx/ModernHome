<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
	.selected {
	background-color: #b3ccff;
	}
</style>
<body>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>

	var pageStatus = "";

	$(document).ready(function(){

	// 추가 버튼 클릭 시 행 추가
	// 추가버튼 1번 누르면 추가버튼 비활성화
	$("#addRowButton").click(function() {
		var newRow = '<tr>' +
		'<td><input type="checkbox"></td>' +
		'<td><input type="text" disabled="disabled" value="자동으로 부여"></td>' +
		'<td>' +
			'<select name="clt_sort">' +
			'<option value="수주">수주</option>' +
			'<option value="발주">발주</option>' +
			'</select>' +
		'</td>' +
		'<td><input type="text" name="clt_name"></td>' +
		'<td><input type="text" name="clt_rep"></td>' +
		'<td><input type="text" name="clt_tel"></td>' +
		'<td><input type="text" name="clt_adr"></td>' +
		'<td><input type="text" name="clt_post"></td>' +
		'<td><input type="email" name="clt_email"></td>' +
		'</tr>';
		
		// 첫번째 자식<tr> 뒤에서 부터 행을 추가함
		$(".table-clientList tr:nth-child(1)").after(newRow);
		
		// 버튼 활성화, 비활성화
		$("#addRowButton").attr("disabled", "disabled");
		$("#updateButton").attr("disabled", "disabled");
		$("#deleteClientButton").attr("disabled", "disabled");
		
		$("#cancleButton").removeAttr("disabled");
		$("#submitButton").removeAttr("disabled");
		
		pageStatus = "reg";
		
	}); // 여기까지 추가 버튼
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	// <th> 쪽 체크박스 클릭 시 해당 열의 <td> 부분의 행들을 선택하고 배경색 지정
	$(".table-clientList th input[type='checkbox']").click(function() {
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
	$(".table-clientList td input[type='checkbox']").click(function() {
		var checkbox = $(this);
		var isChecked = checkbox.prop('checked');
		checkbox.closest('tr').toggleClass('selected', isChecked);
	});
	
	
	
	
	
	
	
}); // jQuery
	
</script>




	<h1>거래처조회</h1>
<!-- 	http://localhost:8088/client/clientList -->
	<form action="" method="GET">
	상호명 <input type="text" name="clt_name">
	대표자 <input type="text" name="clt_rep">
	
<span>업종유형
  <!-- 체크박스 요소 - 수주 -->
  <input type="checkbox" name="clt_sort" value="수주" ${param.clt_sort == '수주' ? 'checked' : ''}
    onclick="handleCheckbox(this, '수주')">수주

  <!-- 체크박스 요소 - 발주 -->
  <input type="checkbox" name="clt_sort" value="발주" ${param.clt_sort == '발주' ? 'checked' : ''}
    onclick="handleCheckbox(this, '발주')">발주
</span>

<script>
  /**
   * 체크박스 클릭 이벤트 핸들러 함수
   * @param {HTMLInputElement} checkbox - 클릭된 체크박스 요소
   * @param {string} value - 클릭된 체크박스의 값
   */
  function handleCheckbox(checkbox, value) {
    const checkboxes = document.getElementsByName('clt_sort');

    // 다른 체크박스 중에서 선택된 체크박스를 제외하고 체크 해제
    checkboxes.forEach(function(cb) {
      if (cb !== checkbox && cb.checked) {
        cb.checked = false;
      }
    });
  }
</script>

			
	<input type="submit" value="조회">
	</form>
		
		
		
	<form id="clientList">
	
	<input type="button" id="addRowButton" value="추가">
	<input type="button" id="cancleButton" value="취소" disabled="disabled">
	<input type="button" id="updateButton" value="수정">
	<input type="submit" id="deleteClientButton" value="삭제" formaction="deleteEmployee" formmethod="post">
	<input type="submit" id="submitButton" value="저장" formaction="regClient" formmethod="post" disabled="disabled">
	
	
	<table class="table-clientList" border="1">
		<tr>
			<th><input type="checkbox"></th>
			<th>거래처코드</th>
			<th>구분</th>
			<th>상호명</th>
			<th>대표자</th>
			<th>연락처</th>
			<th>주소지</th>
			<th>우편번호</th>
			<th>이메일</th>
		</tr>
		<c:forEach var="clientList" items="${clientList }">
		<tr>
			<td><input type="checkbox" name="selected" value="${clientList.clt_num}"></td>
			<td>${clientList.clt_num }</td>
			<td>${clientList.clt_sort }</td>
			<td>${clientList.clt_name }</td>
			<td>${clientList.clt_rep }</td>
			<td>${clientList.clt_tel }</td>
			<td>${clientList.clt_adr }</td>
			<td>${clientList.clt_post }</td>
			<td>${clientList.clt_email }</td>
		</tr>
		</c:forEach>
	</table>
	
	</form>

</body>
</html>