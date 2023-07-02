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
                   '<td><input type="text" class="form-control" type="text" name="line_num" placeholder="자동으로 부여" style="border: none; background: transparent;" readonly></td>' +
                   '<td><input type="text" class="form-control" type="text" name="line_name"></td>' +
                   '<td>' +
                   '<select type="text" class="form-control" name="use_yn">' +
                   '<option value="Y">Y</option>' +
                   '<option value="N">N</option>' +
                   '</select>' +
                   '</td>' +
                   '<td><input type="text" class="form-control" type="text" name="reg_date" style="border: none; background: transparent;" readonly></td>' +
                   '<td><input type="text" class="form-control" type="text" name="emp_id" placeholder="담당자" value="${sessionScope.emp_id }" style="border: none; background: transparent;" readonly></td>' +
                   '</tr>';
                   
			// 첫번째 자식<tr> 뒤에서 부터 행을 추가함
			$(".table-lineList tr:nth-child(1)").after(newRow);
			
            	// 버튼 활성화, 비활성화
			$("#addRowButton").attr("disabled", "disabled");
			$("#updateButton").attr("disabled", "disabled");
			$("#deleteReceiveButton").attr("disabled", "disabled");
			
			$("#cancelButton").removeAttr("disabled");
			$("#submitButton").removeAttr("disabled");
			
			pageStatus = "reg";
			
		}); // addRowButton
            
   
            
//             // 체크박스 클릭 시 선택된 행 삭제
//             $(".table-lineList").on("click", "td input[type='checkbox']", function() {
//                 var checkbox = $(this);
//                 if (checkbox.prop("checked")) {
//                     checkbox.closest("tr").addClass("selected");
//                 } else {
//                     checkbox.closest("tr").removeClass("selected");
//                 }
//             });
            
            
         	// 취소 버튼 누를 시 
			$("#cancelButton").click(function(){
				
				// 등록버튼 취소
				if(pageStatus == "reg"){
					
					// 두번째 tr (추가된 행)을 삭제함
					$(".table-lineList tr:nth-child(2)").remove();
					
					// 모든 체크박스의 체크 해제
					$(".table-lineList input[type='checkbox']").prop("checked", false);
					
					// 추가버튼, 수정버튼 활성화, 취소버튼 비활성화
					$("#addRowButton").removeAttr("disabled");
					$("#updateButton").removeAttr("disabled");
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
// 					$("#lineList")[0].reset();
					
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
					$("#updateButton").removeAttr("disabled");
					$("#deleteButton").removeAttr("disabled");
					
					$("#cancelButton").attr("disabled", "disabled");
					$("#submitButton").attr("disabled", "disabled");
					
					pageStatus = "";
					
					});
				} // if(update)문
			
			}); // 취소버튼
            
			// 수정 버튼 누를 시
			$("#updateButton").click(function() {
			    var selectedCheckbox = $("input[name='selectedLineId']:checked");

			    // 체크된 체크박스가 하나인 경우에만 수정 기능 작동
			    if (selectedCheckbox.length === 1) {
			        var empId = selectedCheckbox.val();
			        var row = selectedCheckbox.closest("tr");

			        // input type의 name 값 지정
			        var cellNames = [
			            "line_num",
			            "line_name",
			            "use_yn",
			            "update_date",
			            "update_emp_id"
			        ];
			        
			        var cellIds = [
			            "line_num",
			            "line_name",
			            "use_yn",
			            "update_date",
			            "update_emp_id"
			        ];
			        

			        // 각 셀을 수정 가능한 텍스트 입력 필드로 변경
			        row.find("td:not(:first-child)").each(function(index) {
			            
// 			        	var cellValue = $(this).text();
// 			            var cellType = index === 3 ? "date" : "text"; // 날짜 타입은 date로 설정
// 			            var cellReadonly = [0].includes(index) ? "readonly='readonly'" : "";
// 			            var cellName = cellNames[index];
// 			            var cellDisabled = [3].includes(index)? "disabled":"";
// 			            var cellId = cellIds[index];
// 			            var cellContent;
			            
// 			            if (index === 2) {
// 			                cellContent = '<td>' +
// 			                    '<select class="form-control" name="' + cellName + '">' +
// 			                    '<option value="Y" ' + (cellValue === 'Y' ? 'selected' : '') + '>Y</option>' +
// 			                    '<option value="N" ' + (cellValue === 'N' ? 'selected' : '') + '>N</option>' +
// 			                    '</select>' +
// 			                    '</td>';
// 			            }else if (index === 4){
// 							cellContent = '<td><input class="form-control" type="' + cellType + '" name="' + cellName + '" value="' + ${sessionScope.emp_id} + '"' + cellReadonly + '></td>'; 
// 			            }else {
// 			                cellContent = '<td><input class="form-control" type="' + cellType + '" name="' + cellName + '" id="' + cellName + '"' + '" value="' + cellValue + '"'+ cellReadonly + '' + cellDisabled + '></td>';
// 			            }

// 			            $(this).html(cellContent);

		        	var cellValue = $(this).text();
		        	if(index == 4){
		        		cellValue = ${sessionScope.emp_id}
		        	}
		        	var cellName = cellNames[index];
		        	var cellId = cellIds[index];
		        	var cellContent;
		        	var cellOption = "";

		        	if(index == 0 || index == 4){
		        		cellOption = "readonly";
		        	}else if(index == 2) {
		        		cellOption = "";
		        	}else {
		        		cellOption = "disabled";
		        	}
		        	
		            if (index === 2) {
	               		 cellContent = '<td>' +
	                    '<select class="form-control" name="' + cellName + '">' +
	                    '<option value="Y" ' + (cellValue === 'Y' ? 'selected' : '') + '>Y</option>' +
	                    '<option value="N" ' + (cellValue === 'N' ? 'selected' : '') + '>N</option>' +
	                    '</select>' +
	                    '</td>';
					}else {
						cellContent = '<td><input name="' + cellName + '" id="' + cellId + '" value="' + cellValue + '"' + cellOption + ' class="form-control"' + '></td>';
					}
		            
					$(this).data('prevValue', cellValue);
		            
		            $(this).html(cellContent);

			        // 추가버튼, 수정버튼 활성화, 취소버튼 비활성화
			        $("#addRowButton").attr("disabled", "disabled");
			        $("#updateButton").attr("disabled", "disabled");
			        $("#deleteReceiveButton").attr("disabled", "disabled");

			        $("#cancelButton").removeAttr("disabled");
			        $("#submitButton").removeAttr("disabled");

			        pageStatus = "update";
			     
				});
			        
			        
			    } else if (selectedCheckbox.length === 0) {
			        alert("수정할 행을 선택해주세요!")
			    } else {
			        alert("수정은 하나의 행만 가능합니다!");
			    }
			    
    	});// 수정버튼

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
				var use_yn = $("use_yn").val();
				
				if(pageStatus == "reg"){
					if(line_name == null || line_name == ""){
						$("#line_name").focus();
						alert("라인명을 입력하세요!");
						return;
					}
					if(use_yn == null || use_yn == ""){
						$("#use_yn").focus();
						alert("사용여부를 입력하세요!");
						return;
					}
				}
				
				if(pageStatus == "update"){
					if(use_yn == null || use_yn == ""){
						$("use_yn").focus();
						alert("사용여부를 입력하세요!");
						return;
					}
				}
				
				form.submit();
			}); // submit버튼 유효성
	        	
	        }); // jQuery
    </script>
    
	<style>
		.selected { 
             background-color: #b3ccff; 
         } 
	</style>
	
</head>
<body>
	
	<form method="GET" class="bg-light rounded p-3 m-3">
		<div class="row mb-3">
			<label class="col-sm-2 col-form-label">라인코드</label>
			<div class="col-sm-10">
				<input type="text" name="line_num">
			</div>
		</div>
		<div class="row mb-3">
			<label class="col-sm-2 col-form-label">라인명</label>
			<div class="col-sm-10">
				<input type="text" name="line_name">
			</div>
		</div>
		<div class="row mb-3">
			<label class="col-sm-2 col-form-label">사용여부</label>
			<div class="col-sm-10">
				<select name="use_yn">
					<option>전체</option>
					<option>Y</option>
					<option>N</option>
				</select>
				<input class="btn btn-info rounded-pill m-2" type="submit" value="조회">
			</div>
		</div>
	</form>

	
	<form>
		<div class="d-flex align-items-center justify-content-between mb-2">
			<h3 class="m-4">라인 리스트</h3>
			<div>
				<c:if test="${(sessionScope.emp_dept eq '생산') && sessionScope.emp_auth >= 2}">
					<button type="button" class="btn btn-sm btn-primary m-2" id="addRowButton">
						<i class="fa fa-plus"></i> 추가</button>
					<button type="button" class="btn btn-sm btn-primary m-2" id="cancelButton" disabled>X 취소</button>
					<button type="button" class="btn btn-sm btn-primary m-2" id="updateButton">
						<i class="fa fa-edit"></i> 수정</button>
					<button type="submit" class="btn btn-sm btn-primary m-2" id="deleteLineButton" formaction="deleteLine" formmethod="post">
						<i class="fa fa-trash"></i> 삭제</button>
<!-- 					<button type="button" class="btn btn-sm btn-primary m-2" id="submitButton" formaction="regLine" formmethod="post" disabled="disabled"> -->
<!-- 						<i class="fa fa-download"></i> 저장</button> -->
					<button type="button" class="btn btn-sm btn-primary m-2" id="submitButton" disabled>
						<i class="fa fa-download"></i> 저장</button>
				</c:if>
			</div>
		</div>
		
		<div class="bg-light text-center rounded p-4 m-3">
			<div class="d-flex align-items-center justify-content-between mb-4">
			<span id="selectedCheckboxCount">0</span>
			</div>
			
			<table class="table-lineList table text-start align-middle table-bordered table-hover mb-0">
			    <tr>
			        <th><input type="checkbox" class="form-check-input"></th>
			        <th>라인코드</th>
			        <th>라인명</th>
			        <th>사용여부</th>
			        <th>등록일</th>
			        <th>등록자</th>
			    </tr>
			    <c:forEach var="vo" items="${lineList}" varStatus="status">
			        <tr>
			            <td><input type="checkbox" name="selectedLineId" value="${vo.line_id}" class="form-check-input"></td>
			            <td>${vo.line_num}</td>
			            <td>${vo.line_name}</td>
			            <td>${vo.use_yn}</td>
			            <td>
							<c:if test="${!empty vo.update_date}">${fn:substring(vo.update_date, 0, 10)}</c:if>
							<c:if test="${empty vo.update_date}">${fn:substring(vo.reg_date, 0, 10)}</c:if>
						</td>
			            <td>${vo.emp_name}</td>
			        </tr>
			    </c:forEach>
			</table>
		</div>
	</form>
	
</body>
</html>
<%@ include file="../../inc/footer.jsp"%>