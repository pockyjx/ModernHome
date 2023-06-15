<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>발주 관리</title>
<link rel="stylesheet" href="//code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" />
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="//code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
</head>
<body>
		<h2>발주 관리</h2>
			<fieldset>
               	<form name="search" method="get" action="">
                   	<div>
                   		<label>발주일자</label>
                   	</div>
                   	<div>
                   		<input name="publeYear" autocomplete="off" readonly="readonly">
                   	</div>
		       		<div>
		       			<input type="text" name="wh_name" placeholder="발주 자재명을 입력하세요">
		       		</div>
		       		<br>
		       		<div>
                   		<label>입고예정일</label>
                   	</div>
                   	<div>
                   		<input name="publeYear" autocomplete="off" readonly="readonly">
                   	</div>
		       		<span>발주상태
		       			<input type="checkbox" name="wh_type_ma">완료
                   		<input type="checkbox" name="wh_type_pro">미완료
		       		</span>
		      		<button class="btn btn-primary" type="submit" id="IconButton6"><a>조회</a></button>
             	</form>
             </fieldset>  
             
		<h2>발주</h2>
			<table border="1">
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
			  	<c:forEach var="vo" items="${inorderList}">
					<tr>
						<td><input type="checkbox"></td>
				    	<td></td>
				    	<td></td>
				    	<td></td>
				    	<td></td>
				    	<td></td>
				    	<td></td>
				    	<td></td>
				    	<td></td>
				    	<td></td>
				   		<td></td>
				   		<td></td>
				   		<td>${vo.emp_id}</td>
				    </tr>
			    </c:forEach>
			</table>
	<script type="text/javascript">
	<!-- 캘린터 위젯 적용 -->
		/* 설정 */	
		const config = {
			dateFormat : 'yy-mm-dd',
			showOn : "button",
			buttonText:"날짜 선택",
			prevText: '이전달',
		    nextText: '다음달',
		    currentText:'오늘',
		    closeText: '닫기',
		    monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
		    monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
		    dayNames:['일요일','월요일','화요일','수요일','목요일','금요일','토요일'],
			dayNamesMin:['일','월','화','수','목','금','토'],
		    dayNamesShort: ['일','월','화','수','목','금','토'],
		    minDate:0,
		    maxDate:+7,
// 		    yearSuffix: '년',
		    changeMonth: false,
	        changeYear: false
		}
		
		/* 캘린더 */
		$(function() {
			$( "input[name='publeYear']" ).datepicker(config);
		});
	</script>		
	
		
	
	
	
</body>
</html>