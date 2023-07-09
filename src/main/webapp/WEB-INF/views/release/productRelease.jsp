<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/header.jsp"%>
<%@ include file="../inc/sidebar.jsp"%>
<%@ include file="../inc/nav.jsp"%>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>


<script>
	$(document).ready(function() {
		updateSelectedCheckboxCount();
        // 버튼 클릭 시 행 추가
        $("#addRowButton").click(function() {
        	
        	updateSelectedCheckboxCount();
        	
        	// 모든 체크박스의 체크 해제
			$(".releaseList input[type='checkbox']").prop("checked", false);
			
			// selected 클래스를 없앰 (css 없애기)
			$(".releaseList tr").removeClass("selected");
        	
            var newRow = '<tr>' +
                '<td><input type="checkbox" class="form-check-input"></td>' +
                '<td><input type="text" placeholder="(자동으로 부여)" style="border: none; background: transparent;" readonly></td>' +
                '<td><input type="text" name="oo_num" id="oo_num" placeholder="여기를 눌러 검색하세요" readonly></td>' +
                '<td><input type="text" name="clt_name" id="clt_name" style="border: none; background: transparent;" readonly></td>' +
                '<td><input type="text" name="pro_name" id="pro_name" style="border: none; background: transparent;" readonly disabled></td>' +
                '<td><input type="text" name="pr_cnt" id="oo_cnt" style="border: none; background: transparent;" readonly value="0"></td>' +
                '<td><input type="text" name="ps_cnt" id="ps_cnt" placeholder="여기를 눌러 검색하세요" readonly></td>' +
                '<td><input type="text" name="wh_name" id="wh_name" style="border: none; background: transparent;" readonly disabled></td>' +
                '<td><input type="datetime-local" name="oo_end_date" id="oo_end_date" style="border: none; background: transparent;" readonly disabled></td>' +
                '<td><input type="text" name="pr_state" id="pr_state" value="출고준비" style="border: none; background: transparent;" readonly></td>' +
                '<td><input type="text" name="emp_id" id="emp_id" value="${sessionScope.emp_id}" style="border: none; background: transparent;" readonly></td>' +
                '<td></td>' +
                '<td>' +
                '<input type="hidden" name="pro_id" id="pro_id" value="0">' +
                '<input type="hidden" name="oo_id" id="oo_id" value="0">' +
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
			
			updateSelectedCheckboxCount();  
			
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

		// 삭제버튼
    	$("#deleteButton").click(function(){
    		
    		
    		var selectedCheckbox = $("input[name='selectedId']:checked");
    		
    		// 체크된 체크박스가 하나인 경우에만 수정 기능 작동
    		if (selectedCheckbox.length === 0){
    			alert("삭제할 행을 선택하세요!");
    			
    			// 선택안하면 submit을 막음
    			event.preventDefault();
    			
    		}
    	});
		
		
		
		
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
        $(document).on("click", "input[id='oo_num']", function() {
        	var left = (screen.width - 650) / 2;
			var top = (screen.height - 680) / 2;
     	   window.open('/release/addPopup?txt=pro', 'popup', 'width=650, height=680, top=' + top + ', left=' + left + ', location=no, status=no, scrollbars=yes');
        });
        $(document).on("click", "input[id='ps_cnt']", function() {
        	var left = (screen.width - 580) / 2;
			var top = (screen.height - 680) / 2;
        	if($('#pro_id').val() != "" ) {
	      	   window.open('/release/addPopup?txt=ps&mapro_id='+ $('#pro_id').val(), 'popup', 'width=580, height=680, top=' + top + ', left=' + left + ', location=no, status=no, scrollbars=yes');
        	}else {
        		alert("수주코드를 입력해주세요");
        	}
         });
        
        // 출고 처리 버튼
 		$(".release").click(function () {
 			var pr_id = $(this).closest("tr").find('td:eq(0)').find('input').val();
 			var pro_id = $(this).closest("tr").find('td:eq(12)').text();
 			var pr_cnt = $(this).closest("tr").find('td:eq(5)').text();
 			
 			Swal.fire({
				title: '출고처리 하시겠습니까?',
				text: '출고 후 변경이 불가능합니다.', 
				icon: 'warning',
				showCancelButton: true,
				confirmButtonColor: '#3085d6',
	            cancelButtonColor: '#d33',
	            confirmButtonText: '승인',
	            cancelButtonText: '취소'
			}).then((result) => {
				
				if(result.isConfirmed) {
					Swal.fire({
						icon: 'success', 
						title: '출고가 완료되었습니다!', 
						confirmButtonColor: '#3085d6'
					}).then((result) => {
						if(result.isConfirmed) {
						location.href="/release/acceptRelease?txt=pr&release_id="+pr_id+"&mapro_id="+pro_id+"&release_cnt="+pr_cnt; 				
						
						}
					});
				}
 			
 			});
 			
//  			if(result = window.confirm("출고하시겠습니까? (출고 후 변경이 불가능합니다.)")) {
// 				location.href="/release/acceptRelease?txt=pr&release_id="+pr_id+"&mapro_id="+pro_id+"&release_cnt="+pr_cnt; 				
//  			}
 			
 		});
        
        // 출고 대기 버튼
 		$(".waiting").click(function() {
 			var pr_id = $(this).closest("tr").find('td:eq(0)').find('input').val();
			var pro_id = $(this).closest("tr").find('td:eq(12)').text();
 			
//  			alert(pr_id + ", " + pro_id);
 			
 			location.href="/release/waitingRelease?txt=pr&rel_id="+pr_id+"&item_id="+pro_id;
 			
 		});
        
 		$("#submitButton").click(function() {
 			var form = $("#productRelease");
 			form.attr("method", "post");
 			form.attr("action", "/release/regPRRelease");
 			var oo_num = $("#oo_num").val();
 			var ps_cnt = $("#ps_cnt").val();
 			if(oo_num == null || oo_num == "") {
 				$("#oo_num").focus();
 				alert("수주코드를 입력하세요");
 				return;
 			}
 			if(ps_cnt == null || ps_cnt == "") {
 				$("#ps_cnt").focus();
 				alert("현 재고를 입력하세요");
 				return;
 			}
 			form.submit();
 		});
	});
</script>
<style>
    .selected {
        background-color: #b3ccff;
    }
</style>

<form name="search" method="get" class="bg-light rounded p-3 m-3">
	
	<div class="row mb-3">
		<label for="pro_nameSearch" class="col-sm-2 col-form-label"><b>출고코드</b></label>
		<div class="col-sm-4">
			<input type="text" name="pr_numSearch" class="form-control" placeholder="출고코드를 입력하세요" value="${pr_numSearch }">
		</div>
	</div>
	
	<div class="row mb-3">
		<label for="pro_nameSearch" class="col-sm-2 col-form-label"><b>품목명</b></label>
		<div class="col-sm-4">
			<input type="text" name="pro_nameSearch" class="form-control" placeholder="제품명을 입력하세요" value="${pro_nameSearch }">
		</div>
	</div>
	
	<div class="row mb-3">
		<label for="" class="col-sm-2 col-form-label"><b>출고일자</b></label>
		
		<div class="col-sm-2">
			<div class="col-auto">
				<input type="datetime-local" name="startDate" class="form-control">
			</div>
		</div>
			
			<div class="col-auto">
   				~
			</div>
			
		<div class="col-sm-2">
			<div class="col-auto">
				<input type="datetime-local" name="endDate" class="form-control">
			</div>
		</div>
		
		<div class="col-auto">
			<button class="btn btn-primary m-3" type="submit" style="width:70px;">조회</button>
		</div>	
	
	</div>
</form>

<hr>

<form id="productRelease" name="release">

	<div class="d-flex align-items-center justify-content-between mb-2">
		<h3 class="m-4">제품출고</h3>
		<div>
			<c:if test="${(sessionScope.emp_dept eq '자재' && sessionScope.emp_auth >= '1') || sessionScope.emp_auth == '3' }">
				<button class="btn btn-primary m-2" id="addRowButton"><i class="fa fa-plus"></i> 추가</button>
				<button class="btn btn-primary m-2" id="cancleButton" disabled>X 취소</button>
				<button type="submit" class="btn btn-primary m-2" id="deleteButton" formaction="/release/delPRRelease" formmethod="post"><i class="fa fa-trash"></i> 삭제</button>
				<button type="button" class="btn btn-primary m-2" id="submitButton" formaction="/release/regPRRelease" formmethod="post" disabled><i class="fa fa-download"></i> 저장</button>
			</c:if>
		</div>
	</div>

	<div class="bg-light text-center rounded p-4 m-3">

		<div class="d-flex align-items-center justify-content-between mb-4">
			<span id="selectedCheckboxCount">0</span>
		</div>

	<div class="table-responsive">
		<table id="releaseList" class="releaseList table align-middle table-bordered table-hover mb-0">
				<tr class="text-dark">
					<th scope="col" style="background-color: rgba(0,0,0,0.075);"><input class="form-check-input"	type="checkbox" id="cbx_chkAll"></th>
			    	<th scope="col" style="background-color: rgba(0,0,0,0.075);">출고코드</th>
			    	<th scope="col" style="background-color: rgba(0,0,0,0.075);">수주코드</th>
			    	<th scope="col" style="background-color: rgba(0,0,0,0.075);">납품처명</th>
			    	<th scope="col" style="background-color: rgba(0,0,0,0.075);">완제품명</th>
			    	<th scope="col" style="background-color: rgba(0,0,0,0.075);">주문수량</th>
			    	<th scope="col" style="background-color: rgba(0,0,0,0.075);">현<br>재고</th>
			    	<th scope="col" style="background-color: rgba(0,0,0,0.075);">창고명</th>
			    	<th scope="col" style="background-color: rgba(0,0,0,0.075);">납기일자</th>
			    	<th scope="col" style="background-color: rgba(0,0,0,0.075);">진행현황</th>
			    	<th scope="col" style="background-color: rgba(0,0,0,0.075);">담당자</th>
			    	<th scope="col" style="background-color: rgba(0,0,0,0.075);">출고일자</th>
			    	<th scope="col" style="background-color: rgba(0,0,0,0.075);">출고처리</th>
			    	<th scope="col" style="display: none">pro_id</th>
<!-- 			    	<th scope="col" style="display: none">pro_id</th> -->
				</tr>
			  	<c:forEach var="vo" items="${prReleaseList}">
				<tr>
					<td><input class="form-check-input" type="checkbox" value="${vo.pr_id }" name="selectedId"></td>
					<td>${vo.pr_num }</td>
					<td>${vo.outOrderVO.oo_num }</td>
					<td>${vo.clientVO.clt_name }</td>
					<td>${vo.productVO.pro_name }</td>
					<td>${vo.pr_cnt }</td>
					<td>${vo.productStockVO.ps_cnt }</td>
					<td>${vo.warehouseVO.wh_name }</td>
					<td>${vo.outOrderVO.oo_end_date }</td>
					<td>${vo.pr_state }</td>
					<td>${vo.employeeVO.emp_name }</td>
					<td>${vo.pr_date }</td>
					<td style="display: none">${vo.productVO.pro_id }</td>
					<td>
					<c:if test="${(sessionScope.emp_dept eq '자재' && sessionScope.emp_auth >= '1') || sessionScope.emp_auth == '3'}">
					<c:choose>
					<c:when test="${vo.pr_state eq '검사완료' && vo.productStockVO.ps_cnt ge vo.pr_cnt}">
					<button type="button" class="btn btn-sm btn-success release">출고<br>처리</button>
					</c:when>
					<c:when test="${vo.pr_state eq '출고준비' && vo.productStockVO.ps_cnt ge vo.pr_cnt}">
					<button type="button" class="btn btn-sm btn-warning waiting">출고<br>대기</button>
					</c:when>
					<c:when test="${vo.pr_state eq '출고준비' && vo.productStockVO.ps_cnt lt vo.pr_cnt}">
					<button type="button" class="btn btn-sm btn-danger">출고<br>불가</button>
					</c:when>
					<c:when test="${vo.pr_state eq '출고완료'}">
					<button type="button" class="btn btn-sm btn-primary">출고<br>완료</button> 
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
			<a class="page-link" href="/release/productRelease?page=${pm.startPage-1 }&startDate=${startDate}&endDate=${endDate}&pro_nameSearch=${pro_nameSearch}&pr_numSearch=${pr_numSearch}" aria-label="Previous">
      			<span aria-hidden="true">&laquo;</span>
     			</a>
   		</li>
   		</c:if>
   		
   		<c:forEach begin="${pm.startPage }" end="${pm.endPage }" step="1" var="idx">
   		<li class="<c:out value='${pm.pageVO.page == idx ? "page-item active" : "page-item"}' />">
   				<a class="page-link" href="/release/productRelease?page=${idx}&startDate=${startDate}&endDate=${endDate}&pro_nameSearch=${pro_nameSearch}&pr_numSearch=${pr_numSearch}">${idx }</a>
   		</li>
   		</c:forEach>
		
		<c:if test="${pm.next && pm.endPage > 0}">
		<li class="page-item">
     			<a class="page-link" href="/release/productRelease?page=${pm.endPage+1 }&startDate=${startDate}&endDate=${endDate}&pro_nameSearch=${pro_nameSearch}&pr_numSearch=${pr_numSearch}" aria-label="Next">
       		<span aria-hidden="true">&raquo;</span>
     			</a>
   		</li>
   		</c:if>
   		
 		</ul>
</nav>

<!-- 페이지 이동 버튼 -->

<%@ include file="../inc/footer.jsp"%>