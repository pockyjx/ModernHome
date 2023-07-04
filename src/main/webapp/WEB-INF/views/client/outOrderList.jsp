<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ include file="../inc/header.jsp"%>
<%@ include file="../inc/sidebar.jsp"%>
<%@ include file="../inc/nav.jsp"%>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>

var pageStatus = "";

$(document).ready(function() {
	
	updateSelectedCheckboxCount();

	// <th> 쪽 체크박스 클릭 시 해당 열의 <td> 부분의 행들을 선택하고 배경색 지정
	$(".table-outOrderList th input[type='checkbox']").click(function() {
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
	$(".table-outOrderList td input[type='checkbox']").click(function() {
		var checkbox = $(this);
		var isChecked = checkbox.prop('checked');
		checkbox.closest('tr').toggleClass('selected', isChecked);
		
		updateSelectedCheckboxCount();
		
	});
	
	// ------------------ 체크박스
	
	
	
	// 추가 버튼 클릭 시 행 추가
	// 추가버튼 1번 누르면 추가버튼 비활성화
	$("#addRowButton").click(function() {
		
		// 모든 체크박스의 체크 해제
		$(".table-outOrderList input[type='checkbox']").prop("checked", false);
		
		// selected 클래스를 없앰 (css 없애기)
		$(".table-outOrderList tr").removeClass("selected");
		
		
		var newRow = '<tr>' +
		'<td><input type="checkbox"></td>' +
		'<td><input type="text" disabled="disabled" value="(자동으로 부여)" style="border: none; background: transparent;"></td>' +
		
		'<td><input type="text" name="emp_id" value="' + '${sessionScope.emp_id}' + '" readonly style="border: none; background: transparent;"></td>' +
		'<td><input type="text" name="clt_num" id="clt_num" readonly placeholder="여기를 눌러 검색하세요"></td>' +
		'<td><input type="text" name="clt_name" id="clt_name" style="border: none; background: transparent;" readonly></td>' +
		'<td><input type="text" name="pro_num" id="pro_num" readonly placeholder="여기를 눌러 검색하세요"></td>' +
		'<td><input type="text" name="pro_name" id="pro_name" style="border: none; background: transparent;" readonly></td>' +
		'<td><input type="text" name="pro_price" id="pro_price" style="border: none; background: transparent;" readonly></td>' +
		'<td><input type="number" name="oo_cnt" id="oo_cnt" placeholder="주문량을 입력하세요"></td>' +
		'<td><input type="number" name="clt_cost" id="clt_cost" placeholder="수주금액(자동계산)" style="border: none; background: transparent;" readonly></td>' +
		'<td><input type="date" name="oo_start_date" id="oo_start_date"></td>' +
		'<td><input type="date" name="oo_end_date" id="oo_end_date"></td>' +
		'<td>' +
		'<select name="oo_state">' +
		'<option value="대기">대기</option>' +
		'<option value="진행중">진행중</option>' +
		'<option value="완료">완료</option>' +
		'</select>' +
		'</td>' +
		'</tr>';
		
		// 첫번째 자식<tr> 뒤에서 부터 행을 추가함
		$(".table-outOrderList tr:nth-child(1)").after(newRow);
		
		// 버튼 활성화, 비활성화
		$("#addRowButton").attr("disabled", "disabled");
		$("#updateButton").attr("disabled", "disabled");
		$("#deleteButton").attr("disabled", "disabled");
		
		$("#cancelButton").removeAttr("disabled");
		$("#submitButton").removeAttr("disabled");
		
		pageStatus = "reg";
		
		updateSelectedCheckboxCount();
		
	}); // 여기까지 추가 버튼
	
	
	
    
	// 취소버튼
	$("#cancelButton").click(function(){
	
		// 등록버튼 취소
		if(pageStatus == "reg"){
			
			// 두번째 tr (추가된 행)을 삭제함
			$(".table-outOrderList tr:nth-child(2)").remove();

			// 모든 체크박스의 체크 해제
			$(".table-outOrderList input[type='checkbox']").prop("checked", false);
			
			// selected 클래스를 없앰 (css 없애기)
			$(".table-outOrderList tr").removeClass("selected");
			
			
			// 버튼 활성화, 비활성화
			$("#addRowButton").removeAttr("disabled");
			$("#updateButton").removeAttr("disabled");
			$("#deleteButton").removeAttr("disabled");
			
			$("#cancelButton").attr("disabled", "disabled");
			$("#submitButton").attr("disabled", "disabled");
			
			pageStatus = "";
		}
		
		// 수정버튼 취소
		if(pageStatus == "update"){
			
			// 모든행에 대해 반복작업, 테이블 이름에 맞게 수정
			$(".table-outOrderList tr").each(function() {
			var row = $(this);
			
			// 폼 초기화(기존내용으로)
			// 가져가서 쓰는 경우 폼에 이름 지정해줘야해요
			$("#outOrderList")[0].reset();
			
			// 각 셀의 값을 원래 상태로 되돌림
			row.find("td:not(:first-child)").each(function(index) {
				
				var cellValue = $(this).data('prevValue'); // 수정 전의 기존값을 가져옴
				
				
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
			$(".table-outOrderList tr").removeClass("selected");
			
			// 추가버튼, 수정버튼 활성화, 취소버튼 비활성화
			$("#addRowButton").removeAttr("disabled");
			$("#updateButton").removeAttr("disabled");
			$("#deleteButton").removeAttr("disabled");
			
			$("#cancelButton").attr("disabled", "disabled");
			$("#submitButton").attr("disabled", "disabled");
			
			
			pageStatus = "";
			
			});
		} // if(update)문
	
		updateSelectedCheckboxCount();
		
	}); // 취소버튼
	
	
	
	
    // 수정 버튼 누를 시
	$("#updateButton").click(function(){
		 
		var selectedCheckbox = $("input[name='selected']:checked");
		
		// 체크된 체크박스가 하나인 경우에만 수정 기능 작동
		if (selectedCheckbox.length === 1) {
			var oo_num = selectedCheckbox.val();
			var row = selectedCheckbox.closest("tr");
			
			
			// oo_num 값을 넘기기 위해 히든에 추가함
			var ooNumInput = '<input type="hidden" name="oo_num" value="' + oo_num + '">';
			$(this).closest("form").append(ooNumInput);
	        
	        
			// input type의 name 값 지정
			var cellNames = [
	            "oo_num",
	            "update_emp_id",
	            "clt_num",
	            "clt_name",
	            "pro_num",
	            "pro_name",
	            "pro_price",
	            "oo_cnt",
	            "clt_cost",
	            "oo_start_date",
	            "oo_end_date",
	            "oo_state",
	            "oo_update_date"
			];
			
			
			// 각 셀을 수정 가능한 텍스트 입력 필드로 변경
			row.find("td:not(:first-child)").each(function(index) {
				
				
				var cellValue = $(this).text();
				var cellType = [9, 10].includes(index) ? "date" : "text"; // 날짜 타입은 date로 설정
				var cellReadonly = [0, 1, 6, 8, 12].includes(index) ? "readonly='readonly'" : "";
				var cellName = cellNames[index];
				var cellDisabled = [2, 4, 11].includes(index)? "disabled" : "";
				var cellContent;
				
				var originalValue = row.find(".original-value").val();
				
				// 첫행 링크(a태그) 유지하기위해 적어둔 것
				if (index === 0){
					return;
				}else if (index === 11){
					cellContent = '<td>' +
					'<select name="' + cellName + '">' +
					'<option value="대기" ' + (cellValue === '대기' ? 'selected' : '') + '>대기</option>' +
					'<option value="진행중" ' + (cellValue === '진행중' ? 'selected' : '') + '>진행중</option>' +
					'<option value="완료" ' + (cellValue === '완료' ? 'selected' : '') + '>완료</option>' +
					'</select>' +
					'</td>';
				}else if (index === 1){
					cellContent = '<td><input type="' + cellType + '" name="' + cellName + '" value="' + ${sessionScope.emp_id} + '"' + cellReadonly + '></td>';
				}else if (index === 7){
					cellContent = '<td><input type="number" name="' + cellName + '" id="' + cellName + '"' + '" value="' + cellValue + '"' + cellReadonly + '></td>';
				}else {
					cellContent = '<td><input type="' + cellType + '" name="' + cellName + '" id="' + cellName + '"' + '" value="' + cellValue + '"'
// 					+ cellReadonly + '></td>';
					+ cellReadonly + ' ' + cellDisabled + '></td>';
				}
				
				
				// 기존 값을 임시 변수에 저장 -> 수정 후 취소버튼 시 담당자 칸에 세션값이 나오는 문제 해결위해
				$(this).data('prevValue', cellValue);
				
				
				$(this).html(cellContent);
				
				// 버튼 활성화, 비활성화
				$("#updateButton").attr("disabled", "disabled");
				$("#addRowButton").attr("disabled", "disabled");
				$("#deleteButton").attr("disabled", "disabled");
				
				$("#cancelButton").removeAttr("disabled");
				$("#submitButton").removeAttr("disabled");
				
				pageStatus = "update";
			});
			
		}else if (selectedCheckbox.length === 0){
			alert("수정할 행을 선택하세요!")
			
		}else {
			alert("수정은 하나의 행만 가능합니다!");
		}
	});
	
	
	// 삭제버튼
	$("#deleteButton").click(function(){
		
		var selectedCheckbox = $("input[name='selected']:checked");
		
		// 체크된 체크박스가 하나인 경우에만 수정 기능 작동
		if (selectedCheckbox.length === 0){
			alert("삭제할 행을 선택하세요!");
			
			// 선택안하면 submit을 막음
			event.preventDefault();
		}
		
	});
	
	
	// submit버튼 유효성
	$("#submitButton").click(function() {
		
		var form = $("#outOrderList");
		form.attr("method", "post");
		form.attr("action", "/client/regOutOrder");
		var clt_num = $("#clt_num").val();
		var pro_num = $("#pro_num").val();
		var oo_cnt = $("#oo_cnt").val();
		var oo_start_date = $("#oo_start_date").val();
		var oo_end_date = $("#oo_end_date").val();
		
			// 등록할 때
			if(pageStatus == "reg"){
			
				if(clt_num == null || clt_num == "") {
					$("#clt_num").focus();
					alert("거래처 코드를 입력하세요!");
					return;
				}
				if(pro_num == null || pro_num == "") {
					$("#pro_num").focus();
					alert("완제품 코드를 입력하세요!");
					return;
				}
				if(oo_cnt == null || oo_cnt == "") {
					$("#oo_cnt").focus();
					alert("주문량를 입력하세요!");
					return;
				}
				if(oo_start_date == null || oo_start_date == "") {
					$("#oo_start_date").focus();
					alert("수주일자를 입력하세요!");
					return;
				}
				
				if(oo_end_date == null || oo_end_date == "") {
					$("#oo_end_date").focus();
					alert("출하일자를 입력하세요!");
					return;
				}
			} //if문
		
			
			// 업데이트할 때
			if(pageStatus == "update"){
				if(oo_cnt == null || oo_cnt == "") {
					$("#oo_cnt").focus();
					alert("주문량를 입력하세요!");
					return;
				}
				if(oo_start_date == null || oo_start_date == "") {
					$("#oo_start_date").focus();
					alert("수주일자를 입력하세요!");
					return;
				}
				if(oo_end_date == null || oo_end_date == "") {
					$("#oo_end_date").focus();
					alert("출하일자를 입력하세요!");
					return;
				}
			} //if문
		
		
		form.submit();
	}); //submit버튼 유효성
	
	
	
	
	
	
	
	
	// 체크박스 선택 시 체크박스 개수 구하기
	function updateSelectedCheckboxCount() {
		var totalCheckboxes = $(".table-outOrderList td input[type='checkbox']").length;
		var selectedCheckboxes = $(".table-outOrderList td input[type='checkbox']:checked").length;
		$("#selectedCheckboxCount").text("전체 ("+selectedCheckboxes + '/' + totalCheckboxes+")");
	}
	
	
	// ------------- 팝업창
	// 거래처 코드 입력란 클릭 시 팝업창 열기
	$(document).on("click", "input[name='clt_num']", function() {
		var left = (screen.width - 600) / 2;
		var top = (screen.height - 680) / 2;
// 		// 창이 열릴 시 포커스를 없앰
// 		$("input").blur();
		window.open('/client/addPopup?txt=clt', 'popup', 'width=600, height=680, top=' + top + ', left=' + left + ', location=no, status=no, scrollbars=yes');
	});

	// 완제품 코드 입력란 클릭 시 팝업창 열기
	$(document).on("click", "input[name='pro_num']", function() {
		var left = (screen.width - 600) / 2;
		var top = (screen.height - 680) / 2;
// 		// 창이 열릴 시 포커스를 없앰
// 		$("input").blur();
		window.open('/client/addPopup?txt=pro', 'popup', 'width=600, height=680, top=' + top + ', left=' + left + ', location=no, status=no, scrollbars=yes');
	});
	
	
	$(".ooContract").click(function() {
		
		var oo_num = $(this).closest("tr").find('td:eq(1)').text();
			
		//alert(pro_id);
		
		var left = (screen.width - 800) / 2;
			var top = (screen.height - 400) / 2;
		window.open('/client/outOrderContract?oo_num='+oo_num+'', 'popup', 'width=800, height=400, top=' + top + ', left=' + left + ', location=no, status=no, scrollbars=yes');
	
	});
	
	// --------------------------------팝업창
	
	
	
	
	// 수주금액 계산
	$(document).on("input", "#oo_cnt", function() {
		
		var oo_cnt = parseInt($(this).val()); // oo_cnt의 값 가져오기
		var pro_price = parseInt($("#pro_price").val()); // pro_price의 값 가져오기
		
		var clt_cost = oo_cnt * pro_price * 1.2; // clt_cost 계산
		
		$("#clt_cost").val(clt_cost); // clt_cost의 값을 설정하여 표시
		
		
	});
	
	
}); //jQuery

// clt_cost 값 업데이트 함수
function updateCltCost() {
	var oo_cnt = parseInt($("#oo_cnt").val());
	var pro_price = parseInt($("#pro_price").val());
	var clt_cost = oo_cnt * pro_price * 1.2;
	$("#clt_cost").val(clt_cost);
}
</script>

<style>
.selected {
   background-color: #b3ccff;
}
</style>

<body>


<!-- http://localhost:8088/client/outOrderList -->
<!-- 검색칸 -->
<form method="get" name="search" action="" class="bg-light rounded p-3 m-3">
	
	<div class="row mb-3">
		<label for="ioSearch" class="col-sm-2 col-form-label"><b>수주일자</b></label>
			
			<div class="col-sm-2">
    			<div class="col-auto">
     			<input type="date" name="oo_start_date_1" class="form-control">
     			</div>
   			</div>
   			
   				<div class="col-auto">
   				~
   				</div>
   				
     		<div class="col-sm-2">
    			<div class="col-auto">
    				<input type="date" name="oo_start_date_2" class="form-control">
   				</div>
    		</div>
    		
   	</div>
   	
   	<div class="row mb-3">
   		<label for="ioSearch" class="col-sm-2 col-form-label"><b>출하(예정)일자</b></label>
   		
    		<div class="col-sm-2">
    			<div class="col-auto">
     				<input type="date" name="oo_end_date_1" class="form-control">
  				</div>
			</div>
   				
				<div class="col-auto">
   				~
   				</div>
   				
   			<div class="col-sm-2">
    			<div class="col-auto">
     				<input type="date" name="oo_end_date_2" class="form-control">
   				</div>
    		</div>
    		
   	</div>
	
	<div class="row mb-3">
		<label for="ioSearch" class="col-sm-2 col-form-label"><b>거래처명</b></label>
		<div class="col-sm-4">
			<input type="text" name="clt_name" value="${ovo.clt_name}" placeholder="거래처명을 입력하세요" class="form-control">
		</div>
	</div>
			
	<div class="row mb-3">
		<label for="ioSearch" class="col-sm-2 col-form-label"><b>담당자</b></label>
		<div class="col-sm-4">
			<input type="text" name="emp_name" value="${ovo.emp_name}" placeholder="담당자를 입력하세요" class="form-control">
		</div>
		
		<div class="col-auto">
			<button class="btn btn-primary m-3" type="submit" style="width:70px;">조회</button>
		</div>
	</div>		
</form>
<!-- 검색칸 -->
		
		<hr>
		
<form id="outOrderList" method="post">		
	<div class="d-flex align-items-center justify-content-between mb-2">             
		<h3 class="m-4">수주 목록</h3>
		<div>
			<c:if test="${(sessionScope.emp_dept eq '영업' && sessionScope.emp_auth == 2) || sessionScope.emp_auth == 3}">
				<button type="button" class="btn btn-primary m-2" id="addRowButton"><i class="fa fa-plus"></i> 추가</button>
				<button type="button" class="btn btn-primary m-2" id="cancelButton" disabled>X 취소</button>
				<button type="button" class="btn btn-primary m-2" id="updateButton"><i class="fa fa-edit"></i> 수정</button>
				<button type="submit" class="btn btn-primary m-2" id="deleteButton" formaction="deleteOutOrder" formmethod="post">
				<i class="fa fa-trash"></i> 삭제</button>
				<button type="button" class="btn btn-primary m-2" id="submitButton" disabled>
				<i class="fa fa-download"></i> 저장</button>
			</c:if>
		</div>
	</div>
	
	<div class="bg-light text-center rounded p-4 m-3">
		<div class="d-flex align-items-center justify-content-between mb-4">	
			<span id="selectedCheckboxCount">0</span>
		</div>
	
		<input type="hidden" name="pro_id" id="pro_id">
		<input type="hidden" name="clt_id" id="clt_id">
		
		<div class="table-responsive">	
			<table class="table-outOrderList table align-middle table-bordered table-hover mb-0">
					<tr>
						<th style="background-color: rgba(0,0,0,0.075);"><input type="checkbox" class="form-check-input"></th>
				    	<th style="background-color: rgba(0,0,0,0.075);">수주코드</th>
				    	<th style="background-color: rgba(0,0,0,0.075);">담당자</th>
				    	<th style="background-color: rgba(0,0,0,0.075);">거래처<br>코드</th>
				    	<th style="background-color: rgba(0,0,0,0.075);">거래처이름</th>
				    	<th style="background-color: rgba(0,0,0,0.075);">완제품<br>코드</th>
				    	<th style="background-color: rgba(0,0,0,0.075);">완제품명</th>
				    	<th style="background-color: rgba(0,0,0,0.075);">완제품<br>가격</th>
				    	<th style="background-color: rgba(0,0,0,0.075);">주문량</th>
				    	<th style="background-color: rgba(0,0,0,0.075);">수주금액</th>
				    	<th style="background-color: rgba(0,0,0,0.075);">수주일자</th>
				    	<th style="background-color: rgba(0,0,0,0.075);">출하일자</th>
				    	<th style="background-color: rgba(0,0,0,0.075);">진행상황</th>
				    	<th style="background-color: rgba(0,0,0,0.075);">등록일</th>
					</tr>
					
				  	<c:forEach var="outOrderList" items="${outOrderList }">
						<tr>
							<td><input type="checkbox" name="selected" value="${outOrderList.oo_num}" class="form-check-input"></td>
							
							<td><span class="ooContract"><a href="javascript:void(0);" class="ooContract">${outOrderList.oo_num}</a></span></td>
							
							<td>${outOrderList.emp_name}</td>
					
							<td>${outOrderList.clt_num}</td>
							<td>${outOrderList.clt_name}</td>
							<td>${outOrderList.pro_num}</td>
							<td>${outOrderList.pro_name}</td>
							<td>${outOrderList.pro_price}</td>
							<td>${outOrderList.oo_cnt}</td>



<%-- 			<c:choose> --%>
<%-- 				<c:when test="${outOrderList.clt_cost >= 10000}"> --%>
<%-- 					<td><fmt:formatNumber value="${outOrderList.clt_cost div 10000}" pattern="#,##0.#" />만</td> --%>
<%-- 				</c:when> --%>
<%-- 				<c:otherwise> --%>
							<td>${outOrderList.clt_cost}</td>
			
<%-- 				</c:otherwise> --%>
<%-- 			</c:choose> --%>


							<td>${fn:substring(outOrderList.oo_start_date, 0, 10)}</td>
							<td>${fn:substring(outOrderList.oo_end_date, 0, 10)}</td>
							<td>${outOrderList.oo_state}</td>
							<td>${fn:substring(outOrderList.oo_reg_date, 0, 10)}</td>
						</tr>
						<input type="hidden" class="original-value" value="${outOrderList.clt_cost}" />
					</c:forEach>
			</table>
		</div>
	</div>
</form>
	
	<!-- 페이징 버튼 -->
	<nav aria-label="Page navigation example">
		<ul class="pagination justify-content-center pagination-sm">
		
		<!-- 이전버튼 -->
		<c:if test="${pm.prev }">
			<li class="page-item">
			
			<c:choose>
				<c:when test="${not empty ovo.oo_start_date_1 || not empty ovo.oo_start_date_2 || not empty ovo.oo_end_date_1 || not empty ovo.oo_end_date_2 || not empty ovo.clt_name || not empty ovo.emp_name}">
				<a class="page-link"
				href="/client/outOrderList?page=${pm.startPage-1}&oo_start_date_1=${ovo.oo_start_date_1}&oo_start_date_2=${ovo.oo_start_date_2}&oo_end_date_1=${ovo.oo_end_date_1}&oo_end_date_2=${ovo.oo_end_date_2}&clt_name=${ovo.clt_name}&emp_name=${ovo.emp_name}" aria-label="Previous">
					<span aria-hidden="true">&laquo;</span>
				</a>
				</c:when>
				
				<c:otherwise>
				<a class="page-link"
				href="/client/outOrderList?page=${pm.startPage-1 }" aria-label="Previous">
					<span aria-hidden="true">&laquo;</span>
				</a>
				</c:otherwise>
			</c:choose>
				
			</li>
		</c:if>
		<!-- 이전버튼 -->
			
		<!-- 버튼 -->
		<c:forEach begin="${pm.startPage }" end="${pm.endPage}" step="1" var="idx">
		<li 
				<c:out value="${pm.pageVO.page == idx ? 'class=page-item active': 'class=page-item'}" />
			>
			
			<c:choose>
				<c:when test="${not empty ovo.oo_start_date_1 || not empty ovo.oo_start_date_2 || not empty ovo.oo_end_date_1 || not empty ovo.oo_end_date_2 || not empty ovo.clt_name || not empty ovo.emp_name}">
				<a class="page-link"
				href="/client/outOrderList?page=${idx}&oo_start_date_1=${ovo.oo_start_date_1}&oo_start_date_2=${ovo.oo_start_date_2}&oo_end_date_1=${ovo.oo_end_date_1}&oo_end_date_2=${ovo.oo_end_date_2}&clt_name=${ovo.clt_name}&emp_name=${ovo.emp_name}">${idx }</a>
				</c:when>
				
				<c:otherwise>
				<a class="page-link"
				href="/client/outOrderList?page=${idx}">${idx }</a>
				</c:otherwise>
			</c:choose>
				
		</li>
		</c:forEach>
		<!-- 버튼 -->
			
		<!-- 다음버튼 -->
		<c:if test="${pm.next && pm.endPage > 0}">
		<li class="page-item">
			
			<c:choose>
				<c:when test="${not empty ovo.oo_start_date_1 || not empty ovo.oo_start_date_2 || not empty ovo.oo_end_date_1 || not empty ovo.oo_end_date_2 || not empty ovo.clt_name || not empty ovo.emp_name}">
				<a class="page-link"
				href="/client/outOrderList?page=${pm.startPage-1}&oo_start_date_1=${ovo.oo_start_date_1}&oo_start_date_2=${ovo.oo_start_date_2}&oo_end_date_1=${ovo.oo_end_date_1}&oo_end_date_2=${ovo.oo_end_date_2}&clt_name=${ovo.clt_name}&emp_name=${ovo.emp_name}" aria-label="Next">
				<span aria-hidden="true">&raquo;</span>
				</a>
				</c:when>
				
				<c:otherwise>
				<a class="page-link"
				href="/client/outOrderList?page=${pm.endPage+1}" aria-label="Next">
				<span aria-hidden="true">&raquo;</span>
				</a>
				</c:otherwise>
			</c:choose>
			
		</li>
		</c:if>
		<!-- 다음버튼 -->
			
		</ul>
	</nav>
	<!-- 페이징 버튼 -->
	
	
</body>
</html>
<%@ include file="../inc/footer.jsp"%>