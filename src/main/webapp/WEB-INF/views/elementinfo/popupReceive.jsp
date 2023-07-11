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
		var count=0;
		const urlParams = new URL(location.href).searchParams;
		const cnt = urlParams.get('cnt');
		const rec_id = urlParams.get('rec_id');
		const ma_id = urlParams.get('ma_id');
		function duplicate() {
			var duplication = false;
			$("#elementlist").find("td").each(function() {
				if($('#elementName').val() == $(this).text() ) {
					duplication = true;
					return false;
				}
			});
			if(duplication) return true;
			else return false;
		}
		function chkValue() {
	        var tmp = $('#elementName').val().replace(/\s|　/gi, '');
	        if(tmp == ''){
	           return true; // 공백일 때
	        }else {
	            return false; // 공백이 아닐 때
	        }
	    }
		$('#btnAdd').click(function() {
			if(chkValue()) {
				
				return false;
			}
			if(duplicate()) {
				$('.alert-danger').css("display", "block");
				$('.alert-light').css("display", "none");
				setTimeout(function() {
					$('.alert-danger').css("display", "none");
					$('.alert-light').css("display", "block");
				}, 3000);
			}else if(count < cnt) {
// 				alert("cnt :" + cnt + "count : " + count);
// 				var str = "<input type='text' id='element"+(count++)+"' class='form-control' value='"+$('#elementName').val()+"' readonly><br>";
// 				str += ""
				var str = "<tr><td>";
				str += $('#elementName').val();
				str += "</td><td>";
				str += "<input type='button' class='btn btn-outline-danger m-2' value='X'>";
				str += "</td></tr>";
				$('#elementlistBody').append(str);
				$('#count').text(++count);
				count=$('elementlistBody').find('tr').length;
				$('#elementName').val("");
				$('.alert-success').css("display", "block");
				$('.alert-light').css("display", "none");
				setTimeout(function() {
					$('.alert-success').css("display", "none");
					$('.alert-light').css("display", "block");
				}, 1000);
			}else {
				$('.alert-warning').css("display", "block");
				$('.alert-light').css("display", "none");
				setTimeout(function() {
					$('.alert-warning').css("display", "none");
					$('.alert-light').css("display", "block");
				}, 3000);
			}

		});
		$('#btnInsertAuto').click(function() {
			$('#elementlistBody').find('tr').remove();
			count = 0;
			$('#count').text(count);
			var today = new Date();
			var year = today.getFullYear();
			var month = ('0' + (today.getMonth() + 1)).slice(-2);
			var day = ('0' + today.getDate()).slice(-2);
			var todayDate = year+""+month+day;
			for(var i=0; i<cnt; i++) {
				var str = "<tr><td>";
				str += "EI"+todayDate+"-"+ma_id+"-"+(i+1);
				str += "</td><td>";
				str += "<input type='button' class='btn btn-outline-danger m-2' value='X'>";
				str += "</td></tr>";
				$('#elementlistBody').append(str);
				$('#count').text(++count);
			}
		});
		$(document).on("click", ".btn-outline-danger", function() {
		    $(this).parent().parent().remove();
		    $('#count').text(--count);
		});
		$('#btnInsert').click(function() {
			if(count != cnt) {
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
						$("#elementlistBody").find("tr").each(function() {
							var data = new Object();
						    data.ele_num = $(this).find("td:eq(0)").text();
						    data.rec_id = rec_id;
						    data.ma_id = ma_id;
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
				url: '/elements/insert',
				contentType: 'application/json',
				data: JSON.stringify(elementList),
				success: function(data) {
// 					alert(data);
// 					Swal.fire('등록이 완료되었습니다!', '자재정보가 등록되었습니다','success');
// 					Swal.fire({
// 						icon: 'success', 
// 						title: '등록이 완료되었습니다!', 
// 						confirmButtonColor: '#3085d6'
// 					});
// 					window.close();
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
	});
</script>
<div class="row row" style="margin-left: 1rem; margin-top: 3rem;">
	<div class="col-sm-2">
		<input type="text" class="form-control" id="elementName" placeholder="일련번호를 입력하세요" >
	</div>
	<div class="col-auto">
		<input type="button" id="btnAdd" class="btn btn-primary m-2" value="추가">
	</div>
	<div class="col-auto">
		<input type="button" id="btnInsert" class="btn btn-primary m-2" value="등록">
	</div>
	<div class="col-auto">
		<input type="button" id="btnInsertAuto" class="btn btn-primary m-2" value="자동추가">
	</div>
</div>
<div class="alert alert-light" role="alert"></div>
<div class="alert alert-success" role="alert" style="display: none">등록되었습니다.</div>
<div class="alert alert-warning" role="alert" style="display: none">더이상 추가할 수 없습니다.</div>
<div class="alert alert-danger" role="alert" style="display: none">중복된 일련번호가 있습니다.</div>

<div class="bg-light text-center rounded p-4 m-3" style="width: 300px;">
	<span id="count"> 0</span>/${param.cnt }
	<div class="table-responsive">
		<table id="elementlist" class="table align-middle table-bordered table-hover mb-0">
			<thead>
			<tr class="text-dark" style="background-color: rgba(0,0,0,0.075);">
			    <th>자재일련번호</th>
			    <th>삭제</th>
		  </tr>
		  </thead>
		  <tbody id="elementlistBody">
		  </tbody>
		</table>
	</div>
</div>

