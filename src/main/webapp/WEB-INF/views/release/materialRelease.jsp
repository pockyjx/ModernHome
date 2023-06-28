<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/header.jsp"%>
<%@ include file="../inc/sidebar.jsp"%>
<%@ include file="../inc/nav.jsp"%>

<script>
	$(document).ready(function() {
		updateSelectedCheckboxCount();		
        // 버튼 클릭 시 행 추가
        $("#addRowButton").click(function() {
            var newRow = '<tr>' +
                '<td><input type="checkbox"></td>' +
                '<td></td>' +
                '<td><input type="text" name="work_num" id="work_num" placeholder="여기를 눌러 검색하세요" readonly ></td>' +
                '<td><input type="text" name="ma_name" id="ma_name" readonly></td>' +
                '<td><input type="text" name="mr_cnt" id="mr_cnt" readonly></td>' +
                '<td><input type="text" name="ms_cnt" id="ms_cnt" readonly></td>' +
                '<td><input type="text" name="wh_name" id="wh_name" readonly></td>' +
                '<td><input type="datetime-local" name="reg_date" id="reg_date" readonly></td>' +
                '<td><input type="text" name="mr_state" id="mr_state" value="준비" readonly></td>' +
                '<td><input type="text" name="emp_id" id="emp_id" value="${sessionScope.emp_id}" readonly></td>' +
                '<td></td>' +
                '<td>' +
                '<input type="hidden" name="ma_id" id="ma_id" value="0">' +
                '<input type="hidden" name="work_id" id="work_id" value="0">' +
                '<input type="hidden" name="wh_id" id="wh_id" value="0">' +
                '</td>' +
                '</tr>';
                
            $("#releaseList tr:nth-child(1)").after(newRow);
            
        	// 추가버튼, 수정버튼 비활성화, 취소버튼 활성화
			$("#addRowButton").attr("disabled", "disabled");
			$("#updateButton").attr("disabled", "disabled");
			$("#deleteButton").attr("disabled", "disabled");
			
			$("#cancleButton").removeAttr("disabled");
			$("#submitButton").removeAttr("disabled");
			
			pageStatus = "reg";
        }); // 추가 버튼

		// 취소 버튼 누를 시 
		$("#cancleButton").click(function(){
			
			// 등록버튼 취소
			if(pageStatus == "reg"){
				// 두번째 tr (추가된 행)을 삭제함
				$("#releaseList tr:nth-child(2)").remove();
				
				// 추가버튼, 수정버튼 활성화, 취소버튼 비활성화
				$("#addRowButton").removeAttr("disabled");
				$("#updateButton").removeAttr("disabled");
				$("#deleteButton").removeAttr("disabled");
				
				$("#cancleButton").attr("disabled", "disabled");
				$("#submitButton").attr("disabled", "disabled");
				
				pageStatus = "";
			}
			// 수정버튼 취소
			if(pageStatus == "update"){
				
				// 모든행에 대해 반복작업, 테이블 이름에 맞게 수정
				$("#releaseList tr").each(function() {
				var row = $(this);
				
				// 폼 초기화(기존내용으로)
				$("#releaseList")[0].reset();
				
				// 각 셀의 값을 원래 상태로 되돌림
				row.find("td:not(:first-child)").each(function(index) {
					var cellValue = $(this).find("input").val();
					$(this).html(cellValue);
				});
				
				// selected 클래스를 없앰 (css 없애기)
				$("#releaseList tr").removeClass("selected");
				
				// 추가버튼, 수정버튼 활성화, 취소버튼 비활성화
				$("#addRowButton").removeAttr("disabled");
				$("#updateButton").removeAttr("disabled");
				$("#deleteButton").removeAttr("disabled");
				
				$("#cancleButton").attr("disabled", "disabled");
				$("#submitButton").attr("disabled", "disabled");
				
				
				pageStatus = "";
				
				});
			}
		
		}); // 취소 버튼 누를 시
        
     	// 수정 버튼 누를 시
// 		$("#updateButton").click(function(){
// 			var selectedCheckbox = $("input[name='selectedId']:checked");
			
// 			// 체크된 체크박스가 하나인 경우에만 수정 기능 작동
// 			if (selectedCheckbox.length === 1) {
// 				var empId = selectedCheckbox.val();
// 				var row = selectedCheckbox.closest("tr");
				
// 				// input type의 name 값 지정
// 				var cellNames = [
// 					"pro_num", 
// 					"pro_name", 
// 					"pro_unit", 
// 					"pro_price"
// 				];
				
				
// 				// 각 셀을 수정 가능한 텍스트 입력 필드로 변경
// 				row.find("td:not(:first-child)").each(function(index) {
// 					//
// 					var cellValue = $(this).text();
// 					var cellOption = index === 0 ? "readonly" : "";
// 					var cellName = cellNames[index];
					
// 					$(this).html('<input type="text" name="' + cellName + '" value="' + cellValue + '"' + cellOption + '>');
					
// 					$("#updateButton").attr("disabled", "disabled");
// 					$("#addRowButton").attr("disabled", "disabled");
// 					$("#deleteButton").attr("disabled", "disabled");
					
// 					$("#cancleButton").removeAttr("disabled");
// 					$("#submitButton").removeAttr("disabled");
					
// 					pageStatus = "update";
// 				});
				
// 			}else if (selectedCheckbox.length === 0){
// 				alert("수정할 행을 선택해주세요!")
				
// 			}else {
// 				alert("수정은 하나의 행만 가능합니다!");
// 			}
// 		});

	     // <th> 쪽 체크박스 클릭 시 해당 열의 <td> 부분의 행들을 선택하고 배경색 지정
        $("#releaseList th input[type='checkbox']").click(function() {
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
		
        // <td> 쪽 체크박스 클릭 시 행 선택
        $("#releaseList td input[type='checkbox']").click(function() {
            var checkbox = $(this);
            var isChecked = checkbox.prop('checked');
            checkbox.closest('tr').toggleClass('selected', isChecked);
            
            updateSelectedCheckboxCount(); 
        }); // <td> 쪽 체크박스 클릭 시 행 선택

        function updateSelectedCheckboxCount() {
            var totalCheckboxes = $("#releaseList td input[type='checkbox']").length;
            var selectedCheckboxes = $("#releaseList td input[type='checkbox']:checked").length;
            $("#selectedCheckboxCount").text("전체 ("+selectedCheckboxes + '/' + totalCheckboxes+")");
        } // 체크박스 선택 시 체크박스 개수 구하기
        
        // 완제품 코드 입력란 클릭 시 팝업창 열기
        $(document).on("click", "input[id='work_num']", function() {
     	   window.open('/release/addPopup?txt=ma', 'popup', 'width=600, height=500, location=no, status=no, scrollbars=yes');
        });
        $(document).on("click", "input[id='ms_cnt']", function() {
        	if($('ma_id').val() != "" ) {
	      	   window.open('/release/addPopup?txt=ms&mapro_id='+ $('#ma_id').val(), 'popup', 'width=600, height=500, location=no, status=no, scrollbars=yes');
        	}else {
        		alert("작업지시코드를 입력해주세요");
        	}
         });
 		$(".release").click(function () {
 			var mr_id = $(this).closest("tr").find('td:eq(0)').find('input').val();
 			var ma_id = $(this).closest("tr").find('td:eq(11)').text();
 			var mr_cnt = $(this).closest("tr").find('td:eq(4)').text();
 			alert(mr_id +"/"+ ma_id +"/"+ mr_cnt);
 			if(result = window.confirm("출고하시겠습니까? (출고 후 변경이 불가능합니다.)")) {
				location.href="/release/acceptRelease?txt=mr&release_id="+mr_id+"&mapro_id="+ma_id+"&release_cnt="+mr_cnt; 				
 			}
 			
 		});
//  		$("#submitButton").click(function() {
//  			var ma_id = $('#ma_id').val();
//  			var work_id = $('#work_id').val();
//  			var wh_id = $('#wh_id').val();
//  			var mr_cnt = $('#mr_cnt').val();
//  			var mr_state = $('#mr_state').val();
//  			var emp_id = Number($('#emp_id').val());
//  			alert(ma_id);
//  			alert(work_id);
//  			alert(wh_id);
//  			alert(mr_cnt);
//  			alert(mr_state);
//  			alert(emp_id);
 			
//  		})
 		$("#submitButton").click(function() {
 			var form = $("#materialRelease");
 			form.attr("method", "post");
 			form.attr("action", "/release/regMTRelease");
 			var work_num = $("#work_num").val();
 			var ms_cnt = $("#ms_cnt").val();
 			if(work_num == null || work_num == "") {
 				$("#work_num").focus();
 				alert("작업지시코드를 입력하세요");
 				return;
 			}
 			if(ms_cnt == null || ms_cnt == "") {
 				$("#ms_cnt").focus();
 				alert("현 재고를 입력하세요");
 				return;
 			}
 			form.submit();
 		});
	});
</script>

<h1>materialRelease</h1>


<div class="col-sm-12 col-xl-6">
	<div class="bg-light rounded h-100 p-4">
		<h6 class="mb-4">제품출고관리</h6>
		<form name="search" method="post">
			<div class="row mb-3">
				<label for="mr_numSearch" class="col-sm-2 col-form-label">출고코드</label>
				<div class="col-sm-10">
					<input type="text" name="mr_numSearch" class="form-control" placeholder="출고코드를 입력하세요">
				</div>
			</div>
			<div class="row mb-3">
				<label for="ma_nameSearch" class="col-sm-2 col-form-label">품목명</label>
				<div class="col-sm-10">
					<input type="text" name="ma_nameSearch" class="form-control" placeholder="제품명을 입력하세요"> <br>
				</div>
			</div>
			<div class="row mb-3">
				<label for="" class="col-sm-2 col-form-label">출고일자 : </label>
				<div class="col-sm-10">
					<input type="datetime-local" name="startDate" class="form-control"> ~ 
					<input type="datetime-local" name="endDate" class="form-control">
				</div>
			</div>
			<button type="submit" class="btn btn-primary">조회</button>
		</form>
	</div>
</div>


<span id="selectedCheckboxCount">0</span><br>

<h6 class="mb-0">자재출고</h6>
<form id="materialRelease" name="release">
<c:if test="${sessionScope.emp_dept eq '자재'}">
<button class="btn btn-primary m-2" id="addRowButton"><i class="fa fa-plus"></i> 추가</button>
<button class="btn btn-primary m-2" id="cancleButton" disabled>X 취소</button>
<button class="btn btn-primary m-2" id="updateButton"><i class="fa fa-edit"></i> 수정</button>
<button type="submit" class="btn btn-primary m-2" id="deleteButton" formaction="/release/delMTRelease" formmethod="post"><i class="fa fa-trash"></i> 삭제</button>
<button type="button" class="btn btn-primary m-2" id="submitButton" formaction="/release/regMTRelease" formmethod="post" disabled><i class="fa fa-download"></i> 저장</button>
</c:if>
<%-- ${mtReleaseList} --%>

<div class="bg-light text-center rounded p-4">
	<div class="d-flex align-items-center justify-content-between mb-4">

	</div>
	<div class="table-responsive">
		<table id="releaseList" class="table text-start align-middle table-bordered table-hover mb-0">
				<tr class="text-dark">
					<th scope="col"><input class="form-check-input" type="checkbox" id="cbx_chkAll"></th>
			    	<th scope="col">출고코드</th>
			    	<th scope="col">작업지시코드</th>
			    	<th scope="col">자재명</th>
			    	<th scope="col">주문수량</th>
			    	<th scope="col">현 재고</th>
			    	<th scope="col">창고명</th>
			    	<th scope="col">작업지시일자</th>
			    	<th scope="col">진행현황</th>
			    	<th scope="col">담당자</th>
			    	<th scope="col">출고일자</th>
			    	<th scope="col">출고처리</th>
				</tr>
			  	<c:forEach var="vo" items="${mtReleaseList}">
				<tr>
					<td><input class="form-check-input" type="checkbox" name="selectedId" value="${vo.mr_id}"></td>
					<td>${vo.mr_num }</td>
					<td>${vo.workInstrVO.work_num }</td>
					<td>${vo.materialVO.ma_name }</td>
					<td>${vo.mr_cnt }</td>
					<td>${vo.materialStockVO.ms_cnt }</td>
					<td>${vo.warehouseVO.wh_name }</td>
					<td>${vo.workInstrVO.reg_date }</td>
					<td>${vo.mr_state }</td>
					<td>${vo.employeeVO.emp_name }</td>
					<td>${vo.mr_date }</td>
					<td style="display: none">${vo.materialVO.ma_id }</td>
					<td>
						<c:choose>
						<c:when test="${vo.mr_state eq '준비' && vo.materialStockVO.ms_cnt ge vo.mr_cnt}">
						<button type="button" class="btn btn-sm btn-success release">출고가능</button>
						</c:when>
						<c:when test="${vo.mr_state eq '준비' && vo.materialStockVO.ms_cnt lt vo.mr_cnt}">
						<button type="button" class="btn btn-sm btn-danger">출고불가</button>
						</c:when>
						<c:when test="${!vo.mr_state.equals('준비')}">
						<button type="button" class="btn btn-sm btn-primary">출고${vo.mr_state}</button> 
						</c:when>
						</c:choose>
					</td>
			    </tr>
			    </c:forEach>
		</table>
	</div>
</div>
</form>

<%@ include file="../inc/footer.jsp"%>