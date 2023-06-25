<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="../../inc/header.jsp"%>
<%@ include file="../../inc/sidebar.jsp"%>
<%@ include file="../../inc/nav.jsp"%>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" />
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="//code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<script>
	$(document).ready(function() {
		// 버튼 클릭 시 행 추가
        $("#addRowButton").click(function() {
			var selectedWorkId = $("input[name='selectedWorkId']:checked");
			var work_num;
			var line_num;
			var pro_num;
			var pro_name;
			var work_cnt;
			var now = new Date();
			var today = now.getFullYear() + '-' + ('0' + (now.getMonth() + 1)).slice(-2) + '-' + now.getDate();
			
			// 작업 지시를 먼저 선택하여 해당 지시에 대한 실적 등록 실행 
			if(selectedWorkId.val()) {
				selectedWorkId.closest('tr').each(function() {
					work_num = $(this).find('td:eq(1)').text();
					line_num = $(this).find('td:eq(2)').text();
					pro_num = $(this).find('td:eq(3)').text();
					pro_name = $(this).find('td:eq(4)').text();
					work_cnt = $(this).find('td:eq(7)').text();
				});
				
				var newRow = '<tr>' +
							 '<td><input type="checkbox"></td>' +
							 '<td><input type="text" name="prfrm_num" value="${prfrmNum}"></td>' +
							 '<td><input type="text" name="work_num" value="' + work_num + '"></td>' +
							 '<td><input type="text" name="line_num" value="' + line_num + '"></td>' +
							 '<td><input type="text" name="pro_num" value="' + pro_num + '"></td>' +
							 '<td><input type="text" name="pro_name" value="' + pro_name + '"></td>' +
							 '<td><input type="text" name="reg_date" value="' + today + '"></td>' +
							 '<td>' +
							 '<select name="gb_yn">' +
							 '<option value="Y">양품</option>' +
							 '<option value="N">불량품</option>' +
							 '</select>' +
							 '</td>' +
							 '<td><input type="text" name="prfrm_cnt"></td>' +
							 '<td><input type="text" name="df_cnt" value="0" disabled></td>' +
							 '<td><input type="text" name="emp_id"></td>' +
							 '<td><input type="text" name="work_cnt" value="' + work_cnt + '"></td>' +
							 '</tr>';
				
				// gb_yn이 Y라면 df_cnt를 비활성화 시킴
				$(document).on('change', 'select[name="gb_yn"]', function() {
					var dfCntInput = $(this).closest('tr').find('input[name="df_cnt"]');
					var selectedValue = $(this).val();
					
					if(selectedValue === 'Y') {
						dfCntInput.prop('disabled', true);
					} else {
						dfCntInput.prop('disabled', false);
					}
				});
				
				// 첫번째 자식<tr> 뒤에서 부터 행을 추가함
				$(".table-prfrmList tr:nth-child(1)").after(newRow);
				
				// 추가버튼, 수정버튼 비활성화, 취소버튼 활성화
				$("#addRowButton").attr("disabled", "disabled");
				$("#updateButton").attr("disabled", "disabled");
				
				$("#cancleButton").removeAttr("disabled");
				$("#submitButton").removeAttr("disabled");
				
				pageStatus = "reg";
			} else {
				alert("실적을 등록할 작업지시를 선택하세요.");
				return false;
			}
		});
		
		// 취소 버튼 누를 시 
		$("#cancleButton").click(function(){
			// 등록버튼 취소
			if(pageStatus == "reg"){
				// 두번째 tr (추가된 행)을 삭제함
				$(".table-prfrmList tr:nth-child(2)").remove();
				
				// 추가버튼, 수정버튼 활성화, 취소버튼 비활성화
				$("#addRowButton").removeAttr("disabled");
				$("#updateButton").removeAttr("disabled");
				$("#cancleButton").attr("disabled", "disabled");
				$("#submitButton").attr("disabled", "disabled");
				
				pageStatus = "";
			}
			// 수정버튼 취소
			if(pageStatus == "update"){
				var row = $("input[name='prfrm_id']:checked").closest("tr");
				
				// 각 셀의 값을 원래 상태로 되돌림
				row.find("td:not(:first-child)").each(function(index) {
					var cellValue = $(this).find("input").val();
					$(this).html(cellValue);
				});
				
				// 추가버튼, 수정버튼 활성화, 취소버튼 비활성화
				$("#addRowButton").removeAttr("disabled");
				$("#updateButton").removeAttr("disabled");
				
				$("#cancleButton").attr("disabled", "disabled");
				$("#submitButton").attr("disabled", "disabled");
				
				pageStatus = "";
			}
		});
        
		// 체크박스 선택 시 체크박스의 개수 구하기
        updateSelectedCheckboxCount();
		
		// <th> 쪽 체크박스 클릭 시 해당 열의 <td> 부분의 행들을 선택하고 배경색 지정
		$("table th input[type='checkbox']").click(function() {
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
		});
		
		// 수정 버튼 누를 시
		$("#updateButton").click(function(){
			var prfrmCheckbox = $("input[name='prfrm_id']:checked");
			
			// 체크된 체크박스가 하나인 경우에만 수정 기능 작동
			if (prfrmCheckbox.length === 1) {
				var prfrm_id = prfrmCheckbox.val();
				var row = prfrmCheckbox.closest("tr");
				
				// input type의 name 값 지정
				var cellNames = [
					"prfrm_num",
					"work_num",
					"line_num",
					"pro_num",
					"pro_name",
					"reg_date",
					"gb_yn",
					"prfrm_cnt",
					"df_cnt",
					"emp_name",
					"work_cnt",
				];
				
				// 각 셀을 수정 가능한 텍스트 입력 필드로 변경
				row.find("td:not(:first-child)").each(function(index) {
					var cellValue = $(this).text();
					var cellType = "text";
					var cellName = (index == 5) ? "update_date" : cellNames[index];
					
					if(index == 6) {
						$(this).html(
							'<select name="' + cellNames[index] + '">'
							+ '<option value="Y" <c:if test="${wp.gb_yn.equals(' + Y + ')}">selected</c:if>>양품</option>'
							+ '<option value="N" <c:if test="${wp.gb_yn.equals(' + N + ')}">selected</c:if>>불량품</option>'
							+ '</select>');
					}
					if(index == 7) {
						$(this).html('<input type="' + cellType + '" name="' + cellName + '" value="' + cellValue + '">');
					}
// 					if(index == 8) {
// 						$(this).html('<input type="' + cellType + '" name="' + cellName + '" value="${work_cnt - prfrm_cnt}">');
// 					}
					
					
					$("#updateButton").attr("disabled", "disabled");
					$("#addRowButton").attr("disabled", "disabled");
					$("#cancleButton").removeAttr("disabled");
					$("#submitButton").removeAttr("disabled");
					
					pageStatus = "update";
				});
			}else if (prfrmCheckbox.length === 0){
				alert("수정할 행을 선택해주세요!")
				return false;
			}else {
				alert("수정은 하나의 행만 가능합니다!");
				return false;
			}
		});
		
		// <th> 쪽 체크박스 클릭 시 해당 열의 <td> 부분의 행들을 선택하고 배경색 지정
		$("table th input[type='checkbox']").click(function() {
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
		$("table td input[type='checkbox']").click(function() {
			var checkbox = $(this);
			var isChecked = checkbox.prop('checked');
			checkbox.closest('tr').toggleClass('selected', isChecked);
			
			updateSelectedCheckboxCount();
		});
		
		// 체크박스 클릭 시 선택된 행 삭제
		$(".table-prfrmList").on("click", "td input[type='checkbox']", function() {
			var checkbox = $(this);
			if (checkbox.prop("checked")) {
				checkbox.closest("tr").addClass("selected");
			} else {
				checkbox.closest("tr").removeClass("selected");
			}
		});
		
		// 삭제 버튼 누를 시
		$("#deleteInstrButton").click(function(){
			var prfrmCheckbox = $("input[name='prfrm_id']:checked");
			var prfrm_id = prfrmCheckbox.val();
		});
		
		// 체크박스 선택 시 체크박스 개수 구하기
        function updateSelectedCheckboxCount() {
            var totalCheckboxes = $(".table-prfrmList td input[type='checkbox']").length;
            var selectedCheckboxes = $(".table-prfrmList td input[type='checkbox']:checked").length;
            $("#selectedCheckboxCount").text("전체 ("+selectedCheckboxes + '/' + totalCheckboxes+")");
        }
	});
</script>
<style>
.selected {
	background-color: #b3ccff;
}
</style>

<h2>생산관리</h2>

<form method="get">
	양불 여부
		<label><input type="radio" name="gb_yn" value="Y">양품</label>
		<label><input type="radio" name="gb_yn" value="N">불량품</label>
	작업지시코드 <input type="text" name="work_num"> <br>
	<label>등록일자</label>
	<input type="date" name="startDate"> ~ <input type="date" name="endDate">
	<button class="btn btn-primary m-2" type="submit">조회</button>
</form>

<br>

		<!-- 작업지시 중 검수상태(qc_yn)가 완료인 리스트 -->
		<table border="1" class="table-instrList">
			<tr>
				<th>　</th>
				<th>작업지시코드</th>
				<th>라인코드</th>
				<th>품목코드</th>
				<th>품목명</th>
				<th>작업상태</th>
				<th>지시일자</th>
				<th>지시수량</th>
				<th>수주번호</th>
				<th>납품예정일</th>
				<th>담당자</th>
			</tr>
		
			<c:forEach var="qi" items="${qiList}">
				<tr>
					<td><input type="checkbox" name="selectedWorkId" value="${qi.work_id}"></td>
					<td>${qi.work_num}</td>
					<td>${qi.line_num}</td>
					<td>${qi.pro_num}</td>
					<td>${qi.pro_name}</td>
					<td>${qi.work_state}</td>
					<td>
						<c:if test="${!empty qi.update_date}">${qi.update_date}</c:if>
						<c:if test="${empty qi.update_date}">${qi.reg_date}</c:if>
					</td>
					<td>${qi.work_cnt}</td>
					<td>${qi.oo_num}</td>
					<td>${qi.oo_end_date}</td>
					<td>
						<c:if test="${!empty qi.update_emp_id}">${qi.emp_name}</c:if>
						<c:if test="${empty qi.update_emp_id}">${qi.emp_name}</c:if>
					</td>
				</tr>
			</c:forEach>
		</table>
		<!-- 작업지시 중 검수상태(qc_yn)가 완료인 리스트 -->
		
		<hr>
		<!-- ================================================================================== -->
<%-- ${prfrmNum} --%>
		
<form>
	<div class="bg-light text-center rounded p-4">
		<div>
			<button type="button" class="btn btn-primary m-2" id="addRowButton"><i class="fa fa-plus"></i> 추가</button>
			<button type="button" class="btn btn-primary m-2" id="cancleButton" disabled>X 취소</button>
			<button type="button" class="btn btn-primary m-2" id="updateButton"><i class="fa fa-edit"></i> 수정</button>
			<button type="submit" class="btn btn-primary m-2" id="deleteInstrButton" formaction="delPrfrm" formmethod="post"><i class="fa fa-trash"></i> 삭제</button>
			<button type="submit" class="btn btn-primary m-2" id="submitButton" formaction="regPrfrm" formmethod="post" disabled><i class="fa fa-download"></i> 저장</button>
		</div>
		
		<div class="d-flex align-items-center justify-content-between mb-4">
			<span id="selectedCheckboxCount">0</span>
		</div>
		
		<!-- 생산실적 리스트 -->
		<table border="1" class="table-prfrmList">
			<tr>
				<th><input type="checkbox"></th>
				<th>생산실적코드</th>
				<th>작업지시코드</th>
				<th>라인코드</th>
				<th>품목코드</th>
				<th>품목명</th>
				<th>등록일</th>
				<th>양불여부</th>
				<th>실적수량</th>
				<th>불량수량</th>
				<th>담당자</th>
				<th>목표수량</th>
			</tr>
		
			<c:forEach var="wp" items="${wpList}">
				<tr>
					<td><input type="checkbox" name="prfrm_id" value="${wp.prfrm_id}"></td>
					<td>${wp.prfrm_num}</td>
					<td>${wp.work_num}</td>
					<td>${wp.line_num}</td>
					<td>${wp.pro_num}</td>
					<td>${wp.pro_name}</td>
					<td>
						<c:if test="${!empty wp.update_date}">${wp.update_date}</c:if>
						<c:if test="${empty wp.update_date}">${wp.reg_date}</c:if>
					</td>
					<td>
						${wp.gb_yn.equals("Y") ? "양품" : "불량품"}
					</td>
					<td>${wp.prfrm_cnt}</td>
					<td>${wp.work_cnt - wp.prfrm_cnt}</td>
					<td>
						<c:if test="${!empty wp.update_emp_id}">${wp.emp_name}</c:if>
						<c:if test="${empty wp.update_emp_id}">${wp.emp_name}</c:if>
					</td>
					<td>${wp.work_cnt}</td>
				</tr>
			</c:forEach>
		</table>
	</div>
</form>
<!-- 생산실적 리스트 -->

<%@ include file="../../inc/footer.jsp"%>