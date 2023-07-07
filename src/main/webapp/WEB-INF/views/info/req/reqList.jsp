<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
  
<%@ include file="../../inc/header.jsp"%>
<%@ include file="../../inc/sidebar.jsp"%>
<%@ include file="../../inc/nav.jsp"%>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/xlsx/0.17.1/xlsx.full.min.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" />   
    	<c:set var="now" value="<%=new java.util.Date()%>"/>
    	<c:set var="today"><fmt:formatDate value="${now}" pattern="yyyy-MM-dd"/></c:set>
    <script>
	     $(document).ready(function() {
	    	 
	    	 updateSelectedCheckboxCount();
	     	
	         // 버튼 클릭 시 행 추가
	         $("#addRowButton").click(function() {
	        	 
	        	// 모든 체크박스의 체크 해제
    			$(".table-reqList input[type='checkbox']").prop("checked", false);
    			
    			// selected 클래스를 없앰 (css 없애기)
    			$(".table-reqList tr").removeClass("selected");
	        	 
	             var newRow = '<tr>' +
	                 '<td><input type="checkbox" class="form-check-input"></td>' +
	                 '<td><input type="text" class="form-control" name="req_num" id="req_num" placeholder="(자동 부여)" style="border: none; background: transparent;" readonly></td>' +
	                 '<td><input type="text" class="form-control" name="pro_num" placeholder="완제품 코드" readonly id="pro_num"></td>' +
	                 '<td><input type="text" class="form-control" name="pro_name" id="pro_name" style="border: none; background: transparent;" readonly ></td>' +
	                 '<td><input type="text" class="form-control" name="ma_num" placeholder="자재 코드" id="ma_num" readonly></td>' +
	                 '<td><input type="text" class="form-control" name="ma_name" id="ma_name" style="border: none; background: transparent;" readonly></td>' +
	                 '<td><input type="number" class="form-control" name="req_cnt" id="req_cnt" placeholder="소요량" min="0"></td>' +
	                 '<td><input type="text" class="form-control" name="req_unit" value="EA" style="border: none; background: transparent;" readonly></td>' +
	                 '<td><input type="text" class="form-control" name="req_reg_date" value="<c:out value='${today}'/>" style="border: none; background: transparent;" readonly></td>' +
	                 '<td><input type="text" class="form-control" name="emp_id" value="${sessionScope.emp_id }" style="border: none; background: transparent;" readonly></td>' +
	                 '</tr>';
	             $(".table-reqList tr:nth-child(1)").after(newRow);
	             
	             // 추가버튼, 수정버튼 비활성화, 취소버튼 활성화
				$("#addRowButton").attr("disabled", "disabled");
				$("#updateButton").attr("disabled", "disabled");
				$("#deleteButton").attr("disabled", "disabled");
				
				$("#cancleButton").removeAttr("disabled");
				$("#submitButton").removeAttr("disabled");
				
				pageStatus = "reg";
				
				updateSelectedCheckboxCount();
	             
	         });  // 버튼 클릭 시 행 추가
	         
	     	// 취소 버튼 누를 시 
			$("#cancleButton").click(function(){
		
		// 등록버튼 취소
		if(pageStatus == "reg"){
			// 두번째 tr (추가된 행)을 삭제함
			$(".table-reqList tr:nth-child(2)").remove();
			
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
			$(".table-reqList tr").each(function() {
			var row = $(this);
			
			// 폼 초기화(기존내용으로)
			$("#reqList")[0].reset();
			
			// 각 셀의 값을 원래 상태로 되돌림
			row.find("td:not(:first-child)").each(function(index) {
				var cellValue = $(this).data('prevValue');
				$(this).html(cellValue);
			});
			
			// selected 클래스를 없앰 (css 없애기)
			$(".table-reqList tr").removeClass("selected");
			
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
	$("#updateButton").click(function(){
		var selectedCheckbox = $("input[name='selectedReqId']:checked");
		
		// 체크된 체크박스가 하나인 경우에만 수정 기능 작동
		if (selectedCheckbox.length === 1) {
			var empId = selectedCheckbox.val();
			var row = selectedCheckbox.closest("tr");
			
			// input type의 name 값 지정
			var cellNames = [
				"req_num",
				"pro_num",
				"pro_name",
				"ma_num",
				"ma_name",
				"req_cnt",
				"req_unit",
				"req_update_date", 
				"update_emp_id"
			];
			
			// input type의 id값 지정
			var cellIds = [
				"req_num",
				"pro_num",
				"pro_name",
				"ma_num",
				"ma_name",
				"req_cnt",
				"req_unit",
				"req_update_date", 
				"update_emp_id"
			];
			
			
			// 각 셀을 수정 가능한 텍스트 입력 필드로 변경
			row.find("td:not(:first-child)").each(function(index) {
				
				var cellValue = $(this).text();
				console.log(cellNames[index] + "[" + index + "] : " + cellValue);
				
				var cellType = index === 5 ? "number" : "text";
				var cellMin = index === 5 ? "min=0" : "";
				var cellOption = "";
				
				if(index == 0 || index == 8) {
					cellOption = "readonly";
				}else if(index == 5){
					cellOption = "";
				}else {
					cellOption = "disabled";
				}
				
				var cellName = cellNames[index];
				var cellId = cellIds[index];
				var cellContent;
				
				// 첫 행 링크 유지
				if(index === 1) {
					return;
				}else if(index === 8) {
					cellContent = '<td><input type="'+cellType+'" name="'+cellName+'" value="'+${sessionScope.emp_id}+'"'+cellOption+' class="form-control"></td>';
				}else if(index === 5) {
					cellContent = '<td><input type="'+cellType+'" name="'+cellName+'" value="'+cellValue+'" id="'+cellId+'"'+cellOption+' min="0" class="form-control"></td>';
				}else {
					cellContent = '<td><input type="'+cellType+'" name="'+cellName+'" value="'+cellValue+'" id="'+cellId+'" '+cellOption+' class="form-control"></td>';
				}
				
				$(this).data('prevValue', cellValue);
				
				$(this).html(cellContent);
				
				$("#updateButton").attr("disabled", "disabled");
				$("#addRowButton").attr("disabled", "disabled");
				$("#deleteButton").attr("disabled", "disabled");
				
				$("#cancleButton").removeAttr("disabled");
				$("#submitButton").removeAttr("disabled");
				
				
				pageStatus = "update";
			});
			
		}else if (selectedCheckbox.length === 0){
			alert("수정할 행을 선택해주세요!")
			
		}else {
			alert("수정은 하나의 행만 가능합니다!");
		}
		
	}); // 수정 버튼 누를 시
	
	// 삭제버튼
	$("#deleteButton").click(function(){
		
		var selectedCheckbox = $("input[name='selectedReqId']:checked");
		
		// 체크된 체크박스가 하나인 경우에만 수정 기능 작동
		if (selectedCheckbox.length === 0){
			alert("삭제할 행을 선택해주세요!");
			
			// 선택안하면 submit을 막음
			event.preventDefault();
		}
		
	});
	
		// <th> 쪽 체크박스 클릭 시 해당 열의 <td> 부분의 행들을 선택하고 배경색 지정
        $(".table-reqList th input[type='checkbox']").click(function() {
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
         $(".table-reqList td input[type='checkbox']").click(function() {
             var checkbox = $(this);
             var isChecked = checkbox.prop('checked');
             checkbox.closest('tr').toggleClass('selected', isChecked);
             
             updateSelectedCheckboxCount(); 
         }); // <td> 쪽 체크박스 클릭 시 행 선택
         
    	function updateSelectedCheckboxCount() {
          var totalCheckboxes = $(".table-reqList td input[type='checkbox']").length;
          var selectedCheckboxes = $(".table-reqList td input[type='checkbox']:checked").length;
          $("#selectedCheckboxCount").text("전체 ("+selectedCheckboxes + '/' + totalCheckboxes+")");
      } // 체크박스 선택 시 체크박스 개수 구하기
      
      // 유효성 검사
      $("#submitButton").click(function() {
    	  
    	  var form = $("#reqList");
    	  form.attr("method", "post");
    	  form.attr("action", "/info/regRequirement");
    	  
    	  var req_num = $("#req_num").val();
    	  var pro_num = $("#pro_num").val();
    	  var ma_num = $("#ma_num").val();
    	  var req_cnt = $("#req_cnt").val();
    	  
    	  // alert(req_num + pro_num);
    	  
    	  // 수정 시 disabled 때문에 값 안넘어가는거 해결하기,,
    	  // req_num값이 null일 때만 등록이므로 등록할 때만 팝업창 제어하기!
    	  if(req_num == null || req_num == "") {
    	      	  
		   	  if(pro_num == null || pro_num == "") {
		   		  alert('완제품 코드를 입력하세요!');
		   		  $("pro_num").focus();
		   		  return;
		   	  }
    	  
	    	  if(ma_num == null || ma_num == "") {
	    		  alert('자재 코드를 입력하세요!');
	    		  $("ma_num").focus();
	    		  return;
	    	  }
      	}
    	  
    	  // 수정 시에도 제어 가능!
    	  if(req_cnt == 0) {
    		  alert('소요량을 입력하세요!');
    		  $("req_cnt").focus();
    		  return;
    	  }
    	  
    	  form.submit();
    	  
      });
      
      // 목록에서 완제품 코드 클릭 시 해당 완제품의 BOM 출력
      $(".openBOM").click(function() {
    	  
    	 var pro_num = $(this).text();
    	 
//     	 if(pageStatus == 'update') {
//     		 pro_num = $(this).closest("tr").find('td:eq(3)').text();
//     	 }

		//   alert(pro_num);
    	 
    	var left = (screen.width - 750) / 2;
 		var top = (screen.height - 400) / 2;
    	window.open('/info/req/BOM?pro_num='+pro_num+'', 'popup', 'width=750, height=400, top=' + top + ', left=' + left + ', location=no, status=no, scrollbars=yes');
    	 
      });
      
     });
         
    // 완제품 코드 입력란 클릭 시 팝업창 열기
    $(document).on("click", "input[name='pro_num']", function() {
    	var left = (screen.width - 600) / 2;
		var top = (screen.height - 680) / 2;
    	window.open('/info/req/addPopup?txt=pro', 'popup', 'width=600, height=680, top=' + top + ', left=' + left + ', location=no, status=no, scrollbars=yes');
   		
    });
    
    // 자재 코드 입력란 클릭 시 팝업창 열기
    $(document).on("click", "input[name='ma_num']", function() {
    	var left = (screen.width - 600) / 2;
		var top = (screen.height - 680) / 2;
 	   window.open('/info/req/addPopup?txt=ma', 'popup', 'width=600, height=680, top=' + top + ', left=' + left + ', location=no, status=no, scrollbars=yes');
    });
    

	  </script>
	  
    <style>
        .selected {
            background-color: #b3ccff;
        }
    </style>

<form action="" method="GET" class="bg-light rounded p-3 m-3">
	
	<div class="row mb-3">
		<label class="col-sm-2 col-form-label"><b>타입</b></label>
		<div class="col-sm-2">
			<select name="option" class="form-select" style="background-color: #fff;">
				<option value="all" 
					<c:if test="${option == '' || option == 'all' }">selected</c:if>
				>전체</option>
				<option value="pro_name" 
					<c:if test="${option == 'pro_name' }">selected</c:if>
				>완제품명</option>
				<option value="ma_name"
					<c:if test="${option == 'ma_name' }">selected</c:if>
				>자재명</option>
			</select>
		</div>		
	</div>
	
	<div class="row mb-3">
		<label class="col-sm-2 col-form-label"><b>검색어</b></label>
		<div class="col-sm-4">
			<input type="text" name="search" value="${search }" class="form-control" placeholder="검색어를 입력하세요">
		</div>
		
		<div class="col-auto">
			<button class="btn btn-primary m-3" type="submit" style="width:70px;">조회</button>
		</div>
	</div>
	
</form>

<hr>

<form id="reqList">
	
	<div class="d-flex align-items-center justify-content-between mb-2">
		
	<h3 class="m-4">소요량 관리</h3>
		
	<div>
	
		<c:if test="${((sessionScope.emp_dept eq '자재' || sessionScope.emp_dept eq '생산') && sessionScope.emp_auth == '2') || sessionScope.emp_auth == '3'}">
		
			<button type="button" class="btn btn-primary m-2" id="addRowButton"><i class="fa fa-plus"></i> 추가</button>
			<button type="button" class="btn btn-primary m-2" id="cancleButton" disabled>X 취소</button>
			<button type="button" class="btn btn-primary m-2" id="updateButton"><i class="fa fa-edit"></i> 수정</button>
			<button type="submit" class="btn btn-primary m-2" id="deleteButton" formaction="/info/delRequirement" formmethod="post"><i class="fa fa-trash"></i> 삭제</button>
			
			<button type="button" class="btn btn-primary m-2" id="submitButton" formaction="/info/regRequirement" formmethod="post" disabled><i class="fa fa-download"></i> 저장</button>
	
		</c:if>
	</div>
	
	</div>
	
	<div class="bg-light text-center rounded p-4 m-3">

		<div class="d-flex align-items-center justify-content-between mb-4">
			<span id="selectedCheckboxCount">0</span>
		</div>
	
	<input type="hidden" name="pro_id" id="pro_id">
	<input type="hidden" name="ma_id" id="ma_id"> 
	
		<div class="table-responsive">
			<table class="table-reqList table align-middle table-bordered table-hover mb-0">
		
				<tr>
					<th style="background-color: rgba(0,0,0,0.075);"><input type="checkbox" class="form-check-input"></th>
					<th style="background-color: rgba(0,0,0,0.075);">소요량 코드</th>
					<th style="background-color: rgba(0,0,0,0.075);">완제품 코드</th>
					<th style="background-color: rgba(0,0,0,0.075);">완제품명</th>
					<th style="background-color: rgba(0,0,0,0.075);">자재 코드</th>
					<th style="background-color: rgba(0,0,0,0.075);">자재명</th>
					<th style="background-color: rgba(0,0,0,0.075);">소요량</th>
					<th style="background-color: rgba(0,0,0,0.075);">단위</th>
					<th style="background-color: rgba(0,0,0,0.075);">등록일</th>
					<th style="background-color: rgba(0,0,0,0.075);">등록자</th>
				</tr>
				
				<c:forEach var="vo" items="${reqList }">
				<tr>	
					<td><input type="checkbox" name="selectedReqId" value="${vo.req_id}" class="form-check-input"></td>
					<td>${vo.req_num }</td>
					<td><a href="javascript:void(0);" class="openBOM">${vo.pro_num }</a></td>
					<td>${vo.pro_name }</td>
					<td>${vo.ma_num }</td>
					<td>${vo.ma_name }</td>
					<td>${vo.req_cnt }</td>
					<td>${vo.req_unit }</td>
					<td>
						<c:if test="${!empty vo.req_update_date}">${fn:substring(vo.req_update_date, 0, 10) }</c:if>
						<c:if test="${empty vo.req_update_date}">${fn:substring(vo.req_reg_date, 0, 10) }</c:if>
					</td>
					<td>${vo.emp_name }</td>
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
				<a class="page-link" href="/info/req/reqList?page=${pm.startPage-1 }&search=${search}&option=${option}" aria-label="Previous">
       			<span aria-hidden="true">&laquo;</span>
      			</a>
    		</li>
    		</c:if>
    		
    		<c:forEach begin="${pm.startPage }" end="${pm.endPage }" step="1" var="idx">
    		<li 
    			<c:out value="${pm.pageVO.page == idx ? 'class=page-item active': 'class=page-item'}" />
    		>
    				<a class="page-link" href="/info/req/reqList?page=${idx}&search=${search}&option=${option}">${idx }</a>
    		</li>
    		</c:forEach>
			
			<c:if test="${pm.next && pm.endPage > 0}">
			<li class="page-item">
      			<a class="page-link" href="/info/req/reqList?page=${pm.endPage+1 }&search=${search}&option=${option}" aria-label="Next">
        		<span aria-hidden="true">&raquo;</span>
      			</a>
    		</li>
    		</c:if>
    		
  		</ul>
	</nav>
	
	<!-- 페이지 이동 버튼 -->

	
</body>
</html>

<%@ include file="../../inc/footer.jsp"%>