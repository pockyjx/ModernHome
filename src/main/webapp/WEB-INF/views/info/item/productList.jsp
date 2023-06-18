<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 

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
                    '<td><input type="text" name="pro_num"></td>' +
                    '<td><input type="text" name="pro_name"></td>' +
                    '<td><input type="text" value="완제품" readonly></td>' +
                    '<td><input type="text" name="pro_unit"></td>' +
                    '<td><input type="text" name="pro_price"></td>' +
                    '</tr>';
                $(".table-proList tr:nth-child(1)").after(newRow);
            });
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
            
            // 체크박스 클릭 시 선택된 행 삭제
            $(".table-proList").on("click", "td input[type='checkbox']", function() {
                var checkbox = $(this);
                if (checkbox.prop("checked")) {
                    checkbox.closest("tr").addClass("selected");
                } else {
                    checkbox.closest("tr").removeClass("selected");
                }
            });

            // 선택된 행 삭제 버튼 클릭 시 행 삭제
            $("#deleteRowsButton").click(function() {
                var selectedRows = $(".table-proList tr.selected");
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

	<form action="/info/regProduct" method="POST">	
	

	<input type="button" id="addRowButton" value="추가">
	<input type="button" id="deleteRowsButton" value="삭제">
	
	<input type="submit" value="등록">

	<table border="1" class="table-proList">
	
		<tr>
			<td><input type="checkbox"></td>
			<th>품목 코드</th>
			<th>품목명</th>
			<th>품목 구분</th>
			<th>단위</th>
			<th>단가</th>
		</tr>
		
		<c:forEach items="${productList }" var="vo">
		<tr>
			<td><input type="checkbox"></td>
			<td>${vo.pro_num }</td>
			<td>${vo.pro_name }</td>
			<td>완제품</td>
			<td>${vo.pro_unit }</td>
			<td>${vo.pro_price }</td>
		</tr>
		</c:forEach>
	
	</table>
	
	</form>

</body>
</html>