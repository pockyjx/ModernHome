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
<title>출하 관리</title>
</head>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>

var pageStatus = "";

$(document).ready(function() {

	// <th> 쪽 체크박스 클릭 시 해당 열의 <td> 부분의 행들을 선택하고 배경색 지정
	$(".table-shipmentList th input[type='checkbox']").click(function() {
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
	$(".table-shipmentList td input[type='checkbox']").click(function() {
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

		'<td><input type="text" name="emp_id"></td>' +
		'<td><input type="text" name="clt_name" id="clt_name"></td>' +
		'<td><input type="text" name="pro_num" id="pro_num" readonly></td>' +
		'<td><input type="text" name="pro_name" id="pro_name" disabled></td>' +
		'<td><input type="text" name="shp_cnt"></td>' +
		'<td><input type="text" name="shp_date"></td>' +
		'</td>' +
		'</tr>';
		
		// 첫번째 자식<tr> 뒤에서 부터 행을 추가함
		$(".table-shipmentList tr:nth-child(1)").after(newRow);
		
		// 버튼 활성화, 비활성화
		$("#addRowButton").attr("disabled", "disabled");
		$("#updateButton").attr("disabled", "disabled");
		$("#deleteShipmentButton").attr("disabled", "disabled");
		
		$("#cancleButton").removeAttr("disabled");
		$("#submitButton").removeAttr("disabled");
		
		pageStatus = "reg";
		
	}); // 여기까지 추가 버튼
	
	
    // 거래처 코드 입력란 클릭 시 팝업창 열기
    $(document).on("click", "input[name='clt_name']", function() {
 	   window.open('/client/addPopup?txt=clt2', 'popup', 'width=600, height=500, location=no, status=no, scrollbars=yes');
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
			$(".table-shipmentList tr:nth-child(2)").remove();

			// 모든 체크박스의 체크 해제
			$(".table-shipmentList input[type='checkbox']").prop("checked", false);
			
			// selected 클래스를 없앰 (css 없애기)
			$(".table-shipmentList tr").removeClass("selected");
			
			
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
			$(".table-shipmentList tr").each(function() {
			var row = $(this);
			
			// 폼 초기화(기존내용으로)
			// 가져가서 쓰는 경우 폼에 이름 지정해줘야해요
			$("#shipmentList")[0].reset();
			
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
			$(".table-shipmentList tr").removeClass("selected");
			
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
	            "shp_num",
	            "update_emp_id",
	            "clt_id",
	            "pro_id",
	            "pro_name",
	            "shp_cnt",
	            "shp_date",
			];
			
			
			// 각 셀을 수정 가능한 텍스트 입력 필드로 변경
			row.find("td:not(:first-child)").each(function(index) {
				//
				var cellValue = $(this).text();
				var cellType = [6].includes(index) ? "date" : "text"; // 날짜 타입은 date로 설정
				var cellReadonly = [0, 1, 2, 4].includes(index) ? "readonly='readonly'" : "";
				var cellName = cellNames[index];
				var cellDisabled = [2, 3, 4].includes(index)? "disabled" : "";
				var cellContent;
				

				if (index === 1){
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

<!-- http://localhost:8088/client/shi	pmentList -->
<body>
		<h2>출하 관리</h2>
			<fieldset>
               	<form name="search" method="get" action="">
		       		<br>
		       		<div>
                   		<label>출하일자</label>
                   		<div>
		                   	<input type="date" name="startDate">
                   			~
		                   	<input type="date" name="endDate">
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
             
		<h2>출하</h2>
		
		<form id="shipmentList">
	
		<input type="hidden" name="pro_id" id="pro_id">
		<input type="hidden" name="clt_id" id="clt_id">
	
	
		<button type="button" class="btn btn-primary m-2" id="addRowButton"><i class="fa fa-plus"></i> 추가</button>
		<button type="button" class="btn btn-primary m-2" id="cancleButton" disabled>X 취소</button>
		<button type="button" class="btn btn-primary m-2" id="updateButton"><i class="fa fa-edit"></i> 수정</button>
		<button type="submit" class="btn btn-primary m-2" id="deleteButton" formaction="deleteShipment" formmethod="post">
		<i class="fa fa-trash"></i> 삭제</button>
		<button type="submit" class="btn btn-primary m-2" id="submitButton" formaction="regShipment" formmethod="post" disabled>
		<i class="fa fa-download"></i> 저장</button>
	
		
		
			<table class="table-shipmentList" border="1">
				<tr>
					<th><input type="checkbox"></th>
			    	<th>출하코드</th>
			    	<th>담당자</th>
			    	<th>거래처</th>
			    	<th>완제품코드</th>
			    	<th>완제품명</th>
			    	<th>출하량</th>
			    	<th>출하일자</th>
				</tr>
			  	<c:forEach var="shipmentList" items="${shipmentList }">
					<tr>
						<td><input type="checkbox" name="selected" value="${shipmentList.shp_num}"></td>
				    	<td>${shipmentList.shp_num}</td>
				    	<td>${shipmentList.emp_name}</td>
				    	<td>${shipmentList.clt_name}</td>
				    	<td>${shipmentList.pro_num}</td>
				    	<td>${shipmentList.pro_name}</td>
				    	<td>${shipmentList.shp_cnt}</td>
				    	<td>${fn:substring(shipmentList.shp_date, 0, 10)}</td>
				    </tr>
			    </c:forEach>
			</table>
		</form>
</body>
</html>

<%@ include file="../inc/footer.jsp"%>