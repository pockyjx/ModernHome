<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/header.jsp"%>
<%@ include file="../inc/sidebar.jsp"%>
<%@ include file="../inc/nav.jsp"%>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" />
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="//code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>


<script>
	$(document).ready(function() {
		var isEmpty = function(value){
			  if( value == "" || value == null || value == undefined || ( value != null && typeof value == "object" && !Object.keys(value).length ) ){
			    return true
			  }else{
			    return false
			  }
			};
		var vo = "<c:out value='${vo}'/>";
		if(!isEmpty(vo)) {
			var mr = "<c:out value='${vo.materialReleaseVO}'/>"
			var wi = "<c:out value='${vo.workInstrVO}'/>"
			var pr = "<c:out value='${vo.productReleaseVO}'/>"
			var shp = "<c:out value='${vo.shipmentVO}'/>"
			var line_defect = "<c:out value='${vo.line_qc_defect}'/>"
			var pr_defect = "<c:out value='${vo.pr_qc_defect}'/>"
			var shp_state = "<c:out value='${vo.shipmentVO.shp_state}'/>"
			if(isEmpty(mr)) {
				$('#rec_btn').addClass('blink');
			}else if(!isEmpty(mr)) {
				$('#rec_btn').removeClass('btn-primary');
				$('#rec_btn').addClass('btn-success');
				if(isEmpty(wi)) {
					$('#mr_btn').addClass('blink');
				}else if(!isEmpty(wi)) {
					$('#mr_btn').removeClass('btn-primary');
					$('#mr_btn').addClass('btn-success');
					if(isEmpty(pr)) {
						if(line_defect == 1) {
							$('#wi_btn').removeClass('btn-primary');
							$('#wi_btn').addClass('btn-danger');
						}else {
							$('#wi_btn').addClass('blink');
						}
					}else if(!isEmpty(pr)) {
						$('#wi_btn').removeClass('btn-primary');
						$('#wi_btn').addClass('btn-success');
						if(isEmpty(shp)) {
							if(pr_defect == 1) {
								$('#pr_btn').removeClass('btn-primary');
								$('#pr_btn').addClass('btn-danger');
							}else {
								$('#pr_btn').addClass('blink');
							}
						}else if(!isEmpty(shp)) {
							$('#pr_btn').removeClass('btn-primary');
							$('#pr_btn').addClass('btn-success');
							if(shp_state == '출하대기') {
								$('#shp_btn').addClass('blink');
							}else if(shp_state == '출하완료') {
								$('#shp_btn').removeClass('btn-primary');
								$('#shp_btn').addClass('btn-success');
							}
						}else {
						}
					}
				}
			}
		}

	});
</script>

<style>
    .selected {
        background-color: #b3ccff;
    }
	@keyframes blink-effect {
		50% {
			opacity: 0;
		}
	}
	.blink {
	  animation: blink-effect 1s step-end infinite;
	}
</style>

<form name="search" action="" method="get" class="bg-light rounded p-3 m-3">

	<div class="row mb-3">
		<label for="ele_numSearch" class="col-sm-2 col-form-label"><b>자재코드</b></label>
		<div class="col-sm-4">
			<input type="text" name="ele_numSearch" class="form-control" placeholder="자재코드를 입력하세요" value="${ele_num }">
		</div>
		<div class="col-auto">
			<button class="btn btn-primary m-3" type="submit" style="width:70px;">조회</button>
		</div>	
	</div>
	
</form>

<hr>


<div class="d-flex align-items-center justify-content-between mb-2">

	<h3 class="m-4">자재 정보</h3>
</div>

<div class="bg-light text-center rounded p-4 m-3">

	<div class="table-responsive">
		<table id="releaseList" class="table align-middle table-bordered table-hover mb-0">
				<tr class="text-dark">
<!-- 					<th scope="col" style="background-color: rgba(0,0,0,0.075);"><input class="form-check-input" type="checkbox" id="cbx_chkAll"></th> -->
<!-- 			    	<th scope="col" style="background-color: rgba(0,0,0,0.075);">출고코드</th> -->
<!-- 			    	<th scope="col" style="background-color: rgba(0,0,0,0.075);">작업지시<br>코드</th> -->
<!-- 			    	<th scope="col" style="background-color: rgba(0,0,0,0.075);">자재명</th> -->
<!-- 			    	<th scope="col" style="background-color: rgba(0,0,0,0.075);">주문수량</th> -->
<!-- 			    	<th scope="col" style="background-color: rgba(0,0,0,0.075);">현<br>재고</th> -->
<!-- 			    	<th scope="col" style="background-color: rgba(0,0,0,0.075);">창고명</th> -->
<!-- 			    	<th scope="col" style="background-color: rgba(0,0,0,0.075);">작업지시일자</th> -->
<!-- 			    	<th scope="col" style="background-color: rgba(0,0,0,0.075);">진행현황</th> -->
<!-- 			    	<th scope="col" style="background-color: rgba(0,0,0,0.075);">담당자</th> -->
<!-- 			    	<th scope="col" style="background-color: rgba(0,0,0,0.075);">출고일자</th> -->
<!-- 			    	<th scope="col" style="background-color: rgba(0,0,0,0.075);">출고처리</th> -->
<!-- 					<td style="display: none">작업지시 id</td> -->
				<tr>
				<th>입고정보</th>		<td>입고코드</td>		<td>${vo.receiveVO.rec_num }</td>	
				<th>공정검사정보</th>	<td>검사코드</td>	<td><c:if test="${!empty vo.liQualityCheckingVO }">${vo.liQualityCheckingVO.qc_num }</c:if></td> 
				<td rowspan="14">
<%-- 				<c:if test="${empty vo.materialReleaseVO }"> --%>
<!-- 					<button type="button" class="btn btn-danger rounded-pill m-2 blink">입고</button><br> -->
<%-- 				</c:if> --%>
<%-- 				<c:if test="${!empty vo.materialReleaseVO }"> --%>
<!-- 					<button type="button" class="btn btn-success rounded-pill m-2">입고</button><br>		 -->
<%-- 				</c:if> --%>
<!-- 				↓<br> -->
				<button type="button" id="rec_btn" class="btn btn-primary rounded-pill m-2">입고</button><br>
				↓<br>
				<button type="button" id="mr_btn" class="btn btn-primary rounded-pill m-2">자재출고</button><br>
				↓<br>
				<button type="button" id="wi_btn" class="btn btn-primary rounded-pill m-2">생산</button><br>
				↓<br>
				<button type="button" id="pr_btn" class="btn btn-primary rounded-pill m-2">제품출고</button><br>
				↓<br>
				<button type="button" id="shp_btn" class="btn btn-primary rounded-pill m-2">출하</button><br>
				
				</td>				
				</tr>
				<tr>
				<td></td>				<td>입고일자</td>		<td>${vo.receiveVO.rec_date }</td>	
				<td></td>				<td>검사일자</td>	<td><c:if test="${!empty vo.liQualityCheckingVO }">${vo.liQualityCheckingVO.qc_date }</c:if></td>
				</tr>
				<tr>
				<th>자재정보</th>		<td>자재코드</td>		<td>${vo.materialVO.ma_num }</td>	
				<td></td>				<td>불량여부</td>	<td><c:if test="${vo.line_qc_defect == 1 }">불량</c:if></td>
				</tr>
				<tr>
				<td></td>				<td>자재명</td>			<td>${vo.materialVO.ma_name }</td>	
				<td></td>				<td>수리여부</td>	<td><c:if test="${!empty vo.liDefectiveVO && vo.line_qc_defect == 1}">${vo.liDefectiveVO.repair_yn }</c:if></td>
				</tr>
				<tr>
				<th>자재출고정보</th>	<td>출고코드</td>		<td><c:if test="${!empty vo.materialReleaseVO }">${vo.materialReleaseVO.mr_num }</c:if></td>	
				<th>로트정보</th>		<td>로트번호</td>	<td>${vo.lot_num }</td>
				</tr>
				<tr>
				<td></td>				<td>출고일자</td>		<td><c:if test="${!empty vo.materialReleaseVO }">${vo.materialReleaseVO.mr_date }</c:if></td>	
				<th>제품출고정보</th>	<td>제품출고코드</td>	<td><c:if test="${!empty vo.productReleaseVO }">${vo.productReleaseVO.pr_num }</c:if></td>
				</tr>
				<tr>
				<td></td>				<td>출고상태</td>			<td><c:if test="${!empty vo.materialReleaseVO }">${vo.materialReleaseVO.mr_state }</c:if></td>	
				<td></td>			<td>출고일자</td>	<td><c:if test="${!empty vo.productReleaseVO }">${vo.productReleaseVO.pr_date }</c:if></td>
				</tr>
				<tr>
				<th>작업지시정보</th>	<td>수주코드</td>		<td><c:if test="${!empty vo.outOrderVO }">${vo.outOrderVO.oo_num }</c:if></td>	
				<th>출고검사정보</th>	<td>검사코드</td>	<td><c:if test="${!empty vo.prQualityCheckingVO }">${vo.prQualityCheckingVO.qc_num }</c:if></td>
				</tr>
				<tr>
				<td></td>				<td>작업지시코드</td>	<td><c:if test="${!empty vo.workInstrVO }">${vo.workInstrVO.work_num }</c:if></td>	
				<td></td>				<td>검사일자</td>	<td><c:if test="${!empty vo.prQualityCheckingVO }">${vo.prQualityCheckingVO.qc_date }</c:if></td>
				</tr>
				<tr>
				<td></td>				<td>작업지시일자</td>	<td><c:if test="${!empty vo.workInstrVO }">${vo.workInstrVO.reg_date }</c:if></td>	
				<td></td>				<td>불량여부</td>	<td><c:if test="${vo.pr_qc_defect == 1 }">불량</c:if></td>
				</tr>
				<tr>
				<td></td>				<td>라인</td>			<td><c:if test="${!empty vo.lineVO }">${vo.lineVO.line_name }</c:if></td>	
				<td></td>				<td>수리여부</td>	<td><c:if test="${!empty vo.prDefectiveVO && vo.pr_qc_defect == 1}">${vo.prDefectiveVO.repair_yn }</c:if></td>
				</tr>
				<tr>
				<td></td>				<td>제품코드</td>		<td><c:if test="${!empty vo.productVO }">${vo.productVO.pro_num }</c:if></td>	
				<th>출하정보</th>		<td>출하코드</td>	<td><c:if test="${!empty vo.shipmentVO }">${vo.shipmentVO.shp_num }</c:if></td>
				</tr>
				<tr>
				<td></td>				<td>제품명</td>			<td><c:if test="${!empty vo.productVO }">${vo.productVO.pro_name }</c:if></td>	
				<td></td>				<td>출하일자</td>	<td><c:if test="${!empty vo.shipmentVO }">${vo.shipmentVO.shp_date }</c:if></td>
				</tr>
				<tr>
				<td></td>				<td></td>				<td></td>	
				<td></td>				<td>출하상태</td>	<td><c:if test="${!empty vo.shipmentVO }">${vo.shipmentVO.shp_state }</c:if></td>
				</tr>
<%-- 			  	<c:forEach var="vo" items="${mtReleaseList}"> --%>
<!-- 				<tr> -->
<%-- 					<td><input class="form-check-input" type="checkbox" name="selectedId" value="${vo.mr_id}"></td> --%>
<%-- 					<td>${vo.mr_num }</td> --%>
<%-- 					<td>${vo.workInstrVO.work_num }</td> --%>
<%-- 					<td>${vo.materialVO.ma_name }</td> --%>
<%-- 					<td>${vo.mr_cnt }</td> --%>
<%-- 					<td>${vo.materialStockVO.ms_cnt }</td> --%>
<%-- 					<td>${vo.warehouseVO.wh_name }</td> --%>
<%-- 					<td>${vo.workInstrVO.reg_date }</td> --%>
<%-- 					<td>${vo.mr_state }</td> --%>
<%-- 					<td>${vo.employeeVO.emp_name }</td> --%>
<%-- 					<td>${vo.mr_date }</td> --%>
<%-- 					<td style="display: none">${vo.materialVO.ma_id }</td> --%>
<!-- 					<td> -->
<%-- 					<c:if test="${(sessionScope.emp_dept eq '자재' && sessionScope.emp_auth >= '1') || sessionScope.emp_auth == '3'}"> --%>
<%-- 						<c:choose> --%>
<%-- 						<c:when test="${vo.mr_state eq '검사완료' && vo.materialStockVO.ms_cnt ge vo.mr_cnt}"> --%>
<!-- 						<button type="button" class="btn btn-sm btn-success release">출고<br>처리</button> -->
<%-- 						</c:when> --%>
<%-- 						<c:when test="${vo.mr_state eq '출고준비' && vo.materialStockVO.ms_cnt ge vo.mr_cnt}"> --%>
<!-- 						<button type="button" class="btn btn-sm btn-warning waiting">출고<br>대기</button> -->
<%-- 						</c:when> --%>
<%-- 						<c:when test="${vo.mr_state eq '출고준비' && vo.materialStockVO.ms_cnt lt vo.mr_cnt}"> --%>
<!-- 						<button type="button" class="btn btn-sm btn-danger">출고<br>불가</button> -->
<%-- 						</c:when> --%>
<%-- 						<c:when test="${vo.mr_state eq '출고완료'}"> --%>
<!-- 						<button type="button" class="btn btn-sm btn-primary">출고<br>완료</button>  -->
<%-- 						</c:when> --%>
<%-- 						</c:choose> --%>
<%-- 					</c:if> --%>
<!-- 					</td> -->
<%-- 					<td style="display: none">${vo.work_id }</td> --%>
<!-- 			    </tr> -->
<%-- 			    </c:forEach> --%>
		</table>
	</div>
</div>

<%@ include file="../inc/footer.jsp"%>