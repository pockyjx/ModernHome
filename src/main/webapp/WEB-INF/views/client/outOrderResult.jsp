<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>


<script>
$(document).ready(function() {
	
	// 월별
	var monthlyOrderResult = JSON.parse('${monthlyOrderResult}');
	
	var months = [];
	var orderCount = [];
	var orderAmount = [];
	
	for(var i = 0; i < monthlyOrderResult.length; i++){
		var month = monthlyOrderResult[i].month;
		months.push(month);
	}
	
	for(var i = 0; i < monthlyOrderResult.length; i++){
		var monthlyOrderCount = monthlyOrderResult[i].monthlyOrderCount;
		orderCount.push(monthlyOrderCount);
	}
	
	for(var i = 0; i < monthlyOrderResult.length; i++){
		var monthlyOrderAmount = monthlyOrderResult[i].monthlyOrderAmount;
		orderAmount.push(monthlyOrderAmount);
	}
	
// 	alert(months);
// 	alert(orderCount);
// 	alert(orderAmount);
	
	
	// 수주금액 차트
	var canvas = document.getElementById('monthlyOrderAmount');
// 	canvas.width = 400; // 너비 설정
// 	canvas.height = 300; // 높이 설정
	
	var ctx = canvas.getContext('2d');
	
	var myChart = new Chart(ctx, {
		type: 'line',
		data: {
			labels: months,
			datasets: [{
			label: '월별 수주 금액',
			data: orderAmount,
// 			backgroundColor: 'rgba(75, 192, 192, 0.2)',
// 			borderColor: 'rgba(75, 192, 192, 1)',
			borderWidth: 1
			}]
		}, // data
		options: {
			scales: {
				y: {
					beginAtZero: true
				}
			},
			responsive: false // 차트 크기를 고정, 이거 안하면 차트가 부모요소에 꽉 채워서 나옴
		}
		
	}); // 수주금액 차트
	
	
	
	var canvas1 = document.getElementById('monthlyOrderCount');
// 	canvas1.width = 400; // 너비 설정
// 	canvas1.height = 300; // 높이 설정
	
	var ctx = canvas1.getContext('2d');
	
	var myChart = new Chart(ctx, {
		type: 'line',
		data: {
			labels: months,
			datasets: [{
			label: '월별 수주 건수',
			data: orderCount,
// 			backgroundColor: 'rgba(75, 192, 192, 0.2)',
// 			borderColor: 'rgba(75, 192, 192, 1)',
			borderWidth: 1
			}]
		}, // data
		options: {
			scales: {
				y: {
					beginAtZero: true
				}
			},
			responsive: false // 차트 크기를 고정, 이거 안하면 차트가 부모요소에 꽉 채워서 나옴
		}
		
	}); // 수주금액 차트
	  
}); //jQuery
</script>

</head>
<body>


	<div class="col-sm-12 col-xl-6">
		<div class="bg-light rounded h-100 p-4">
			<h6 class="mb-4">Single Line Chart</h6>
			<canvas id="monthlyOrderAmount" width="412" height="206"
				style="display: block; box-sizing: border-box; height: 219.733px; width: 439.467px;"></canvas>
		</div>
	</div>

	<div class="col-sm-12 col-xl-6">
		<div class="bg-light rounded h-100 p-4">
			<h6 class="mb-4">Single Line Chart</h6>
			<canvas id="monthlyOrderCount" width="412" height="206"
				style="display: block; box-sizing: border-box; height: 219.733px; width: 439.467px;"></canvas>
		</div>
	</div>


</body>
</html>