<%@page import="com.dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>��й�ȣ Ȯ��</title>
</head>
<!-- ��ȣ�� �Է� ���� �� ��ġ�ϸ� ȸ�� ���� -->
<body>
<%
		String id = request.getParameter("id");
%>
	<h2>ȸ������</h2>
	<hr>
	<form action="deleteMemberOk.jsp" method = "post">
		<input type="hidden" name="id" value="<%=id%>">
		��ȣ: <input type="password" name="pwd"><br>
		<input type="submit" value="����">
	</form>

</body>
</html>