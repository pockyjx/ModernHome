<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../inc/header.jsp"%>
<%@ include file="../../inc/sidebar.jsp"%>
<%@ include file="../../inc/nav.jsp"%>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" />
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="//code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<script>
	$(document).ready(function() {
		// 체크박스 선택 시 체크박스의 개수 구하기
        updateSelectedCheckboxCount();
		
		// <th> 쪽 체크박스 클릭 시 해당 열의 <td> 부분의 행들을 선택하고 배경색 지정
		$("table th input[type='checkbox']").click(function() {
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
		});
		
		// 수정 버튼 누를 시
		$("#updateButton").click(function(){
			var selectedCheckbox = $("input[name='selectedWorkId']:checked");
			
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
        $("table th input[type='checkbox']").click(function() {
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
        $("table td input[type='checkbox']").click(function() {
            var checkbox = $(this);
            var isChecked = checkbox.prop('checked');
            checkbox.closest('tr').toggleClass('selected', isChecked);
        });
        
        // 체크박스 클릭 시 선택된 행 삭제
        $(".table-prfrmList").on("click", "td input[type='checkbox']", function() {
            var checkbox = $(this);
            if (checkbox.prop("checked")) {
            	var workId = selectedCheckbox.val();
				location.href = "/production/instruct/delete?work_id=" + workId;
                checkbox.closest("tr").addClass("selected");
            } else {
                checkbox.closest("tr").removeClass("selected");
            }
        });
        // 삭제 버튼 누를 시
		$("#deleteInstrButton").click(function(){
			var selectedCheckbox = $("input[name='selectedWorkId']:checked");
			var workId = selectedCheckbox.val();
			location.href = "/production/instruct/delete?work_id=" + workId;
		});

        // <td> 쪽 체크박스 클릭 시 행 선택
        $(".table-prfrmList td input[type='checkbox']").click(function() {
            var checkbox = $(this);
            var isChecked = checkbox.prop('checked');
            checkbox.closest('tr').toggleClass('selected', isChecked);

            updateSelectedCheckboxCount(); 
        });
		
		// 체크박스 선택 시 체크박스 개수 구하기
        function updateSelectedCheckboxCount() {
            var totalCheckboxes = $(".table-prfrmList td input[type='checkbox']").length;
            var selectedCheckboxes = $(".table-prfrmList td input[type='checkbox']:checked").length;
            $("#selectedCheckboxCount").text("전체 ("+selectedCheckboxes + '/' + totalCheckboxes+")");
        }
	});
</script>
<style>
	.selected {
	    background-color: #b3ccff;
	}
</style>

	<h2>생산관리</h2>

	<form method="get">
		양불 여부
			<label><input type="radio" name="gb_yn" value="Y"> 양품</label>
			<label><input type="radio" name="gb_yn" value="N"> 불량품</label>
		작업지시코드
			<input type="text" name="work_num">
		<br>
		<label>등록일자</label>
		<input type="date" name="startDate">
			~
		<input type="date" name="endDate">
		<button type="submit">조회</button>
	</form>
	
	<br>
	
	<!-- 작업지시 중 검수상태(qc_yn)가 완료인 리스트 -->
	<table border="1" class="table-instrList">
		<tr>
			<th><input type="checkbox"></th>
			<th>작업지시코드</th>
			<th>라인코드</th>
			<th>품목코드</th>
			<th>품목명</th>
			<th>작업상태</th>
			<th>지시일자</th>
			<th>지시수량</th>
			<th>수주번호</th>
			<th>납품예정일</th>
			<th>담당자</th>
		</tr>
		
		<c:forEach var="list" items="${qiList}" varStatus="status">
			<tr>
				<td><input type="checkbox" name="selectedWorkId" value="${list.work_id}"></td>
				<td>${list.work_num}</td>
				<td>${list.line_num}</td>
				<td>${list.pro_num}</td>
				<td>${list.pro_name}</td>
				<td>${list.work_state}</td>
				<td>
					<c:if test="${!empty list.update_date}">${list.update_date}</c:if>
					<c:if test="${empty list.update_date}">${list.reg_date}</c:if>
				</td>
				<td>${list.work_cnt}</td>
				<td>${list.oo_num}</td>
				<td>${list.oo_end_date}</td>
				<td>
					<c:if test="${!empty list.update_emp_id}">${list.emp_name}</c:if>
					<c:if test="${empty list.update_emp_id}">${list.emp_name}</c:if>
				</td>
			</tr>
		</c:forEach>
	</table>
	<!-- 작업지시 중 검수상태(qc_yn)가 완료인 리스트 -->
	
	<hr> <!-- ================================================================================== -->
	
	<span id="selectedCheckboxCount">0</span>
	
	<div>
		<button id="addRowButton" onclick="location.href='/production/instruct/add'">추가</button>
		<button id="updateButton">수정</button>
		<button id="deleteInstrButton">삭제</button>
	</div>
	
	<!-- 생산실적 리스트 -->
	<table border="1" class="table-prfrmList">
		<tr>
			<th><input type="checkbox"></th>
			<th>생산실적코드</th>
			<th>작업지시코드</th>
			<th>라인코드</th>
			<th>품목코드</th>
			<th>품목명</th>
			<th>등록일</th>
			<th>양불여부</th>
			<th>실적수량</th>
			<th>불량수량</th>
			<th>담당자</th>
			<th>목표수량</th>
		</tr>
		
		<c:forEach var="list" items="" varStatus="status">
			<tr>
				<td><input type="checkbox" name="selectedWorkId" value="${prfrm_id}"></td>
				<td>${prfrm_num}</td>
				<td>${work_num}</td>
				<td>${line_num}</td>
				<td>${pro_num}</td>
				<td>${pro_name}</td>
				<td>
					<c:if test="${!empty update_date}">${update_date}</c:if>
					<c:if test="${empty update_date}">${reg_date}</c:if>
				</td>
				<td>${gb_yn}</td>
				<td>${prfrm_cnt}</td>
				<td>${work_cnt - prfrm_cnt}</td>
				<td>
					<c:if test="${!empty update_emp_id}">${emp_name}</c:if>
					<c:if test="${empty update_emp_id}">${emp_name}</c:if>
				</td>
				<td>${work_cnt}</td>
			</tr>
		</c:forEach>
	</table>
	<!-- 생산실적 리스트 -->
	
<%@ include file="../../inc/footer.jsp"%>