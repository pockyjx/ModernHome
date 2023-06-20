<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>  
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
                    '<td><input type="text" name="req_num" placeholder="소요량 코드" readonly></td>' +
                    '<td><input type="text" name="pro_num" placeholder="완제품 코드" readonly id="pro_num"></td>' +
                    '<td><input type="text" name="pro_name" placeholder="완제품명" id="pro_name" readonly ></td>' +
                    '<td><input type="text" name="ma_num" placeholder="자재 코드" id="ma_num" readonly></td>' +
                    '<td><input type="text" name="ma_name" placeholder="자재명" id="ma_name" readonly></td>' +
                    '<td><input type="text" name="req_cnt" placeholder="소요량"></td>' +
                    '<td><input type="text" name="req_unit" placeholder="단위"></td>' +
                    '<td></td>' +
                    '<td><input type="text" name="pro_price" placeholder="품목 단가"></td>' +
                    '<td></td>' +
                    '<td></td>' +
                    '</tr>';
                $(".table-reqList tr:nth-child(1)").after(newRow);
                
                // 추가버튼, 수정버튼 비활성화, 취소버튼 활성화
				$("#addRowButton").attr("disabled", "disabled");
				$("#updateButton").attr("disabled", "disabled");
				
				$("#cancleButton").removeAttr("disabled");
				$("#submitButton").removeAttr("disabled");
				
				pageStatus = "reg";
                
            });
            
         // <th> 쪽 체크박스 클릭 시 해당 열의 <td> 부분의 행들을 선택하고 배경색 지정
            $(".table-reqList th input[type='checkbox']").click(function() {
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
            $(".table-reqList td input[type='checkbox']").click(function() {
                var checkbox = $(this);
                var isChecked = checkbox.prop('checked');
                checkbox.closest('tr').toggleClass('selected', isChecked);
            });
            
         // 취소 버튼 누를 시 
			$("#cancleButton").click(function(){
				
				// 등록버튼 취소
				if(pageStatus == "reg"){
					// 두번째 tr (추가된 행)을 삭제함
					$(".table-reqList tr:nth-child(2)").remove();
					
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
					var row = $("input[name='selectedReqId']:checked").closest("tr");
					
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
				var selectedCheckbox = $("input[name='selectedReqId']:checked");
				
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
            
       // 완제품 코드 입력란 클릭 시 팝업창 열기
       $(document).on("click", "input[name='pro_num']", function() {
    	   window.open('/info/req/addPopup?txt=pro', 'popup', 'width=600, height=500, location=no, status=no, scrollbars=yes');
       });
       
       // 자재 코드 입력란 클릭 시 팝업창 열기
       $(document).on("click", "input[name='ma_num']", function() {
    	   window.open('/info/req/addPopup?txt=ma', 'popup', 'width=600, height=500, location=no, status=no, scrollbars=yes');
       });
       
        
    </script>
    <style>
        .selected {
            background-color: #b3ccff;
        }
    </style>

</head>
<body>
	
	<h1>소요량 관리</h1>
	
	<fieldset>
		<form action="" method="GET">
				
			<select name="option">
				<option value="all">전체</option>
				<option value="pro_name">완제품명</option>
				<option value="ma_name">자재명</option>
<!-- 				<option value="req_num">소요량 코드</option> -->
			</select>
			
			<label><input type="text" name="search"></label>
			<input type="submit" value="조회">
		</form>
	</fieldset>

	<hr>
	
	<form action="">
	
	<h2>소요량</h2>
	
	<input type="button" id="addRowButton" value="추가">
	<input type="button" id="cancleButton" value="취소" disabled="disabled">
	<input type="button" id="updateButton" value="수정">
	<input type="submit" id="" value="삭제" formaction="/info/delRequirement" formmethod="post">
	
	<input type="submit" id="submitButton" value="저장" formaction="/info/regRequirement" formmethod="post" disabled="disabled">
	
	<table class="table-reqList" border="1">
	
	<input type="input" id="pro_id">
	<input type="input" id="ma_id"> 
		
		<tr>
			<th><input type="checkbox" name="selectedReqId" value="${vo.req_id}"></th>
			<th>소요량 코드</th>
			<th>완제품 코드</th>
			<th>완제품명</th>
			<th>자재 코드</th>
			<th>자재명</th>
			<th>소요량</th>
			<th>단위</th>
			<th>등록일</th>
			<th>등록자</th>
			<th>수정일</th>
			<th>수정자</th>
		</tr>
		
		<c:forEach var="vo" items="${reqList }">
		<tr>	
			<td><input type="checkbox"></td>
			<td>${vo.req_num }</td>
			<td>${vo.pro_num }</td>
			<td>${vo.pro_name }</td>
			<td>${vo.ma_num }</td>
			<td>${vo.ma_name }</td>
			<td>${vo.req_cnt }</td>
			<td>${vo.req_unit }</td>
			<td>${vo.req_reg_date }</td>
			<td>${vo.emp_id }</td>
			<td>${fn:substring(vo.req_update_date, 0, 10) }</td>
			<td>${vo.update_emp_id }</td>
		</tr>	
		</c:forEach>
		
	</table>
	
	</form>
	
</body>
</html>