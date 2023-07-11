<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<link rel="stylesheet" as="style" crossorigin 
    href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.8/dist/web/static/pretendard.css" />
     <!-- Favicon -->
<link rel="icon" href="/resources/img/faviconn.svg" type="image/x-icon">   
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <style type="text/css">
        * {
            font-family: Pretendard, -apple-system, BlinkMacSystemFont, system-ui, Roboto, "Helvetica Neue", "Segoe UI", "Apple SD Gothic Neo", "Noto Sans KR", "Malgun Gothic", "Apple Color Emoji", "Segoe UI Emoji", "Segoe UI Symbol", sans-serif;
        }
    </style>
<link href="/resources/img/favicon.ico" rel="icon">
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">
<link href="/resources/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
<link href="/resources/lib/tempusdominus/css/tempusdominus-bootstrap-4.min.css" rel="stylesheet" />
<link href="/resources/css/bootstrap.min.css" rel="stylesheet">
<link href="/resources/css/style.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		const urlParams = new URL(location.href).searchParams;
		const cnt = urlParams.get('cnt');
		const line_qc_id = urlParams.get('line_qc_id');
		const work_num = urlParams.get('work_num');
		updateSelectedCheckboxCount();
		$('#btnInsert').click(function() {
			var selectedCheckboxes = $(".table td input[type='checkbox']:checked").length;
			if(selectedCheckboxes != cnt) {
				Swal.fire('수량이 맞지 않습니다.', '누락된 자재가 있는지 확인하세요','warning');
			}else {
				Swal.fire({
					title: '등록하시겠습니까?',
					text: '등록 후 변경이 불가능합니다.', 
					icon: 'warning',
					showCancelButton: true,
					confirmButtonColor: '#3085d6',
		            cancelButtonColor: '#d33',
		            confirmButtonText: '승인',
		            cancelButtonText: '취소'
				}).then((result) => {
					if(result.isConfirmed) {
						var elementList = new Array();
						var today = new Date();
						var year = today.getFullYear();
						var month = ('0' + (today.getMonth() + 1)).slice(-2);
						var day = ('0' + today.getDate()).slice(-2);
						var todayDate = year+""+month+day;
						$("#elementlistBody").find("tr").each(function(idx) {
							var data = new Object();
							data.ele_num = $(this).find("td:eq(1)").text();
							data.line_qc_id = line_qc_id;
			            	var checkBox = $(this).find("td input[type='checkbox']")
				            var isChecked = checkBox.prop('checked');
							if(isChecked) {
								data.line_qc_defect = 1;
							}else {
				            var pro_id = checkBox.val();
								data.lot_num = "MH"+todayDate+"-"+pro_id+"-"+(idx+1);
							}
							elementList.push(data);
						});
						console.log(elementList);
						ajax(elementList);
						
					}
				});				
			}

			
		});
		function ajax(elementList) {
			$.ajax({
				type: 'post',
				url: '/elements/updateLQC',
				contentType: 'application/json',
				data: JSON.stringify(elementList),
				success: function(data) {
					Swal.fire({
						title : "등록이 완료되었습니다!",
				    	icon  : "success",
				    	closeOnClickOutside : false
					}).then(function(){
						window.close();
					});
				},
				error: function() {
// 					alert("error");
					Swal.fire('등록에 실패하였습니다', '전산실에 문의하세요','error');
					return;
				}
			});
		}
		// <th> 쪽 체크박스 클릭 시 해당 열의 <td> 부분의 행들을 선택하고 배경색 지정
        $(".table th input[type='checkbox']").click(function() {
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
        $(".table td input[type='checkbox']").click(function() {
        	var checkedCnt = $(".table td input[type='checkbox']:checked").length;
            var checkbox = $(this);
            var isChecked = checkbox.prop('checked');
            if(isChecked && checkedCnt > cnt) {
            	Swal.fire('수량이 초과하였습니다', '불량수량을 초과하여 선택할 수 없습니다','warning');
            	checkbox.prop('checked', false);
            	return;
            }
            checkbox.closest('tr').toggleClass('selected', isChecked);
        
            updateSelectedCheckboxCount();
        }); // <td> 쪽 체크박스 클릭 시 행 선택
	
		
        function updateSelectedCheckboxCount() {
        	var selectedCheckboxes = $(".table td input[type='checkbox']:checked").length;
            $("#count").text(selectedCheckboxes);
        } // 체크박스 선택 시 체크박스 개수 구하기
        
        $('#btnRelease').click(function() {
        	var rows = $('#elementlistBody').find('tr');
        	var len = $('#elementlistBody').find('input[type="checkbox"]').length;
        	$('#elementlistBody').find('input[type="checkbox"]').prop('checked', false);
        	rows.removeClass('selected');
        	updateSelectedCheckboxCount();
//         	.each(function() {
//         		$(this).prop('checked', false);
//         	});
        });
	});
</script>
<style>
    .selected {
        background-color: #b3ccff;
    }
</style>
<div class="row row" style="margin-left: 1rem; margin-top: 3rem;">
	<div class="col-auto">
		<input type="button" id="btnInsert" class="btn btn-primary m-2" value="등록">
	</div>
	<div class="col-auto">
		<input type="button" id="btnRelease" class="btn btn-primary m-2" value="전체선택해제">
	</div>
</div>

<div class="bg-light text-center rounded p-4 m-3" style="width: 300px;">
	<span id="count"> 0</span>/${param.cnt }
	<div class="table-responsive">
		<table id="elementlist" class="table align-middle table-bordered table-hover mb-0">
			<thead>
			<tr class="text-dark" style="background-color: rgba(0,0,0,0.075);">
			    <th>선택</th>
			    <th>자재일련번호</th>
		  </tr>
		  </thead>
		  <tbody id="elementlistBody">
		  	<c:forEach var="vo" items="${eiList}">
		  		<tr>		  		
			  		<td><input type="checkbox" value="${vo.pro_id }" <c:if test="${vo.line_qc_defect eq 1 }">checked</c:if>></td>
			  		<td>${vo.ele_num }</td>
		  		</tr>
		  	</c:forEach>
		  </tbody>
		</table>
	</div>
</div>

