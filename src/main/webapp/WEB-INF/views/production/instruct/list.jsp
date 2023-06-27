<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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
	    $(".table-instrList").on("click", "td input[type='checkbox']", function() {
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
			
			if(selectedCheckbox.length === 1) {
				location.href = "/production/instruct/delete?work_id=" + workId;
			} else {
				alert("삭제할 행을 선택해주세요.");
				return false;
			}
		});
	
	    // <td> 쪽 체크박스 클릭 시 행 선택
	    $(".table-instrList td input[type='checkbox']").click(function() {
	        var checkbox = $(this);
	        var isChecked = checkbox.prop('checked');
	        checkbox.closest('tr').toggleClass('selected', isChecked);
	
	        updateSelectedCheckboxCount(); 
	    });
		
		// 체크박스 선택 시 체크박스 개수 구하기
	    function updateSelectedCheckboxCount() {
	        var totalCheckboxes = $(".table-instrList td input[type='checkbox']").length;
	        var selectedCheckboxes = $(".table-instrList td input[type='checkbox']:checked").length;
	        $("#selectedCheckboxCount").text("전체 ("+selectedCheckboxes + '/' + totalCheckboxes+")");
	    }
	});
	
	// 체크박스 중복 X
	function handleCheckbox(checkbox, value) {
		const checkboxes = document.getElementsByName('work_state');
		
		// 다른 체크박스 중에서 선택된 체크박스를 제외하고 체크 해제
		checkboxes.forEach(function(cb) {
		if (cb !== checkbox && cb.checked) {
			cb.checked = false;
			}
		});
	}
</script>
<style>
	.selected {
	    background-color: #b3ccff;
	}
</style>

<h2>작업지시 목록</h2>

<form method="get">
	<div>
		작업상태
			<label><input type="checkbox" name="work_state" value="대기"
				${param.work_state == '대기' ? 'checked' : ''} onclick="handleCheckbox(this, '대기')"> 대기</label>
			<label><input type="checkbox" name="work_state" value="진행중"
				${param.work_state == '진행중' ? 'checked' : ''} onclick="handleCheckbox(this, '진행중')"> 진행중</label>
			<label><input type="checkbox" name="work_state" value="완료"
				${param.work_state == '완료' ? 'checked' : ''} onclick="handleCheckbox(this, '완료')"> 완료</label>
	</div>
	<div>
		품목코드
			<input type="text" name="pro_num">
	</div>
	<div>
		<label>지시일자</label>
			<input type="date" name="startDate">
				~
			<input type="date" name="endDate">
		<button type="submit">조회</button>
	</div>
</form>

<%-- 	${instrList} --%>

<span id="selectedCheckboxCount">0</span>

<div>
	<button class="btn btn-primary m-2" id="addRowButton" onclick="location.href='/production/instruct/add'">추가</button>
	<button class="btn btn-primary m-2" id="updateButton">수정</button>
	<button class="btn btn-primary m-2" id="deleteInstrButton">삭제</button>
</div>

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
	
	<c:forEach var="list" items="${instrList}" varStatus="status">
		<tr>
			<td><input type="checkbox" name="selectedWorkId" value="${list.work_id}"></td>
			<td><a href="/production/instruct/info?work_id=${list.work_id}&pro_id=${list.pro_id}">${list.work_num}</a></td>
			<td>${list.line_num}</td>
			<td>${list.pro_num}</td>
			<td>${list.pro_name}</td>
			<td>
			    <c:if test="${list.work_state=='대기'}">대기</c:if>
			    <c:if test="${list.work_state=='진행중'}">진행중</c:if>
			    <c:if test="${list.work_state=='완료'}">완료</c:if>
			</td>
			<td>
				<c:if test="${!empty list.update_date}">${fn:substring(list.update_date, 0, 10)}</c:if>
				<c:if test="${empty list.update_date}">${fn:substring(list.reg_date, 0, 10)}</c:if>
			</td>
			<td>${list.work_cnt}</td>
			<td>${list.oo_num}</td>
			<td>${fn:substring(list.oo_end_date, 0, 10)}</td>
			<td>${list.emp_name}</td>
		</tr>
	</c:forEach>
</table>

<!-- 페이지 이동 버튼 -->
<nav aria-label="Page navigation example">
 	<ul class="pagination justify-content-center pagination-sm">
 		<c:if test="${pm.prev}">
			<li class="page-item">
				<a class="page-link" 
				href="/info/req/reqList?page=${pm.startPage-1}&work_state=${work_state}&pro_num=${pro_num}&startDate=${startDate}&endDate=${endDate}" 
				aria-label="Previous">
	      			<span aria-hidden="true">&laquo;</span>
	     		</a>
	   		</li>
   		</c:if>
   		
   		<c:forEach begin="${pm.startPage}" end="${pm.endPage}" step="1" var="idx">
	   		<li <c:out value="${pm.pageVO.page == idx ? 'class=page-item active': 'class=page-item'}" />>
	   			<a class="page-link" href="/production/instruct/list?page=${idx}&work_state=${work_state}&pro_num=${pro_num}&startDate=${startDate}&endDate=${endDate}">${idx}</a>
	   		</li>
   		</c:forEach>
		
		<c:if test="${pm.next && pm.endPage > 0}">
			<li class="page-item">
	     		<a class="page-link" 
	     		href="/production/instruct/list?page=${pm.endPage+1}&work_state=${work_state}&pro_num=${pro_num}&startDate=${startDate}&endDate=${endDate}" 
	     		aria-label="Next">
	       			<span aria-hidden="true">&raquo;</span>
	     		</a>
	   		</li>
   		</c:if>
 	</ul>
</nav>
<!-- 페이지 이동 버튼 -->
	
<%@ include file="../../inc/footer.jsp"%>