<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
	
	
		<input type="button" id="addRowButton" value="추가">
		<input type="button" id="cancleButton" value="취소" disabled="disabled">
		<input type="button" id="updateButton" value="수정">
		<input type="submit" id="deleteButton" value="삭제" formaction="deleteShipment" formmethod="post">
		<input type="submit" id="submitButton" value="저장" formaction="regShipment" formmethod="post" disabled="disabled">
	
		
		
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