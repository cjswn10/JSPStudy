<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body bgcolor='yellow'>
<%
	String msg = request.getParameter("msg");
	int age = Integer.parseInt(request.getParameter("age"));
%>
yellow�Դϴ�.<hr>
���޵� msg : <%=msg %><br>
���޵� age : <%=age %>
<hr>
</body>
</html>