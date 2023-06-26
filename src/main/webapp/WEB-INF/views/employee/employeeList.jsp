<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ include file="../inc/header.jsp"%>
<%@ include file="../inc/sidebar.jsp"%>
<%@ include file="../inc/nav.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>

	var pageStatus = "";
	
	$(document).ready(function() {
			
		updateSelectedCheckboxCount();
		
			
		
		// 체크박스 
		// <th> 쪽 체크박스 클릭 시 해당 열의 <td> 부분의 행들을 선택하고 배경색 지정 (전체 선택)
		$(".table-employeeList th input[type='checkbox']").click(function() {
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
			
			updateSelectedCheckboxCount();
			
		}); // 배경색지정

		// <td> 쪽 체크박스 클릭 시 행 선택
		$(".table-employeeList td input[type='checkbox']").click(function() {
			var checkbox = $(this);
			var isChecked = checkbox.prop('checked');
			checkbox.closest('tr').toggleClass('selected', isChecked);
			
			updateSelectedCheckboxCount();
		});
		
		// ------------------- 체크박스
		
		
		
		// 추가 버튼 클릭 시 행 추가
		// 추가버튼 1번 누르면 추가버튼 비활성화
		$("#addRowButton").click(function() {
			
			
			// 모든 체크박스의 체크 해제
			$(".table-employeeList input[type='checkbox']").prop("checked", false);
			
			// selected 클래스를 없앰 (css 없애기)
			$(".table-employeeList tr").removeClass("selected");
			
			var newRow = '<tr>' +
				'<td><input type="checkbox"></td>' +
				'<td><input type="text" name="emp_id" disabled="disabled" value="자동으로 부여"></td>' +
				'<td><input type="text" name="emp_name" required></td>' +
				
				'<td>' +
					'<select name="emp_gender">' +
					'<option value="남">남</option>' +
					'<option value="여">여</option>' +
					'</select>' +
				'</td>' +
				
				'<td><input type="date" name="emp_birth" required></td>' +
				
				'<td>' +
				'<select name="emp_dept">' +
				'<option value="인사">인사</option>' +
				'<option value="영업">영업</option>' +
				'<option value="생산">생산</option>' +
				'<option value="자재">자재</option>' +
				'<option value="품질">품질</option>' +
				'</select>' +
				'</td>' +
				
				'<td>' +
				'<select name="emp_rank">' +
				'<option value="팀장">팀장</option>' +
				'<option value="대리">대리</option>' +
				'<option value="사원">사원</option>' +
				'</select>' +
				'</td>' +
				
				'<td>' +
				'<select name="emp_auth">' +
				'<option value="N">N</option>' +
				'<option value="Y">Y</option>' +
				'</select>' +
				'</td>' +
				
				'<td><input type="text" name="emp_state" value="재직" readonly="readonly"></td>' +
				'<td><input type="text" id="tel" name="emp_tel" required></td>' +
				'<td><input type="date" name="emp_hire_date"></td>' +
				'<td><input type="date" name="emp_rsgnt_date" disabled="disabled"></td>' +
				'<td><input type="date" name="emp_start_leave_date" disabled="disabled"></td>' +
				'</tr>';
			
			// 첫번째 자식<tr> 뒤에서 부터 행을 추가함
			$(".table-employeeList tr:nth-child(1)").after(newRow);
			
			// 버튼 활성화, 비활성화
			$("#addRowButton").attr("disabled", "disabled");
			$("#updateButton").attr("disabled", "disabled");
			$("#deleteButton").attr("disabled", "disabled");
			
			$("#cancleButton").removeAttr("disabled");
			$("#submitButton").removeAttr("disabled");
			
			pageStatus = "reg";
			
			updateSelectedCheckboxCount();
			
		}); // 여기까지 추가 버튼
		
		
		
		
		// 취소 버튼 누를 시 
		$("#cancleButton").click(function(){
			
			// 등록버튼 취소
			if(pageStatus == "reg"){
				// 두번째 tr (추가된 행)을 삭제함
				$(".table-employeeList tr:nth-child(2)").remove();
				
				// 모든 체크박스의 체크 해제
				$(".table-employeeList input[type='checkbox']").prop("checked", false);
				
				// selected 클래스를 없앰 (css 없애기)
				$(".table-employeeList tr").removeClass("selected");
				
				// 버튼 활성화, 비활성화
				$("#addRowButton").removeAttr("disabled");
				$("#updateButton").removeAttr("disabled");
				$("#deleteButton").removeAttr("disabled");
				
				$("#cancleButton").attr("disabled", "disabled");
				$("#submitButton").attr("disabled", "disabled");
				
				pageStatus = "";
			}
			
			// 수정버튼 취소
			if(pageStatus == "update"){
				
				// 모든행에 대해 반복작업, 테이블 이름에 맞게 수정
				$(".table-employeeList tr").each(function() {
				var row = $(this);
				
				// 폼 초기화(기존내용으로)
				// 가져가서 쓰는 경우 폼에 이름 지정해줘야해요
				$("#employeeList")[0].reset();
				
				// 각 셀의 값을 원래 상태로 되돌림
				row.find("td:not(:first-child)").each(function(index) {
					var cellValue = $(this).find("input").val();
					if ($(this).find("select").length) {
						// <select>가 있는 경우 선택된 옵션의 텍스트로 변경
						var selectedOptionText = $(this).find("select option:selected").text();
						$(this).html(selectedOptionText);
					}else {
						// <select>가 없는 경우 셀 값을 그대로 표시
						$(this).html(cellValue);
					}
				});
				
				// selected 클래스를 없앰 (css 없애기)
				$(".table-employeeList tr").removeClass("selected");
				
				// 추가버튼, 수정버튼 활성화, 취소버튼 비활성화
				$("#addRowButton").removeAttr("disabled");
				$("#updateButton").removeAttr("disabled");
				$("#deleteButton").removeAttr("disabled");
				
				$("#cancleButton").attr("disabled", "disabled");
				$("#submitButton").attr("disabled", "disabled");
				
				
				pageStatus = "";
				
				});
				
			} // if(update)문
		
			updateSelectedCheckboxCount();
			
		}); // 취소버튼
           
           
		// 수정 버튼 누를 시
		$("#updateButton").click(function(){
			
			var selectedCheckbox = $("input[name='selectedEmpId']:checked");
			
			// 체크된 체크박스가 하나인 경우에만 수정 기능 작동
			if (selectedCheckbox.length === 1) {
				var empId = selectedCheckbox.val();
				var row = selectedCheckbox.closest("tr");
				
				// input type의 name 값 지정
				var cellNames = [
					"emp_id",
					"emp_name",
					"emp_gender",
					"emp_birth",
					"emp_dept",
					"emp_rank",
					"emp_auth",
					"emp_state",
					"emp_tel",
					"emp_hire_date",
					"emp_rsgnt_date",
					"emp_start_leave_date"
				];
				
				
				// 각 셀을 수정 가능한 텍스트 입력 필드로 변경
				row.find("td:not(:first-child)").each(function(index) {
					//
					var cellValue = $(this).text();
					var cellType = [3, 9, 10, 11].includes(index) ? "date" : "text"; // 날짜 타입은 date로 설정
					var cellReadonly = [0, 2, 6].includes(index) ? "readonly='readonly'" : "";
					var cellName = cellNames[index];
					var cellContent;
					
					if (index === 4){
						cellContent = '<td>' +
						'<select name="' + cellName + '">' +
						'<option value="인사" ' + (cellValue === '인사' ? 'selected' : '') + '>인사</option>' +
						'<option value="영업" ' + (cellValue === '영업' ? 'selected' : '') + '>영업</option>' +
						'<option value="생산" ' + (cellValue === '생산' ? 'selected' : '') + '>생산</option>' +
						'<option value="자재" ' + (cellValue === '자재' ? 'selected' : '') + '>자재</option>' +
						'<option value="품질" ' + (cellValue === '품질' ? 'selected' : '') + '>품질</option>' +
						'</select>' +
						'</td>';
					}else if (index === 5){
						cellContent = '<td>' +
						'<select name="' + cellName + '">' +
						'<option value="팀장" ' + (cellValue === '팀장' ? 'selected' : '') + '>팀장</option>' +
						'<option value="대리" ' + (cellValue === '대리' ? 'selected' : '') + '>대리</option>' +
						'<option value="사원" ' + (cellValue === '사원' ? 'selected' : '') + '>사원</option>' +
						'</select>' +
						'</td>';
					}else if (index === 6){
						cellContent = '<td>' +
						'<select name="' + cellName + '">' +
						'<option value="N" ' + (cellValue === 'N' ? 'selected' : '') + '>N</option>' +
						'<option value="Y" ' + (cellValue === 'Y' ? 'selected' : '') + '>Y</option>' +
						'</select>' +
						'</td>';
					}else if (index === 7){
						cellContent = '<td>' +
						'<select name="' + cellName + '">' +
						'<option value="재직" ' + (cellValue === '재직' ? 'selected' : '') + '>재직</option>' +
						'<option value="휴직" ' + (cellValue === '휴직' ? 'selected' : '') + '>휴직</option>' +
						'<option value="퇴직" ' + (cellValue === '퇴직' ? 'selected' : '') + '>퇴직</option>' +
						'</select>' +
						'</td>';
					}else if (index === 8){
						cellContent = '<td><input type="' + cellType + '" id="tel" name="' + cellName + '" value="' + cellValue + '"' + cellReadonly + '></td>';
					}else {																							
						cellContent = '<td><input type="' + cellType + '" name="' + cellName + '" value="' + cellValue + '"' + cellReadonly + '></td>';
					}
					
					$(this).html(cellContent);
					
					// 버튼 활성화, 비활성화
					$("#updateButton").attr("disabled", "disabled");
					$("#addRowButton").attr("disabled", "disabled");
					$("#deleteButton").attr("disabled", "disabled");
					
					$("#cancleButton").removeAttr("disabled");
					$("#submitButton").removeAttr("disabled");
					
					pageStatus = "update";
				});
				
			}else if (selectedCheckbox.length === 0){
				alert("수정할 행을 선택해주세요!")
				
			}else {
				alert("수정은 하나의 행만 가능합니다!");
			}
		}); // 수정버튼
			
            
			
			
		// 삭제버튼
		$("#deleteButton").click(function(){
			
			var selectedCheckbox = $("input[name='selectedEmpId']:checked");
			
			// 체크된 체크박스가 하나인 경우에만 수정 기능 작동
			if (selectedCheckbox.length === 0){
				alert("삭제할 행을 선택해주세요!");
				
				// 선택안하면 submit을 막음
				event.preventDefault();
			}
			
		});
			
		
		// 체크박스 선택 시 체크박스 개수 구하기
		function updateSelectedCheckboxCount() {
			var totalCheckboxes = $(".table-employeeList td input[type='checkbox']").length;
			var selectedCheckboxes = $(".table-employeeList td input[type='checkbox']:checked").length;
			$("#selectedCheckboxCount").text("전체 ("+selectedCheckboxes + '/' + totalCheckboxes+")");
		}
		
		
			// $(function () {
			// $("#tel").on("keyup", function () {})
			// }); -> 이런식으로 쓰면 페이지가 로드될 때의 요소에만 바인딩 되기때문에(추가된 행엔 동작안함) 아래와 같은 형태로 사용해야함
		
		// 전화번호 입력시 하이픈 생성
		$(document).on("keyup", "#tel", function() {
			var telVal = $(this).val();
			telVal = telVal.replace(/[^0-9]/g, ''); // 숫자 이외의 문자 제거
			var telLen = telVal.length;
			
				if(telLen > 3){
					telVal = telVal.substring(0,3) + "-" + telVal.substring(3);
				}
				if(telLen > 7){
					telVal = telVal.substring(0,8) + "-" +telVal.substring(8);
				}
			$(this).val(telVal);
		});
		
		
	}); // jQuery
		


		
</script>
<style>
.selected {
	background-color: #b3ccff;
}
</style>

</head>
<body>

	<h1>사원조회</h1>
	<!-- 검색칸 -->
	<form action="" method="GET">
	사원번호 <input type="number" name="emp_id">
	이름 <input type="text" name="emp_name">
	부서
		<select name="emp_dept">
			<option>전체</option>
			<option>인사</option>
			<option>영업</option>
			<option>생산</option>
			<option>자재</option>
			<option>품질</option>
		</select>
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
	
	<form id="employeeList">
	
	<span id="selectedCheckboxCount">0</span>
	
	<c:if test="${sessionScope.emp_dept eq '인사' && sessionScope.emp_auth == 'Y'}">
		<button type="button" class="btn btn-primary m-2" id="addRowButton"><i class="fa fa-plus"></i> 추가</button>
		<button type="button" class="btn btn-primary m-2" id="cancleButton" disabled>X 취소</button>
		<button type="button" class="btn btn-primary m-2" id="updateButton"><i class="fa fa-edit"></i> 수정</button>
		<button type="submit" class="btn btn-primary m-2" id="deleteButton" formaction="deleteEmployee" formmethod="post">
		<i class="fa fa-trash"></i> 삭제</button>
		<button type="submit" class="btn btn-primary m-2" id="submitButton" formaction="regEmployee" formmethod="post" disabled>
		<i class="fa fa-download"></i> 저장</button>
	</c:if>
	

	<table class="table-employeeList" border="1">
		<tr>
			<th><input type="checkbox"></th>
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
		
		
		
		<c:forEach var="employeeList" items="${employeeList }">
		<tr>
			<td><input type="checkbox" name="selectedEmpId" value="${employeeList.emp_id}"></td>
			<td>${employeeList.emp_id }</td>
			<td>${employeeList.emp_name }</td>
			<td>${employeeList.emp_gender }</td>
			
			<td>${fn:substring(employeeList.emp_birth, 0, 10)}</td>
			
			<td>${employeeList.emp_dept }</td>
			<td>${employeeList.emp_rank }</td>
			<td>${employeeList.emp_auth }</td>
			<td>${employeeList.emp_state }</td>
			<td>${employeeList.emp_tel }</td>
			
			<td>${fn:substring(employeeList.emp_hire_date, 0, 10) }</td>
			<td>${fn:substring(employeeList.emp_rsgnt_date, 0, 10) }</td>
			<td>${fn:substring(employeeList.emp_start_leave_date, 0, 10) }</td>
		</tr>
		</c:forEach>
	</table>
	
	</form>


</body>
</html>
<%@ include file="../inc/footer.jsp"%>