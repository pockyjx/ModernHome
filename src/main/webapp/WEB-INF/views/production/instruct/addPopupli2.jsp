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
	
	<h1>addPopupli</h1>
	
<%-- 	${liList} <hr> --%>
	
	<form id="fr" action="/production/instruct/add?oo_num=${param.oo_num}&line_num=${liList[0].line_num}" 
			method="get" target="add">
		<table border="1">
			<tr>
				<th>라인번호</th>
				<td>
					<input type="hidden" name="oo_num" value="${param.oo_num}">
					<c:forEach var="lnum" items="${liList}">
						<select id="selectLnum" name="line_num">
							<option value="">라인을 선택하세요.</option>
								<c:if test="${lnum.use_yn == 'Y'}">
									<option value="${lnum.line_num}">${lnum.line_num}</option>
								</c:if>
						</select>
						<input type="hidden" name="line_id" value="${lnum.line_id}">
					</c:forEach>
				</td>
			</tr>
		</table>
		<button class="fr-submit" onclick="window.close();">확인</button>
		<button onclick="window.close();">닫기</button>
	</form>
	
</body>
</html>