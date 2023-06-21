<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수주 관리</title>
</head>

<!-- http://localhost:8088/client/outOrderList -->
<body>
		<h2>수주 관리</h2>
			<fieldset>
               	<form name="search" method="get" action="">
                   	<div>
                   		<label>수주일자</label>
                   		<div>
		                   	<input type="date" name="startDate">
                   			~
		                   	<input type="date" name="endDate">
                   		</div>
                   	</div>
		       		<br>
		       		<div>
                   		<label>출하일자</label>
                   		<div>
		                   	<input type="date" name="startDate">
                   			~
		                   	<input type="date" name="endDate">
                   		</div>
                   	</div>
		       		<span>상호명 :
		       			<input type="text" name="clt_id" placeholder="상호명을 입력하세요">
		       		</span>
		       		<span>담당자 :
		       			<input type="text" name="emp_id" placeholder="담당자를 입력하세요">
		       		</span>
		       		
		      		<input type="submit" value="조회">
             	</form>
             </fieldset>  
             
		<h2>수주</h2>
			<table border="1">
				<tr>
			    	<td>수주코드</td>
			    	<td>담당자</td>
			    	<td>거래처</td>
			    	<td>품목명</td>
			    	<td>품목코드</td>
			    	<td>주문량</td>
			    	<td>수주일자</td>
			    	<td>출하일자</td>
			    	<td>진행상황</td>
				</tr>
			  	<c:forEach var="outOrderList" items="${outOrderList }">
					<tr>
				    	<td>${outOrderList.oo_num}</td>
				    	<td>${outOrderList.emp_id}</td>
				    	<td>${outOrderList.clt_id}</td>
				    	<td>${outOrderList.pro_id}</td>
				    	<td>${outOrderList.pro_id}</td>
				    	<td>${outOrderList.oo_cnt}</td>
				    	<td>${fn:substring(outOrderList.oo_start_date, 0, 10)}</td>
				   		<td>${fn:substring(outOrderList.oo_end_date, 0, 10)}</td>
				   		<td>${outOrderList.oo_state}</td>
				    </tr>
			    </c:forEach>
			</table>
	
</body>
</html>