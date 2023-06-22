<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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

		'<td><input type="text" name="emp_id"></td>' +
		'<td><input type="text" name="clt_num" id="clt_num" readonly></td>' +
		'<td><input type="text" name="clt_name" id="clt_name" disabled></td>' +
		'<td><input type="text" name="pro_num" id="pro_num" readonly></td>' +
		'<td><input type="text" name="pro_name" id="pro_name" disabled></td>' +
		'<td><input type="text" name="oo_cnt"></td>' +
		'<td><input type="text" name="oo_start_date"></td>' +
		'<td><input type="text" name="oo_end_date"></td>' +
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
		$("#deleteOutOrderButton").attr("disabled", "disabled");
		
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
                  		<label>출하일자</label>
                  		<div>
	                   	<input type="date" name="oo_end_date_1">
                  			~
	                   	<input type="date" name="oo_end_date_2">
                  		</div>
                  	</div>
	       		<span>거래처명 :
	       			<input type="text" name="clt_id" placeholder="거래처명을 입력하세요">
	       		</span>
	       		<span>담당자 :
	       			<input type="text" name="emp_id" placeholder="담당자를 입력하세요">
	       		</span>
	       		
	      		<input type="submit" value="조회">
            	</form>
            </fieldset>  
             
	<h2>수주</h2>
	
	<form id="outOrderList">
	
	<input type="hidden" name="pro_id" id="pro_id">
	<input type="hidden" name="clt_id" id="clt_id">
	
	
	<input type="button" id="addRowButton" value="추가">
	<input type="button" id="cancleButton" value="취소" disabled="disabled">
	<input type="button" id="updateButton" value="수정">
	<input type="submit" id="deleteButton" value="삭제" formaction="deleteOutOrder" formmethod="post">
	<input type="submit" id="submitButton" value="저장" formaction="regOutOrder" formmethod="post" disabled="disabled">
	
	
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
	    	<th>출하일자</th>
	    	<th>진행상황</th>
		</tr>
	  	<c:forEach var="outOrderList" items="${outOrderList }">
		<tr>
			<td><input type="checkbox" name="selected" value="${outOrderList.oo_num}"></td>
	    	<td>${outOrderList.oo_num}</td>
	    	<td>${outOrderList.emp_id}</td>
	    	<td>${outOrderList.clt_id}</td>
	    	<td>(조인)</td>
	    	<td>${outOrderList.pro_id}</td>
	    	<td>${outOrderList.pro_id}</td>
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