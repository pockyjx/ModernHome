<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ include file="../inc/header.jsp"%>
<%@ include file="../inc/sidebar.jsp"%>
<%@ include file="../inc/nav.jsp"%>

<style>
	.selected {
	background-color: #b3ccff;
	}
</style>
<body>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>

	var pageStatus = "";
	
	

	$(document).ready(function(){
		
		updateSelectedCheckboxCount();

		// <th> 쪽 체크박스 클릭 시 해당 열의 <td> 부분의 행들을 선택하고 배경색 지정
		$(".table-clientList th input[type='checkbox']").click(function() {
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
		$(".table-clientList td input[type='checkbox']").click(function() {
			var checkbox = $(this);
			var isChecked = checkbox.prop('checked');
			checkbox.closest('tr').toggleClass('selected', isChecked);
			
			updateSelectedCheckboxCount();
		});

	// 추가 버튼 클릭 시 행 추가
	// 추가버튼 1번 누르면 추가버튼 비활성화
	$("#addRowButton").click(function() {
		var newRow = '<tr>' +
		'<td><input type="checkbox" class="form-check-input"></td>' +
		'<td><input type="text" disabled="disabled" value="(자동으로 부여)" style="border: none; background: transparent;"></td>' +
		'<td>' +
			'<select name="clt_sort">' +
			'<option value="수주">수주</option>' +
			'<option value="발주">발주</option>' +
			'</select>' +
		'</td>' +
		'<td><input type="text" id="clt_name" name="clt_name" placeholder="상호명을 입력하세요"></td>' +
		'<td><input type="text" id="clt_rep" name="clt_rep" placeholder="대표자를 입력하세요"></td>' +
		'<td><input type="text" id="tel" name="clt_tel" placeholder="연락처를 입력하세요"></td>' +
		'<td><input type="text" id="clt_adr" name="clt_adr" placeholder="주소지를 입력하세요"></td>' +
		'<td><input type="number" id="clt_post" name="clt_post" placeholder="우편번호를 입력하세요"></td>' +
		'<td><input type="email" name="clt_email" placeholder="이메일을 입력하세요"></td>' +
		'</tr>';
		
		// 첫번째 자식<tr> 뒤에서 부터 행을 추가함
		$(".table-clientList tr:nth-child(1)").after(newRow);
		
		// 버튼 활성화, 비활성화
		$("#addRowButton").attr("disabled", "disabled");
		$("#updateButton").attr("disabled", "disabled");
		$("#deleteClientButton").attr("disabled", "disabled");
		
		$("#cancleButton").removeAttr("disabled");
		$("#submitButton").removeAttr("disabled");
		
		pageStatus = "reg";
		
		updateSelectedCheckboxCount();
		
	}); // 여기까지 추가 버튼
	


	
	
	 // 취소버튼
	$("#cancleButton").click(function(){
	
		// 등록버튼 취소
		if(pageStatus == "reg"){
			// 두번째 tr (추가된 행)을 삭제함
			$(".table-clientList tr:nth-child(2)").remove();
			
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
			$(".table-clientList tr").each(function() {
			var row = $(this);
			
			// 폼 초기화(기존내용으로)
			// 가져가서 쓰는 경우 폼에 이름 지정해줘야해요
			$("#clientList")[0].reset();
			
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
			$(".table-clientList tr").removeClass("selected");
			
			// 추가버튼, 수정버튼 활성화, 취소버튼 비활성화
			$("#addRowButton").removeAttr("disabled");
			$("#updateButton").removeAttr("disabled");
			$("#deleteClientButton").removeAttr("disabled");
			
			$("#cancleButton").attr("disabled", "disabled");
			$("#submitButton").attr("disabled", "disabled");
			
			
			pageStatus = "";
			
			});
		} // if(update)문
	
		updateSelectedCheckboxCount();
	}); // 취소버튼
	
	
	
	
	
    // 수정 버튼 누를 시
	$("#updateButton").click(function(){
		var selectedCheckbox = $("input[name='selectedCltId']:checked");
		
		// 체크된 체크박스가 하나인 경우에만 수정 기능 작동
		if (selectedCheckbox.length === 1) {
			var cltnum = selectedCheckbox.val();
			var row = selectedCheckbox.closest("tr");
			
			// input type의 name 값 지정
			var cellNames = [
				"clt_num",
	            "clt_sort",
	            "clt_name",
	            "clt_rep",
	            "clt_tel",
	            "clt_adr",
	            "clt_post",
	            "clt_email",
			];
			
			
			// 각 셀을 수정 가능한 텍스트 입력 필드로 변경
			row.find("td:not(:first-child)").each(function(index) {
				//
				var cellValue = $(this).text();
				var cellType = [].includes(index) ? "date" : "text"; // 날짜 타입은 date로 설정
				var cellReadonly = [0].includes(index) ? "readonly='readonly'" : "";
				var cellName = cellNames[index];
				var cellDisabled = [].includes(index)? "disabled" : "";
				var cellContent;
				
				
				
				
					if (index === 1){
						cellContent = '<td>' +
						'<select name="' + cellName + '">' +
						'<option value="수주" ' + (cellValue === '수주' ? 'selected' : '') + '>수주</option>' +
						'<option value="발주" ' + (cellValue === '발주' ? 'selected' : '') + '>발주</option>' +
						'</select>' +
						'</td>';
						}else if (index === 4){
							cellContent = '<td><input type="' + cellType + '" id="tel" name="' + cellName + '" value="' + cellValue + '"' + cellReadonly + '></td>';
						}else {cellContent = '<td><input type="' + cellType + '" name="' + cellName + '" id="' + cellName + '"' +  '" value="'
							+ cellValue + '"' + cellReadonly + ' ' + cellDisabled + '></td>';
						}
					
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
			alert("수정할 행을 선택하세요!")
			
		}else {
			alert("수정은 하나의 행만 가능합니다!");
		}
	});
	
	  // 삭제 버튼 누를 시
	  $("#deleteButton").click(function(){
		var selectedCheckbox = $("input[name='selectedCltId']:checked");
		
		// 체크된 체크박스가 하나인 경우에만 수정 기능 작동
		if (selectedCheckbox.length === 0) {
			alert("삭제할 행을 선택하세요!")
		}
	});
	  
	// submit버튼 유효성
		$("#submitButton").click(function() {
			
			var form = $("#clientList");
			form.attr("method", "post");
			form.attr("action", "/client/regClient");
			var clt_name = $("#clt_name").val();
			var clt_rep = $("#clt_rep").val();
			var clt_tel = $("#tel").val();
			var clt_adr = $("#clt_adr").val();
			var clt_post = $("#clt_post").val();
			
				// 등록할 때
				if(pageStatus == "reg"){
				
					if(clt_name == null || clt_name == "") {
						$("#clt_name").focus();
						alert("거래처명을 입력하세요!");
						return;
					}
					if(clt_rep == null || clt_rep == "") {
						$("#clt_rep").focus();
						alert("대표자 이름을 입력하세요!");
						return;
					}
					if(clt_tel == null || clt_tel == "") {
						$("#tel").focus();
						alert("전화번호를 입력하세요!");
						return;
					}
					if(clt_adr == null || clt_adr == "") {
						$("#clt_adr").focus();
						alert("주소를 입력하세요!");
						return;
						}
					if(clt_post == null || clt_post == "") {
						$("#clt_post").focus();
						alert("우편번호를 입력하세요!");
						return;
						}
				} //if문
			
				
				// 업데이트할 때
				if(pageStatus == "update"){
					if(clt_name == null || clt_name == "") {
						$("#clt_name").focus();
						alert("거래처명을 입력하세요!");
						return;
					}
					if(clt_rep == null || clt_rep == "") {
						$("#clt_rep").focus();
						alert("대표자 이름을 입력하세요!");
						return;
					}
					if(clt_tel == null || clt_tel == "") {
						$("#tel").focus();
						alert("전화번호를 입력하세요!");
						return;
					}
					if(clt_adr == null || clt_adr == "") {
						$("#clt_adr").focus();
						alert("주소를 입력하세요!");
						return;
						}
					if(clt_post == null || clt_post == "") {
						$("#clt_post").focus();
						alert("우편번호를 입력하세요!");
						return;
						}
				} //if문
			
			
			form.submit();
		}); //submit버튼 유효성
		
		
	  
	  
	  
	  

	
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
	
	
	
	// 체크박스 선택 시 체크박스 개수 구하기
	function updateSelectedCheckboxCount() {
		var totalCheckboxes = $(".table-clientList td input[type='checkbox']").length;
		var selectedCheckboxes = $(".table-clientList td input[type='checkbox']:checked").length;
		$("#selectedCheckboxCount").text("전체 ("+selectedCheckboxes + '/' + totalCheckboxes+")");
	}
	
	
	
	
	
}); // jQuery
	
</script>


<!-- 	http://localhost:8088/client/clientList -->
<form action="" name="search"  method="GET" class="bg-light rounded p-3 m-3">
	<div class="row mb-3">
		<label for="ioSearch" class="col-sm-2 col-form-label"><b>업종유형</b></label>
		
		<!-- 체크박스 요소 - 수주 -->
		<div class="col-sm-2">
			<input type="checkbox" name="clt_sort" value="수주" ${param.clt_sort == '수주' ? 'checked' : ''}
	    	onclick="handleCheckbox(this, '수주')" class="form-check-input"> 수주
    	</div>
	
	  	<!-- 체크박스 요소 - 발주 -->
	  	<div class="col-sm-2">
	  	<input type="checkbox" name="clt_sort" value="발주" ${param.clt_sort == '발주' ? 'checked' : ''}
	    onclick="handleCheckbox(this, '발주')" class="form-check-input"> 발주
	    </div>	     
	</div>
	
	<div class="row mb-3">
		<label for="ioSearch" class="col-sm-2 col-form-label"><b>상호명</b></label>
		<div class="col-sm-4">
			<input type="text" name="clt_name" value="${clt_name}" placeholder="상호명을 입력하세요" class="form-control">
		</div>	     
	</div>
	
	<div class="row mb-3">
		<label for="ioSearch" class="col-sm-2 col-form-label"><b>대표자</b></label>
		<div class="col-sm-4">
			<input type="text" name="clt_rep" value="${clt_rep}" placeholder="대표자를 입력하세요" class="form-control">
		</div>
	

<script>
  /**
   * 체크박스 클릭 이벤트 핸들러 함수
   * @param {HTMLInputElement} checkbox - 클릭된 체크박스 요소
   * @param {string} value - 클릭된 체크박스의 값
   */
  function handleCheckbox(checkbox, value) {
    const checkboxes = document.getElementsByName('clt_sort');

    // 다른 체크박스 중에서 선택된 체크박스를 제외하고 체크 해제
    checkboxes.forEach(function(cb) {
      if (cb !== checkbox && cb.checked) {
        cb.checked = false;
      }
    });
  }
   
   
</script>


			
		<div class="col-auto">
				<button class="btn btn-primary m-3" type="submit" style="width:70px;">조회</button>
		</div>
	</div>
</form>
		
	<hr>	

<form id="clientList" method="post">		
	<div class="d-flex align-items-center justify-content-between mb-2">
		<h3 class="m-4">거래처 목록</h3>
		<div>
			<c:if test="${(sessionScope.emp_dept eq '영업' && sessionScope.emp_auth >= 1) || sessionScope.emp_auth == 3}">
				<button type="button" class="btn btn-primary m-2" id="addRowButton">
					<i class="fa fa-plus"></i> 추가</button>	
				<button type="button" class="btn btn-primary m-2" id="cancleButton" disabled>X 취소</button>
				<button type="button" class="btn btn-primary m-2" id="updateButton">
	    			<i class="fa fa-edit"></i> 수정</button>	
				<button type="submit" class="btn btn-primary m-2" id="deleteButton" formaction="deleteClient" formmethod="post">
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
		
		<div class="table-responsive">
			<table class="table-clientList table align-middle table-bordered table-hover mb-0">
				<tr>
					<th style="background-color: rgba(0,0,0,0.075);"><input type="checkbox" class="form-check-input"></th>
					<th style="background-color: rgba(0,0,0,0.075);">거래처코드</th>
					<th style="background-color: rgba(0,0,0,0.075);">구분</th>
					<th style="background-color: rgba(0,0,0,0.075);">상호명</th>
					<th style="background-color: rgba(0,0,0,0.075);">대표자</th>
					<th style="background-color: rgba(0,0,0,0.075);">연락처</th>
					<th style="background-color: rgba(0,0,0,0.075);">주소지</th>
					<th style="background-color: rgba(0,0,0,0.075);">우편번호</th>
					<th style="background-color: rgba(0,0,0,0.075);">이메일</th>
				</tr>
				
				<c:forEach var="clientList" items="${clientList }">
				<tr>
					<td><input type="checkbox" name="selectedCltId" value="${clientList.clt_num}" class="form-check-input"></td>
					<td>${clientList.clt_num }</td>
					<td>${clientList.clt_sort }</td>	
					<td>${clientList.clt_name }</td>
					<td>${clientList.clt_rep }</td>
					<td>${clientList.clt_tel }</td>
					<td>${clientList.clt_adr }</td>
					<td>${clientList.clt_post }</td>
					<td>${clientList.clt_email }</td>
				</tr>
				</c:forEach>
			</table>
		</div>
	</div>	
</form>
	
	
	<!-- 페이지 이동 버튼 -->
	<nav aria-label="Page navigation example">
  		<ul class="pagination justify-content-center pagination-sm">
  		
  			<c:if test="${pm.prev }">
			<li class="page-item">
				<a class="page-link" href="/client/clientList?page=${pm.startPage-1 }&clt_name=${cvo.clt_name}&clt_rep=${cvo.clt_rep}&clt_sort=${cvo.clt_sort}" aria-label="Previous">
       			<span aria-hidden="true">&laquo;</span>
      			</a>
    		</li>
    		</c:if>
    		
    		<c:forEach begin="${pm.startPage }" end="${pm.endPage }" step="1" var="idx">
    		<li 
    			<c:out value="${pm.pageVO.page == idx ? 'class=page-item active': 'class=page-item'}" />
    		>
    				<a class="page-link" href="/client/clientList?page=${idx}&clt_name=${cvo.clt_name}&clt_rep=${cvo.clt_rep}&clt_sort=${cvo.clt_sort}">${idx }</a>
    		</li>
    		</c:forEach>
			
			<c:if test="${pm.next && pm.endPage > 0}">
			<li class="page-item">
      			<a class="page-link" href="/client/clientList?page=${pm.endPage+1 }&clt_name=${cvo.clt_name}&clt_rep=${cvo.clt_rep}&clt_sort=${cvo.clt_sort}" aria-label="Next">
        		<span aria-hidden="true">&raquo;</span>
      			</a>
    		</li>
    		</c:if>
    		
  		</ul>
	</nav>
	<!-- 페이지 이동 버튼 -->
	


</body>
</html>
<%@ include file="../inc/footer.jsp"%>