<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ include file="../../inc/header.jsp"%>
<%@ include file="../../inc/sidebar.jsp"%>
<%@ include file="../../inc/nav.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script>
        $(document).ready(function() {
        	
        	updateSelectedCheckboxCount();
        	
            // 버튼 클릭 시 행 추가
            $("#addRowButton").click(function() {
                var newRow = '<tr>' +
                    '<td><input type="checkbox"></td>' +
                    '<td><input type="text" name="ma_num" placeholder="자재 코드" readonly></td>' +
                    '<td><input type="text" name="ma_name" placeholder="자재명""></td>' +
                    '<td><input type="text" name="ma_unit" placeholder="자재 단위"></td>' +
                    '<td><input type="text" name="ma_price" placeholder="자재 단가"></td>' +
                    '</tr>';
                $(".table-mateList tr:nth-child(1)").after(newRow);
                
             // 추가버튼, 수정버튼 비활성화, 취소버튼 활성화
				$("#addRowButton").attr("disabled", "disabled");
				$("#updateButton").attr("disabled", "disabled");
				$("#deleteButton").attr("disabled", "disabled");
				
				$("#cancleButton").removeAttr("disabled");
				$("#submitButton").removeAttr("disabled");
				
				pageStatus = "reg";
				
            }); // 추가 버튼
            
         // 취소 버튼 누를 시 
			$("#cancleButton").click(function(){
				
				// 등록버튼 취소
				if(pageStatus == "reg"){
					// 두번째 tr (추가된 행)을 삭제함
					$(".table-mateList tr:nth-child(2)").remove();
					
					// 모든 체크박스의 체크 해제
					$(".table-mateList input[type='checkbox']").prop("checked", false);
					
					// selected 클래스를 없앰 (css 없애기)
					$(".table-mateList tr").removeClass("selected");
					
					// 추가버튼, 수정버튼 활성화, 취소버튼 비활성화
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
					$(".table-mateList tr").each(function() {
					var row = $(this);
					
					$("#materialList")[0].reset();
					
					// 각 셀의 값을 원래 상태로 되돌림
					row.find("td:not(:first-child)").each(function(index) {
						var cellValue = $(this).find("input").val();
						$(this).html(cellValue);
					});
					
					// selected 클래스를 없앰 (css 없애기)
					$(".table-mateList tr").removeClass("selected");
					
					// 추가버튼, 수정버튼 활성화, 취소버튼 비활성화
					$("#addRowButton").removeAttr("disabled");
					$("#updateButton").removeAttr("disabled");
					$("#deleteButton").removeAttr("disabled");
					
					$("#cancleButton").attr("disabled", "disabled");
					$("#submitButton").attr("disabled", "disabled");
					
					
					pageStatus = "";
				
					});
				
				}
				
				updateSelectedCheckboxCount();
			
			});
         
			// 수정 버튼 누를 시
			$("#updateButton").click(function(){
				var selectedCheckbox = $("input[name='selectedMaId']:checked");
				
				// 체크된 체크박스가 하나인 경우에만 수정 기능 작동
				if (selectedCheckbox.length === 1) {
					var empId = selectedCheckbox.val();
					var row = selectedCheckbox.closest("tr");
					
					// input type의 name 값 지정
					var cellNames = [
						"ma_num",
						"ma_name",
						"ma_unit",
						"ma_price"
					];
					
					// 각 셀을 수정 가능한 텍스트 입력 필드로 변경
					row.find("td:not(:first-child)").each(function(index) {
						//
						var cellValue = $(this).text();
						var cellOption = index === 0 ? "readonly" : "";
						var cellName = cellNames[index];
						
						$(this).html('<input type="text" name="' + cellName + '" value="' + cellValue + '"' + cellOption + '>');
						
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
			
			
			// <th> 쪽 체크박스 클릭 시 해당 열의 <td> 부분의 행들을 선택하고 배경색 지정
	        $(".table-mateList th input[type='checkbox']").click(function() {
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
	            
	        }); // 배경색 지정

	         // <td> 쪽 체크박스 클릭 시 행 선택
	         $(".table-mateList td input[type='checkbox']").click(function() {
	             var checkbox = $(this);
	             var isChecked = checkbox.prop('checked');
	             checkbox.closest('tr').toggleClass('selected', isChecked);
	             
	             updateSelectedCheckboxCount(); 
	         }); // <td> 쪽 체크박스 클릭 시 행 선택
	         

	    	function updateSelectedCheckboxCount() {
	          var totalCheckboxes = $(".table-mateList td input[type='checkbox']").length;
	          var selectedCheckboxes = $(".table-mateList td input[type='checkbox']:checked").length;
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

<div>
	<ul class="nav nav-tabs">
	  <li class="nav-item">
	    <a class="nav-link active" aria-current="page" href="/info/item/materialList">자재</a>
	  </li>
	  <li class="nav-item">
	    <a class="nav-link" href="/info/item/productList">완제품</a>
		</li>
	</ul>
</div>

<hr>


<h2>자재 검색</h2>

	<fieldset>
		<form action="" method="GET">

			<label><b>자재코드</b> <input type="text" name="ma_num"></label>
			<label><b>자재명</b> <input type="text" name="ma_name"></label>

			<input type="submit" value="조회">
		</form>
	</fieldset>


<hr>
	
	<h2>자재 목록</h2>
	
	<form id="materialList">
	
	<span id="selectedCheckboxCount">0</span>	
	
	<div>
	
	<c:if test="${sessionScope.emp_dept eq '자재'}">
	
	<button type="button" class="btn btn-primary m-2" id="addRowButton"><i class="fa fa-plus"></i> 추가</button>
	<button type="button" class="btn btn-primary m-2" id="cancleButton" disabled>X 취소</button>
	<button type="button" class="btn btn-primary m-2" id="updateButton"><i class="fa fa-edit"></i> 수정</button>
	<button type="submit" class="btn btn-primary m-2" id="/info/delMaterial" formaction="/info/delProduct" formmethod="post"><i class="fa fa-trash"></i> 삭제</button>
	
	<button type="submit" class="btn btn-primary m-2" id="submitButton" formaction="/info/regMaterial" formmethod="post" disabled><i class="fa fa-download"></i> 저장</button>
	
	</c:if>
	
	</div>
	
	<table class="table-mateList" border="1">
	
		<tr>
			<th><input type="checkbox"></th>
			<th>자재 코드</th>
			<th>자재명</th>
			<th>단위</th>
			<th>단가(원)</th>
		</tr>
		
		<c:forEach items="${materialList }" var="vo">
		<tr>
			<td><input type="checkbox" name="selectedMaId" value="${vo.ma_id }"></td>
			<td>${vo.ma_num }</td>
			<td>${vo.ma_name }</td>
			<td>${vo.ma_unit }</td>
			<td>${vo.ma_price }</td>
		</tr>
		</c:forEach>
	
	</table>
	
	</form>

</body>
</html>

<%@ include file="../../inc/footer.jsp"%>