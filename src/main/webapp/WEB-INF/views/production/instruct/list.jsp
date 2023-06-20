<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" />
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="//code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<script>
	$(document).ready(function() {
		// <th> 쪽 체크박스 클릭 시 해당 열의 <td> 부분의 행들을 선택하고 배경색 지정
		$(".table-instrList th input[type='checkbox']").click(function() {
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
		
		// 수정 버튼 누를 시
		$("#updateButton").click(function(){
			var selectedCheckbox = $("input[name='selectedEmpId']:checked");
			
			// 체크된 체크박스가 하나인 경우에만 수정 기능 작동
			if (selectedCheckbox.length === 1) {
				var workId = selectedCheckbox.val();
				location.href = "/production/instruct/modify?work_id=" + workId;
			}else if (selectedCheckbox.length === 0){
				alert("수정할 행을 선택해주세요!")
			}else {
				alert("수정은 하나의 행만 가능합니다!");
			}
		});
		// <th> 쪽 체크박스 클릭 시 해당 열의 <td> 부분의 행들을 선택하고 배경색 지정
        $(".table-instrList th input[type='checkbox']").click(function() {
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
        $(".table-instrList td input[type='checkbox']").click(function() {
            var checkbox = $(this);
            var isChecked = checkbox.prop('checked');
            checkbox.closest('tr').toggleClass('selected', isChecked);
        });
        
        // 체크박스 클릭 시 선택된 행 삭제
        $(".table-instrList").on("click", "td input[type='checkbox']", function() {
            var checkbox = $(this);
            if (checkbox.prop("checked")) {
                checkbox.closest("tr").addClass("selected");
            } else {
                checkbox.closest("tr").removeClass("selected");
            }
        });
        
		// 체크박스 선택 시 체크박스의 개수 구하기
        updateSelectedCheckboxCount();

        // <th> 쪽 체크박스 클릭 시 해당 열의 <td> 부분의 행들을 선택하고 배경색 지정
        $(".table-instrList th input[type='checkbox']").click(function() {
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
        $(".table-instrList td input[type='checkbox']").click(function() {
            var checkbox = $(this);
            var isChecked = checkbox.prop('checked');
            checkbox.closest('tr').toggleClass('selected', isChecked);

            updateSelectedCheckboxCount(); 
        });

        function updateSelectedCheckboxCount() {
            var totalCheckboxes = $(".table-instrList td input[type='checkbox']").length;
            var selectedCheckboxes = $(".table-instrList td input[type='checkbox']:checked").length;
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
	
	<h1>/production/instruct/list.jsp</h1>
	
	<h2>작업지시 조회</h2>
	<form method="get">
		작업상태
			<label><input type="radio" name="work_state" value="대기"> 대기</label>
			<label><input type="radio" name="work_state" value="진행중"> 진행중</label>
			<label><input type="radio" name="work_state" value="완료"> 완료</label>
		<br>
		품목코드
			<input type="text" name="pro_num">
		<br>
		<div>
			<label>지시일자</label>
			<input type="date" name="startDate">
				~
			<input type="date" name="endDate">
		</div>
		<input type="submit" value="조회">
	</form>
	
	<h2>작업지시 목록</h2>
	<span id="selectedCheckboxCount">0</span>
	<div>
		<button id="addRowButton" onclick="location.href='/production/instruct/add'">추가</button>
		<button id="cancleButton" disabled="disabled">취소</button>
		<button id="updateButton">수정</button>
		<button id="deleteInstrButton" onclick="location.href='/production/instruct/delete'">삭제</button>
		<button id="submitButton" formaction="regInstr" formmethod="post" disabled="disabled">저장</button>
	</div>
	
	<table border="1" class="table-instrList">
		<tr>
			<th><input type="checkbox"></th>
			<th>작업지시코드</th>
			<th>라인명</th>
			<th>품목코드</th>
			<th>품목명</th>
			<th>작업상태</th>
			<th>지시일자</th>
			<th>지시수량</th>
			<th>수주번호</th>
			<th>납품예정일</th>
			<th>담당자</th>
		</tr>
		
		<c:forEach var="list" items="${instrList}" varStatus="status">
			<tr>
				<td><input type="checkbox" name="selectedEmpId" value="${list.work_id}"></td>
				<td><a href="/production/instruct/info?work_id=${list.work_id}&pro_id=${list.pro_id}">${list.work_num}</a></td>
				<td>${list.line_name}</td>
				<td>${list.pro_num}</td>
				<td>${list.pro_name}</td>
				<td>
				    <c:if test="${list.work_state=='대기'}">대기</c:if>
				    <c:if test="${list.work_state=='진행중'}">진행중</c:if>
				    <c:if test="${list.work_state=='완료'}">완료</c:if>
				</td>
				<td>
					<c:if test="${!empty list.update_date}">${list.update_date}</c:if>
					<c:if test="${empty list.update_date}">${list.reg_date}</c:if>
				</td>
				<td>${list.work_cnt}</td>
				<td>${list.oo_num}</td>
				<td>${list.oo_end_date}</td>
				<td>${list.emp_name}</td>
			</tr>
		</c:forEach>
	</table>
	
</body>
</html>