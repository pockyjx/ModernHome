<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
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
                    '<td><input type="text" name="productVO.pro_num" placeholder="완제품 코드" readonly id="proList"></td>' +
                    '<td><input type="text" name="productVO.pro_name" value="" readonly ></td>' +
                    '<td><input type="text" name="materialVO.ma_num" placeholder="자재 코드"></td>' +
                    '<td><input type="text" name="pro_price" placeholder="품목 단가"></td>' +
                    '<td><input type="text" name="pro_price" placeholder="품목 단가"></td>' +
                    '<td><input type="text" name="pro_price" placeholder="품목 단가"></td>' +
                    '<td><input type="text" name="pro_price" placeholder="품목 단가"></td>' +
                    '<td><input type="text" name="pro_price" placeholder="품목 단가"></td>' +
                    '<td><input type="text" name="pro_price" placeholder="품목 단가"></td>' +
                    '<td><input type="text" name="pro_price" placeholder="품목 단가"></td>' +
                    '</tr>';
                $(".table-reqList tr:nth-child(1)").after(newRow);
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
            
            // 체크박스 클릭 시 선택된 행 삭제
            $(".table-reqList").on("click", "td input[type='checkbox']", function() {
                var checkbox = $(this);
                if (checkbox.prop("checked")) {
                    checkbox.closest("tr").addClass("selected");
                } else {
                    checkbox.closest("tr").removeClass("selected");
                }
            });

            // 선택된 행 삭제 버튼 클릭 시 행 삭제
            $("#deleteRowsButton").click(function() {
                var selectedRows = $(".table-reqList tr.selected");
                selectedRows.remove();
            });
            
	       // 완제품 코드 입력란 클릭 시 팝업창 열기
	       $(document).on("click", "input[name='productVO.pro_num']", function() {
	    	   window.open('/info/req/popUpProduct', 'popUpProduct', 'width=600, height=500, location=no, status=no, scrollbars=yes');
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
	
	<h2>소요량</h2>
	
	<input type="button" id="addRowButton" value="추가">
	<input type="button" id="deleteRowsButton" value="삭제">
	
	<input type="submit" value="등록">
	
	<table class="table-reqList" border="1">
		
		<tr>
			<th><input type="checkbox"></th>
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
			<td>${vo.productVO.pro_num }</td>
			<td>${vo.productVO.pro_name }</td>
			<td>${vo.materialVO.ma_num }</td>
			<td>${vo.materialVO.ma_name }</td>
			<td>${vo.req_cnt }</td>
			<td>${vo.req_unit }</td>
			<td>${vo.req_reg_date }</td>
			<td>${vo.emp_id }</td>
			<td>${vo.req_update_date }</td>
			<td>${vo.update_emp_id }</td>
		</tr>	
		</c:forEach>
		
	</table>
	
</body>
</html>