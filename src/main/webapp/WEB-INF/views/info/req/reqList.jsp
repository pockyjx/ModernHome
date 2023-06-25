<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
  
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
    
	     $(document).ready(function() {
	    	 
	    	 updateSelectedCheckboxCount();
	     	
	         // 버튼 클릭 시 행 추가
	         $("#addRowButton").click(function() {
	             var newRow = '<tr>' +
	                 '<td><input type="checkbox"></td>' +
	                 '<td><input type="text" name="req_num" placeholder="소요량 코드" readonly></td>' +
	                 '<td><input type="text" name="pro_num" placeholder="완제품 코드" readonly id="pro_num"></td>' +
	                 '<td><input type="text" name="pro_name" placeholder="완제품명" id="pro_name" readonly ></td>' +
	                 '<td><input type="text" name="ma_num" placeholder="자재 코드" id="ma_num" readonly></td>' +
	                 '<td><input type="text" name="ma_name" placeholder="자재명" id="ma_name" readonly></td>' +
	                 '<td><input type="number" name="req_cnt" placeholder="소요량" min="0"></td>' +
	                 '<td><input type="text" name="req_unit" placeholder="단위"></td>' +
	                 '<td><input type="date" name="req_reg_date" readonly></td>' +
	                 '<td><input type="text" name="emp_id" value="${sessionScope.emp_id }" readonly></td>' +
	                 '</tr>';
	             $(".table-reqList tr:nth-child(1)").after(newRow);
	             
	             // 추가버튼, 수정버튼 비활성화, 취소버튼 활성화
				$("#addRowButton").attr("disabled", "disabled");
				$("#updateButton").attr("disabled", "disabled");
				$("#deleteButton").attr("disabled", "disabled");
				
				$("#cancleButton").removeAttr("disabled");
				$("#submitButton").removeAttr("disabled");
				
				pageStatus = "reg";
				

	             
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
			$("#deleteButton").attr("disabled", "disabled");
			
			$("#cancleButton").attr("disabled", "disabled");
			$("#submitButton").attr("disabled", "disabled");
			
			pageStatus = "";
		}
		
		// 수정버튼 취소
		if(pageStatus == "update"){
			
			// selectedReqid 이름을 가진 input 요소의 부모 테이블 행을 찾음
			var row = $("input[name='selectedReqId']:checked").closest("tr");
			
			// 폼 초기화(기존내용으로)
			$("#reqList")[0].reset();
			
			// 각 셀의 값을 원래 상태로 되돌림
			row.find("td:not(:first-child)").each(function(index) {
				var cellValue = $(this).find("input").val();
				$(this).html(cellValue);
			});
			
			// 추가버튼, 수정버튼 활성화, 취소버튼 비활성화
			$("#addRowButton").removeAttr("disabled");
			$("#updateButton").removeAttr("disabled");
			$("#deleteButton").removeAttr("disabled");
			
			$("#cancleButton").attr("disabled", "disabled");
			$("#submitButton").attr("disabled", "disabled");
			
			
			pageStatus = "";
			
		}
	
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
			
			
			// 각 셀을 수정 가능한 텍스트 입력 필드로 변경
			row.find("td:not(:first-child)").each(function(index) {
				//
				var cellValue = $(this).text();
				var cellOption = "";
				
				if(index == 8) {
					cellValue = ${sessionScope.emp_id}
				}
				
				if(index == 0 || index == 8) {
					cellOption = "readonly";
				}else if(index == 5){
					cellOption = "";
				}else {
					cellOption = "disabled";
				}
				
				
				var cellType = index === 5 ? "number" : "text";
				
			
				
				var cellName = cellNames[index];
				
				$(this).html('<input type="' + cellType + '" name="' + cellName + '" value="' + cellValue + '"' + cellOption + '>');
				
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
         
     });
         
    // 완제품 코드 입력란 클릭 시 팝업창 열기
    $(document).on("click", "input[name='pro_num']", function() {
 	   window.open('/info/req/addPopup?txt=pro', 'popup', 'width=600, height=500, location=no, status=no, scrollbars=yes');
    });
    
    // 자재 코드 입력란 클릭 시 팝업창 열기
    $(document).on("click", "input[name='ma_num']", function() {
 	   window.open('/info/req/addPopup?txt=ma', 'popup', 'width=600, height=500, location=no, status=no, scrollbars=yes');
    });
     
	      
	  </script>
	 
	  
	  
    <style>
        .selected {
            background-color: #b3ccff;
        }
    </style>

</head>
<body>
	
	<h1>소요량 관리</h1>
	
	<fieldset>
		<form action="" method="GET">
				
			<select name="option">
				<option value="all">전체</option>
				<option value="pro_name">완제품명</option>
				<option value="ma_name">자재명</option>
			</select>
			
			<label><input type="text" name="search"></label>
			<input type="submit" value="조회">
		</form>
	</fieldset>

	<hr>
	
	
	<form id="reqList">
	
	
	<span id="selectedCheckboxCount">0</span>
	
<div>
	
	<!-- input 타입 button 타입으로 바꿔줘야 아이콘 적용됨! -->
	<!-- <input type="button" id="addRowButton" value="추가" class="btn btn-primary m-2 fa fa-plus""> -->
	<button class="btn btn-primary m-2" id="addRowButton"><i class="fa fa-plus"></i> 추가</button>

	<!-- <input type="button" id="cancleButton" value="취소" disabled="disabled" class="btn btn-primary m-2"> -->
	<button class="btn btn-primary m-2" id="cancleButton" disabled>X 취소</button>

	<!-- <input type="button" id="updateButton" value="수정" class="btn btn-primary m-2"> -->
	<button class="btn btn-primary m-2" id="updateButton"><i class="fa fa-edit"></i> 수정</button>

	<!-- <input type="submit" id="deleteButton" value="삭제" formaction="/info/delRequirement" formmethod="post" class="btn btn-primary m-2"> -->
	<button type="submit" class="btn btn-primary m-2" id="deleteButton" formaction="/info/delRequirement" formmethod="post"><i class="fa fa-trash"></i> 삭제</button>
	
	<!-- <input type="submit"  id="submitButton" value="저장" formaction="/info/regRequirement" formmethod="post" disabled="disabled" class="btn btn-primary m-2"> -->
	<button type="submit" class="btn btn-primary m-2" id="submitButton" formaction="/info/regRequirement" formmethod="post" disabled><i class="fa fa-download"></i> 저장</button>

</div>

	

	<table class="table-reqList" border="1">

	<input type="hidden" name="pro_id" id="pro_id">
	<input type="hidden" name="ma_id" id="ma_id"> 
		
		<tr>
			<th><input type="checkbox"></th>
			<th>소요량 코드</th>
			<th>완제품 코드</th>
			<th>완제품명</th>
			<th>자재 코드</th>
			<th>자재명</th>
			<th>소요량</th>
			<th>단위</th>
			<th>등록일</th>
			<th>등록자</th>
		</tr>
		
		<c:forEach var="vo" items="${reqList }">
		<tr>	
			<td><input type="checkbox" name="selectedReqId" value="${vo.req_id}"></td>
			<td>${vo.req_num }</td>
			<td><a href="/info/req/BOM?pro_id=${vo.pro_id}">${vo.pro_num }</a></td>
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
	
	
	
	</form>

	
</body>
</html>

<%@ include file="../../inc/footer.jsp"%>