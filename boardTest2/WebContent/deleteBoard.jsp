<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>�Խù� ����</title>
</head>
<body>
<h2>�Խù� ����</h2>
<%
	int no = Integer.parseInt(request.getParameter("no"));
%>
<form action="deleteBoardOk.jsp" method="POST">
	<input type="hidden" name="no" value="<%=no%>">
	��й�ȣ<input type="password" name="pwd">
	<input type="submit" value="����">
</form>
</body>
</html>