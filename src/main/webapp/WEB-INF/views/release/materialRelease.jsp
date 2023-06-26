<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/header.jsp"%>
<%@ include file="../inc/sidebar.jsp"%>
<%@ include file="../inc/nav.jsp"%>

<h1>materialRelease</h1>


<h4>자재출고관리</h4>
<form role="form" method="post">
	출고코드 : <input type="text"><br>
	품목명 : <input type="text"> <br>
	출고일자 : <input type="datetime"> <input type="datetime"><br>
	<input type="submit" value="조회">
</form>
<br>
<h4>자재출고</h4><br>
<button class="btn btn-primary m-2"><i class="fa fa-plus"></i> 추가</button>
<button class="btn btn-primary m-2"><i class="fa fa-edit"></i> 수정</button>
<button class="btn btn-primary m-2"><i class="fa fa-trash"></i> 삭제</button>
<button class="btn btn-primary m-2"> X 취소</button>
<button class="btn btn-primary m-2"><i class="fa fa-download"></i> 저장</button>
<%-- ${mtReleaseList} --%>

<div class="bg-light text-center rounded p-4">
	<div class="d-flex align-items-center justify-content-between mb-4">

	</div>
	<div class="table-responsive">
		<table class="table text-start align-middle table-bordered table-hover mb-0">
			<thead>
				<tr class="text-dark">
					<th scope="col"><input class="form-check-input" type="checkbox"></th>
			    	<th scope="col">출고코드</th>
			    	<th scope="col">작업지시코드</th>
			    	<th scope="col">자재명</th>
			    	<th scope="col">주문수량</th>
			    	<th scope="col">현 재고</th>
			    	<th scope="col">창고명</th>
			    	<th scope="col">작업지시일자</th>
			    	<th scope="col">진행현황</th>
			    	<th scope="col">담당자</th>
			    	<th scope="col">출고일자</th>
			    	<th scope="col">출고처리</th>
				</tr>
			</thead>
			<tbody>
			  	<c:forEach var="vo" items="${mtReleaseList}">
					<tr>
						<td><input class="form-check-input" type="checkbox"></td>
						<td>${vo.mr_num }</td>
						<td>${vo.workInstrVO.work_num }</td>
						<td>${vo.materialVO.ma_name }</td>
						<td>${vo.mr_cnt }</td>
						<td>${vo.materialStockVO.ms_cnt }</td>
						<td>${vo.warehouseVO.wh_name }</td>
						<td>${vo.workInstrVO.reg_date }</td>
						<td>${vo.mr_state }</td>
						<td>${vo.emp_id }</td>
						<td>${vo.mr_date }</td>
						<td><a class="btn btn-sm btn-primary" href="">${vo.mr_state }</a></td>
				    </tr>
			    </c:forEach>
			</tbody>
		</table>
	</div>
</div>

<%@ include file="../inc/footer.jsp"%>