<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<<<<<<< HEAD
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>창고 관리</title>
</head>
<body>
		<h2>창고 관리</h2>
			<fieldset>
               	<form name="search" method="get" action="">
                   	<span>창고 구분
						<input type="checkbox" name="wh_type_ma">자재
                   		<input type="checkbox" name="wh_type_pro">완제품
                   	</span>
		       		<span>창고명 : 
		       			<input type="text" name="wh_name" placeholder="창고 이름을 입력하세요">
		       		</span>
		      		<button class="btn btn-primary" type="submit" id="IconButton6"><a>조회</a></button>
             	</form>
             </fieldset>  
             
		<h2>창고</h2>
			<table border="1">
=======
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>창고 관리</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
        $(document).ready(function() {
            // 버튼 클릭 시 행 추가
            $("#addRowButton").click(function() {
                var newRow = '<tr>' +
                    '<td><input type="checkbox"></td>' +
                    '<td>' +
                    '<select name="wh_type">' +
                    '<option>전체</option>' +
                    '<option>자재</option>' +
                    '<option>완제품</option>' +
                    '</select>' +
                    '</td>' +
                    '<td><input type="text" name="wh_name"></td>' +
                    '</tr>';
                $(".table-warehouseList").append(newRow);
            });
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
            
            // 체크박스 클릭 시 선택된 행 삭제
            $(".table-warehouseList").on("click", "td input[type='checkbox']", function() {
                var checkbox = $(this);
                if (checkbox.prop("checked")) {
                    checkbox.closest("tr").addClass("selected");
                } else {
                    checkbox.closest("tr").removeClass("selected");
                }
            });
            // 선택된 행 삭제 버튼 클릭 시 행 삭제
            $("#deleteRowsButton").click(function() {
                var selectedRows = $(".table-warehouseList tr.selected");
                selectedRows.remove();
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
		<h2>창고 관리</h2>
			<fieldset>
               	<form name="search" method="GET" action="">
                   	<span>창고 구분
                   		<select name="wh_type">
                   			<option>전체</option>
                   			<option>자재</option>
                   			<option>완제품</option>
                 		</select>
                   	</span>
		       		<span>창고명 : 
		       			<input type="text" name="wh_name" placeholder="창고 이름을 입력하세요">
		       		</span>
		      		<input type="submit" value="조회">
             	</form>
             </fieldset>  
             
		<h2>창고</h2>
			<button id="addRowButton">추가</button>
			<button id="deleteRowsButton">삭제</button>
			<table class="table-warehouseList" border="1">
>>>>>>> branch 'develop' of https://github.com/jinagain/ModernHome.git
				<tr>
					<th><input type="checkbox"></th>
			    	<th>창고번호</th>
			    	<th>창고코드</th>
			    	<th>창고이름</th>
			    	<th>창고구분</th>
			    	<th>창고연락처</th>
			    	<th>담당자</th>
				</tr>
			  	<c:forEach var="vo" items="${warehouseList}">
					<tr>
						<td><input type="checkbox"></td>
				    	<td>${vo.wh_id}</td>
				    	<td>${vo.wh_num}</td>
				    	<td>${vo.wh_name}</td>
				    	<td>${vo.wh_type}</td>
				   		<td>${vo.wh_tel}</td>
				   		<td>${vo.emp_id}</td>
				    </tr>
			    </c:forEach>
			</table>
		
		
		
</body>
</html>