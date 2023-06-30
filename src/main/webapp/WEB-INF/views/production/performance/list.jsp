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
            var totalCheckboxes = $(".table-prfrmList td input[type='checkbox']").length;
            var selectedCheckboxes = $(".table-prfrmList td input[type='checkbox']:checked").length;
            $("#selectedCheckboxCount").text("전체 ("+selectedCheckboxes + '/' + totalCheckboxes+")");
        }
		
		// 추가 버튼 클릭 시 행 추가
        $("#addRowButton").click(function() {
        	var now = new Date();
			var today = now.getFullYear() + '-' + ('0' + (now.getMonth() + 1)).slice(-2) + '-' + now.getDate();
        	
			var newRow = '<tr>' +
						 '<td><input type="checkbox" class="form-check-input"></td>' +
						 '<td><input type="text" class="form-control" name="prfrm_num" value="${prfrmNum}" style="border: none; background: transparent;" readonly></td>' +
						 '<td id="work_num"><input id="wnumPop" type="text" class="form-control" name="work_num" style="border: none; background: transparent;" readonly></td>' +
						 '<td><input type="text" class="form-control" name="line_num" style="border: none; background: transparent;" readonly></td>' +
						 '<td><input type="text" class="form-control" name="pro_num" style="border: none; background: transparent;" readonly></td>' +
						 '<td><input type="text" class="form-control" name="pro_name" style="border: none; background: transparent;" readonly></td>' +
						 '<td><input type="text" class="form-control" name="reg_date" value="' + today + '" style="border: none; background: transparent;" readonly></td>' +
						 '<td>' +
						 '<select name="gb_yn" id="selGb" class="form-select mb-3">' +
						 '<option value="양품">양품</option>' +
						 '<option value="불량품">불량품</option>' +
						 '</select>' +
						 '</td>' +
						 '<td><input type="text" class="form-control" name="prfrm_cnt"></td>' +
						 '<td><input type="text" class="form-control" name="df_cnt" style="border: none; background: transparent;" readonly></td>' +
						 '<td>${sessionScope.emp_name}<input type="hidden" class="form-control" name="emp_id" value="${sessionScope.emp_id}" style="border: none; background: transparent;"></td>' +
						 '<td><input type="text" class="form-control" name="work_cnt" style="border: none; background: transparent;" readonly>' +
						 '<input type="hidden" class="form-control" name="work_id">' +
						 '<input type="hidden" class="form-control" name="line_id">' +
						 '<input type="hidden" class="form-control" name="pro_id"></td>' +
						 '</tr>';
			
			// 클릭 시 팝업창 열기
			$(document).on("click", "td[id='work_num']", function() {
				window.name = "add";
				window.open('/production/performance/addPopup', 'popup', 'width=400, height=300, top=300, left=650, location=no, status=no');
			});
			
			// 첫번째 자식<tr> 뒤에서 부터 행을 추가함
			$(".table-prfrmList tr:nth-child(1)").after(newRow);
			
			// 추가버튼, 취소버튼 활성화
			$("#addRowButton").attr("disabled", "disabled");
			$("#deleteReceiveButton").attr("disabled", "disabled");
			$("#cancleButton").removeAttr("disabled");
			$("#submitButton").removeAttr("disabled");
			
			pageStatus = "reg";
		});
		
		// 취소 버튼 누를 시 
		$("#cancleButton").click(function(){
			// 등록버튼 취소
			if(pageStatus == "reg"){
				// 두번째 tr (추가된 행)을 삭제함
				$(".table-prfrmList tr:nth-child(2)").remove();
				
				// 추가버튼, 취소버튼 비활성화
				$("#addRowButton").removeAttr("disabled");
				$("#deleteButton").removeAttr("disabled");
				$("#addRowButton").removeAttr("disabled");
				$("#cancleButton").attr("disabled", "disabled");
				$("#submitButton").attr("disabled", "disabled");
				
				pageStatus = "";
			}
		});
        
		// <th> 쪽 체크박스 클릭 시 해당 열의 <td> 부분의 행들을 선택하고 배경색 지정
		$(".table-prfrmList th input[type='checkbox']").click(function() {
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
		$(".table-prfrmList td input[type='checkbox']").click(function() {
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
		$("#deleteButton").click(function(){
			var prfrmCheckbox = $("input[name='prfrm_id']:checked");
			var prfrm_id = prfrmCheckbox.val();
		});
		
		// 유효성 검사
		$("#submitButton").click(function() {
			var form = $("#prfrmList");
			var prfrm_cnt = $("#ma_num").val();
			
			if(prfrm_cnt == null || prfrm_cnt == "") {
				$("#prfrm_cnt").focus();
				alert("실적 수량을 입력하세요!");
				return false;
			}
			form.submit();
		});
	});
	
	// 체크박스 중복 X
	function handleCheckbox(checkbox, value) {
		const checkboxes = document.getElementsByName('gb_yn');
		
		// 다른 체크박스 중에서 선택된 체크박스를 제외하고 체크 해제
		checkboxes.forEach(function(cb) {
		if (cb !== checkbox && cb.checked) {
			cb.checked = false;
			}
		});
	}
</script>
<style>
.selected {
	background-color: #b3ccff;
}
</style>

	<form method="get" class="bg-light rounded p-3 m-3">
		<div class="row mb-3">
			<label class="col-sm-2 col-form-label">양불 여부</label>
			<div class="col-sm-10">
				<label><input type="checkbox" name="gb_yn" value="양품" class="form-check-input" 
					${param.gb_yn == '양품' ? 'checked' : ''} onclick="handleCheckbox(this, '양품')"> 양품</label>
				<label><input type="checkbox" name="gb_yn" value="불량품" class="form-check-input" 
					${param.gb_yn == '불량품' ? 'checked' : ''} onclick="handleCheckbox(this, '불량품')"> 불량품</label>
			</div>
		</div>
		<div class="row mb-3">
			<label class="col-sm-2 col-form-label">작업지시코드</label>
			<div class="col-sm-10">
				<input type="text" name="work_num">
			</div>
		</div>
		<div class="row mb-3">
			<label class="col-sm-2 col-form-label">등록일자</label>
			<div class="col-sm-10">
				<input type="date" name="startDate"> ~ <input type="date" name="endDate">
				<button class="btn btn-info rounded-pill m-2" type="submit">조회</button>
			</div>
		</div>
	</form>

<br>
		
<form id="prfrmList">
	<div class="d-flex align-items-center justify-content-between mb-2">
		<h3 class="m-4">생산실적 리스트</h3>
		<div>
			<c:if test="${sessionScope.emp_dept eq '생산' && sessionScope.emp_auth >= 2 || sessionScope.emp_auth == 3}">
				<button type="button" class="btn btn-sm btn-primary m-2" id="addRowButton"><i class="fa fa-plus"></i> 추가</button>
				<button type="button" class="btn btn-sm btn-primary m-2" id="cancleButton" disabled>X 취소</button>
				<button type="submit" class="btn btn-sm btn-primary m-2" id="deleteButton" formaction="delPrfrm" formmethod="post">
					<i class="fa fa-trash"></i> 삭제</button>
				<button type="submit" class="btn btn-sm btn-primary m-2" id="submitButton" formaction="regPrfrm" formmethod="post" disabled>
					<i class="fa fa-download"></i> 저장</button>
			</c:if>
		</div>
	</div>
	
	<div class="bg-light text-center rounded p-4 m-3">
		<div class="d-flex align-items-center justify-content-between mb-4">
			<span id="selectedCheckboxCount">0</span>
		</div>
		
		<div class="table-responsive">
			<!-- 생산실적 리스트 -->
			<table class="table-prfrmList table text-start align-middle table-bordered table-hover mb-0">
				<tr>
					<th><input type="checkbox" class="form-check-input"></th>
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
						<td><input type="checkbox" class="form-check-input" name="prfrm_id" value="${wp.prfrm_id}"></td>
						<td>${wp.prfrm_num}</td>
						<td>${wp.work_num}</td>
						<td>${wp.line_num}</td>
						<td>${wp.pro_num}</td>
						<td>${wp.pro_name}</td>
						<td>
							<c:if test="${!empty wp.update_date}">${fn:substring(wp.update_date, 0, 10)}</c:if>
							<c:if test="${empty wp.update_date}">${fn:substring(wp.reg_date, 0, 10)}</c:if>
						</td>
						<td>${wp.gb_yn}</td>
						<td>${wp.prfrm_cnt}</td>
						<td>${wp.df_cnt}</td>
						<td>${wp.emp_name}</td>
						<td>${wp.work_cnt}</td>
					</tr>
				</c:forEach>
			</table>
		</div>
	</div>
</form>
<!-- 생산실적 리스트 -->

<!-- 페이지 이동 버튼 -->
<nav aria-label="Page navigation example">
 	<ul class="pagination justify-content-center pagination-sm">
 		<c:if test="${pm.prev}">
			<li class="page-item">
				<a class="page-link" 
				href="/production/performance/list?page=${pm.startPage - 1}&gb_yn=${gb_yn}&work_num=${work_num}&startDate=${startDate}&endDate=${endDate}" 
				aria-label="Previous">
	      			<span aria-hidden="true">&laquo;</span>
	     		</a>
	   		</li>
   		</c:if>
   		
   		<c:forEach begin="${pm.startPage}" end="${pm.endPage}" step="1" var="idx">
	   		<li <c:out value="${pm.pageVO.page == idx ? 'class=page-item active': 'class=page-item'}" />>
	   			<a class="page-link" href="/production/performance/list?page=${idx}&gb_yn=${gb_yn}&work_num=${work_num}&startDate=${startDate}&endDate=${endDate}">${idx}</a>
	   		</li>
   		</c:forEach>
		
		<c:if test="${pm.next && pm.endPage > 0}">
			<li class="page-item">
	     		<a class="page-link" 
	     		href="/production/performance/list?page=${pm.endPage + 1}&gb_yn=${gb_yn}&work_num=${work_num}&startDate=${startDate}&endDate=${endDate}" 
	     		aria-label="Next">
	       			<span aria-hidden="true">&raquo;</span>
	     		</a>
	   		</li>
   		</c:if>
 	</ul>
</nav>
<!-- 페이지 이동 버튼 -->

<%@ include file="../../inc/footer.jsp"%>