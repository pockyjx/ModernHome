<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%@ include file="../../inc/header.jsp"%>
<%@ include file="../../inc/sidebar.jsp"%>
<%@ include file="../../inc/nav.jsp"%>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" />
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="//code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>

<script>
		<!-- 캘린터 위젯 적용 -->
// 			/* 설정 */	
// 			const config = {
// 				dateFormat : 'yy-mm-dd',
// 				showOn : "button",
// 				buttonText:"날짜 선택",
// 				prevText: '이전달',
// 			    nextText: '다음달',
// 			    currentText:'오늘',
// 			    closeText: '닫기',
// 			    monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
// 			    monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
// 			    dayNames:['일요일','월요일','화요일','수요일','목요일','금요일','토요일'],
// 				dayNamesMin:['일','월','화','수','목','금','토'],
// 			    dayNamesShort: ['일','월','화','수','목','금','토'],
// 			    yearSuffix: '년',
// 			    changeMonth: true,
// 		        changeYear: true
// 			}
			
// 			/* 캘린더 */
// 			$(function() {
// 				//datepicker 한국어로 사용하기 위한 언어설정
// 	            $.datepicker.setDefaults($.datepicker.regional['ko']); 
// 				$( "input[name='startDate']" ).datepicker(config);
// 				$( "input[name='endDate']" ).datepicker(config);
// 			});
			
//-------------------------------------------------------------------------------------------------
		var pageStatus = "";
		
		$(document).ready(function() {
			
			updateSelectedCheckboxCount();
			
			// 추가 버튼 클릭 시 행 추가
            // 추가버튼 1번 누르면 추가버튼 비활성화
            $("#addRowButton").click(function() {
            	
            	// 모든 체크박스의 체크 해제
    			$(".table-receiveList input[type='checkbox']").prop("checked", false);
    			
    			// selected 클래스를 없앰 (css 없애기)
    			$(".table-receiveList tr").removeClass("selected");
            	
            	var newRow = '<tr>' +
	                '<td><input type="checkbox" class="form-check-input"></td>' +
	                '<td><input type="text" class="form-control" name="rec_num" placeholder="(자동부여)" style="border: none; background: transparent;" readonly></td>' +
	                '<td><input type="text" class="form-control" name="io_num" placeholder="클릭" id="io_num" readonly></td>' +
	                '<td><input type="text" class="form-control" name="ma_name" id="ma_name" style="border: none; background: transparent;" readonly></td>' +
	                '<td><input type="text" class="form-control" name="io_cnt" id="io_cnt" style="border: none; background: transparent;" readonly></td>' +
	                '<td><input type="text" class="form-control" name="rec_cnt" id="rec_cnt" id="rec_cnt" style="border: none; background: transparent;" readonly></td>' +
	                '<td><input type="text" class="form-control" id="clt_name" name="clt_name" style="border: none; background: transparent;" readonly></td>' +
	                '<td><input type="text" class="form-control" name="rec_in_state" value="입고대기" style="border: none; background: transparent;" readonly></td>' +
	                '<td><input type="text" class="form-control" name="wh_name" placeholder="B창고" style="border: none; background: transparent;" readonly></td>' +
	                '<td></td>' +
	                '<td><input type="text" class="form-control" name="emp_id" style="border: none; background: transparent;" value="${sessionScope.emp_id }" readonly></td>' +
	                '<td></td>' +
	                '</tr>';
	                
            	// 첫번째 자식<tr> 뒤에서 부터 행을 추가함    
                $(".table-receiveList tr:nth-child(1)").after(newRow);
                 
             	// 추가버튼, 수정버튼 비활성화, 취소버튼 활성화
				$("#addRowButton").attr("disabled", "disabled");
				$("#deleteReceiveButton").attr("disabled", "disabled");
				
				$("#cancelButton").removeAttr("disabled");
				$("#submitButton").removeAttr("disabled");
				
				pageStatus = "reg";
				
				updateSelectedCheckboxCount();
				
            }); // 여기까지 추가 버튼
            
            
         	// 취소 버튼 누를 시 
			$("#cancelButton").click(function(){
				
				// 등록버튼 취소
				if(pageStatus == "reg"){
					// 두번째 tr (추가된 행)을 삭제함
					$(".table-receiveList tr:nth-child(2)").remove();
					
					// 모든 체크박스의 체크 해제
					$(".table-receiveList input[type='checkbox']").prop("checked", false);
					
					// selected 클래스를 없앰 (css 없애기)
					$(".table-receiveList tr").removeClass("selected");
					
					// 추가버튼, 수정버튼 활성화, 취소버튼 비활성화
					$("#addRowButton").removeAttr("disabled");
					$("#deleteReceiveButton").removeAttr("disabled");
					
					$("#cancelButton").attr("disabled", "disabled");
					$("#submitButton").attr("disabled", "disabled");
					
					pageStatus = "";
				}
			
				updateSelectedCheckboxCount();
				
			}); // 취소버튼
            
			
			// 삭제버튼
	    	$("#deleteReceiveButton").click(function(){
	    		
	    		var selectedCheckbox = $("input[name='selectedRecId']:checked");
	    		
	    		// 체크된 체크박스가 하나인 경우에만 수정 기능 작동
	    		if (selectedCheckbox.length === 0){
	    			alert("삭제할 행을 선택하세요!");
	    			
	    			// 선택안하면 submit을 막음
	    			event.preventDefault();
	    		}
	    	});
			
			
			// <th> 쪽 체크박스 클릭 시 해당 열의 <td> 부분의 행들을 선택하고 배경색 지정
	        $(".table-receiveList th input[type='checkbox']").click(function() {
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
	        $(".table-receiveList td input[type='checkbox']").click(function() {
	            var checkbox = $(this);
	            var isChecked = checkbox.prop('checked');
	            checkbox.closest('tr').toggleClass('selected', isChecked);
	        
	            updateSelectedCheckboxCount();
	        }); // <td> 쪽 체크박스 클릭 시 행 선택
		
			
	        function updateSelectedCheckboxCount() {
	            var totalCheckboxes = $(".table-receiveList td input[type='checkbox']").length;
	            var selectedCheckboxes = $(".table-receiveList td input[type='checkbox']:checked").length;
	            $("#selectedCheckboxCount").text("전체 ("+selectedCheckboxes + '/' + totalCheckboxes+")");
	        } // 체크박스 선택 시 체크박스 개수 구하기
	        
	           
		// 입고 처리 버튼 클릭 시 재고 자동 반영 
		$(".receive").click(function() {
			var rec_id = $(this).closest("tr").find('td:eq(0)').find('input').val();
			var ma_id = $(this).closest("tr").find('td:eq(3)').text();
			var rec_cnt = $(this).closest("tr").find('td:eq(6)').text();
			
			if(result = window.confirm("입고처리 하시겠습니까?")) {
				location.href="/wms/acceptReceive?rec_id="+rec_id+"&ma_id="+ma_id+"&rec_cnt="+rec_cnt;
			}
		});
	    
		// 유효성 검사
		$("#submitButton").click(function() {
			
			var form = $("#receiveList");
			form.attr("method", "post");
			form.attr("action", "/wms/regReceive");
			
			var io_num = $('#io_num').val();
			if(io_num == null || io_num == "") {
				alert('발주코드를 입력하세요!');
				$("#io_num").focus();
				return;
			}
			
			form.submit();
			
		});
	        
	        
	 });
		
	// 발주 코드 입력란 클릭 시 팝업창 열기
	$(document).on("click", "input[id='io_num']", function() {
		var left = (screen.width - 600) / 2;
		var top = (screen.height - 500) / 2;
		window.open('/wms/receive/addPopup?txt=io', 'popup', 'width=600, height=500, top=' + top + ', left=' + left + ', location=no, status=no, scrollbars=yes');
		});
		
</script>
<style>
    .selected {
        background-color: #b3ccff;
    }
</style>

<!-- 검색칸 -->
<form name="search" method="get" action="" class="bg-light rounded p-3 m-3">
	
	<div class="row mb-3">
		<label class="col-sm-2 col-form-label"><b>자재명</b></label>
		<div class="col-sm-4">
			<input type="text" name="ma_name" value="${ma_name}" placeholder="자재명을 입력하세요" class="form-control">
		</div>
	</div>
	
	<div class="row mb-3">
		<label class="col-sm-2 col-form-label"><b>발주코드</b></label>
		<div class="col-sm-4">
      		<input type="text" name="io_num" value="${io_num }" placeholder="발주코드를 입력하세요" class="form-control">
		</div>
	</div>
	
	<div class="row mb-3">
		<label class="col-sm-2 col-form-label"><b>입고일자</b></label>
		
		<div class="col-sm-2">
			<div class="col-auto">
				<input type="date" name="startDate" value="${startDate }" class="form-control">
            </div>
		</div> 

			<div class="col-auto">
   				~
			</div>
			
		<div class="col-sm-2">
			<div class="col-auto">	
				<input type="date" name="endDate" value="${endDate }" class="form-control">
     		</div>
   		</div>
   		
   		<div class="col-auto">
			<button class="btn btn-primary m-3" type="submit" style="width:70px;">조회</button>
		</div>
		
   	</div>
</form>
<!-- 검색칸 -->

		<hr>
             

<form id="receiveList" method="post">
	<div class="d-flex align-items-center justify-content-between mb-2">
		<h3 class="m-4">입고 관리</h3>
		<div>
			<c:if test="${(sessionScope.emp_dept eq '자재' && sessionScope.emp_auth >= '1') || sessionScope.emp_auth == '3' }">
				<button type="button" class="btn btn-primary m-2" id="addRowButton">
					<i class="fa fa-plus"></i> 추가</button>
		  		<button type="button" class="btn btn-primary m-2" id="cancelButton" disabled>X 취소</button>
			    <button type="submit" class="btn btn-primary m-2" id="deleteReceiveButton" formaction="/wms/deleteReceive" formmethod="post">
			    	<i class="fa fa-trash"></i> 삭제</button>
<!-- 			    <button type="button" class="btn btn-primary m-2" id="submitButton" formaction="/wms/regReceive" formmethod="post" disabled> -->
<!-- 			    	<i class="fa fa-download"></i> 저장</button> -->
			    <button type="button" class="btn btn-primary m-2" id="submitButton" disabled>
			    	<i class="fa fa-download"></i> 저장</button>
			</c:if>
		</div>
	</div>
			
	<div class="bg-light text-center rounded p-4 m-3">
			<div class="d-flex align-items-center justify-content-between mb-4">
				<span id="selectedCheckboxCount">0</span>
			</div>			
	
			<input type="hidden" name="io_id" id="io_id">
			<input type="hidden" name="clt_id" id="clt_id">
	
			<div class="table-responsive">		
				<table class="table-receiveList table align-middle table-bordered table-hover mb-0">
					<tr>
						<th style="background-color: rgba(0,0,0,0.075);"><input type="checkbox" class="form-check-input"></th>
				    	<th style="background-color: rgba(0,0,0,0.075);">입고코드</th>
				    	<th style="background-color: rgba(0,0,0,0.075);">발주코드</th>
				    	<th style="display: none; background-color: rgba(0,0,0,0.075);">자재id</th>
				    	<th style="background-color: rgba(0,0,0,0.075);">자재명</th>
				    	<th style="background-color: rgba(0,0,0,0.075);">발주량</th>
				    	<th style="background-color: rgba(0,0,0,0.075);">입고량</th>
				    	<th style="background-color: rgba(0,0,0,0.075);">거래처명</th>
				    	<th style="background-color: rgba(0,0,0,0.075);">입고상태</th> 
				    	<th style="background-color: rgba(0,0,0,0.075);">창고명</th>
				    	<th style="background-color: rgba(0,0,0,0.075);">입고일자</th>
				    	<th style="background-color: rgba(0,0,0,0.075);">담당자</th>
				    	<th style="background-color: rgba(0,0,0,0.075);">입고처리</th> 
					</tr>
					
				  	<c:forEach var="vo" items="${receiveList}" varStatus="status">
						<tr>
							<td><input type="checkbox" name="selectedRecId" value="${vo.rec_id}" class="form-check-input"></td>
					    	<td>${vo.rec_num}</td>
					    	<td>${vo.io_num}</td>
					    	<td style="display: none">${vo.ma_id }</td>
					    	<td>${vo.ma_name}</td>
					    	<td>${vo.io_cnt}</td>
					    	<td>${vo.rec_cnt}</td>
					    	<td>${vo.clt_name}</td>
					    	<td>${vo.rec_in_state}</td>
					    	<td>${vo.wh_name}</td>
					   		<td>${fn:substring(vo.rec_date, 0, 10)}</td>
					   		<td>${vo.emp_name}</td>
					   		<td>
					   		<c:if test="${sessionScope.emp_dept eq '자재' && (sessionScope.emp_auth == '2' || sessionScope.emp_auth == '3')}">
					   		<c:choose>
					   		<c:when test="${vo.rec_in_state eq '입고대기'}">
							<button type="button" class="btn btn-sm btn-danger">입고<br>대기</button>
							</c:when>
							<c:when test="${vo.rec_in_state eq '검사완료'}">
							<button type="button" class="btn btn-sm btn-success receive">입고<br>처리</button>
							</c:when>
							<c:when test="${vo.rec_in_state eq '입고완료'}">
							<button type="button" class="btn btn-sm btn-primary">입고<br>완료</button>
							</c:when>
							</c:choose>
							</c:if>
							</td>
					    </tr>
				    </c:forEach>
			</table>
		</div>	
	</div>
</form>
			
<!-- 페이지 이동 버튼 -->
<nav aria-label="Page navigation example">
 		<ul class="pagination justify-content-center pagination-sm">
 		
 			<c:if test="${pm.prev }">
		<li class="page-item">
			<a class="page-link" href="/wms/receive/receivelist?page=${pm.startPage-1 }&startDate=${startDate}&endDate=${endDate}&ma_name=${ma_name}&io_num=${io_num}" aria-label="Previous">
      			<span aria-hidden="true">&laquo;</span>
     			</a>
   		</li>
   		</c:if>
   		
   		<c:forEach begin="${pm.startPage }" end="${pm.endPage }" step="1" var="idx">
   		<li 
   			<c:out value="${pm.pageVO.page == idx ? 'class=page-item active': 'class=page-item'}" />
   		>
   				<a class="page-link" href="/wms/receive/receivelist?page=${idx}&startDate=${startDate}&endDate=${endDate}&ma_name=${ma_name}&io_num=${io_num}">${idx }</a>
   		</li>
   		</c:forEach>
		
		<c:if test="${pm.next && pm.endPage > 0}">
		<li class="page-item">
     			<a class="page-link" href="/wms/receive/receivelist?page=${pm.endPage+1 }&startDate=${startDate}&endDate=${endDate}&ma_name=${ma_name}&io_num=${io_num}" aria-label="Next">
       		<span aria-hidden="true">&raquo;</span>
     			</a>
   		</li>
   		</c:if>
   		
 		</ul>
</nav>

<!-- 페이지 이동 버튼 -->
			
<%@ include file="../../inc/footer.jsp"%>