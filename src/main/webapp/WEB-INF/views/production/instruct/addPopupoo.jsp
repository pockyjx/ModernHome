<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<script type="text/javascript">
	function popSub(form) {
		form.taget = opener.name;
		form.submit();
		self.close();
	}
</script>

<body>
	
	<h1>addPopupoo</h1>
	
<%-- 	${onumList} <hr> --%>
	
	<form id="fr" action="/production/instruct/add?oo_num=${onum.oo_num}" method="get" target="add">
		<table border="1">
			<tr>
				<th>수주번호</th>
				<td>
					<select id="selectOnum" name="oo_num">
						<option value="">수주번호를 선택하세요.</option>
						<c:forEach var="onum" items="${onumList}">
							<option value="${onum.oo_num}">${onum.oo_num}</option>
						</c:forEach>
					</select>
				</td>
			</tr>
		</table>
		<button class="fr-submit" onclick="window.close();">확인</button>
	</form>
	
</body>
</html>