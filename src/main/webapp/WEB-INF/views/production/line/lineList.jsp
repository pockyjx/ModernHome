<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ include file="../../inc/header.jsp"%>
<%@ include file="../../inc/sidebar.jsp"%>
<%@ include file="../../inc/nav.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/xlsx/0.17.1/xlsx.full.min.js"></script>
<script>
	var pageStatus = "";
	
	$(document).ready(function() {
		
		// 버튼 클릭 시 행 추가
		$("#addRowButton").click(function() {
			var newRow = '<tr>' +
						'<td><input type="checkbox" class="form-check-input"></td>' +
						'<td><input class="form-control" type="text" name="line_num" placeholder="(자동으로 부여)" style="border: none; background: transparent;" readonly></td>' +
						'<td><input class="form-control" type="text" name="line_name" id="line_name" placeholder="라인명"></td>' +
						'<td><input class="form-control" type="text" name="reg_date" style="border: none; background: transparent;" readonly></td>' +
						'<td><input class="form-control" type="text" name="emp_id" value="${sessionScope.emp_id}" style="border: none; background: transparent;" readonly></td>' +
						'<td>' +
						'<select class="form-control" name="use_yn" id="use_yn">' +
						'<option value="Y">Y</option>' +
						'<option value="N">N</option>' +
						'</select>' +
						'</td>' +
						'</tr>';
			
			// 첫번째 자식<tr> 뒤에서 부터 행을 추가함
			$(".table-lineList tr:nth-child(1)").after(newRow);
			
	           	// 추가버튼, 수정버튼 비활성화, 취소버튼 활성화
			$("#addRowButton").attr("disabled", "disabled");
			$("#deleteReceiveButton").attr("disabled", "disabled");
			
			$("#cancelButton").removeAttr("disabled");
			$("#submitButton").removeAttr("disabled");
			
			pageStatus = "reg";
		
		}); // addRowButton
		
		// 취소 버튼 누를 시 
		$("#cancelButton").click(function(){
				
			// 등록버튼 취소
			if(pageStatus == "reg"){
				// 두번째 tr (추가된 행)을 삭제함
				$(".table-lineList tr:nth-child(2)").remove();
				
				// 추가버튼, 수정버튼 활성화, 취소버튼 비활성화
				$("#addRowButton").removeAttr("disabled");
				$("#deleteButton").removeAttr("disabled");
				
				$("#cancelButton").attr("disabled", "disabled");
				$("#submitButton").attr("disabled", "disabled");
				
				pageStatus = "";
			}
			// 수정버튼 취소
			if(pageStatus == "update"){
				var row = $("input[name='line_id']:checked").closest("tr");
				// 모든행에 대해 반복작업, 테이블 이름에 맞게 수정
				$(".table-lineList tr").each(function() {
				var row = $(this);
				
				// 폼 초기화(기존내용으로)
// 				$("#lineList")[0].reset();
				
				// 각 셀의 값을 원래 상태로 되돌림
				row.find("td:not(:first-child)").each(function(index) {
					var cellValue = $(this).find("input").val();
					var cellValueSelect = $(this).find("select").val();
					
					$(this).html(cellValue);
					$(this).html(cellValueSelect);
				});
				
				// selected 클래스를 없앰 (css 없애기)
				$(".table-lineList tr").removeClass("selected");
				
				
				// 추가버튼, 수정버튼 활성화, 취소버튼 비활성화
				$("#addRowButton").removeAttr("disabled");
				$("#deleteButton").removeAttr("disabled");
				
				$("#cancelButton").attr("disabled", "disabled");
				$("#submitButton").attr("disabled", "disabled");
				
				pageStatus = "";
				
				});
			} // if(update)문
			
		}); // 취소버튼
		
		// 선택된 행 삭제 버튼 클릭 시 행 삭제
		$("#deleteRowsButton").click(function() {
			var selectedRows = $(".table-lineList tr.selected");
			selectedRows.remove();
		});

		//체크박스 선택 시 체크박스의 개수 구하기
		updateSelectedCheckboxCount();
		
		// <th> 쪽 체크박스 클릭 시 해당 열의 <td> 부분의 행들을 선택하고 배경색 지정
		$(".table-lineList th input[type='checkbox']").click(function() {
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
		$(".table-lineList td input[type='checkbox']").click(function() {
		var checkbox = $(this);
		var isChecked = checkbox.prop('checked');
		checkbox.closest('tr').toggleClass('selected', isChecked);
		});
			
			
		// <th> 쪽 체크박스 클릭 시 해당 열의 <td> 부분의 행들을 선택하고 배경색 지정
		$(".table-lineList th input[type='checkbox']").click(function() {
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
					$(this).toggleClass('selected', isChecked);
				}
			});
			
			updateSelectedCheckboxCount();
		});
	
		// <td> 쪽 체크박스 클릭 시 행 선택
		$(".table-lineList td input[type='checkbox']").click(function() {
			var checkbox = $(this);
			var isChecked = checkbox.prop('checked');
			checkbox.closest('tr').toggleClass('selected', isChecked);
			
			updateSelectedCheckboxCount(); 
		});
		
		function updateSelectedCheckboxCount() {
			var totalCheckboxes = $(".table-lineList td input[type='checkbox']").length;
			var selectedCheckboxes = $(".table-lineList td input[type='checkbox']:checked").length;
			$("#selectedCheckboxCount").text("전체 ("+selectedCheckboxes + '/' + totalCheckboxes+")");
		} // 체크박스 선택 시 체크박스 개수 구하기
		
		// submit버튼 유효성
		$("#submitButton").click(function() {
			
			var form = $("#lineList");
			form.attr("method", "post");
			form.attr("action", "/production/line/regLine");
			
			var line_name = $("#line_name").val();
			var use_yn = $("#use_yn").val();
			
			if(line_name == null || line_name == ""){
				$("#line_name").focus();
				alert("라인명을 입력하세요!");
				return false;
			}
			if(use_yn == null || use_yn == ""){
				$("#use_yn").focus();
				alert("사용여부를 입력하세요!");
				return false;
			}
			form.submit();
		}); // submit버튼 유효성
		
	});

	function updateButton(lineId, useYn) {
		var url = "/production/line/modifyPopup?line_id=" + lineId + "&use_yn=" + useYn;
		window.open(url, 'popup', 'width=400, height=400, top=300, left=650, location=no, status=no');
	}
	
	// 작업지시 코드 선택 시 팝업창 열기
	function lsPopup(lineId) {
		var left = (screen.width - 600) / 2;
		var top = (screen.height - 300) / 2;
		window.open('/production/line/lsPopup?line_id=' + lineId, 'popup', 
			'width=600, height=300, top=' + top + ', left=' + left + ', location=no, status=no, scrollbars=yes');
	}
</script>

<style>
	.selected { 
		background-color: #b3ccff; 
	} 
</style>

</head>
<body>
	
<form method="GET" name="search" class="bg-light rounded p-3 m-3">

	<div class="row mb-3">
		<label for="lineSearch" class="col-sm-2 col-form-label"><b>라인코드</b></label>
		<div class="col-sm-4">
			<input type="text" name="line_num" value="${line_name }" placeholder="라인코드를 입력하세요" class="form-control">
		</div>
	</div>
	<div class="row mb-3">
		<label for="lineSearch" class="col-sm-2 col-form-label"><b>라인명</b></label>
		<div class="col-sm-4">
			<input type="text" name="line_name" value="${line_name }" placeholder="라인명을 입력하세요" class="form-control">
		</div>
	</div>
	
	<div class="row mb-3">
		<label for="lineSearch" class="col-sm-2 col-form-label"><b>사용여부</b></label>
		<div class="col-sm-2">
			<select name="use_yn" class="form-select" style="background-color: #fff;">
				<option value="전체">전체</option>
				<option value="Y">가동</option>
				<option value="N">점검 중</option>
			</select>
		</div>
		<div class="col-auto">
			<button class="btn btn-primary m-3" type="submit" style="width:70px;">조회</button>
		</div>
	</div>
	
</form>

<hr>
	
<form id="lineList" method="post">
	<div class="d-flex align-items-center justify-content-between mb-2">
		<h3 class="m-4">생산 라인 관리</h3>
		<div>
			<c:if test="${(sessionScope.emp_dept eq '생산' && sessionScope.emp_auth >= '1') || sessionScope.emp_auth == '3'}">
				<button type="button" class="btn btn-primary m-2" id="addRowButton">
					<i class="fa fa-plus"></i> 추가</button>
				<button type="button" class="btn btn-primary m-2" id="cancelButton" disabled>X 취소</button>
<!-- 					<button type="button" class="btn btn-sm btn-primary m-2" id="updateButton"> -->
<!-- 						<i class="fa fa-edit"></i> 수정</button> -->
				<button type="submit" class="btn btn-primary m-2" id="deleteLineButton" formaction="deleteLine" formmethod="post">
					<i class="fa fa-trash"></i> 삭제</button>
<!-- 					<button type="button" class="btn btn-sm btn-primary m-2" id="submitButton" formaction="regLine" formmethod="post" disabled="disabled"> -->
<!-- 						<i class="fa fa-download"></i> 저장</button> -->
				<button type="button" class="btn btn-primary m-2" id="submitButton" disabled>
					<i class="fa fa-download"></i> 저장</button>
			</c:if>
		</div>
	</div>
	
	<div class="bg-light text-center rounded p-4 m-3">
		<div class="d-flex align-items-center justify-content-between mb-4">
			<span id="selectedCheckboxCount">0</span>
		</div>
		
		<div class="table-responsive">
			<table class="table-lineList table align-middle table-bordered table-hover mb-0">
			    <tr>
			        <th style="background-color: rgba(0,0,0,0.075);"><input type="checkbox" class="form-check-input"></th>
			        <th style="background-color: rgba(0,0,0,0.075);">라인코드</th>
			        <th style="background-color: rgba(0,0,0,0.075);">라인명</th>
			        <th style="background-color: rgba(0,0,0,0.075);">등록일</th>
			        <th style="background-color: rgba(0,0,0,0.075);">등록자</th>
			        <th style="background-color: rgba(0,0,0,0.075);">라인관리</th>
			    </tr>
			    
			    <c:forEach var="vo" items="${lineList}" varStatus="status">
			        <tr>
			            <td><input type="checkbox" name="selectedLineId" value="${vo.line_id}" class="form-check-input"></td>
			            <td><span onclick="lsPopup('${vo.line_id}');" class="text-primary">${vo.line_num}</span></td>
			            <td>${vo.line_name}</td>
			            <td>
							<c:if test="${!empty vo.update_date}">${fn:substring(vo.update_date, 0, 10)}</c:if>
							<c:if test="${empty vo.update_date}">${fn:substring(vo.reg_date, 0, 10)}</c:if>
						</td>
			            <td>${vo.emp_name}</td>
			            <td>
			            	<button class="${vo.use_yn == 'Y' ? 'btn btn-success m-2' : 'btn btn-danger m-2'}" onclick="updateButton('${vo.line_id}', '${vo.use_yn}'); return false;">
				            	${vo.use_yn == 'Y' ? "가동" : "점검 중"}</button>
			            </td>
			        </tr>
			    </c:forEach>
			</table>
		</div>
	</div>
</form>
	
</body>
</html>
<%@ include file="../../inc/footer.jsp"%>