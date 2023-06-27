<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../inc/header.jsp"%>
<%@ include file="../inc/sidebar.jsp"%>
<%@ include file="../inc/nav.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
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

	// 추가 버튼 클릭 시 행 추가
	// 추가버튼 1번 누르면 추가버튼 비활성화
	$("#addRowButton").click(function() {
		var newRow = '<tr>' +
		'<td><input type="checkbox"></td>' +
		'<td><input type="text" disabled="disabled" value="자동으로 부여"></td>' +
		'<td>' +
			'<select name="clt_sort">' +
			'<option value="수주">수주</option>' +
			'<option value="발주">발주</option>' +
			'</select>' +
		'</td>' +
		'<td><input type="text" name="clt_name"></td>' +
		'<td><input type="text" name="clt_rep"></td>' +
		'<td><input type="text" name="clt_tel"></td>' +
		'<td><input type="text" name="clt_adr"></td>' +
		'<td><input type="text" name="clt_post"></td>' +
		'<td><input type="email" name="clt_email"></td>' +
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
		
	}); // 여기까지 추가 버튼
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
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
	});

	// <td> 쪽 체크박스 클릭 시 행 선택
	$(".table-clientList td input[type='checkbox']").click(function() {
		var checkbox = $(this);
		var isChecked = checkbox.prop('checked');
		checkbox.closest('tr').toggleClass('selected', isChecked);
	});
	
	
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
				var cellReadonly = [].includes(index) ? "readonly='readonly'" : "";
				var cellName = cellNames[index];
				var cellDisabled = [].includes(index)? "disabled" : "";
				var cellContent;
				
				
					cellContent = '<td><input type="' + cellType + '" name="' + cellName + '" value="'
					+ cellValue + '"' + cellReadonly + ' ' + cellDisabled + '></td>';
				
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
	
	
	
	
	
	
	
	
}); // jQuery
	
</script>




	<h1>거래처조회</h1>
<!-- 	http://localhost:8088/client/clientList -->
	<form action="" method="GET">
	상호명 <input type="text" name="clt_name">
	대표자 <input type="text" name="clt_rep">
	
<span>업종유형
  <!-- 체크박스 요소 - 수주 -->
  <input type="checkbox" name="clt_sort" value="수주" ${param.clt_sort == '수주' ? 'checked' : ''}
    onclick="handleCheckbox(this, '수주')">수주

  <!-- 체크박스 요소 - 발주 -->
  <input type="checkbox" name="clt_sort" value="발주" ${param.clt_sort == '발주' ? 'checked' : ''}
    onclick="handleCheckbox(this, '발주')">발주
</span>

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

			
	<input type="submit" value="조회">
	</form>
		
		
		
	<form id="clientList">
	
	<button type="button" class="btn btn-primary m-2" id="addRowButton"><i class="fa fa-plus"></i> 추가</button>
	<button type="button" class="btn btn-primary m-2" id="cancleButton" disabled>X 취소</button>
	<button type="button" class="btn btn-primary m-2" id="updateButton"><i class="fa fa-edit"></i> 수정</button>
	<button type="submit" class="btn btn-primary m-2" id="deleteButton" formaction="deleteClient" formmethod="post">
	<i class="fa fa-trash"></i> 삭제</button>
	<button type="submit" class="btn btn-primary m-2" id="submitButton" formaction="regClient" formmethod="post" disabled>
	<i class="fa fa-download"></i> 저장</button>
	
	<table class="table-clientList" border="1">
		<tr>
			<th><input type="checkbox"></th>
			<th>거래처코드</th>
			<th>구분</th>
			<th>상호명</th>
			<th>대표자</th>
			<th>연락처</th>
			<th>주소지</th>
			<th>우편번호</th>
			<th>이메일</th>
		</tr>
		<c:forEach var="clientList" items="${clientList }">
		<tr>
			<td><input type="checkbox" name="selectedCltId" value="${clientList.clt_num}"></td>
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
	
	</form>
	
	<!-- 페이지 이동 버튼 -->
	
	<nav aria-label="Page navigation example">
  		<ul class="pagination justify-content-center pagination-sm">
  		
  			<c:if test="${pm.prev }">
			<li class="page-item">
				<a class="page-link" href="/client/clientList?page=${pm.startPage-1 }&clt_num=${clientList.clt_num}&clt_name=${clientVO.clt_name}" aria-label="Previous">
       			<span aria-hidden="true">&laquo;</span>
      			</a>
    		</li>
    		</c:if>
    		
    		<c:forEach begin="${pm.startPage }" end="${pm.endPage }" step="1" var="idx">
    		<li 
    			<c:out value="${pm.pageVO.page == idx ? 'class=page-item active': 'class=page-item'}" />
    		>
    				<a class="page-link" href="/client/clientList?page=${idx}&clt_num=${clientVO.clt_num}&clt_name=${clientVO.clt_name}">${idx }</a>
    		</li>
    		</c:forEach>
			
			<c:if test="${pm.next && pm.endPage > 0}">
			<li class="page-item">
      			<a class="page-link" href="/client/clientList?page=${pm.endPage+1 }&clt_num=${clientVO.clt_num}&clt_name=${clientVO.clt_name}" aria-label="Next">
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