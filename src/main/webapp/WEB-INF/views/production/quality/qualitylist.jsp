<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ include file="../../inc/header.jsp"%>
<%@ include file="../../inc/sidebar.jsp"%>
<%@ include file="../../inc/nav.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/xlsx/0.17.1/xlsx.full.min.js"></script>
    <script>
    var pageStatus = "";
	    $(document).ready(function() {
	    	
	        // 수정 버튼 누를 시 (updateButton)
	        $("#updateButton").click(function(){
	            var selectedCheckbox = $("input[name='selectedQcId']:checked");

	            // 체크된 체크박스가 하나인 경우에만 수정 기능 작동
	            if(selectedCheckbox.length === 1) {
	                var empId = selectedCheckbox.val();
	                var row = selectedCheckbox.closest("tr");
	                
	                // input type의 name 값 지정
                	var cellNames = [
                		"work_num",
                		"qc_num",
                		"line_num",
                		"line_name",
                		"pro_num",
                		"pro_name",
                		"update_emp_id",
                		"qc_date",
                		"qc_cnt",
                		"prfrm_cnt",
                		"qc_yn"
                	];

	                // 각 셀을 수정 가능한 텍스트 입력 필드로 변경
	                row.find("td:not(:first-child)").each(function(index){
	                	var cellValue = $(this).text();
// 	                	var cellType = index === 7? "date" : "text";
	                	var cellName = cellNames[index];
// 	                	var cellDisabled = [0, 1, 2, 3, 4, 5].includes(index)? "disabled" : "";
	                	var cellContent;

	                    if (index === 10 ) { // 검수상태 (qc_yn) 열인 경우에만 드롭다운으로 변경
	                        cellContent = '<td>' +
	                            '<select name="' + cellName + '">' +
	                            '<option value="대기" ' + (cellValue === '대기' ? 'selected' : '') + '>대기</option>' +
	                            '<option value="진행중" ' + (cellValue === '진행중' ? 'selected' : '') + '>진행중</option>' +
	                            '<option value="완료" ' + (cellValue === '완료' ? 'selected' : '') + '>완료</option>' +
	                            '</select>' +
	                            '</td>';
	                    } 
	                    
	                    if (index === 6){
	                    	cellContent = '<td><input type="'+ cellType +  '" name="' + cellName + '" value="' + ${sessionScope.emp_id} + '"' + cellReadonly + '></td>';
	                    }
// 	                    else {
// 	                    	cellContent = '<td><input type="'+  cellType + '" name="' + cellName + '" value="' + cellValue + '"' + cellDisabled + '></td>';
// 	                    }

	                    $(this).html(cellContent);

	                    // 버튼 활성화
	                    $("#updateButton").attr("disabled", "disabled");
	                    
						$("#cancleButton").removeAttr("disabled");
	                    $("#submitButton").removeAttr("disabled");
	                    
	                    pageStatus = "update";
	                });
	            }else if (selectedCheckbox.length === 0){
	                alert("수정할 행을 선택해주세요!");
	            }else {
	                alert("수정은 하나의 행만 가능합니다!");
	            }
	        });
	        
            // 취소 버튼 누를 시 
			$("#cancleButton").click(function(){
	        
	    	// 수정버튼 취소
			if(pageStatus == "update"){
				var row = $("input[name='selectedEmpId']:checked").closest("tr");
				
				// 폼 초기화(기존내용으로)
				// 가져가서 쓰는 경우 폼에 이름 지정해줘야해요

				
				// 각 셀의 값을 원래 상태로 되돌림
				row.find("td:not(:first-child)").each(function(index) {
					var cellValue = $(this).find("input").val();
					$(this).html(cellValue);
				});
				
				// 추가버튼, 수정버튼 활성화, 취소버튼 비활성화
				$("#updateButton").removeAttr("disabled");
				
				$("#cancleButton").attr("disabled", "disabled");
				$("#submitButton").attr("disabled", "disabled");
				
				
				pageStatus = "";
				
			} // if(update)문
		
		}); // 취소버튼
		
    	// <th> 쪽 체크박스 클릭 시 해당 열의 <td> 부분의 행들을 선택하고 배경색 지정
        $(".table-qualityList th input[type='checkbox']").click(function() {
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
        $(".table-qualityList td input[type='checkbox']").click(function() {
            var checkbox = $(this);
            var isChecked = checkbox.prop('checked');
            checkbox.closest('tr').toggleClass('selected', isChecked);
        });
        



		// 체크박스 선택 시 체크박스의 개수 구하기
        updateSelectedCheckboxCount();

        // <th> 쪽 체크박스 클릭 시 해당 열의 <td> 부분의 행들을 선택하고 배경색 지정
        $(".table-qualityList th input[type='checkbox']").click(function() {
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
        $(".table-qualityList td input[type='checkbox']").click(function() {
            var checkbox = $(this);
            var isChecked = checkbox.prop('checked');
            checkbox.closest('tr').toggleClass('selected', isChecked);

            updateSelectedCheckboxCount(); 
        });

        function updateSelectedCheckboxCount() {
            var totalCheckboxes = $(".table-qualityList td input[type='checkbox']").length;
            var selectedCheckboxes = $(".table-qualityList td input[type='checkbox']:checked").length;
            $("#selectedCheckboxCount").text("전체 ("+selectedCheckboxes + '/' + totalCheckboxes+")");
        }  // 체크박스 선택 시 체크박스 개수 구하기

   
		// --------------------------------------------------------------------------------------------
		// 품질현황(자재) 목록
		
			// 수정 버튼 누를 시 (updateButton)
// 			$("#updateButton1").click(function(){
// 	            var selectedCheckbox = $("input[name='selectedEmpId']:checked");

// 	            // 체크된 체크박스가 하나인 경우에만 수정 기능 작동
// 	            if(selectedCheckbox.length === 1) {
// 	                var empId = selectedCheckbox.val();
// 	                var row = selectedCheckbox.closest("tr");
	                
// 	                // input type의 name 값 지정
//                 	var cellNames = [
//                 		"rec_num",
//                 		"qc_num",
//                 		"ma_num",
//                 		"ma_name",
//                 		"emp_id",
//                 		"qc_date",
//                 		"qc_cnt",
//                 		"rec_cnt",
//                 		"qc_yn"
//                 	];

// 	                // 각 셀을 수정 가능한 텍스트 입력 필드로 변경
// 	                row.find("td:not(:first-child)").each(function(index){
// 	                	var cellValue = $(this).text();
// 	                	var cellReadonly = index === 0 || index === 1 || index === 2 || index === 3 || index ===4 || index === 5  || index === 7 ? "readonly='readonly'" : "";
// 						var cellName = cellNames[index];
// 	                	var cellContent;

// 	                    if (index === 8 ) { // 검수상태 (qc_yn) 열인 경우에만 드롭다운으로 변경
// 	                        cellContent = '<td>' +
// 	                            '<select name="' + cellName + '">' +
// 	                            '<option value="대기" ' + (cellValue === '대기' ? 'selected' : '') + '>대기</option>' +
// 	                            '<option value="진행중" ' + (cellValue === '진행중' ? 'selected' : '') + '>진행중</option>' +
// 	                            '<option value="완료" ' + (cellValue === '완료' ? 'selected' : '') + '>완료</option>' +
// 	                            '</select>' +
// 	                            '</td>';
// 	                    }else {
// 	                    	cellContent = '<td><input type="'+ '" name="' + cellName + '" value="' + cellValue + '"' + cellReadonly + '></td>';
// 	                    }

// 	                    $(this).html(cellContent);

// 	                    // 버튼 활성화
// 	                    $("#updateButton1").attr("disabled", "disabled");
	                    
// 						$("#cancleButton1").removeAttr("disabled");
// 	                    $("#submitButton1").removeAttr("disabled");
	                    
// 	                    pageStatus = "update";
// 	                });
// 	            }else if (selectedCheckbox.length === 0){
// 	                alert("수정할 행을 선택해주세요!");
// 	            }else {
// 	                alert("수정은 하나의 행만 가능합니다!");
// 	            }
// 	        });
	        
//             // 취소 버튼 누를 시 
// 			$("#cancleButton1").click(function(){
	        
// 	    	// 수정버튼 취소
// 			if(pageStatus == "update"){
// 				var row = $("input[name='selectedEmpId']:checked").closest("tr");
				
// 				// 폼 초기화(기존내용으로)
// 				// 가져가서 쓰는 경우 폼에 이름 지정해줘야해요

				
// 				// 각 셀의 값을 원래 상태로 되돌림
// 				row.find("td:not(:first-child)").each(function(index) {
// 					var cellValue = $(this).find("input").val();
// 					$(this).html(cellValue);
// 				});
				
// 				// 추가버튼, 수정버튼 활성화, 취소버튼 비활성화
// 				$("#updateButton1").removeAttr("disabled");
				
// 				$("#cancleButton1").attr("disabled", "disabled");
// 				$("#submitButton1").attr("disabled", "disabled");
				
				
// 				pageStatus = "";
				
// 			} // if(update)문
		
// 		}); // 취소버튼
        
// 		// <th> 쪽 체크박스 클릭 시 해당 열의 <td> 부분의 행들을 선택하고 배경색 지정
//         $(".table-materialQualityList th input[type='checkbox']").click(function() {
//             var checkbox = $(this);
//             var isChecked = checkbox.prop('checked');
//             var columnIndex = checkbox.parent().index() + 1; // 체크박스의 열 인덱스
//             var table = checkbox.closest('table');
//             var rows = table.find('tr');

//             // <td> 부분의 행들을 선택하고 배경색 지정
//             rows.each(function() {
//                 var checkboxTd = $(this).find('td:nth-child(' + columnIndex + ') input[type="checkbox"]');
//                 if (checkboxTd.length > 0) {
//                     checkboxTd.prop('checked', isChecked);
//                     if (isChecked) {
//                         $(this).addClass('selected');
//                     } else {
//                         $(this).removeClass('selected');
//                     }
//                 }
//             });
//         });

//         // <td> 쪽 체크박스 클릭 시 행 선택
//         $(".table-materialQualityList td input[type='checkbox']").click(function() {
//             var checkbox = $(this);
//             var isChecked = checkbox.prop('checked');
//             checkbox.closest('tr').toggleClass('selected', isChecked);
//         });
        



// 		// 체크박스 선택 시 체크박스의 개수 구하기
//         updateSelectedCheckboxCount1();

//         // <th> 쪽 체크박스 클릭 시 해당 열의 <td> 부분의 행들을 선택하고 배경색 지정
//         $(".table-materialQualityList th input[type='checkbox']").click(function() {
//             var checkbox = $(this);
//             var isChecked = checkbox.prop('checked');
//             var columnIndex = checkbox.parent().index() + 1; // 체크박스의 열 인덱스
//             var table = checkbox.closest('table');
//             var rows = table.find('tr');

//             // <td> 부분의 행들을 선택하고 배경색 지정
//             rows.each(function() {
//                 var checkboxTd = $(this).find('td:nth-child(' + columnIndex + ') input[type="checkbox"]');
//                 if (checkboxTd.length > 0) {
//                     checkboxTd.prop('checked', isChecked);
//                     $(this).toggleClass('selected', isChecked);
//                 }
//             });

//             updateSelectedCheckboxCount1();
//         });

//         // <td> 쪽 체크박스 클릭 시 행 선택
//         $(".table-materialQualityList td input[type='checkbox']").click(function() {
//             var checkbox = $(this);
//             var isChecked = checkbox.prop('checked');
//             checkbox.closest('tr').toggleClass('selected', isChecked);

//             updateSelectedCheckboxCount1(); 
//         });

//         function updateSelectedCheckboxCount1() {
//             var totalCheckboxes = $(".table-materialQualityList td input[type='checkbox']").length;
//             var selectedCheckboxes = $(".table-materialQualityList td input[type='checkbox']:checked").length;
//             $("#selectedCheckboxCount1").text("전체 ("+selectedCheckboxes + '/' + totalCheckboxes+")");
//         }  // 체크박스 선택 시 체크박스 개수 구하기
        
        // 품질현황(자재) 목록
        // --------------------------------------------------------------------------------------------
        
        
	     }); 
    </script>
    
    <style>
		.selected { 
             background-color: #b3ccff; 
         } 
	</style>
</head>
<body>
		<h2>품질현황 조회</h2>
		<form method="get"> 
<!-- 		<span> -->
<%-- 			<input type="checkbox" name="" value="완제품" ${param. }> --%>
<!-- 		</span> -->
		
			품질검사코드 <input type="text" name="qc_num">
			품질검사여부
				<select name="qc_yn">
					<option>전체</option>
					<option>대기</option>
					<option>진행중</option>
					<option>완료</option>
				</select>
			<div>
				<label>검수일자</label>
				<input type="date" name="startDate">
					~
				<input type="date" name="endDate">
			</div>
			<input type="submit" value="조회">
		</form>
		
		<h2>품질현황(완제품) 목록</h2>
		
		<form id="qualityList">
				<span id="selectedCheckboxCount">0</span>

			<input type="button" id="cancleButton" value="취소" disabled="disabled">
			<input type="button" id="updateButton" value="수정">
			<input type="submit" id="submitButton" value="저장" formaction="updateQuality" formmethod="post" disabled="disabled">
			
			<table class="table-qualityList" border="1">
				<tr>
					<th><input type="checkbox"></th>
					<th>작업지시번호</th>
					<th>품질검사코드</th>
					<th>라인코드</th>
					<th>라인명</th>
					<th>품질코드</th>
					<th>품목명</th>
					<th>검수자</th>
					<th>검수일자</th>
					<th>검수량</th>
					<th>생산량</th>
					<th>검수상태</th>
				</tr>
				<c:forEach var="vo" items="${qualityList}" varStatus="status">
					<tr>
						<td><input type="checkbox" name="selectedQcId" value="${vo.qc_id }"></td>
						<td>${vo.work_num }</td>
						<td>${vo.qc_num }</td>
						<td>${vo.line_num }</td>
						<td>${vo.line_name }</td>
						<td>${vo.pro_num }</td>
						<td>${vo.pro_name }</td>
						<td>${vo.emp_name }</td>
						<td>
							<c:if test="${!empty vo.update_date}">${fn:substring(vo.update_date, 0, 10)}</c:if>
							<c:if test="${empty vo.update_date}">${fn:substring(vo.reg_date, 0, 10)}</c:if>
						</td>
						<td>${vo.qc_cnt }</td>
						<td>${vo.prfrm_cnt }</td>
						<td>${vo.qc_yn }</td>
					</tr>
				</c:forEach>
			</table>
		</form>
		
<!-- 		<h2>품질현황(자재) 목록</h2> -->
		
<!-- 		<form id="materialQualityList"> -->
<!-- 			<span id="selectedCheckboxCount1">0</span> -->

<!-- 			<input type="button" id="cancleButton1" value="취소" disabled="disabled"> -->
<!-- 			<input type="button" id="updateButton1" value="수정"> -->
<!-- 			<input type="submit" id="submitButton1" value="저장" formaction="updateMaterialQuality" formmethod="post" disabled="disabled"> -->
			
<!-- 			<table class="table-materialQualityList" border="1"> -->
<!-- 				<tr> -->
<!-- 					<th><input type="checkbox"></th> -->
<!-- 					<th>입고코드</th> -->
<!-- 					<th>품질검사코드</th> -->
<!-- 					<th>자재코드</th> -->
<!-- 					<th>자재명</th> -->
<!-- 					<th>검수자</th> -->
<!-- 					<th>검수일자</th> -->
<!-- 					<th>검수량</th> -->
<!-- 					<th>입고량</th> -->
<!-- 					<th>검수상태</th> -->
<!-- 				</tr> -->
<%-- 				<c:forEach var="mq" items="${materialQualityList }"> --%>
<!-- 					<tr> -->
<%-- 						<td><input type="checkbox" name="selectedEmpId" value="${mq.emp_id }"></td> --%>
<%-- 						<td>${mq.rec_num }</td> --%>
<%-- 						<td>${mq.qc_num }</td> --%>
<%-- 						<td>${mq.ma_num }</td> --%>
<%-- 						<td>${mq.ma_name }</td> --%>
<%-- 						<td>${mq.emp_name }</td> --%>
<%-- 						<td>${fn:substring(mq.qc_date,0,10) }</td> --%>
<%-- 						<td>${mq.qc_cnt }</td> --%>
<%-- 						<td>${mq.rec_cnt }</td> --%>
<%-- 						<td>${mq.qc_yn }</td> --%>
<!-- 					</tr> -->
<%-- 				</c:forEach> --%>
<!-- 			</table> -->
<!-- 		</form> -->

</body>
</html>

<%@ include file="../../inc/footer.jsp"%>