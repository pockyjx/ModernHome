<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="inc/header.jsp"%>
<%@ include file="inc/sidebar.jsp"%>
<%@ include file="inc/nav.jsp"%>

<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<script>
// 수주 그래프
$(document).ready(function() {
	
	var canvas, canvas1;
	var ctx, ctx1;
	var myChart, myChart1;
	
	// 영업실적
	$('#sales').click(function(){
		
		$('.chartTitle').html('<h4>영업 실적</h4>');
		
		if (typeof myChart !== 'undefined') {
			myChart.destroy();
		}
		if (typeof myChart1 !== 'undefined') {
			myChart1.destroy();
		}
		
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
		
		
		// 수주금액 차트
		canvas = document.getElementById('canvas');
		canvas.width = 412; // 너비 설정
		canvas.height = 206; // 높이 설정
		canvas.style.display = 'block';
		canvas.style.boxSizing = 'border-box';
		canvas.style.width = '439.467px';
		canvas.style.height = '219.733px';

		
		
		ctx = canvas.getContext('2d');
		
		myChart = new Chart(ctx, {
			type: 'line',
			data: {
				labels: months,
				datasets: [{
				label: '월별 수주 금액',
				data: orderAmount,
// 				backgroundColor: 'rgba(75, 192, 192, 0.2)', // 색깔지정
// 				borderColor: 'rgba(75, 192, 192, 1)',
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
		
		
		
		canvas1 = document.getElementById('canvas1');
		canvas1.width = 412; // 너비 설정
		canvas1.height = 206; // 높이 설정
		canvas1.style.display = 'block';
		canvas1.style.boxSizing = 'border-box';
		canvas1.style.width = '439.467px';
		canvas1.style.height = '219.733px';
		
		ctx1 = canvas1.getContext('2d');
		
		myChart1 = new Chart(ctx1, {
			type: 'line',
			data: {
				labels: months,
				datasets: [{
				label: '월별 수주 건수',
				data: orderCount,
				borderWidth: 1
				}]
			}, // data
			options: {
				scales: {
					y: {
						beginAtZero: true
					}
				},
				responsive: false // 차트 크기를 고정, true => 화면크기에 따라 크기 달라짐
			}
			
		}); // 수주건수 차트
		
		$('#chartData').show();
		$('#mainImg').hide();
		// active 클래스 추가, 제거
		$(this).addClass('active');
		$('li.nav-item.nav-link').not(this).removeClass('active');
		
	}); // sales click
	
	
	
	// 자재 실적
	$('#materials').click(function(){
		
		$('.chartTitle').html('<h4>자재 실적</h4>');
		
		if (typeof myChart !== 'undefined') {
			myChart.destroy();
		}
		if (typeof myChart1 !== 'undefined') {
			myChart1.destroy();
		}
		
		var monthlyIOResult = JSON.parse('${monthlyIOResult}');
		
		var months = [];
		var IOCount = [];
		var IOAmount = [];
		
		for(var i = 0; i < monthlyIOResult.length; i++){
			var month = monthlyIOResult[i].month;
			months.push(month);
		}
		
		for(var i = 0; i < monthlyIOResult.length; i++){
			var monthlyIOCount = monthlyIOResult[i].monthlyIOCount;
			IOCount.push(monthlyIOCount);
		}
		
		for(var i = 0; i < monthlyIOResult.length; i++){
			var monthlyIOAmount = monthlyIOResult[i].monthlyIOAmount;
			IOAmount.push(monthlyIOAmount);
		}
		
		
		// 발주금액 차트
		canvas = document.getElementById('canvas');
		canvas.width = 412; // 너비 설정
		canvas.height = 206; // 높이 설정
		canvas.style.display = 'block';
		canvas.style.boxSizing = 'border-box';
		canvas.style.width = '439.467px';
		canvas.style.height = '219.733px';
		
		ctx = canvas.getContext('2d');
		
		myChart = new Chart(ctx, {
			type: 'line',
			data: {
				labels: months,
				datasets: [{
				label: '월별 발주 금액',
				data: IOAmount,
	// 			backgroundColor: 'rgba(75, 192, 192, 0.2)', // 색깔지정
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
			
		}); // 발주금액 차트
		
		// 발주건수 차트
		canvas1 = document.getElementById('canvas1');
		canvas1.width = 412; // 너비 설정
		canvas1.height = 206; // 높이 설정
		canvas1.style.display = 'block';
		canvas1.style.boxSizing = 'border-box';
		canvas1.style.width = '439.467px';
		canvas1.style.height = '219.733px';
		
		ctx1 = canvas1.getContext('2d');
		
		myChart1 = new Chart(ctx1, {
			type: 'line',
			data: {
				labels: months,
				datasets: [{
				label: '월별 발주 건수',
				data: IOCount,
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
			
		}); // 발주금액 차트
		
		$('#chartData').show();
		$('#mainImg').hide();
		// active 클래스 추가, 제거
		$(this).addClass('active');
		$('li.nav-item.nav-link').not(this).removeClass('active');
		
	}); // materials click
	


	// 품질 실적
	$('#quality').click(function(){
		
		$('.chartTitle').html('<h4>품질 실적</h4>');
		
		if (typeof myChart !== 'undefined') {
			myChart.destroy();
		}
		if (typeof myChart1 !== 'undefined') {
			myChart1.destroy();
		}
		
		var dfCnt = JSON.parse('${dfCnt}');
		
		var totalMr = dfCnt.totalMr;
		var totalDf = dfCnt.totalDf;
		var discolored = dfCnt.discolored;
		var scratched = dfCnt.scratched;
		var damaged = dfCnt.damaged;
		
		var dfCnt = [];
		canvas = document.getElementById('canvas');
		canvas.width = 422; // 너비 설정
		canvas.height = 422; // 높이 설정
		canvas.style.display = 'block';
		canvas.style.boxSizing = 'border-box';
		canvas.style.width = '450.133px';
		canvas.style.height = '450.133px';
		
		ctx = canvas.getContext('2d');
		
		myChart = new Chart(ctx, {
			type: 'doughnut',
			data: {
				labels: ['양품', '불량품'] ,
				datasets: [{
				label: '불량률',
				data: [((totalMr - totalDf) / totalMr) * 100 ,(totalDf / totalMr) * 100] ,
				backgroundColor: ['#59c6f0', '#ff9c9c'], // 색상 설정
				borderWidth: 1
				}]
			}, // data
			options: {
				plugins: {
					tooltip: {
						callbacks: {
							label: function (context) {
								var value = context.dataset.data[context.dataIndex];
								return value.toFixed(2) + '%'; // 소수점 둘째자리까지 표시하고 '%' 기호 추가
							}
						}
					}
				},
			    scales: {
					x: {
						display: false // x축 숨기기
					},
					y: {
						display: false // y축 숨기기
					}
				},
				responsive: false // 차트 크기를 고정, 이거 안하면 차트가 부모요소에 꽉 채워서 나옴
		    }
		
		}); // 차트
		
		
		
		canvas1 = document.getElementById('canvas1');
		canvas1.width = 422; // 너비 설정
		canvas1.height = 422; // 높이 설정
		canvas1.style.display = 'block';
		canvas1.style.boxSizing = 'border-box';
		canvas1.style.width = '450.133px';
		canvas1.style.height = '450.133px';
		
		ctx1 = canvas1.getContext('2d');
		
		myChart1 = new Chart(ctx1, {
			type: 'doughnut',
			data: {
				labels: ['변색', '찍힘', '파손', '기타'] ,
				datasets: [{
				label: '불량률',
				data: [discolored / totalDf * 100, scratched / totalDf * 100, damaged / totalDf * 100, (totalDf - discolored - scratched - damaged) / totalDf * 100] ,
				backgroundColor: ['#ffe06b', '#ff9c9c', '#59c6f0', '#95da95'], // 색상 설정
				borderWidth: 1
				}]
			}, // data
			options: {
				plugins: {
					tooltip: {
						callbacks: {
							label: function (context) {
								var value = context.dataset.data[context.dataIndex];
								return value.toFixed(2) + '%'; // 소수점 둘째자리까지 표시하고 '%' 기호 추가
							}
						}
					}
				},
			    scales: {
					x: {
						display: false // x축 숨기기
					},
					y: {
						display: false // y축 숨기기
					}
				},
				responsive: false // 차트 크기를 고정, 이거 안하면 차트가 부모요소에 꽉 채워서 나옴
		    }
		
		}); // 차트
		
		$('#chartData').show();
		$('#mainImg').hide();
		// active 클래스 추가, 제거
		$(this).addClass('active');
		$('li.nav-item.nav-link').not(this).removeClass('active');
		
	}); //quality click


	
	// 생산 실적
	$('#production').click(function(){
		
		$('.chartTitle').html('<h4>생산 실적</h4>');
		
		if (typeof myChart !== 'undefined') {
			myChart.destroy();
		}
		if (typeof myChart1 !== 'undefined') {
			myChart1.destroy();
		}
		
		var shutdownCnt = JSON.parse('${shutdownCnt}');
		
		var months = [];
		var counts = [];
		
		
		for(var i = 0; i < shutdownCnt.length; i++){
			var count = shutdownCnt[i].count;
			counts.push(count);
		}
		
		for(var i = 0; i < shutdownCnt.length; i++){
			var month = shutdownCnt[i].month;
			months.push(month);
		}
		
		
		
		canvas = document.getElementById('canvas');
		canvas.width = 412; // 너비 설정
		canvas.height = 206; // 높이 설정
		canvas.style.display = 'block';
		canvas.style.boxSizing = 'border-box';
		canvas.style.width = '439.467px';
		canvas.style.height = '219.733px';
		
		ctx = canvas.getContext('2d');
		
		myChart = new Chart(ctx, {
			type: 'line',
			data: {
				labels: months ,
				datasets: [{
				label: '월별 평균고장수',
				data: counts ,
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
			
		}); // 평균고장수 차트
		
		
		
		var dfRate = JSON.parse('${dfRate}');
		
		
		var qc_cnts = [];
		var df_cnts = [];
		var months = [];
		
		for(var i = 0; i < dfRate.length; i++){
			var qc_cnt = dfRate[i].qc_cnt;
			qc_cnts.push(qc_cnt);
		}
		
		for(var i = 0; i < dfRate.length; i++){
			var df_cnt = dfRate[i].df_cnt;
			df_cnts.push(df_cnt);
		}
		
		for(var i = 0; i < dfRate.length; i++){
			var qc_date = dfRate[i].qc_date;
			months.push(qc_date);
		}
		
		
		var data = [];
	
		for (var i = 0; i < df_cnts.length; i++) {
			if (qc_cnts[i] !== 0) {
				data.push(df_cnts[i] / qc_cnts[i] * 100);
			} else {
				data.push(0); // 대비값이 0인 경우를 처리하기 위해 추가
			}
		}
		
	
		
		var canvas1 = document.getElementById('canvas1');
		canvas1.width = 412; // 너비 설정
		canvas1.height = 206; // 높이 설정
		canvas1.style.display = 'block';
		canvas1.style.boxSizing = 'border-box';
		canvas1.style.width = '439.467px';
		canvas1.style.height = '219.733px';
		
		ctx1 = canvas1.getContext('2d');
		
		myChart1 = new Chart(ctx1, {
			type: 'line',
			data: {
				labels: months ,
				datasets: [{
				label: ['불량률'],
				data: data,
				borderWidth: 1
				}]
			}, // data
			options: {
				plugins: {
					tooltip: {
						callbacks: {
							label: function (context) {
								var value = context.dataset.data[context.dataIndex];
								return value.toFixed(2) + '%'; // 소수점 둘째자리까지 표시하고 '%' 기호 추가
							}
						}
					}
				},
				
			    scales: {
					y: {
						beginAtZero: true,
						max: 100
					}
				},
				responsive: false // 차트 크기를 고정, 이거 안하면 차트가 부모요소에 꽉 채워서 나옴
		    }
			
		}); // 불량률 차트
		
		$('#chartData').show();
		$('#mainImg').hide();
		// active 클래스 추가, 제거
		$(this).addClass('active');
		$('li.nav-item.nav-link').not(this).removeClass('active');
		
	}); // production click
	
	
	$('#home').click(function(){
		
		// 차트데이터를 숨김
		$('#chartData').hide();
		$('#mainImg').show();
		// active 클래스 추가, 제거
		$(this).addClass('active');
		$('li.nav-item.nav-link').not(this).removeClass('active');
		
	}); // home click
	
	
	
}); // jQuery

</script>
<style>
.nav-item.nav-link:hover {
	cursor: pointer;
}
</style>

<div>
	<ul class="nav nav-tabs">
		<li id="home" class="nav-item nav-link active">home</li>
		<li id="sales" class="nav-item nav-link">영업</li>
		<li id="materials" class="nav-item nav-link">자재</li>
		<li id="quality" class="nav-item nav-link">품질</li>
		<li id="production" class="nav-item nav-link">생산</li>
	</ul>
</div>




	<div id="chartData" class="container-fluid pt-4 px-4" style="display: none"> <!-- 이 안에 div 다 넣어도 되는듯 -->
	
		<div class="row g-4">
		
		<div class="chartTitle"></div>
			
			<div class="col-sm-12 col-xl-6">
				<div class="bg-light rounded h-100 p-4">
<!-- 					<h6 class="mb-4">제목</h6> -->
					<canvas id="canvas"></canvas>
				</div>
			</div>
			<div class="col-sm-12 col-xl-6">
				<div class="bg-light rounded h-100 p-4">
<!-- 					<h6 class="mb-4">제목</h6> -->
					<canvas id="canvas1"></canvas>
				</div>
			</div>

			
		</div> <!-- row g-4 -->
		
    </div>
<!--     Sales Chart End <br> -->





<!--     Recent Sales Start -->
<!--     <div class="container-fluid pt-4 px-4"> -->
<!--         <div class="bg-light text-center rounded p-4"> -->
<!--             <div class="d-flex align-items-center justify-content-between mb-4"> -->
<!--                 <h6 class="mb-0">Recent Salse</h6> -->
<!--                 <a href="">Show All</a> -->
<!--             </div> -->
<!--             <div class="table-responsive"> -->
<!--                 <table class="table text-start align-middle table-bordered table-hover mb-0"> -->
<!--                     <thead> -->
<!--                         <tr class="text-dark"> -->
<!--                             <th scope="col"><input class="form-check-input" type="checkbox"></th> -->
<!--                             <th scope="col">Date</th> -->
<!--                             <th scope="col">Invoice</th> -->
<!--                             <th scope="col">Customer</th> -->
<!--                             <th scope="col">Amount</th> -->
<!--                             <th scope="col">Status</th> -->
<!--                             <th scope="col">Action</th> -->
<!--                         </tr> -->
<!--                     </thead> -->
<!--                     <tbody> -->
<!--                         <tr> -->
<!--                             <td><input class="form-check-input" type="checkbox"></td> -->
<!--                             <td>01 Jan 2045</td> -->
<!--                             <td>INV-0123</td> -->
<!--                             <td>Jhon Doe</td> -->
<!--                             <td>$123</td> -->
<!--                             <td>Paid</td> -->
<!--                             <td><a class="btn btn-sm btn-primary" href="">Detail</a></td> -->
<!--                         </tr> -->
<!--                         <tr> -->
<!--                             <td><input class="form-check-input" type="checkbox"></td> -->
<!--                             <td>01 Jan 2045</td> -->
<!--                             <td>INV-0123</td> -->
<!--                             <td>Jhon Doe</td> -->
<!--                             <td>$123</td> -->
<!--                             <td>Paid</td> -->
<!--                             <td><a class="btn btn-sm btn-primary" href="">Detail</a></td> -->
<!--                         </tr> -->
<!--                         <tr> -->
<!--                             <td><input class="form-check-input" type="checkbox"></td> -->
<!--                             <td>01 Jan 2045</td> -->
<!--                             <td>INV-0123</td> -->
<!--                             <td>Jhon Doe</td> -->
<!--                             <td>$123</td> -->
<!--                             <td>Paid</td> -->
<!--                             <td><a class="btn btn-sm btn-primary" href="">Detail</a></td> -->
<!--                         </tr> -->
<!--                         <tr> -->
<!--                             <td><input class="form-check-input" type="checkbox"></td> -->
<!--                             <td>01 Jan 2045</td> -->
<!--                             <td>INV-0123</td> -->
<!--                             <td>Jhon Doe</td> -->
<!--                             <td>$123</td> -->
<!--                             <td>Paid</td> -->
<!--                             <td><a class="btn btn-sm btn-primary" href="">Detail</a></td> -->
<!--                         </tr> -->
<!--                         <tr> -->
<!--                             <td><input class="form-check-input" type="checkbox"></td> -->
<!--                             <td>01 Jan 2045</td> -->
<!--                             <td>INV-0123</td> -->
<!--                             <td>Jhon Doe</td> -->
<!--                             <td>$123</td> -->
<!--                             <td>Paid</td> -->
<!--                             <td><a class="btn btn-sm btn-primary" href="">Detail</a></td> -->
<!--                         </tr> -->
<!--                     </tbody> -->
<!--                 </table> -->
<!--             </div> -->
<!--         </div> -->
<!--     </div> -->
<!--     Recent Sales End -->



<!-- 달력 내용 -->


    <div class="container-fluid pt-4 px-4">
        <div class="row g-4">
        
        <!-- 내용 -->
<!--             <div class="col-sm-12 col-md-6 col-xl-4"> -->

<!--             </div> -->
        <!-- 내용 -->




			<!-- 내용2 -->
			<div id="mainImg">
				<img src="/resources/img/main.png" style="width: 99%; display: block; margin: auto;">
			</div>
<!--             <div class="col-sm-12 col-md-6 col-xl-4"> -->
<!--                 <div class="h-100 bg-light rounded p-4"> -->
<!--                     <div class="d-flex align-items-center justify-content-between mb-4"> -->
<!--                         <h6 class="mb-0">Calender</h6> -->
<!--                     </div> -->
<!--                     <div id="calender"><div class="bootstrap-datetimepicker-widget usetwentyfour"><ul class="list-unstyled"><li class="show"><div class="datepicker"><div class="datepicker-days" style=""><table class="table table-sm"><thead><tr><th class="prev" data-action="previous"><span class="fa fa-chevron-left" title="Previous Month"></span></th><th class="picker-switch" data-action="pickerSwitch" colspan="5" title="Select Month">June 2023</th><th class="next" data-action="next"><span class="fa fa-chevron-right" title="Next Month"></span></th></tr><tr><th class="dow">Su</th><th class="dow">Mo</th><th class="dow">Tu</th><th class="dow">We</th><th class="dow">Th</th><th class="dow">Fr</th><th class="dow">Sa</th></tr></thead><tbody><tr><td data-action="selectDay" data-day="05/28/2023" class="day old weekend">28</td><td data-action="selectDay" data-day="05/29/2023" class="day old">29</td><td data-action="selectDay" data-day="05/30/2023" class="day old">30</td><td data-action="selectDay" data-day="05/31/2023" class="day old">31</td><td data-action="selectDay" data-day="06/01/2023" class="day">1</td><td data-action="selectDay" data-day="06/02/2023" class="day">2</td><td data-action="selectDay" data-day="06/03/2023" class="day weekend">3</td></tr><tr><td data-action="selectDay" data-day="06/04/2023" class="day weekend">4</td><td data-action="selectDay" data-day="06/05/2023" class="day">5</td><td data-action="selectDay" data-day="06/06/2023" class="day">6</td><td data-action="selectDay" data-day="06/07/2023" class="day">7</td><td data-action="selectDay" data-day="06/08/2023" class="day">8</td><td data-action="selectDay" data-day="06/09/2023" class="day">9</td><td data-action="selectDay" data-day="06/10/2023" class="day weekend">10</td></tr><tr><td data-action="selectDay" data-day="06/11/2023" class="day weekend">11</td><td data-action="selectDay" data-day="06/12/2023" class="day">12</td><td data-action="selectDay" data-day="06/13/2023" class="day">13</td><td data-action="selectDay" data-day="06/14/2023" class="day">14</td><td data-action="selectDay" data-day="06/15/2023" class="day">15</td><td data-action="selectDay" data-day="06/16/2023" class="day">16</td><td data-action="selectDay" data-day="06/17/2023" class="day weekend">17</td></tr><tr><td data-action="selectDay" data-day="06/18/2023" class="day weekend">18</td><td data-action="selectDay" data-day="06/19/2023" class="day">19</td><td data-action="selectDay" data-day="06/20/2023" class="day">20</td><td data-action="selectDay" data-day="06/21/2023" class="day">21</td><td data-action="selectDay" data-day="06/22/2023" class="day">22</td><td data-action="selectDay" data-day="06/23/2023" class="day">23</td><td data-action="selectDay" data-day="06/24/2023" class="day weekend">24</td></tr><tr><td data-action="selectDay" data-day="06/25/2023" class="day weekend">25</td><td data-action="selectDay" data-day="06/26/2023" class="day">26</td><td data-action="selectDay" data-day="06/27/2023" class="day">27</td><td data-action="selectDay" data-day="06/28/2023" class="day">28</td><td data-action="selectDay" data-day="06/29/2023" class="day active today">29</td><td data-action="selectDay" data-day="06/30/2023" class="day">30</td><td data-action="selectDay" data-day="07/01/2023" class="day new weekend">1</td></tr><tr><td data-action="selectDay" data-day="07/02/2023" class="day new weekend">2</td><td data-action="selectDay" data-day="07/03/2023" class="day new">3</td><td data-action="selectDay" data-day="07/04/2023" class="day new">4</td><td data-action="selectDay" data-day="07/05/2023" class="day new">5</td><td data-action="selectDay" data-day="07/06/2023" class="day new">6</td><td data-action="selectDay" data-day="07/07/2023" class="day new">7</td><td data-action="selectDay" data-day="07/08/2023" class="day new weekend">8</td></tr></tbody></table></div><div class="datepicker-months" style="display: none;"><table class="table-condensed"><thead><tr><th class="prev" data-action="previous"><span class="fa fa-chevron-left" title="Previous Year"></span></th><th class="picker-switch" data-action="pickerSwitch" colspan="5" title="Select Year">2023</th><th class="next" data-action="next"><span class="fa fa-chevron-right" title="Next Year"></span></th></tr></thead><tbody><tr><td colspan="7"><span data-action="selectMonth" class="month">Jan</span><span data-action="selectMonth" class="month">Feb</span><span data-action="selectMonth" class="month">Mar</span><span data-action="selectMonth" class="month">Apr</span><span data-action="selectMonth" class="month">May</span><span data-action="selectMonth" class="month active">Jun</span><span data-action="selectMonth" class="month">Jul</span><span data-action="selectMonth" class="month">Aug</span><span data-action="selectMonth" class="month">Sep</span><span data-action="selectMonth" class="month">Oct</span><span data-action="selectMonth" class="month">Nov</span><span data-action="selectMonth" class="month">Dec</span></td></tr></tbody></table></div><div class="datepicker-years" style="display: none;"><table class="table-condensed"><thead><tr><th class="prev" data-action="previous"><span class="fa fa-chevron-left" title="Previous Decade"></span></th><th class="picker-switch" data-action="pickerSwitch" colspan="5" title="Select Decade">2020-2029</th><th class="next" data-action="next"><span class="fa fa-chevron-right" title="Next Decade"></span></th></tr></thead><tbody><tr><td colspan="7"><span data-action="selectYear" class="year old">2019</span><span data-action="selectYear" class="year">2020</span><span data-action="selectYear" class="year">2021</span><span data-action="selectYear" class="year">2022</span><span data-action="selectYear" class="year active">2023</span><span data-action="selectYear" class="year">2024</span><span data-action="selectYear" class="year">2025</span><span data-action="selectYear" class="year">2026</span><span data-action="selectYear" class="year">2027</span><span data-action="selectYear" class="year">2028</span><span data-action="selectYear" class="year">2029</span><span data-action="selectYear" class="year old">2030</span></td></tr></tbody></table></div><div class="datepicker-decades" style="display: none;"><table class="table-condensed"><thead><tr><th class="prev" data-action="previous"><span class="fa fa-chevron-left" title="Previous Century"></span></th><th class="picker-switch" data-action="pickerSwitch" colspan="5">2000-2090</th><th class="next" data-action="next"><span class="fa fa-chevron-right" title="Next Century"></span></th></tr></thead><tbody><tr><td colspan="7"><span data-action="selectDecade" class="decade old" data-selection="2006">1990</span><span data-action="selectDecade" class="decade" data-selection="2006">2000</span><span data-action="selectDecade" class="decade" data-selection="2016">2010</span><span data-action="selectDecade" class="decade active" data-selection="2026">2020</span><span data-action="selectDecade" class="decade" data-selection="2036">2030</span><span data-action="selectDecade" class="decade" data-selection="2046">2040</span><span data-action="selectDecade" class="decade" data-selection="2056">2050</span><span data-action="selectDecade" class="decade" data-selection="2066">2060</span><span data-action="selectDecade" class="decade" data-selection="2076">2070</span><span data-action="selectDecade" class="decade" data-selection="2086">2080</span><span data-action="selectDecade" class="decade" data-selection="2096">2090</span><span data-action="selectDecade" class="decade old" data-selection="2106">2100</span></td></tr></tbody></table></div></div></li><li class="picker-switch accordion-toggle"></li></ul></div></div> -->
<!--                 </div> -->
<!--             </div> -->
			<!-- 내용2 -->




            <!-- 내용3 -->
<!--             <div class="col-sm-12 col-md-6 col-xl-4"> -->
<!--                 <div class="h-100 bg-light rounded p-4"> -->
<!--                     <div class="d-flex align-items-center justify-content-between mb-4"> -->
<!--                         <h6 class="mb-0">To Do List</h6> -->
<!--                         <a href="">Show All</a> -->
<!--                     </div> -->
<!--                     <div class="d-flex mb-2"> -->
<!--                         <input class="form-control bg-transparent" type="text" placeholder="Enter task"> -->
<!--                         <button type="button" class="btn btn-primary ms-2">Add</button> -->
<!--                     </div> -->
<!--                     <div class="d-flex align-items-center border-bottom py-2"> -->
<!--                         <input class="form-check-input m-0" type="checkbox"> -->
<!--                         <div class="w-100 ms-3"> -->
<!--                             <div class="d-flex w-100 align-items-center justify-content-between"> -->
<!--                                 <span>Short task goes here...</span> -->
<!--                                 <button class="btn btn-sm"><i class="fa fa-times"></i></button> -->
<!--                             </div> -->
<!--                         </div> -->
<!--                     </div> -->
<!--                     <div class="d-flex align-items-center border-bottom py-2"> -->
<!--                         <input class="form-check-input m-0" type="checkbox"> -->
<!--                         <div class="w-100 ms-3"> -->
<!--                             <div class="d-flex w-100 align-items-center justify-content-between"> -->
<!--                                 <span>Short task goes here...</span> -->
<!--                                 <button class="btn btn-sm"><i class="fa fa-times"></i></button> -->
<!--                             </div> -->
<!--                         </div> -->
<!--                     </div> -->
<!--                     <div class="d-flex align-items-center border-bottom py-2"> -->
<!--                         <input class="form-check-input m-0" type="checkbox" checked=""> -->
<!--                         <div class="w-100 ms-3"> -->
<!--                             <div class="d-flex w-100 align-items-center justify-content-between"> -->
<!--                                 <span><del>Short task goes here...</del></span> -->
<!--                                 <button class="btn btn-sm text-primary"><i class="fa fa-times"></i></button> -->
<!--                             </div> -->
<!--                         </div> -->
<!--                     </div> -->
<!--                     <div class="d-flex align-items-center border-bottom py-2"> -->
<!--                         <input class="form-check-input m-0" type="checkbox"> -->
<!--                         <div class="w-100 ms-3"> -->
<!--                             <div class="d-flex w-100 align-items-center justify-content-between"> -->
<!--                                 <span>Short task goes here...</span> -->
<!--                                 <button class="btn btn-sm"><i class="fa fa-times"></i></button> -->
<!--                             </div> -->
<!--                         </div> -->
<!--                     </div> -->
<!--                     <div class="d-flex align-items-center pt-2"> -->
<!--                         <input class="form-check-input m-0" type="checkbox"> -->
<!--                         <div class="w-100 ms-3"> -->
<!--                             <div class="d-flex w-100 align-items-center justify-content-between"> -->
<!--                                 <span>Short task goes here...</span> -->
<!--                                 <button class="btn btn-sm"><i class="fa fa-times"></i></button> -->
<!--                             </div> -->
<!--                         </div> -->
<!--                     </div> -->
<!--                 </div> -->
<!--             </div> -->
            <!-- 내용3 -->
            
            
            
        </div>
    </div>


<%@ include file="inc/footer.jsp"%>