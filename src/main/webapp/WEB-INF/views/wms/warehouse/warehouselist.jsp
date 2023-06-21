<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>창고 관리</title>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script>
	
		var pageStatus = "";
	
        $(document).ready(function() {
			// 추가 버튼 클릭 시 행 추가
            // 추가버튼 1번 누르면 추가버튼 비활성화
            $("#addRowButton").click(function() {
                var newRow = '<tr>' +
                    '<td><input type="checkbox"></td>' +
                    '<td><input type="text" name="wh_num" placeholder="자동으로 부여" readonly></td>' +
                    '<td><input type="text" name="wh_name" placeholder="창고명"></td>' +
                    '<td>' +
					'<select name="wh_type">' +
					'<option value="자재">자재</option>' +
					'<option value="완제품">완제품</option>' +
					'</select>' +
					'</td>' +
                    '<td><input type="tel" name="wh_tel" placeholder="연락처"></td>' +
                    '</tr>';
                    
                 // 첫번째 자식<tr> 뒤에서 부터 행을 추가함    
                $(".table-warehouseList tr:nth-child(1)").after(newRow);
                 
             	// 추가버튼, 수정버튼 비활성화, 취소버튼 활성화
				$("#addRowButton").attr("disabled", "disabled");
				$("#updateButton").attr("disabled", "disabled");
				$("#deleteWarehouseButton").attr("disabled", "disabled");
				
				$("#cancleButton").removeAttr("disabled");
				$("#submitButton").removeAttr("disabled");
				
				pageStatus = "reg";
				
            }); // 여기까지 추가 버튼
        	
        	
            
         	// <th> 쪽 체크박스 클릭 시 해당 열의 <td> 부분의 행들을 선택하고 배경색 지정
            $(".table-warehouseList th input[type='checkbox']").click(function() {
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
            $(".table-warehouseList td input[type='checkbox']").click(function() {
                var checkbox = $(this);
                var isChecked = checkbox.prop('checked');
                checkbox.closest('tr').toggleClass('selected', isChecked);
            });
            
            
            
         	// 취소 버튼 누를 시 
			$("#cancleButton").click(function(){
				
				// 등록버튼 취소
				if(pageStatus == "reg"){
					// 두번째 tr (추가된 행)을 삭제함
					$(".table-warehouseList tr:nth-child(2)").remove();
					
					// 추가버튼, 수정버튼 활성화, 취소버튼 비활성화
					$("#addRowButton").removeAttr("disabled");
					$("#updateButton").removeAttr("disabled");
					$("#deleteWarehouseButton").removeAttr("disabled");
					
					$("#cancleButton").attr("disabled", "disabled");
					$("#submitButton").attr("disabled", "disabled");
					
					pageStatus = "";
				}
				// 수정버튼 취소
				if(pageStatus == "update"){
					var row = $("input[name='selectedWhId']:checked").closest("tr");
					
					// 폼 초기화(기존내용으로)
					// 가져가서 쓰는 경우 폼에 이름 지정해줘야해요
					$("#warehouseList")[0].reset();
					
					// 각 셀의 값을 원래 상태로 되돌림
					row.find("td:not(:first-child)").each(function(index) {
						var cellValue = $(this).find("input").val();
						if ($(this).find("select").length) {
							// <select>가 있는 경우 선택된 옵션의 텍스트로 변경
							var selectedOptionText = $(this).find("select option:selected").text();
							$(this).html(selectedOptionText);
						}else {
							// <select>가 없는 경우 셀 값을 그대로 표시
							$(this).html(cellValue);
						}
					});
					
					// 추가버튼, 수정버튼 활성화, 취소버튼 비활성화
					$("#addRowButton").removeAttr("disabled");
					$("#updateButton").removeAttr("disabled");
					$("#deleteWarehouseButton").removeAttr("disabled");
					
					$("#cancleButton").attr("disabled", "disabled");
					$("#submitButton").attr("disabled", "disabled");
					
					
					pageStatus = "";
					
				} // if(update)문
			
			}); // 취소버튼
            
            
            // 수정 버튼 누를 시
			$("#updateButton").click(function(){
				var selectedCheckbox = $("input[name='selectedWhId']:checked");
				
				// 체크된 체크박스가 하나인 경우에만 수정 기능 작동
				if (selectedCheckbox.length === 1) {
					var empId = selectedCheckbox.val();
					var row = selectedCheckbox.closest("tr");
					
					// input type의 name 값 지정
					var cellNames = [
			            "wh_num",
			            "wh_name",
			            "wh_type",
			            "wh_tel"
					];
					
					
					// 각 셀을 수정 가능한 텍스트 입력 필드로 변경
					row.find("td:not(:first-child)").each(function(index) {
						var cellValue = $(this).text();
						var cellOption = index === 0 ? "readonly" : "";
						var cellName = cellNames[index]
						var cellContent;
						
						if (index === 2){
							cellContent = '<td>' +
							'<select name="' + cellName + '">' +
							'<option value="자재" ' + (cellValue === '자재' ? 'selected' : '') + '>자재</option>' +
							'<option value="완제품" ' + (cellValue === '완제품' ? 'selected' : '') + '>완제품</option>' +
							'</select>' +
							'</td>';
						}else {
							cellContent = '<td><input type="text" name="' + cellName + '" value="' + cellValue + '"' + cellOption + '></td>';
						}
						
						$(this).html(cellContent);
						
						// 버튼 활성화, 비활성화
						$("#updateButton").attr("disabled", "disabled");
						$("#addRowButton").attr("disabled", "disabled");
						$("#deleteWarehouseButton").attr("disabled", "disabled");
						
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
    <style>
        .selected {
            background-color: #b3ccff;
        }
    </style>
</head>
<body>
		<h2>창고 관리</h2>
		<!-- 검색칸 -->	
			<fieldset>
               	<form name="search" method="GET" action="">
                   	<span>창고 구분
                   		<select name="wh_type">
                   			<option value="전체">전체</option>
							<option value="자재">자재</option>
							<option value="완제품">완제품</option>
                 		</select>
                   	</span>
		       		<span>창고명 : 
		       			<input type="text" name="wh_name" placeholder="창고 이름을 입력하세요">
		       		</span>
		      		<input type="submit" value="조회">
             	</form>
             </fieldset>  
		<!-- 검색칸 -->	
             
		<h2>창고</h2>
			<form id="warehouseList" action="" method="GET">
		
			<input type="button" id="addRowButton" value="추가">
			<input type="button" id="cancleButton" value="취소" disabled="disabled">
			<input type="button" id="updateButton" value="수정">
			<input type="submit" id="deleteWarehouseButton" value="삭제" formaction="/wms/deleteWarehouse" formmethod="post">
			
			<input type="submit" id="submitButton" value="저장" formaction="/wms/regWarehouse" formmethod="post" disabled="disabled">
			
			<table class="table-warehouseList" border="1">
				<tr>
					<th><input type="checkbox" name="selectedWhId"></th>
			    	<th>창고코드</th>
			    	<th>창고이름</th>
			    	<th>창고구분</th>
			    	<th>창고연락처</th>
				</tr>
			  	<c:forEach var="vo" items="${warehouseList}">
					<tr>
						<td><input type="checkbox" name="selectedWhId" value="${vo.wh_id}"></td>
				    	<td>${vo.wh_num}</td>
				    	<td>${vo.wh_name}</td>
				    	<td>${vo.wh_type}</td>
				   		<td>${vo.wh_tel}</td>
				    </tr>
			    </c:forEach>
			</table>
		
			</form>
		
</body>
</html>