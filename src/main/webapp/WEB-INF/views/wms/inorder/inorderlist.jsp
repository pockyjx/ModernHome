<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
   				$(".table-inorderList input[type='checkbox']").prop("checked", false);
    			
    			// selected 클래스를 없앰 (css 없애기)
    			$(".table-inorderList tr").removeClass("selected");
            	
            	var newRow = '<tr>' +
	                '<td><input type="checkbox" class="form-check-input"></td>' +
	                '<td><input type="text" name="io_num" placeholder="(자동으로 부여)" style="border: none; background: transparent;" readonly></td>' +
	                '<td><input type="text" name="ma_num" placeholder="여기를 눌러 검색하세요" id="ma_num" readonly></td>' +
	                '<td><input type="text" name="ma_name" id="ma_name" style="border: none; background: transparent;" readonly></td>' +
	                '<td><input type="text" name="clt_num" placeholder="여기를 눌러 검색하세요" id="clt_num" readonly></td>' +
	                '<td><input type="text" name="clt_name" id="clt_name" style="border: none; background: transparent;" readonly></td>' +
	                '<td><input type="text" name="io_cnt" id="io_cnt" placeholder="발주량을 입력하세요"></td>' +
	                '<td><input type="text" name="ma_price" id="ma_price" style="border: none; background: transparent;" readonly></td>' +
	                '<td><input type="text" name="io_amount" placeholder="총금액(자동계산)" style="border: none; background: transparent;" readonly></td>' +
	                '<td><input type="date" name="io_date" style="border: none; background: transparent;" readonly></td>' +
	                '<td><input type="text" name="io_state" value="미완료" style="border: none; background: transparent;" readonly></td>' +
	                '<td><input type="date" name="rec_date" id="rec_date"></td>' +
	                '<td><input type="date" name="io_reg_date" style="border: none; background: transparent;" readonly></td>' +
	                '<td><input type="text" name="emp_id" style="border: none; background: transparent;" value="${sessionScope.emp_id }" readonly></td>' +
	                '</tr>';
	                
            	// 첫번째 자식<tr> 뒤에서 부터 행을 추가함    
                $(".table-inorderList tr:nth-child(1)").after(newRow);
                 
             	// 추가버튼, 수정버튼 비활성화, 취소버튼 활성화
				$("#addRowButton").attr("disabled", "disabled");
				$("#updateButton").attr("disabled", "disabled");
				$("#deleteInorderButton").attr("disabled", "disabled");
				
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
					$(".table-inorderList tr:nth-child(2)").remove();
					
					// 모든 체크박스의 체크 해제
					$(".table-inorderList input[type='checkbox']").prop("checked", false);
					
					// selected 클래스를 없앰 (css 없애기)
					$(".table-inorderList tr").removeClass("selected");
					
					// 추가버튼, 수정버튼 활성화, 취소버튼 비활성화
					$("#addRowButton").removeAttr("disabled");
					$("#updateButton").removeAttr("disabled");
					$("#deleteInorderButton").removeAttr("disabled");
					
					$("#cancelButton").attr("disabled", "disabled");
					$("#submitButton").attr("disabled", "disabled");
					
					pageStatus = "";
				}
				// 수정버튼 취소
				if(pageStatus == "update"){
					
					// 모든행에 대해 반복작업, 테이블 이름에 맞게 수정
					$(".table-inorderList tr").each(function() {
					var row = $(this);
						
					// 폼 초기화(기존내용으로)
					$("#inorderList")[0].reset();
					
					// 각 셀의 값을 원래 상태로 되돌림
					row.find("td:not(:first-child)").each(function(index) {
						
						var cellValue = $(this).data('prevValue'); // 수정 전의 기존값을 가져옴
						
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
					$(".table-inorderList tr").removeClass("selected");
					
					// 추가버튼, 수정버튼 활성화, 취소버튼 비활성화
					$("#addRowButton").removeAttr("disabled");
					$("#updateButton").removeAttr("disabled");
					$("#deleteInorderButton").removeAttr("disabled");
					
					$("#cancelButton").attr("disabled", "disabled");
					$("#submitButton").attr("disabled", "disabled");
					
					
					pageStatus = "";
					
					});
				} // if(update)문
			
				updateSelectedCheckboxCount();
				
			}); // 취소버튼
            
			
			
			
            
            // 수정 버튼 누를 시
			$("#updateButton").click(function(){
				
				var selectedCheckbox = $("input[name='selectedIoId']:checked");
				
				// 체크된 체크박스가 하나인 경우에만 수정 기능 작동
				if (selectedCheckbox.length === 1) {
// 					var io_num = selectedCheckbox.val();
					var empId = selectedCheckbox.val();
					var row = selectedCheckbox.closest("tr");
					var io_state = selectedCheckbox.closest("tr").find('td:eq(10)').text();
					
					
					// io_num 값을 넘기기 위해 히든에 추가함
// 					var ioNumInput = '<input type="hidden" name="io_num" value="' + io_num + '">';
// 					$(this).closest("form").append(ioNumInput);

					
					// 발주 상태가 완료일 경우에는 수정 불가능
					if(io_state == "완료") {
	 					alert("완료상태인 발주는 수정할 수 없습니다!");
	 					
	 					// css 삭제
	 					$(".table-inorderList tr").removeClass("selected");
	 					
	 					// 체크박스 해제
	 					$(".table-inorderList input[type='checkbox']").prop("checked", false);
						
	 					return;
					}
					
					// input type의 name 값 지정
					var cellNames = [
						"io_num",
						"ma_num",
						"ma_name",
						"clt_num",
						"clt_name",
			            "io_cnt",
			            "ma_price",
			            "io_amount",
			            "io_date",
			            "io_state",
			            "rec_date",
			            "io_update_date",
			            "update_emp_id"
					];
					
					// input type의 id 값 지정
					var cellIds = [
						"io_num",
						"ma_num",
						"ma_name",
						"clt_num",
						"clt_name",
			            "io_cnt",
			            "ma_price",
			            "io_amount",
			            "io_date",
			            "io_state",
			            "rec_date",
			            "io_update_date",
			            "update_emp_id"
					];
					
					
					// 각 셀을 수정 가능한 텍스트 입력 필드로 변경
					row.find("td:not(:first-child)").each(function(index) {
						
						var cellValue = $(this).text();
						var cellType = index === 10 ? "date" : "text"; // 날짜 타입은 date로 설정
						var cellName = cellNames[index];
						var cellId = cellIds[index];
						var cellContent;
						var cellOption = "";
						
						if(index == 5 || index == 9 || index == 10) {
							cellOption = "";
						}else if(index == 0 || index == 12 || index == 6){
							cellOption = "readonly";
						}else {
							cellOption = "disabled";
						}
						
						// 첫 행 링크(a태그) 유지하기 위해 적어둔 것
// 						if (index === 0){
// 							return;
// 						}else 
						if (index === 9){
							cellContent = '<td>' +
							'<select name="' + cellName + '">' +
							'<option value="완료" ' + (cellValue === '완료' ? 'selected' : '') + '>완료</option>' +
							'<option value="미완료" ' + (cellValue === '미완료' ? 'selected' : '') + '>미완료</option>' +
							'</select>' +
							'</td>';
						}else if (index === 12){
							cellContent = '<td><input type="' + cellType + '" name="' + cellName + '" value="' + ${sessionScope.emp_id} + '"' + cellOption + '></td>';
						
						}else {
							cellContent = '<td><input type="' + cellType + '" name="' + cellName + '" id="' + cellId + '" value="' + cellValue + '"' + cellOption+ '></td>';
						}
						
						// 기존 값을 임시 변수에 저장 -> 수정 후 취소버튼 시 담당자 칸에 세션값이 나오는 문제 해결위해
						$(this).data('prevValue', cellValue);
						
						$(this).html(cellContent);
						
						// 버튼 활성화, 비활성화
						$("#updateButton").attr("disabled", "disabled");
						$("#addRowButton").attr("disabled", "disabled");
						$("#deleteInorderButton").attr("disabled", "disabled");
						
						$("#cancelButton").removeAttr("disabled");
						$("#submitButton").removeAttr("disabled");
						
						pageStatus = "update";
					});
					
				}else if (selectedCheckbox.length === 0){
					alert("수정할 행을 선택하세요!")
					
				}else {
					alert("수정은 하나의 행만 가능합니다!");
				}
					
			}); // 수정 버튼 누를 시
		
		
			// 삭제버튼
	    	$("#deleteInorderButton").click(function(){
	    		
	    		
	    		var selectedCheckbox = $("input[name='selectedIoId']:checked");
	    		
	    		// 체크된 체크박스가 하나인 경우에만 수정 기능 작동
	    		if (selectedCheckbox.length === 0){
	    			alert("삭제할 행을 선택하세요!");
	    			
	    			// 선택안하면 submit을 막음
	    			event.preventDefault();
	    			
	    		}
	    	});
			
			
			// <th> 쪽 체크박스 클릭 시 해당 열의 <td> 부분의 행들을 선택하고 배경색 지정
	        $(".table-inorderList th input[type='checkbox']").click(function() {
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
	        $(".table-inorderList td input[type='checkbox']").click(function() {
	            var checkbox = $(this);
	            var isChecked = checkbox.prop('checked');
	            checkbox.closest('tr').toggleClass('selected', isChecked);
	        
	            updateSelectedCheckboxCount();
	        }); // <td> 쪽 체크박스 클릭 시 행 선택
		
			
	        function updateSelectedCheckboxCount() {
	            var totalCheckboxes = $(".table-inorderList td input[type='checkbox']").length;
	            var selectedCheckboxes = $(".table-inorderList td input[type='checkbox']:checked").length;
	            $("#selectedCheckboxCount").text("전체 ("+selectedCheckboxes + '/' + totalCheckboxes+")");
	        } // 체크박스 선택 시 체크박스 개수 구하기
	        
	        
        // submit버튼 유효성
        $("#submitButton").click(function() {
        	
			var form = $("#inorderList");
			form.attr("method", "post");
			form.attr("action", "/wms/regInorder");
			
			var ma_num = $("#ma_num").val();
			var clt_num = $("#clt_num").val();
			var io_cnt = $("#io_cnt").val();
			var rec_date = $("#rec_date").val();
			
				// 등록할 때
				if(pageStatus == "reg"){
					
					if(ma_num == null || ma_num == "") {
						$("ma_num").focus();
						alert("자재코드를 입력하세요!");
						return;
					}
					if(clt_num == null || clt_num == "") {
						$("clt_num").focus();
						alert("거래처 코드를 입력하세요!");
						return;
					}
					if(io_cnt == null || io_cnt == "") {
						$("#io_cnt").focus();
						alert("발주량을 입력하세요!");
						return;
					}
					if(rec_date == null || rec_date == "") {
						$("#rec_date").focus();
						alert("입고예정일을 입력하세요!");
						return;
					}
				} //if문
				
				
				// 수정할 때
				if(pageStatus == "update"){
					if(io_cnt == null || io_cnt == "") {
						$("io_cnt").focus();
						alert("발주량을 입력하세요!");
						return;
					}
				} // if문
				
				form.submit();
			}); //submit 버튼 유효성
			
			
		// 목록에서 발주 코드 클릭 시 해당 발주코드 발주서 출력
	      $(".openinorderInfo").click(function() {
			var io_id = $(this).closest("tr").find('td:eq(14)').text();
	    	  
    		var left = (screen.width - 900) / 2;
	 		var top = (screen.height - 450) / 2;
	    	window.open('/wms/inorder/inorderInfo?io_id='+io_id+'', 'popup', 'width=900, height=450, top=' + top + ', left=' + left + ', location=no, status=no, scrollbars=yes');
	    	 
	      
	     });
			
		});
		
		// 거래처 코드 입력란 클릭 시 팝업창 열기
       $(document).on("click", "input[name='clt_num']", function() {
			var left = (screen.width - 600) / 2;
			var top = (screen.height - 680) / 2;
			window.open('/wms/inorder/addPopup?txt=clt', 'popup', 'width=600, height=680, top=' + top + ', left=' + left + ', location=no, status=no, scrollbars=yes');
			});
       
		
       // 자재 코드 입력란 클릭 시 팝업창 열기
       $(document).on("click", "input[name='ma_num']", function() {
			var left = (screen.width - 580) / 2;
			var top = (screen.height - 680) / 2;
			window.open('/wms/inorder/addPopup?txt=ma', 'popup', 'width=580, height=680, top=' + top + ', left=' + left + ', location=no, status=no, scrollbars=yes');
			});
       

	
</script>
<style>
    .selected {
        background-color: #b3ccff;
    }
</style>

<!-- 검색칸 -->
<form method="get" name="search" action="" class="bg-light rounded p-3 m-3">

   	<div class="row mb-3">
   		<label for="ioSearch" class="col-sm-2 col-form-label"><b>발주일자</b></label>
   		
    		<div class="col-sm-2">
    			<div class="col-auto">
     			<input type="date" name="istartDate" class="form-control">
     			</div>
   			</div>
   			
   				<div class="col-auto">
   				~
   				</div>
   				
     		<div class="col-sm-2">
    			<div class="col-auto">
    				<input type="date" name="iendDate" class="form-control">
   				</div>
    		</div>
    		
   	</div>
   	
	<div class="row mb-3">
   		<label for="ioSearch" class="col-sm-2 col-form-label"><b>입고예정일</b></label>
   		
    		<div class="col-sm-2">
    			<div class="col-auto">
     				<input type="date" name="rstartDate" class="form-control">
  				</div>
			</div>
   				
				<div class="col-auto">
   				~
   				</div>
   				
   			<div class="col-sm-2">
    			<div class="col-auto">
     				<input type="date" name="rendDate" class="form-control">
   				</div>
    		</div>
    		
   	</div>
   	
	<div class="row mb-3">
		<label for="ioSearch" class="col-sm-2 col-form-label"><b>자재명</b></label>
		<div class="col-sm-4">
			<input type="text" name="ma_name" value="${ma_name}" placeholder="자재명을 입력하세요" class="form-control">
		</div>
	</div>
	
	<div class="row mb-3">
		<label for="ioSearch" class="col-sm-2 col-form-label"><b>발주상태</b></label>
		
		<div class="col-sm-2">
			<select name="io_state" class="form-select" style="background-color: #fff;">
         			<option value="전체">전체</option>
         			<option value="완료">완료</option>
         			<option value="미완료">미완료</option>
       		</select>
      	</div>
      	
      	<div class="col-auto">
			<button class="btn btn-primary m-3" type="submit" style="width:70px;">조회</button>
		</div>
	
   	</div>
</form>
<!-- 검색칸 --> 
             
		<hr>    
          
<form id="inorderList" method="post">
	<div class="d-flex align-items-center justify-content-between mb-2">             
		<h3 class="m-4">발주 목록</h3>
		<div>	
			<c:if test="${(sessionScope.emp_dept eq '자재' && sessionScope.emp_auth >= '1') || sessionScope.emp_auth == '3' }">
				<button type="button" class="btn btn-primary m-2" id="addRowButton">
					<i class="fa fa-plus"></i> 추가</button>
	    		<button type="button" class="btn btn-primary m-2" id="cancelButton" disabled>X 취소</button>
	    		<button type="button" class="btn btn-primary m-2" id="updateButton">
	    			<i class="fa fa-edit"></i> 수정</button>
			    <button type="submit" class="btn btn-primary m-2" id="deleteInorderButton" formaction="/wms/deleteInorder" formmethod="post">
			    	<i class="fa fa-trash"></i> 삭제</button>
			    <button type="button" class="btn btn-primary m-2" id="submitButton" disabled>
			    	<i class="fa fa-download"></i> 저장</button>
			</c:if>
		</div>
	</div>	

	<div class="bg-light text-center rounded p-4 m-3">
		<div class="d-flex align-items-center justify-content-between mb-4">	
			<span id="selectedCheckboxCount">0</span>
		</div>
		
		<input type="hidden" name="clt_id" id="clt_id">
		<input type="hidden" name="ma_id" id="ma_id">
<!-- 		<input type="hidden" name="ma_price" id="ma_price"> -->
				
		<div class="table-responsive">		
			<table class="table-inorderList table align-middle table-bordered table-hover mb-0">
					<tr>
						<th style="background-color: rgba(0,0,0,0.075);"><input type="checkbox" class="form-check-input"></th>
				    	<th style="background-color: rgba(0,0,0,0.075);">발주코드</th>
				    	<th style="background-color: rgba(0,0,0,0.075);">자재코드</th>
				    	<th style="background-color: rgba(0,0,0,0.075);">자재명</th>
				    	<th style="background-color: rgba(0,0,0,0.075);">거래처<br>코드</th>
				    	<th style="background-color: rgba(0,0,0,0.075);">거래처명</th>
				    	<th style="background-color: rgba(0,0,0,0.075);">발주량</th>
				    	<th style="background-color: rgba(0,0,0,0.075);">단가</th>
				    	<th style="background-color: rgba(0,0,0,0.075);">총금액</th>
				    	<th style="background-color: rgba(0,0,0,0.075);">발주일자</th>
				    	<th style="background-color: rgba(0,0,0,0.075);">발주상태</th>
				    	<th style="background-color: rgba(0,0,0,0.075);">입고<br>예정일</th>
				    	<th style="background-color: rgba(0,0,0,0.075);">등록일</th>
				    	<th style="background-color: rgba(0,0,0,0.075);">담당자</th>
				    	<th style="display: none;">발주코드 id</th>
					</tr>
					
				  	<c:forEach var="vo" items="${inorderList}" varStatus="status">
						<tr>
							<td><input type="checkbox" name="selectedIoId" value="${vo.io_id}" class="form-check-input"></td>
							<td><a href="javascript:void(0);" class="openinorderInfo">${vo.io_num }</a></td>
					    	<td>${vo.ma_num}</td>
					    	<td>${vo.ma_name}</td>
					    	<td>${vo.clt_num}</td>
					    	<td>${vo.clt_name}</td>
					    	<td>${vo.io_cnt}</td>
					    	<td>${vo.ma_price}</td>
					    	<td>${vo.ma_price*vo.io_cnt}</td>
					    	<td>${fn:substring(vo.io_date, 0, 10)}</td>
					   		<td>${vo.io_state}</td>
					   		<td>${fn:substring(vo.rec_date, 0, 10)}</td>
					   		<td>
								<c:if test="${!empty vo.io_update_date}">${fn:substring(vo.io_update_date, 0, 10)}</c:if>
								<c:if test="${empty vo.io_update_date}">${fn:substring(vo.io_reg_date, 0, 10)}</c:if>
							</td>
					   		<td>${vo.emp_name}</td>
   							<td style="display: none;">${vo.io_id }</td>
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
			<a class="page-link" href="/wms/inorder/inorderlist?page=${pm.startPage-1 }&istartDate=${istartDate}&iendDate=${iendDate}&rstartDate=${rstartDate}&rendDate=${rendDate}&ma_name=${ma_name}&io_state=${io_state}" aria-label="Previous">
      			<span aria-hidden="true">&laquo;</span>
     			</a>
   		</li>
   		</c:if>
   		
   		<c:forEach begin="${pm.startPage }" end="${pm.endPage }" step="1" var="idx">
   		<li 
   			<c:out value="${pm.pageVO.page == idx ? 'class=page-item active': 'class=page-item'}" />
   		>
   				<a class="page-link" href="/wms/inorder/inorderlist?page=${idx}&istartDate=${istartDate}&iendDate=${iendDate}&rstartDate=${rstartDate}&rendDate=${rendDate}&ma_name=${ma_name}&io_state=${io_state}">${idx }</a>
   		</li>
   		</c:forEach>
		
		<c:if test="${pm.next && pm.endPage > 0}">
		<li class="page-item">
     			<a class="page-link" href="/wms/inorder/inorderlist?page=${pm.endPage+1 }&istartDate=${istartDate}&iendDate=${iendDate}&rstartDate=${rstartDate}&rendDate=${rendDate}&ma_name=${ma_name}&io_state=${io_state}" aria-label="Next">
       		<span aria-hidden="true">&raquo;</span>
     			</a>
   		</li>
   		</c:if>
   		
 		</ul>
</nav>
<!-- 페이지 이동 버튼 -->
			
<%@ include file="../../inc/footer.jsp"%>