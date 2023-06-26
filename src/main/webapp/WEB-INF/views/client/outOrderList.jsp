<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ include file="../inc/header.jsp"%>
<%@ include file="../inc/sidebar.jsp"%>
<%@ include file="../inc/nav.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수주 관리</title>
</head>


<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>

var pageStatus = "";

$(document).ready(function() {

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
	});
	
	// <td> 쪽 체크박스 클릭 시 행 선택
	$(".table-outOrderList td input[type='checkbox']").click(function() {
		var checkbox = $(this);
		var isChecked = checkbox.prop('checked');
		checkbox.closest('tr').toggleClass('selected', isChecked);
	});
	
	// ------------------ 체크박스
	
	
	
		// 추가 버튼 클릭 시 행 추가
	// 추가버튼 1번 누르면 추가버튼 비활성화
	$("#addRowButton").click(function() {
		var newRow = '<tr>' +
		'<td><input type="checkbox"></td>' +
		'<td><input type="text" disabled="disabled" value="자동으로 부여"></td>' +

		'<td><input type="text" name="emp_id" value="' + '${sessionScope.emp_id}' + '" readonly></td>' +
		'<td><input type="text" name="clt_num" id="clt_num" readonly></td>' +
		'<td><input type="text" name="clt_name" id="clt_name" readonly placeholder="거래처코드를 선택해주세요"></td>' +
		'<td><input type="text" name="pro_num" id="pro_num" readonly></td>' +
		'<td><input type="text" name="pro_name" id="pro_name" readonly placeholder="완제품코드를 선택해주세요"></td>' +
		'<td><input type="text" name="oo_cnt" value=0></td>' +
		'<td><input type="date" name="oo_start_date"></td>' +
		'<td><input type="date" name="oo_end_date"></td>' +
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
		
		$("#cancleButton").removeAttr("disabled");
		$("#submitButton").removeAttr("disabled");
		
		pageStatus = "reg";
		
	}); // 여기까지 추가 버튼
	
	
	// 거래처 코드 입력란 클릭 시 팝업창 열기
	$(document).on("click", "input[name='clt_num']", function() {
		window.open('/client/addPopup?txt=clt', 'popup', 'width=600, height=500, location=no, status=no, scrollbars=yes');
	});

	// 완제품 코드 입력란 클릭 시 팝업창 열기
	$(document).on("click", "input[name='pro_num']", function() {
		window.open('/client/addPopup?txt=pro', 'popup', 'width=600, height=500, location=no, status=no, scrollbars=yes');
	});
	
	
    
	// 취소버튼
	$("#cancleButton").click(function(){
	
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
			
			$("#cancleButton").attr("disabled", "disabled");
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
			
			$("#cancleButton").attr("disabled", "disabled");
			$("#submitButton").attr("disabled", "disabled");
			
			
			pageStatus = "";
			
			});
		} // if(update)문
	
	}); // 취소버튼
	
	
	
	
	
    // 수정 버튼 누를 시
	$("#updateButton").click(function(){
		 
		var selectedCheckbox = $("input[name='selected']:checked");
		
		// 체크된 체크박스가 하나인 경우에만 수정 기능 작동
		if (selectedCheckbox.length === 1) {
			var empId = selectedCheckbox.val();
			var row = selectedCheckbox.closest("tr");
			
			// input type의 name 값 지정
			var cellNames = [
	            "oo_num",
	            "update_emp_id",
	            "clt_id",
	            "clt_name",
	            "pro_id",
	            "pro_name",
	            "oo_cnt",
	            "oo_update_date",
	            "oo_end_date",
	            "oo_state",
			];
			
			
			// 각 셀을 수정 가능한 텍스트 입력 필드로 변경
			row.find("td:not(:first-child)").each(function(index) {
				//
				var cellValue = $(this).text();
				var cellType = [7, 8].includes(index) ? "date" : "text"; // 날짜 타입은 date로 설정
				var cellReadonly = [0, 1, 2, 4].includes(index) ? "readonly='readonly'" : "";
				var cellName = cellNames[index];
				var cellDisabled = [2, 3, 4, 5].includes(index)? "disabled" : "";
				var cellContent;
				
				if (index === 9){
					cellContent = '<td>' +
					'<select name="' + cellName + '">' +
					'<option value="대기" ' + (cellValue === '대기' ? 'selected' : '') + '>대기</option>' +
					'<option value="진행중" ' + (cellValue === '진행중' ? 'selected' : '') + '>진행중</option>' +
					'<option value="완료" ' + (cellValue === '완료' ? 'selected' : '') + '>완료</option>' +
					'</select>' +
					'</td>';
				}else if (index === 1){
					cellContent = '<td><input type="' + cellType + '" name="' + cellName + '" value="' + ${sessionScope.emp_id} + '"' + cellReadonly + '></td>';
				}else {
					cellContent = '<td><input type="' + cellType + '" name="' + cellName + '" value="'
					+ cellValue + '"' + cellReadonly + ' ' + cellDisabled + '></td>';
				}
				
				
				// 기존 값을 임시 변수에 저장 -> 수정 후 취소버튼 시 담당자 칸에 세션값이 나오는 문제 해결위해
				$(this).data('prevValue', cellValue);
				
				
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
	});
	
	
}); //jQuery
</script>

<style>
.selected {
   background-color: #b3ccff;
}
</style>

<body>


<!-- http://localhost:8088/client/outOrderList -->

	<h2>수주 관리</h2>
		<fieldset>
              	<form name="search" method="get" action="">
                  	<div>
                  		<label>수주일자</label>
                  		<div>
	                   	<input type="date" name="oo_start_date_1">
                  			~
	                   	<input type="date" name="oo_start_date_2">
                  		</div>
                  	</div>
	       		<br>
	       		<div>
                  		<label>출하(예정)일자</label>
                  		<div>
	                   	<input type="date" name="oo_end_date_1">
                  			~
	                   	<input type="date" name="oo_end_date_2">
                  		</div>
                  	</div>
	       		<span>거래처명 :
	       			<input type="text" name="clt_name" placeholder="거래처명을 입력하세요">
	       		</span>
	       		<span>담당자 :
	       			<input type="text" name="emp_name" placeholder="담당자를 입력하세요">
	       		</span>
	       		
	      		<input type="submit" value="조회">
            	</form>
            </fieldset>  
             
	<h2>수주</h2>
	
	<form id="outOrderList">
	
	<input type="hidden" name="pro_id" id="pro_id">
	<input type="hidden" name="clt_id" id="clt_id">
	
	
<%-- 	<c:if test="${sessionScope.emp_dept eq '영업' && sessionScope.emp_auth == 2 || sessionScope.emp_auth == 3}"> --%>
	<button type="button" class="btn btn-primary m-2" id="addRowButton"><i class="fa fa-plus"></i> 추가</button>
	<button type="button" class="btn btn-primary m-2" id="cancleButton" disabled>X 취소</button>
	<button type="button" class="btn btn-primary m-2" id="updateButton"><i class="fa fa-edit"></i> 수정</button>
	<button type="submit" class="btn btn-primary m-2" id="deleteButton" formaction="deleteOutOrder" formmethod="post">
	<i class="fa fa-trash"></i> 삭제</button>
	<button type="submit" class="btn btn-primary m-2" id="submitButton" formaction="regOutOrder" formmethod="post" disabled>
	<i class="fa fa-download"></i> 저장</button>
<%-- 	</c:if> --%>
	
	
	<table class="table-outOrderList" border="1">
		<tr>
			<th><input type="checkbox"></th>
	    	<th>수주코드</th>
	    	<th>담당자</th>
	    	<th>거래처코드</th>
	    	<th>거래처이름</th>
	    	<th>완제품코드</th>
	    	<th>완제품명</th>
	    	<th>주문량</th>
	    	<th>수주일자</th>
	    	<th>출하예정일자</th>
	    	<th>진행상황</th>
		</tr>
	  	<c:forEach var="outOrderList" items="${outOrderList }">
		<tr>
			<td><input type="checkbox" name="selected" value="${outOrderList.oo_num}"></td>
			<td>${outOrderList.oo_num}</td>
			
			<td>${outOrderList.emp_name}</td>
	
			<td>${outOrderList.clt_num}</td>
			<td>${outOrderList.clt_name}</td>
			<td>${outOrderList.pro_num}</td>
			<td>${outOrderList.pro_name}</td>
			<td>${outOrderList.oo_cnt}</td>
			<td>${fn:substring(outOrderList.oo_start_date, 0, 10)}</td>
			<td>${fn:substring(outOrderList.oo_end_date, 0, 10)}</td>
			<td>${outOrderList.oo_state}</td>
		</tr>
		</c:forEach>
	</table>
	</form>
	
</body>
</html>

<%@ include file="../inc/footer.jsp"%>