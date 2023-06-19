<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script>
        $(document).ready(function() {
            // 버튼 클릭 시 행 추가
            $("#addRowButton").click(function() {
                var newRow = '<tr>' +
                    '<td><input type="checkbox"></td>' +
                    '<td><input type="text" name="pro_num" placeholder="완제품 코드" readonly></td>' +
                    '<td><input type="text" name="pro_name" placeholder="완제품명"></td>' +
                    '<td><input type="text" value="완제품" disabled></td>' +
                    '<td><input type="text" name="pro_unit" placeholder="완제품 단위"></td>' +
                    '<td><input type="text" name="pro_price" placeholder="완제품 단가"></td>' +
                    '</tr>';
                    
                $(".table-proList tr:nth-child(1)").after(newRow);
                
            	// 추가버튼, 수정버튼 비활성화, 취소버튼 활성화
				$("#addRowButton").attr("disabled", "disabled");
				$("#updateButton").attr("disabled", "disabled");
				
				$("#cancleButton").removeAttr("disabled");
				$("#submitButton").removeAttr("disabled");
				
				pageStatus = "reg";
                
            }); // 추가 버튼
            
         // <th> 쪽 체크박스 클릭 시 해당 열의 <td> 부분의 행들을 선택하고 배경색 지정
            $(".table-proList th input[type='checkbox']").click(function() {
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
            $(".table-proList td input[type='checkbox']").click(function() {
                var checkbox = $(this);
                var isChecked = checkbox.prop('checked');
                checkbox.closest('tr').toggleClass('selected', isChecked);
            });
            
         // 취소 버튼 누를 시 
			$("#cancleButton").click(function(){
				
				// 등록버튼 취소
				if(pageStatus == "reg"){
					// 두번째 tr (추가된 행)을 삭제함
					$(".table-proList tr:nth-child(2)").remove();
					
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
					var row = $("input[name='selectedProId']:checked").closest("tr");
					
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
				var selectedCheckbox = $("input[name='selectedProId']:checked");
				
				// 체크된 체크박스가 하나인 경우에만 수정 기능 작동
				if (selectedCheckbox.length === 1) {
					var empId = selectedCheckbox.val();
					var row = selectedCheckbox.closest("tr");
					
					// input type의 name 값 지정
					var cellNames = [
						"pro_num", 
						"pro_name", 
						"type", 
						"pro_unit", 
						"pro_price"
					];
					
					
					// 각 셀을 수정 가능한 텍스트 입력 필드로 변경
					row.find("td:not(:first-child)").each(function(index) {
						//
						var cellValue = $(this).text();
						var cellOption = index === 0 || index === 2 ? "readonly" : "";
						var cellName = cellNames[index];
						
						$(this).html('<input type="text" name="' + cellName + '" value="' + cellValue + '"' + cellOption + '>');
						
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
            
            
        });
    </script>
    <style>
        .selected {
            background-color: #b3ccff;
        }
    </style>

</head>
<body>

<h2>품목 검색</h2>

	<fieldset>
		<form action="./itemSearchResult" method="POST">
			<b>품목 구분</b>
			<label><input type="radio" name="itemType" value="product" checked>완제품</label>
			<label><input type="radio" name="itemType" value="material">자재</label>
			
			<select name="itemOption">
				<option value="name">품목명</option>
				<option value="num">품목코드</option>
			</select>
			
			<label><input type="text" name="search"></label>
			<input type="submit" value="조회">
		</form>
	</fieldset>

	<hr>

	<ul>
		<li><a href="./productList">완제품</a></li>
		<li><a href="./materialList">자재</a></li>
	</ul>

<h2>완제품 목록</h2>

	<form>	

	<input type="button" id="addRowButton" value="추가">
	<input type="button" id="cancleButton" value="취소" disabled="disabled">
	<input type="button" id="updateButton" value="수정">
	<input type="submit" id="" value="삭제" formaction="/info/delProduct" formmethod="post">
	
	<input type="submit" id="submitButton" value="저장" formaction="/info/regProduct" formmethod="post" disabled="disabled">

	<table border="1" class="table-proList">
	
		<tr>
			<th><input type="checkbox"></th>
			<th>품목 코드</th>
			<th>품목명</th>
			<th>품목 구분</th>
			<th>단위</th>
			<th>단가(원)</th>
		</tr>
		
		<c:forEach items="${productList }" var="vo">
		<tr>
			<td><input type="checkbox" name="selectedProId" value="${vo.pro_id}"></td>
			<td>${vo.pro_num }</td>
			<td>${vo.pro_name }</td>
			<td>완제품</td>
			<td>${vo.pro_unit }</td>
			<td><fmt:formatNumber value="${vo.pro_price }" /> </td>
		</tr>
		</c:forEach>
	
	</table>
	
	</form>

</body>
</html>