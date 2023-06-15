<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
                $(".table-lineList").append(newRow);
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

            // 선택된 행 삭제 버튼 클릭 시 행 삭제
            $("#deleteRowsButton").click(function() {
                var selectedRows = $(".table-lineList tr.selected");
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
	
	<h1>line list.jsp</h1>
	
	<h2>라인 정보 관리</h2>
	
	
	
	<h2>라인</h2>
	<button id="addRowButton">추가</button>
	<button id="deleteRowsButton">삭제</button>
	<table class="table-lineList" border="1">
			<tr>
				<th><input type="checkbox"></th>
				<th>라인코드</th>
				<th>라인명</th>
				<th>사용여부</th>
				<th>등록일</th>
				<th>등록자</th>
			</tr>
			<c:forEach var="vo" items="${lineList }">
			<tr>	
				<td><input type="checkbox"></td>
				<td>${vo.line_num }</td>
				<td>${vo.line_name }</td>
				<td>
				    <select>
				       <option value="Y" <c:if test="${vo.use_yn=='Y'}"> selected</c:if>>Y</option>
				       <option value="N" <c:if test="${vo.use_yn=='N'}"> selected</c:if>>N</option>
				    </select>
				</td>
				<td>
				<fmt:formatDate value="${vo.reg_date }" dateStyle="medium"/>
				</td>
				<td>${vo.emp_id }</td>
			</tr>
			</c:forEach>
	</table>

	
</body>
</html>