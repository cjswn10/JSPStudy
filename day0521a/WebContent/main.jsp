<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<%
		if(session.getAttribute("id") == null)
			response.sendRedirect("login.jsp");
	%>
	
	<h2>��Ʈ ����ī</h2>
	<hr>

	<a href="service01.jsp">����1</a><br>
	<a href="service02.jsp">����2</a><br>
	<a href="service03.jsp">����3</a><br>
	
</body>
</html>