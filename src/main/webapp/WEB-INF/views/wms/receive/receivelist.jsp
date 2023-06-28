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
            	var newRow = '<tr>' +
	                '<td><input type="checkbox" class="form-check-input"></td>' +
	                '<td><input type="text" class="form-control" name="rec_num" placeholder="자동 부여" readonly></td>' +
	                '<td><input type="text" class="form-control" name="io_num" placeholder="클릭" id="io_num" readonly></td>' +
	                '<td><input type="text" class="form-control" name="ma_name" id="ma_name" readonly></td>' +
	                '<td><input type="text" class="form-control" name="io_cnt" id="io_cnt" readonly></td>' +
	                '<td><input type="text" class="form-control" name="rec_cnt" id="rec_cnt" placeholder="입고량" id="rec_cnt" readonly></td>' +
	                '<td><input type="text" class="form-control" id="clt_name" name="clt_name" placeholder="거래처명" readonly></td>' +
	                '<td><input type="text" class="form-control" name="rec_in_state" value="입고대기" readonly></td>' +
	                '<td><input type="text" class="form-control" name="wh_name" placeholder="B창고" readonly></td>' +
	                '<td><input type="date" class="form-control" name="rec_date"></td>' +
	                '<td><input type="text" class="form-control" name="emp_id" placeholder="담당자" value="${sessionScope.emp_id }" readonly></td>' +
	                '<td></td>' +
	                '</tr>';
	                
            	// 첫번째 자식<tr> 뒤에서 부터 행을 추가함    
                $(".table-receiveList tr:nth-child(1)").after(newRow);
                 
             	// 추가버튼, 수정버튼 비활성화, 취소버튼 활성화
				$("#addRowButton").attr("disabled", "disabled");
				$("#updateButton").attr("disabled", "disabled");
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
					$("#updateButton").removeAttr("disabled");
					$("#deleteReceiveButton").removeAttr("disabled");
					
					$("#cancelButton").attr("disabled", "disabled");
					$("#submitButton").attr("disabled", "disabled");
					
					pageStatus = "";
				}
				// 수정버튼 취소
				if(pageStatus == "update"){
					
					// 모든행에 대해 반복작업, 테이블 이름에 맞게 수정
					$(".table-receiveList tr").each(function() {
					var row = $(this);
					
					// 폼 초기화(기존내용으로)
					$("#receiveList")[0].reset();
					
					// 각 셀의 값을 원래 상태로 되돌림
					row.find("td:not(:first-child)").each(function(index) {
						var cellValue = $(this).find("input").val();
						if ($(this).find("select").length) {
							// <select>가 있는 경우 선택된 옵션의 텍스트로 변경
							var selectedOptionText = $(this).find("select option:selected").text();
							$(this).html(selectedOptionText);
						}else {
							// <select>가 없는 경우 셀 값을 그대로 표시
							$(this).html(cellValue);
						}
						
					});
					
					// selected 클래스를 없앰 (css 없애기)
					$(".table-receiveList tr").removeClass("selected");
					
					
					// 추가버튼, 수정버튼 활성화, 취소버튼 비활성화
					$("#addRowButton").removeAttr("disabled");
					$("#updateButton").removeAttr("disabled");
					$("#deleteReceiveButton").removeAttr("disabled");
					
					$("#cancelButton").attr("disabled", "disabled");
					$("#submitButton").attr("disabled", "disabled");
					
					
					pageStatus = "";
					
					});
				} // if(update)문
			
				updateSelectedCheckboxCount();
				
			}); // 취소버튼
            
            
//             // 수정 버튼 누를 시
// 			$("#updateButton").click(function(){
// 				var selectedCheckbox = $("input[name='selectedRecId']:checked");
				
// 				// 체크된 체크박스가 하나인 경우에만 수정 기능 작동
// 				if (selectedCheckbox.length === 1) {
// 					var empId = selectedCheckbox.val();
// 					var row = selectedCheckbox.closest("tr");
					
// 					// input type의 name 값 지정
// 					var cellNames = [
// 						"rec_num",
// 						"io_num",
// 						"ma_name",
// 						"io_cnt",
// 						"rec_cnt",
// 			            "clt_name",
// 			            "rec_in_state",
// 			            "wh_name",
// 			            "rec_date",
			           
// 			            "update_emp_id"
// 					];
					
					
// 					// 각 셀을 수정 가능한 텍스트 입력 필드로 변경
// 					row.find("td:not(:first-child)").each(function(index) {
// 						var cellValue = $(this).text();
// 						if(index == 10) {
// 		                    cellValue = ${sessionScope.emp_id}
// 		                }
// 						var cellType = index === 8 ? "date" : "text"; // 날짜 타입은 date로 설정
// 						var cellName = cellNames[index];
// 						var cellContent;
// 						var cellOption = "";
						
// 						if(index == 4 || index == 6 || index == 8) {
// 							cellOption = "";
// 						}else if(index == 0 || index == 10){
// 							cellOption = "readonly";
// 						}else {
// 							cellOption = "disabled";
// 						}
						
// 						if (index === 6){
// 							cellContent = '<td>' +
// 							'<select name="' + cellName + '">' +
// 							'<option value="입고완료" ' + (cellValue === '입고완료' ? 'selected' : '') + '>입고완료</option>' +
// 							'<option value="검사완료" ' + (cellValue === '검사완료' ? 'selected' : '') + '>검사완료</option>' +
// 							'</select>' +
// 							'</td>';
// 						}else {
// 							cellContent = '<td><input type="' + cellType + '" name="' + cellName + '" value="' + cellValue + '"' + cellOption + '></td>';
// 						}
						
// 						$(this).html(cellContent);
						
// 						// 버튼 활성화, 비활성화
// 						$("#updateButton").attr("disabled", "disabled");
// 						$("#addRowButton").attr("disabled", "disabled");
// 						$("#deleteReceiveButton").attr("disabled", "disabled");
						
// 						$("#cancelButton").removeAttr("disabled");
// 						$("#submitButton").removeAttr("disabled");
						
// 						pageStatus = "update";
// 					});
					
// 				}else if (selectedCheckbox.length === 0){
// 					alert("수정할 행을 선택해주세요!")
					
// 				}else {
// 					alert("수정은 하나의 행만 가능합니다!");
// 				}
            
// 		}); // 수정 버튼 누를 시
		
			
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
	           
	       });
		
		// 발주 코드 입력란 클릭 시 팝업창 열기
       $(document).on("click", "input[id='io_num']", function() {
    	   window.open('/wms/receive/addPopup?txt=io', 'popup', 'width=600, height=500, location=no, status=no, scrollbars=yes');
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
		<div class="col-sm-10">
			<input type="text" name="ma_name" value="${ma_name}">
		</div>
	</div>
	
	<div class="row mb-3">
		<label class="col-sm-2 col-form-label">발주코드</label>
		<div class="col-sm-10">
      		<input type="text" name="io_num" value="${io_num }">
		</div>
	</div>
	
	<div class="row mb-3">
		<label class="col-sm-2 col-form-label">입고일자</label>
		<div class="col-sm-10">
			<input type="date" name="startDate" value="${startDate }" >
               			~
			<input type="date" name="endDate" value="${endDate }">
     		<button class="btn btn-info rounded-pill m-2" type="submit">조회</button>
     	</div>
     </div>
</form>
    	
<!-- 검색칸 -->
             
<form id="receiveList" action="" method="GET">

	<div class="d-flex align-items-center justify-content-between mb-2">
	
		<h6 class="m-4">입고 관리</h6>
		
		<div class="m-4">
			<button type="button" class="btn btn-sm btn-primary m-2" id="addRowButton"><i class="fa fa-plus"></i> 추가</button>
	  		<button type="button" class="btn btn-sm btn-primary m-2" id="cancelButton" disabled>X 취소</button>
		    <button type="submit" class="btn btn-sm btn-primary m-2" id="deleteReceiveButton" formaction="/wms/deleteReceive" formmethod="post"><i class="fa fa-trash"></i> 삭제</button>
		    <button type="submit" class="btn btn-sm btn-primary m-2" id="submitButton" formaction="/wms/regReceive" formmethod="post" disabled><i class="fa fa-download"></i> 저장</button>
		</div>
	</div>
			
	<div class="bg-light text-center rounded p-4 m-3">
	
		<div class="d-flex align-items-center justify-content-between mb-4">
			<span id="selectedCheckboxCount">0</span>
		</div>			
	
		<input type="hidden" name="io_id" id="io_id">
		<input type="hidden" name="clt_id" id="clt_id">
	
		<div class="table-responsive">		
			<table class="table-receiveList table text-start align-middle table-bordered table-hover mb-0">
			
				<tr>
					<th><input type="checkbox" class="form-check-input"></th>
			    	<th>입고코드</th>
			    	<th>발주코드</th>
			    	<th>자재명</th>
			    	<th>발주량</th>
			    	<th>입고량</th>
			    	<th>거래처명</th>
			    	<th>입고상태</th>
			    	<th>창고명</th>
			    	<th>입고일자</th>
			    	<th>담당자</th>
			    	<th>입고처리</th>
				</tr>
				
			  	<c:forEach var="vo" items="${receiveList}" varStatus="status">
					<tr>
						<td><input type="checkbox" name="selectedRecId" value="${vo.rec_id}" class="form-check-input"></td>
				    	<td>${vo.rec_num}</td>
				    	<td>${vo.io_num}</td>
				    	<td>${vo.ma_name}</td>
				    	<td>${vo.io_cnt}</td>
				    	<td>${vo.rec_cnt}</td>
				    	<td>${vo.clt_name}</td>
				    	<td>${vo.rec_in_state}</td>
				    	<td>${vo.wh_name}</td>
				   		<td>${fn:substring(vo.rec_date, 0, 10)}</td>
				   		<td>${vo.emp_name}</td>
				   		<td>
				   		<c:choose>
				   		<c:when test="${vo.rec_in_state eq '입고대기'}">
						<button type="button" class="btn btn-sm btn-danger">입고대기</button>
						</c:when>
						<c:when test="${vo.rec_in_state eq '검사완료'}">
						<button type="button" class="btn btn-sm btn-success release">입고처리</button>
						</c:when>
						</c:choose>
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