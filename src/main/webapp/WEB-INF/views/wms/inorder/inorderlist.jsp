<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ include file="../../inc/header.jsp"%>
<%@ include file="../../inc/sidebar.jsp"%>
<%@ include file="../../inc/nav.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>발주 관리</title>
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
	                '<td><input type="checkbox"></td>' +
	                '<td><input type="text" name="io_num" placeholder="자동으로 부여" readonly></td>' +
	                '<td><input type="text" name="ma_num" placeholder="자재코드" id="ma_num" readonly></td>' +
	                '<td><input type="text" name="ma_name" placeholder="자재명" id="ma_name" readonly></td>' +
	                '<td><input type="text" name="clt_num" placeholder="거래처 코드" id="clt_num" readonly></td>' +
	                '<td><input type="text" name="clt_name" placeholder="거래처명" id="clt_name" readonly></td>' +
	                '<td><input type="text" name="io_cnt" placeholder="발주량"></td>' +
	                '<td><input type="text" name="io_unit" placeholder="단위"></td>' +
	                '<td><input type="text" name="io_amount" placeholder="총금액(자동계산)" readonly></td>' +
	                '<td><input type="date" name="io_date" readonly></td>' +
	                '<td><input type="text" name="io_state" value="미완료" readonly></td>' +
	                '<td><input type="date" name="rec_date" placeholder="입고예정일"></td>' +
	                '<td><input type="text" name="emp_id" placeholder="담당자" value="${sessionScope.emp_id }" readonly></td>' +
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
			
			}); // 취소버튼
            
            
            // 수정 버튼 누를 시
			$("#updateButton").click(function(){
				var selectedCheckbox = $("input[name='selectedIoId']:checked");
				
				// 체크된 체크박스가 하나인 경우에만 수정 기능 작동
				if (selectedCheckbox.length === 1) {
					var empId = selectedCheckbox.val();
					var row = selectedCheckbox.closest("tr");
					
					// input type의 name 값 지정
					var cellNames = [
						"io_num",
						"ma_num",
						"ma_name",
						"clt_num",
						"clt_name",
			            "io_cnt",
			            "io_unit",
			            "io_amount",
			            "io_update_date",
			            "io_state",
			            "rec_date",
			            "update_emp_id"
					];
					
					
					// 각 셀을 수정 가능한 텍스트 입력 필드로 변경
					row.find("td:not(:first-child)").each(function(index) {
						var cellValue = $(this).text();
						if(index == 11) {
		                    cellValue = ${sessionScope.emp_id}
		                }
						var cellType = index === 10 ? "date" : "text"; // 날짜 타입은 date로 설정
						var cellName = cellNames[index];
						var cellContent;
						var cellOption = "";
						
						if(index == 5 || index == 9 || index == 10) {
							cellOption = "";
						}else if(index == 0 || index == 11){
							cellOption = "readonly";
						}else {
							cellOption = "disabled";
						}
						
						if (index === 9){
							cellContent = '<td>' +
							'<select name="' + cellName + '">' +
							'<option value="완료" ' + (cellValue === '완료' ? 'selected' : '') + '>완료</option>' +
							'<option value="미완료" ' + (cellValue === '미완료' ? 'selected' : '') + '>미완료</option>' +
							'</select>' +
							'</td>';
						}else {
							cellContent = '<td><input type="' + cellType + '" name="' + cellName + '" value="' + cellValue + '"' + cellOption + '></td>';
						}
						
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
					alert("수정할 행을 선택해주세요!")
					
				}else {
					alert("수정은 하나의 행만 가능합니다!");
				}
			
		}); // 수정 버튼 누를 시
		
		
			
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
	           
	       });
		
		// 거래처 코드 입력란 클릭 시 팝업창 열기
       $(document).on("click", "input[name='clt_num']", function() {
    	   window.open('/wms/inorder/addPopup?txt=clt', 'popup', 'width=600, height=500, location=no, status=no, scrollbars=yes');
       });
       
       // 자재 코드 입력란 클릭 시 팝업창 열기
       $(document).on("click", "input[name='ma_num']", function() {
    	   window.open('/wms/inorder/addPopup?txt=ma', 'popup', 'width=600, height=500, location=no, status=no, scrollbars=yes');
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
		<!-- 검색칸 -->
			<fieldset>
               	<form name="search" method="get" action="">
                   	<div>
                   		<label>발주일자</label>
	                   	<input type="date" name="istartDate">
                  			~
	                   	<input type="date" name="iendDate">
                   	</div>
		       		<br>
		       		<div>
                   		<label>입고예정일</label>
	                   	<input type="date" name="rstartDate">
                  			~
	                   	<input type="date" name="rendDate">
                   	</div>
		       		<span>자재명 :
		       			<input type="text" name="ma_name" placeholder="자재명을 입력하세요">
		       		</span>
		       		<span>발주상태
		       			<select name="io_state">
                   			<option value="전체">전체</option>
                   			<option value="완료">완료</option>
                   			<option value="미완료">미완료</option>
                 		</select>
		       		</span>
		      		<input type="submit" value="조회">
             	</form>
             </fieldset> 
		<!-- 검색칸 --> 
             
		<hr>    
             
		<h2>발주</h2>
			<form id="inorderList" action="" method="GET">
			
			<span id="selectedCheckboxCount">0</span>
			
			<button type="button" class="btn btn-primary m-2" id="addRowButton"><i class="fa fa-plus"></i> 추가</button>
    		<button type="button" class="btn btn-primary m-2" id="cancelButton" disabled>X 취소</button>
    		<button type="button" class="btn btn-primary m-2" id="updateButton"><i class="fa fa-edit"></i> 수정</button>
		    <button type="submit" class="btn btn-primary m-2" id="deleteInorderButton" formaction="/wms/deleteInorder" formmethod="post"><i class="fa fa-trash"></i> 삭제</button>
		    <button type="submit" class="btn btn-primary m-2" id="submitButton" formaction="/wms/regInorder" formmethod="post" disabled><i class="fa fa-download"></i> 저장</button>
			

			<table class="table-inorderList" border="1">
				
			<input type="hidden" name="clt_id" id="clt_id">
			<input type="hidden" name="ma_id" id="ma_id">
				
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
				
			  	<c:forEach var="vo" items="${inorderList}" varStatus="status">
					<tr>
						<td><input type="checkbox" name="selectedIoId" value="${vo.io_id}"></td>
				    	<td>${vo.io_num}</td>
				    	<td>${vo.ma_num}</td>
				    	<td>${vo.ma_name}</td>
				    	<td>${vo.clt_num}</td>
				    	<td>${vo.clt_name}</td>
				    	<td>${vo.io_cnt}</td>
				    	<td>${vo.io_unit}</td>
				    	<td>${vo.ma_price*vo.io_cnt}</td>
				    	<td>
							<c:if test="${!empty vo.io_update_date}">${fn:substring(vo.io_update_date, 0, 10)}</c:if>
							<c:if test="${empty vo.io_update_date}">${fn:substring(vo.io_date, 0, 10)}</c:if>
						</td>
				   		<td>${vo.io_state}</td>
				   		<td>${fn:substring(vo.rec_date, 0, 10)}</td>
				   		<td>${vo.emp_name}</td>
				    </tr>
			    </c:forEach>
			</table>
			
			</form>
</body>
</html>
<%@ include file="../../inc/footer.jsp"%>