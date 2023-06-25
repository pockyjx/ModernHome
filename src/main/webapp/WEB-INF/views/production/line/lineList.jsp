<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../inc/header.jsp"%>
<%@ include file="../../inc/sidebar.jsp"%>
<%@ include file="../../inc/nav.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/xlsx/0.17.1/xlsx.full.min.js"></script>
    <script>
        $(document).ready(function() {
            // 버튼 클릭 시 행 추가
            $("#addRowButton").click(function() {
                var newRow = '<tr>' +
                    '<td><input type="checkbox"></td>' +
                    '<td><input type="text" name="line_num"></td>' +
                    '<td><input type="text" name="line_name"></td>' +
                    '<td>' +
                    '<select name="use_yn">' +
                    '<option value="Y">Y</option>' +
                    '<option value="N">N</option>' +
                    '</select>' +
                    '</td>' +
                    '<td><input type="text" name="reg_date"></td>' +
                    '<td><input type="text" name="emp_id"></td>' +
                    '</tr>';
                    
				// 첫번째 자식<tr> 뒤에서 부터 행을 추가함
				$(".table-lineList tr:nth-child(1)").after(newRow);
				
				// 추가버튼, 수정버튼 비활성화, 취소버튼 활성화
				$("#addRowButton").attr("disabled", "disabled");
				$("#updateButton").attr("disabled", "disabled");
				
				$("#cancleButton").removeAttr("disabled");
				$("#submitButton").removeAttr("disabled");
				
				pageStatus = "reg";
				
            }); // addRowButton
            
            
            // 취소 버튼 누를 시 
			$("#cancleButton").click(function(){
				
				// 등록버튼 취소
				if(pageStatus == "reg"){
					// 두번째 tr (추가된 행)을 삭제함
					$(".table-lineList tr:nth-child(2)").remove();
					
					// 추가버튼, 수정버튼 활성화, 취소버튼 비활성화
					$("#addRowButton").removeAttr("disabled");
					$("#updateButton").removeAttr("disabled");
					$("#cancleButton").attr("disabled", "disabled");
					$("#submitButton").attr("disabled", "disabled");
					
					pageStatus = "";
				}
				// 수정버튼 취소
				if(pageStatus == "update"){
					
					//
					var row = $("input[name='selectedEmpId']:checked").closest("tr");
					
					// 각 셀의 값을 원래 상태로 되돌림
					row.find("td:not(:first-child)").each(function(index) {
						var cellValue = $(this).find("input").val();
						$(this).html(cellValue);
					});
					
					// 추가버튼, 수정버튼 활성화, 취소버튼 비활성화
					$("#addRowButton").removeAttr("disabled");
					$("#updateButton").removeAttr("disabled");
					
					$("#cancleButton").attr("disabled", "disabled");
					$("#submitButton").attr("disabled", "disabled");
					
					
					pageStatus = "";
					
				}
			
			});
            
            
            // 수정 버튼 누를 시
			$("#updateButton").click(function(){
				var selectedCheckbox = $("input[name='selectedEmpId']:checked");
				
				// 체크된 체크박스가 하나인 경우에만 수정 기능 작동
				if (selectedCheckbox.length === 1) {
					var empId = selectedCheckbox.val();
					var row = selectedCheckbox.closest("tr");
					
					// input type의 name 값 지정
					var cellNames = [
			            "line_num",
			            "line_name",
			            "use_yn",
			            "reg_date",
			            "emp_id"

					];
					
					
					// 각 셀을 수정 가능한 텍스트 입력 필드로 변경
					row.find("td:not(:first-child)").each(function(index) {
						//
						var cellValue = $(this).text();
						var cellType = index === 3 ? "date" : "text"; // 날짜 타입은 date로 설정
						var cellName = cellNames[index];
						
						$(this).html('<input type="' + cellType + '" name="' + cellName + '" value="' + cellValue + '">');
						
						$("#updateButton").attr("disabled", "disabled");
						$("#addRowButton").attr("disabled", "disabled");
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
            
            // 체크박스 클릭 시 선택된 행 삭제
            $(".table-lineList").on("click", "td input[type='checkbox']", function() {
                var checkbox = $(this);
                if (checkbox.prop("checked")) {
                    checkbox.closest("tr").addClass("selected");
                } else {
                    checkbox.closest("tr").removeClass("selected");
                }
            });

//             // 선택된 행 삭제 버튼 클릭 시 행 삭제
//             $("#deleteRowsButton").click(function() {
//                 var selectedRows = $(".table-lineList tr.selected");
//                 selectedRows.remove();
//             });
	
			// 체크박스 선택 시 체크박스의 개수 구하기
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
	     
	      
	        });
    </script>
    
	<style>
		.selected { 
             background-color: #b3ccff; 
         } 
	</style>
	
</head>
<body>
	
	<h1>line list.jsp</h1>
	
	<h2>라인 정보 관리</h2>
	
	<form action="" method="GET" >
	라인코드 <input type="text" name="line_num">
	라인명 <input type="text" name="line_name">
	사용여부
		<select name="use_yn">
			<option>전체</option>
			<option>Y</option>
			<option>N</option>
		</select>
		<input type="submit" value="조회">
	</form>
	
	<form>
		<span id="selectedCheckboxCount">0</span>
		
		<input type="button" id="addRowButton" value="추가">
		<input type="button" id="cancleButton" value="취소" disabled="disabled">
		<input type="button" id="updateButton" value="수정">
		<input type="submit" id="deleteLineButton" value="삭제" formaction="deleteLine" formmethod="post">
		
		<input type="submit" id="submitButton" value="저장" formaction="regLine" formmethod="post" disabled="disabled">
		
		<table class="table-lineList" border="1">
		    <tr>
		        <th><input type="checkbox"></th>
		        <th>라인코드</th>
		        <th>라인명</th>
		        <th>사용여부</th>
		        <th>등록일</th>
		        <th>등록자</th>
		    </tr>
		    <c:forEach var="vo" items="${lineList}">
		        <tr>
		            <td><input type="checkbox" name="selectedEmpId" value="${vo.emp_id}"></td>
		            <td>${vo.line_num}</td>
		            <td>${vo.line_name}</td>
		            <td>${vo.use_yn}</td>
		            <td>${fn:substring(vo.reg_date, 0, 10)}</td>
		            <td>${vo.emp_id}</td>
		        </tr>
		    </c:forEach>
		</table>
	</form>

	
</body>
</html>
<%@ include file="../../inc/footer.jsp"%>