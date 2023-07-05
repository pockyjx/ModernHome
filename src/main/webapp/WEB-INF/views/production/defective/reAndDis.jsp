<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<link href="/resources/img/favicon.ico" rel="icon">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Heebo:wght@400;500;600;700&display=swap" rel="stylesheet">
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">
<link href="/resources/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
<link href="/resources/lib/tempusdominus/css/tempusdominus-bootstrap-4.min.css" rel="stylesheet" />
<link href="/resources/css/bootstrap.min.css" rel="stylesheet">
<link href="/resources/css/style.css" rel="stylesheet">

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" />
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="//code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		var url = window.location.href;
		var value = new URLSearchParams(new URL(url).search).get("rd");
		
		if(value === "repair") {
			$("h4").html("수리 처리 하시겠습니까?");
		} else if(value === "discard") {
			$("h4").html("폐기 처리 하시겠습니까?")
		}
		
		$(".submitButton").click(function() {
			// 서버에 저장할 데이터 전송을 위한 ajax
			var formValue = $("form[name='modifyForm']").serialize();
			
			$.ajax({
				url : "${contextPath}/production/defective/reAndDis",
				type : "POST",
				data : formValue,
				success : function() {
					alert("처리 완료되었습니다.");
					opener.location.reload();
					self.close();
				},
				error : function() {
					alert("처리 실패했습니다!");
				}
			});
		});
	});
</script>

<body>


<div class="bg-light text-center rounded p-4 mx-3">
	<form name="modifyForm">
		<h4></h4>
		<p>처리 후 변경이 불가능합니다.</p>
		<input type="hidden" name="df_id" value="${param.df_id}">
		<input type="hidden" name="df_cnt" value="${param.df_cnt}">
		<input type="hidden" name="emp_id" value="${sessionScope.emp_id}">
		<button type="button" class="submitButton btn btn-outline-success m-2">확인</button>
		<button type="button" class="btn btn-outline-danger m-2" onclick="window.close();">취소</button>
	</form>
</div>

</body>
</html>