<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>출하 관리</title>
</head>

<!-- http://localhost:8088/client/shipmentList -->
<body>
		<h2>출하 관리</h2>
			<fieldset>
               	<form name="search" method="get" action="">
		       		<br>
		       		<div>
                   		<label>출하일자</label>
                   		<div>
		                   	<input type="date" name="startDate">
                   			~
		                   	<input type="date" name="endDate">
                   		</div>
                   	</div>
		       		<span>거래처명 :
		       			<input type="text" name="clt_id" placeholder="거래처명을 입력하세요">
		       		</span>
		       		<span>담당자 :
		       			<input type="text" name="emp_id" placeholder="담당자를 입력하세요">
		       		</span>
		       		
		      		<input type="submit" value="조회">
             	</form>
             </fieldset>  
             
		<h2>출하</h2>
			<table border="1">
				<tr>
			    	<td>출하코드</td>
			    	<td>담당자</td>
			    	<td>거래처</td>
			    	<td>품목명</td>
			    	<td>품목코드</td>
			    	<td>출하량</td>
			    	<td>출하일자</td>
				</tr>
			  	<c:forEach var="shipmentList" items="${shipmentList }">
					<tr>
				    	<td>${shipmentList.shp_num}</td>
				    	<td>${shipmentList.emp_id}</td>
				    	<td>${shipmentList.clt_id}</td>
				    	<td>${shipmentList.pro_id}</td>
				    	<td>${shipmentList.pro_id}</td>
				    	<td>${shipmentList.shp_cnt}</td>
				    	<td>${fn:substring(shipmentList.shp_date, 0, 10)}</td>
				    </tr>
			    </c:forEach>
			</table>
	
</body>
</html>