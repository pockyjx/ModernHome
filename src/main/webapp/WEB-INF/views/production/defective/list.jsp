<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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
		var pageStatus = "";
		
		// 체크박스 선택 시 체크박스의 개수 구하기
        updateSelectedCheckboxCount();
		
		// 체크박스 선택 시 체크박스 개수 구하기
        function updateSelectedCheckboxCount() {
            var totalCheckboxes = $(".table-defective td input[type='checkbox']").length;
            var selectedCheckboxes = $(".table-defective td input[type='checkbox']:checked").length;
            $("#selectedCheckboxCount").text("전체 ("+selectedCheckboxes + '/' + totalCheckboxes+")");
        }
		
		// 추가 버튼 클릭 시 행 추가
        $("#addRowButton").click(function() {
        	var now = new Date();
			var today = now.getFullYear() + '-' + ('0' + (now.getMonth() + 1)).slice(-2) + '-' + now.getDate();
        	
			var newRow = '<tr>' +
						 '<td><input type="checkbox" class="form-check-input"></td>' +
						 '<td><input type="text" class="form-control" name="df_num" value="${dfNum[0].df_num}" style="border: none; background: transparent;" readonly></td>' +
						 '<td id="typePop"><input id="dfTypePop" type="text" class="form-control" name="df_type" style="border: none; background: transparent;" readonly></td>' +
						 '<td><input id="lnumPop" type="text" class="form-control" name="line_num" style="border: none; background: transparent;" readonly>' +
						 '<input type="text" class="form-control" name="clt_name" style="border: none; background: transparent;" readonly></td>' +
						 '<td><input type="text" class="form-control" name="pro_num" style="border: none; background: transparent;" readonly>' +
						 '<input type="text" class="form-control" name="ma_num" style="border: none; background: transparent;" readonly></td>' +
						 '<td><input type="text" class="form-control" name="pro_name" style="border: none; background: transparent;" readonly>' +
						 '<input type="text" class="form-control" name="ma_name" style="border: none; background: transparent;" readonly></td>' +
						 '<td>${sessionScope.emp_name}<input type="hidden" class="form-control" name="emp_id" value="${sessionScope.emp_id}" style="border: none; background: transparent;"></td>' +
						 '<td><input type="text" class="form-control" name="reg_date" value="' + today + '" style="border: none; background: transparent;" readonly></td>' +
						 '<td><input id="df_cnt" type="text" class="form-control" name="df_cnt"></td>' +
						 '<td><input id="df_rsns" type="text" class="form-control" name="df_rsns"></td>' +
						 '<td><select id="repair_yn" class="form-control" name="repair_yn">' +
						 '<option value="가능">가능</option>' +
						 '<option value="불가">불가</option>' +
						 '</select></td>' +
						 '<td><input type="text" class="form-control" name="solved_date" style="border: none; background: transparent;" readonly>' +
						 '<input type="hidden" class="form-control" name="df_id" value="${dfNum[0].df_id}">' +
						 '<input type="hidden" class="form-control" name="qc_id">' +
						 '<input type="hidden" class="form-control" name="work_id">' +
						 '<input type="hidden" class="form-control" name="rec_id">' +
						 '<input type="hidden" class="form-control" name="line_id">' +
						 '<input type="hidden" class="form-control" name="pro_id"></td>' +
						 '<input type="hidden" class="form-control" name="ma_id"></td>' +
						 '</tr>';
			
			// 클릭 시 팝업창 열기
			$(document).on("click", "td[id='typePop']", function() {
				window.name = "add";
				window.open('/production/defective/addPopup', 'popup', 'width=400, height=300, top=300, left=650, location=no, status=no');
			});
			
			// 첫번째 자식<tr> 뒤에서 부터 행을 추가함
			$(".table-defective tr:nth-child(1)").after(newRow);
			
			// 추가버튼, 취소버튼 활성화
			$("#addRowButton").attr("disabled", "disabled");
			$("#deleteButton").attr("disabled", "disabled");
			$("#cancleButton").removeAttr("disabled");
			$("#submitButton").removeAttr("disabled");
			
			pageStatus = "reg";
		});
		
		// 취소 버튼 누를 시 
		$("#cancleButton").click(function(){
			// 등록버튼 취소
			if(pageStatus == "reg"){
				// 두번째 tr (추가된 행)을 삭제함
				$(".table-defective tr:nth-child(2)").remove();
				
				// 추가버튼, 취소버튼 비활성화
				$("#addRowButton").removeAttr("disabled");
				$("#deleteButton").removeAttr("disabled");
				$("#cancleButton").attr("disabled", "disabled");
				$("#submitButton").attr("disabled", "disabled");
				
				pageStatus = "";
			}
			// 수정버튼 취소
			if(pageStatus == "update"){
				
				// 모든행에 대해 반복작업, 테이블 이름에 맞게 수정
				$(".table-defective tr").each(function() {
				var row = $(this);
					
				// 폼 초기화(기존내용으로)
				$("#defList")[0].reset();
				
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
				$(".table-inorderList tr").removeClass("selected");
				
				// 추가버튼, 수정버튼 활성화, 취소버튼 비활성화
				$("#addRowButton").removeAttr("disabled");
				$("#updateButton").removeAttr("disabled");
				$("#deleteInorderButton").removeAttr("disabled");
				
				$("#cancelButton").attr("disabled", "disabled");
				$("#submitButton").attr("disabled", "disabled");
				
				pageStatus = "";
				});
			}
		});

		// 수정 버튼 누를 시
		$("#updateButton").click(function(){
			var dfCheckbox = $("input[name='df_id']:checked");
			
			// 체크된 체크박스가 하나인 경우에만 수정 기능 작동
			if (dfCheckbox.length === 1) {
				var df_id = dfCheckbox.val();
				var row = dfCheckbox.closest("tr");
				
				// input type의 name 값 지정
				var cellNames = [
					"df_num",
					"df_type",
					"line_num",
					"pro_num",
					"pro_name",
					"emp_name",
					"reg_date",
					"df_cnt",
					"df_rsns",
					"repair_yn",
					"solved_date"
				];
				
				// 각 셀을 수정 가능한 텍스트 입력 필드로 변경
				row.find("td:not(:first-child)").each(function(index) {
					var cellValue = $(this).text();
					var cellType = "text";
					var cellName = cellNames[index];
					
					if(index === 1) {
						$(this).html('<input id="dfTypePop" class="form-control" type="hidden" name="' + cellName + '" value="' + cellValue + '">');
					}else if(index === 8) {
						$(this).html('<input id="df_rsns" class="form-control" type="' + cellType + '" name="' + cellName + '" value="' + cellValue + '">');
					} else if(index === 9) {
						$(this).html(
							'<select id="repair_yn" class="form-control" name="' + cellNames[index] + '">'
							+ '<option value="가능">가능</option>'
							+ '<option value="불가">불가</option>'
							+ '</select>');
					} else if(index !== 11) {
						$(this).html('<input class="form-control" type="' + cellType + '" name="' + cellName + '" value="' + cellValue + 
								'" style="border: none; background: transparent;" disabled>');
					}
					
					$("#updateButton").attr("disabled", "disabled");
					$("#addRowButton").attr("disabled", "disabled");
					$("#cancleButton").removeAttr("disabled");
					$("#submitButton").removeAttr("disabled");
					
					pageStatus = "update";
				});
			}else if (dfCheckbox.length === 0){
				alert("수정할 행을 선택해주세요!")
				return false;
			}else {
				alert("수정은 하나의 행만 가능합니다!");
				return false;
			}
		});
        
		// <th> 쪽 체크박스 클릭 시 해당 열의 <td> 부분의 행들을 선택하고 배경색 지정
		$(".table-defective th input[type='checkbox']").click(function() {
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
		
		// <td> 쪽 체크박스 클릭 시 행 선택
		$(".table-defective td input[type='checkbox']").click(function() {
			var checkbox = $(this);
			var isChecked = checkbox.prop('checked');
			checkbox.closest('tr').toggleClass('selected', isChecked);
			
			updateSelectedCheckboxCount();
		});
		
		// 체크박스 클릭 시 선택된 행 삭제
		$(".table-defective").on("click", "td input[type='checkbox']", function() {
			var checkbox = $(this);
			if (checkbox.prop("checked")) {
				checkbox.closest("tr").addClass("selected");
			} else {
				checkbox.closest("tr").removeClass("selected");
			}
		});
		
		// 삭제 버튼 누를 시
		$("#deleteButton").click(function(){
			var dfCheckbox = $("input[name='df_id']:checked");
// 			var df_id = dfCheckbox.val();
			
			if(selectedCheckbox.length === 0) {
				alert("삭제할 행을 선택해주세요!");
				
				// 선택안하면 submit을 막음
				event.preventDefault();
				return false;
			}
		});
		
	 	// 유효성 검사
	 	$("#submitButton").click(function() {
	 		var form = $("#defList");
	 		form.attr("method", "post");
	 		form.attr("action", "/production/defective/regDef");
			
	 		var df_type = $("#dfTypePop").val();
	 		var df_rsns = $("#df_rsns").val();
	 		var repair_yn = $("#repair_yn").val();
			
	 		if(df_type == null || df_type == "") {
	 			alert("불량 타입을 입력하세요!");
	 			$("#dfTypePop").focus();
	 			return false;
	 		}
	 		if(df_rsns == null || df_rsns == "") {
	 			alert("불량 사유를 입력하세요!");
	 			$("#df_rsns").focus();
	 			return false;
	 		}
	 		if(repair_yn == null || repair_yn == "") {
	 			alert("수리 가능 여부를 선택하세요!");
	 			$("#repair_yn").focus();
	 			return false;
	 		}
	 		form.submit();
	 	});
	});
	
	function repairAndDiscard(rd, dfId, dfCnt) {
		var sessionEmpAuth = ${sessionScope.emp_auth};
		console.log(sessionEmpAuth)
		
		if(sessionEmpAuth < 2) {
			alert("권한이 없습니다.");
			return false;
		}
		
		var url = "/production/defective/reAndDis?rd=" + rd + "&df_id=" + dfId + "&df_cnt=" + dfCnt;
		window.open(url, 'popup', 'width=400, height=300, top=300, left=650, location=no, status=no');
	}
</script>

<style>
.selected {
	background-color: #b3ccff;
}
</style>

	<form method="get" class="bg-light rounded p-3 m-3">
		<div class="row mb-3">
			<label class="col-sm-2 col-form-label">불량 타입</label>
			<div class="col-sm-10">
				<select name="df_type">
					<option value="all">전체</option>
					<option value="pro">공정검사</option>
					<option value="ma">수입검사</option>
					<option value="re">출고검사</option>
				</select>
			</div>
		</div>
		<div class="row mb-3">
			<label class="col-sm-2 col-form-label">품목명</label>
			<div class="col-sm-10">
				<input type="text" name="nameSearch">
			</div>
		</div>
		<div class="row mb-3">
			<label class="col-sm-2 col-form-label">라인 코드</label>
			<div class="col-sm-10">
				<input type="text" name="line_num">
				<button class="btn btn-info rounded-pill m-2" type="submit">조회</button>
			</div>
		</div>
	</form>

<br>
		
<form id="defList">
	<div class="d-flex align-items-center justify-content-between mb-2">
		<h3 class="m-4">불량 리스트</h3>
		<div class="me-2">
			<c:if test="${sessionScope.emp_dept eq '품질' && sessionScope.emp_auth >= 2 || sessionScope.emp_auth == 3}">
				<button type="button" class="btn btn-sm btn-primary m-2" id="addRowButton"><i class="fa fa-plus"></i> 추가</button>
				<button type="button" class="btn btn-sm btn-primary m-2" id="cancleButton" disabled>X 취소</button>
				<button type="button" class="btn btn-sm btn-primary m-2" id="updateButton">
						<i class="fa fa-edit"></i> 수정</button>
				<button type="submit" class="btn btn-sm btn-primary m-2" id="deleteButton" formaction="delDef" formmethod="post">
					<i class="fa fa-trash"></i> 삭제</button>
				<button type="button" class="btn btn-sm btn-primary m-2" id="submitButton" formaction="regDef" formmethod="post" disabled>
					<i class="fa fa-download"></i> 저장</button>
			</c:if>
		</div>
	</div>
	
	<div class="bg-light text-center rounded p-4 m-3">
		<div class="d-flex align-items-center justify-content-between mb-4">
			<span id="selectedCheckboxCount">0</span>
		</div>
		
		<div class="table-responsive">
			<!-- 불량 리스트 -->
			<table class="table-defective table text-start align-middle table-bordered table-hover mb-0">
				<tr>
					<th><input type="checkbox" class="form-check-input"></th>
					<th>불량코드</th>
					<th>불량타입</th>
					<th>라인코드/거래처</th>
					<th>품목코드</th>
					<th>품목명</th>
					<th>검수자</th>
					<th>등록일자</th>
					<th>불량수량</th>
					<th>불량사유</th>
					<th>수리가능 여부</th>
					<th>처리일</th>
					<th>수리/폐기</th>
				</tr>
			
				<c:forEach var="df" items="${dfList}">
					<tr>
						<td><input type="checkbox" class="form-check-input" name="df_id" value="${df.df_id}"></td>
						<td>${df.df_num}</td>
						<td>${df.df_type}</td>
						<td>${(df.df_type == "공정검사") ? df.line_num : df.clt_name}</td>
						<td>${(df.df_type == "공정검사") ? df.pro_num : df.ma_num}</td>
						<td>${(df.df_type == "공정검사") ? df.pro_name : df.ma_name}</td>
						<td>${df.emp_name}</td>
						<td>
							<c:if test="${!empty wp.update_date}">${fn:substring(df.update_date, 0, 10)}</c:if>
							<c:if test="${empty wp.update_date}">${fn:substring(df.reg_date, 0, 10)}</c:if>
						</td>
						<td>${df.df_cnt}</td>
						<td>${df.df_rsns}</td>
						<td>${df.repair_yn}</td>
						<td>${fn:substring(df.solved_date, 0, 10)}</td>
						<td>
							<c:if test="${df.solved_date == null && df.df_type.equals('공정검사') && df.repair_yn.equals('가능')}">
								<button type="button" onclick="repairAndDiscard('repair', '${df.df_id}', ${df.df_cnt});" class="btn btn-success m-2">수리</button>
							</c:if>
							<c:if test="${df.solved_date == null && df.df_type.equals('공정검사') && df.repair_yn.equals('불가')}">
								<button type="button" onclick="repairAndDiscard('discard', '${df.df_id}', ${df.df_cnt});" class="btn btn-danger m-2">폐기</button>
							</c:if>
							<c:if test="${df.solved_date != null}">
								<button class="btn btn-outline-secondary m-2" disabled>완료</button>
							</c:if>
						</td>
					</tr>
				</c:forEach>
			</table>
			<!-- 불량 리스트 -->
		</div>
	</div>
</form>

<!-- 페이지 이동 버튼 -->
<nav aria-label="Page navigation example">
 	<ul class="pagination justify-content-center pagination-sm">
 		<c:if test="${pm.prev}">
			<li class="page-item">
				<a class="page-link" 
				href="/production/defective/list?page=${pm.startPage - 1}&df_type=${df_type}&nameSearch=${nameSearch}&line_num=${line_num}&nameSearch=${nameSearch}" 
				aria-label="Previous">
	      			<span aria-hidden="true">&laquo;</span>
	     		</a>
	   		</li>
   		</c:if>
   		
   		<c:forEach begin="${pm.startPage}" end="${pm.endPage}" step="1" var="idx">
	   		<li <c:out value="${pm.pageVO.page == idx ? 'class=page-item active': 'class=page-item'}" />>
	   			<a class="page-link" href="/production/defective/list?page=${idx}&df_type=${df_type}&nameSearch=${nameSearch}&line_num=${line_num}&nameSearch=${nameSearch}">${idx}</a>
	   		</li>
   		</c:forEach>
		
		<c:if test="${pm.next && pm.endPage > 0}">
			<li class="page-item">
	     		<a class="page-link" 
	     		href="/production/defective/list?page=${pm.endPage + 1}&df_type=${df_type}&nameSearch=${nameSearch}&line_num=${line_num}" 
	     		aria-label="Next">
	       			<span aria-hidden="true">&raquo;</span>
	     		</a>
	   		</li>
   		</c:if>
 	</ul>
</nav>
<!-- 페이지 이동 버튼 -->

<%@ include file="../../inc/footer.jsp"%>