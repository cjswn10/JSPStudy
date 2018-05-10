<%@page import="com.dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>비밀번호 확인</title>
</head>
<!-- 암호를 입력 받은 후 일치하면 회원 삭제 -->
<body>
<%
		String id = request.getParameter("id");
%>
	<h2>회원삭제</h2>
	<hr>
	<form action="deleteMemberOk.jsp" method = "post">
		<input type="hidden" name="id" value="<%=id%>">
		암호: <input type="password" name="pwd"><br>
		<input type="submit" value="삭제">
	</form>

</body>
</html>