<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>발주 관리</title>
<link rel="stylesheet" href="//code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" />
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="//code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<!-- <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script> -->
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
		<h2>발주 관리</h2>
			<fieldset>
               	<form name="search" method="get" action="">
                   	<div>
                   		<label>발주일자</label>
                   	</div>
                   	<div>
                   		<input name="publeYear" autocomplete="off" readonly="readonly">
                   	</div>
		       		<div>
		       			<input type="text" name="wh_name" placeholder="발주 자재명을 입력하세요">
		       		</div>
		       		<br>
		       		<div>
                   		<label>입고예정일</label>
                   	</div>
                   	<div>
                   		<input name="publeYear" autocomplete="off" readonly="readonly">
                   	</div>
		       		<span>발주상태
		       			<input type="checkbox" name="wh_type_ma">완료
                   		<input type="checkbox" name="wh_type_pro">미완료
		       		</span>
		      		<button class="btn btn-primary" type="submit" id="IconButton6"><a>조회</a></button>
             	</form>
             </fieldset>  
             
		<h2>발주</h2>
			<button id="addRowButton">추가</button>
			<button id="deleteRowsButton">삭제</button>
			<table border="1">
				<tr>
					<th><input type="checkbox"></th>
			    	<th>발주코드</th>
			    	<th>자재코드</th>
			    	<th>자재명</th>
			    	<th>거래처코드</th>
			    	<th>거래처명</th>
			    	<th>발주량</th>
			    	<th>단위</th>
			    	<th>총금액</th>
			    	<th>발주일자</th>
			    	<th>발주상태</th>
			    	<th>입고예정일</th>
			    	<th>담당자</th>
				</tr>
			  	<c:forEach var="vo" items="${inorderList}">
					<tr>
						<td><input type="checkbox"></td>
				    	<td></td>
				    	<td></td>
				    	<td></td>
				    	<td></td>
				    	<td></td>
				    	<td></td>
				    	<td></td>
				    	<td></td>
				    	<td></td>
				   		<td></td>
				   		<td></td>
				   		<td>${vo.emp_id}</td>
				    </tr>
			    </c:forEach>
			</table>
	<script type="text/javascript">
	<!-- 캘린터 위젯 적용 -->
		/* 설정 */	
		const config = {
			dateFormat : 'yy-mm-dd',
			showOn : "button",
			buttonText:"날짜 선택",
			prevText: '이전달',
		    nextText: '다음달',
		    currentText:'오늘',
		    closeText: '닫기',
		    monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
		    monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
		    dayNames:['일요일','월요일','화요일','수요일','목요일','금요일','토요일'],
			dayNamesMin:['일','월','화','수','목','금','토'],
		    dayNamesShort: ['일','월','화','수','목','금','토'],
		    minDate:0,
		    maxDate:+7,
// 		    yearSuffix: '년',
		    changeMonth: false,
	        changeYear: false
		}
		
		/* 캘린더 */
		$(function() {
			$( "input[name='publeYear']" ).datepicker(config);
		});
	</script>		
	
		
	
	
	
</body>
</html>