<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../../inc/header.jsp"%>
<%@ include file="../../inc/sidebar.jsp"%>
<%@ include file="../../inc/nav.jsp"%>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" />
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="//code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<script>
	// 클릭 시 팝업창 열기
	$(document).on("click", "td[id='oo_num']", function() {
		window.name = "add";
		window.open('/production/instruct/addPopup?txt=oo', 'popup', 'width=400, height=300, top=300, left=650, location=no, status=no');
	});
	
	$(document).on("click", "td[id='line_num']", function() {
		window.name = "add";
		var url = window.location.href;
		var onumVal = new URLSearchParams(new URL(url).search).get('oo_num');
		
		if(onumVal == null) {
			alert("수주번호 먼저 선택해주세요.");
			return false;
		} else {
			window.open('/production/instruct/addPopup?txt=li', 'popup', 'width=400, height=300, top=300, left=650, location=no, status=no');
		}
	});
	
	$(document).on("click", "input[type='submit']", function() {
		var url = window.location.href;
		var onumVal = new URLSearchParams(new URL(url).search).get('oo_num');
		var lnumVal = new URLSearchParams(new URL(url).search).get('line_num');
		console.log(onumVal);
		console.log(lnumVal);
		
		if(onumVal == null) {
			alert("수주번호를 선택해주세요.");
			return false;
		} else if(lnumVal == null) {
			alert("라인번호를 선택해주세요.");
			return false;
		}
	});
	
	$(document).ready(function() {
		var cntVal = 1;
		var reqValArr = [];
		
		$("#wcntInput").on('input', function() {
			cntVal = parseInt($(this).val());
		});
		
		$(".cl_req_cnt").each(function(idx) {
			reqValArr[idx] = parseInt($(this).text());
		});
		
		$("#wcntInput").on('change', function() {
			$(".cl_req_cnt").each(function(idx) {
				if(cntVal) {
					if(reqValArr[idx]) {
						var reqVal = reqValArr[idx];
						var mulResult = reqVal * cntVal;
						$(this).text(mulResult);
					}
				}
			});
		});
	});
</script>
	
	<c:set var="now" value="<%=new java.util.Date()%>"/>
	<c:set var="today"><fmt:formatDate value="${now}" pattern="yyyy-MM-dd"/></c:set>
	
	<h2>작업지시서 작성</h2>
<%-- ${idnum} --%>
<%-- ${reqList} --%>
	<form method="post">
		<table border="1">
			<tr>
				<th>지시번호</th>
				<td><input type="text" name="work_num" value="${idnum[0].work_num}" readonly></td>
					
				<th>수주번호</th>
				<td id="oo_num">
					<input type="text" name="oo_num" <c:if test='${!empty param.oo_num}'>value="${param.oo_num}"</c:if> readonly>
				</td>
			</tr>
			<tr>
				<th>품번</th>
				<td><input type="text" name="pro_num" <c:if test='${!empty param.oo_num}'>value="${reqList[0].pro_num}"</c:if> readonly></td>
				<th>수량</th>
				<td><input type="text" name="work_cnt" id="wcntInput" <c:if test='${!empty param.oo_num}'>value="${reqList[0].oo_cnt}"</c:if>></td>
			</tr>
			<tr>
				<th>품명</th>
				<td><input type="text" name="pro_name" <c:if test='${!empty param.oo_num}'>value="${reqList[0].pro_name}"</c:if> readonly></td>
				<th>단위</th>
				<td><input type="text" name="pro_unit" <c:if test='${!empty param.oo_num}'>value="${reqList[0].pro_unit}"</c:if> readonly></td>
			</tr>
			<tr>
				<th>납기일</th>
				<td><input type="text" name="oo_end_date" <c:if test='${!empty param.oo_num}'>value="${reqList[0].oo_end_date}"</c:if> readonly></td>
				<th>생산라인</th>
				<td id="line_num">
					<input type="text" name="line_num" <c:if test='${!empty param.line_num}'>value="${param.line_num}"</c:if> readonly>
				</td>
			</tr>
			<tr>
				<th>납품지점</th>
				<td><input type="text" name="clt_name" <c:if test='${!empty param.oo_num}'>value="${reqList[0].clt_name}"</c:if> readonly></td>
				<th>작성일</th>
				<td><input type="text" name="reg_date" value="<c:out value='${today}'/>"></td>
			</tr>
			<tr>
				<th rowspan="10">원재료</th>
				<th>품목코드</th>
				<th>품목명</th>
				<th>수량</th>
			</tr>
			<c:forEach var="req" items="${reqList}">
				<tr>
					<td>${req.ma_num}</td>
					<td>${req.ma_name}</td>
					<td class="cl_req_cnt">${req.req_cnt}</td>
				</tr>
			</c:forEach>
		</table>
		<input type="hidden" name="work_id" value="${idnum[0].work_id}">
		<input type="hidden" name="pro_id" value="${reqList[0].pro_id}">
		<input type="hidden" name="req_id" value="${reqList[0].req_id}">
		<input type="hidden" name="clt_id" value="${reqList[0].clt_id}">
		<input type="hidden" name="emp_id" value="${sessionScope.emp_id}">
		<input type="hidden" name="oo_id" id="oo_id" <c:if test='${!empty param.oo_id}'>value="${param.oo_id}"</c:if> readonly>
		<input type="hidden" name="line_id" id="line_id" <c:if test='${!empty param.line_id}'>value="${param.line_id}"</c:if> readonly>
		<div>
			<input type="button" value="취소" onclick="location.href='/production/instruct/list'">
			<input type="submit" value="저장">
		</div>
	</form>
	
<%@ include file="../../inc/footer.jsp"%>