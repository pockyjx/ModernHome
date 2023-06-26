<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/header.jsp"%>
<%@ include file="../inc/sidebar.jsp"%>
<%@ include file="../inc/nav.jsp"%>

<h1>materialRelease</h1>


<h4>제품출고관리</h4>
<form role="form" method="post">
	출고코드 : <input type="text" class="form-control"><br>
	품목명 : <input type="text"> <br>
	출고일자 : <input type="datetime"> <input type="datetime"><br>
	<input type="submit" value="조회">
</form>
<br>

<%-- ${mtReleaseList} --%>
<h6 class="mb-0">제품출고</h6>
<button class="btn btn-primary m-2"><i class="fa fa-plus"></i> 추가</button>
<button class="btn btn-primary m-2"><i class="fa fa-edit"></i> 수정</button>
<button class="btn btn-primary m-2"><i class="fa fa-trash"></i> 삭제</button>
<button class="btn btn-primary m-2"> X 취소</button>
<button class="btn btn-primary m-2"><i class="fa fa-download"></i> 저장</button>
<div class="bg-light text-center rounded p-4">
	<div class="d-flex align-items-center justify-content-between mb-4">

	</div>
	<div class="table-responsive">
		<table class="table text-start align-middle table-bordered table-hover mb-0">
			<thead>
				<tr class="text-dark">
					<th scope="col"><input class="form-check-input"
						type="checkbox"></th>
			    	<th scope="col">수주코드</th>
			    	<th scope="col">출고코드</th>
			    	<th scope="col">납품처명</th>
			    	<th scope="col">완제품명</th>
			    	<th scope="col">주문수량</th>
			    	<th scope="col">현 재고</th>
			    	<th scope="col">창고명</th>
			    	<th scope="col">납기일자</th>
			    	<th scope="col">진행현황</th>
			    	<th scope="col">담당자</th>
			    	<th scope="col">출고일자</th>
			    	<th scope="col">출고처리</th>
				</tr>
			</thead>
			<tbody>
			  	<c:forEach var="vo" items="${prReleaseList}">
				<tr>
					<td><input class="form-check-input" type="checkbox"></td>
					<td>${vo.outOrderVO.oo_num }</td>
					<td>${vo.pr_num }</td>
					<td>${vo.clientVO.clt_name }</td>
					<td>${vo.productVO.pro_name }</td>
					<td>${vo.pr_cnt }</td>
					<td>${vo.productStockVO.ps_cnt }</td>
					<td>${vo.warehouseVO.wh_name }</td>
					<td>${vo.outOrderVO.oo_end_date }</td>
					<td>${vo.pr_state }</td>
					<td>${vo.emp_id }</td>
					<td>${vo.pr_date }</td>
					<td><a class="btn btn-sm btn-primary" href="">Detail</a></td>
			    </tr>
		   		</c:forEach>
			</tbody>
		</table>
	</div>
</div>

<%@ include file="../inc/footer.jsp"%>