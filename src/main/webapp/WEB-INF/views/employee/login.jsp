<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
		<h2> http://localhost:8088/employee/login </h2>
		
		<h1>login.jsp</h1>
		
		<fieldset>
		  <form action="" method="post">
		    아이디 : <input type="text" name="emp_id"> <br>
		    비밀번호 : <input type="password" name="emp_pw"><br>
		    
		    <input type="button" value="회원가입" 
		            onclick=" location.href='/employee/join'; ">
		    <input type="submit" value="로그인">
		  </form>		
		</fieldset>
		
		
		
</body>
</html>