<%@page import="home.CustVo"%>
<%@page import="home.CustDao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>�� ���</title>
</head>
<body>
<br><h1 align="center">��� �� ���</h1>
<table border=1 align="center">
<tr>
<th>�����̵�</th>
<th>����</th>
<th>���ּ�</th>
<th>������ó</th>
</tr>

<%
	ArrayList<CustVo> list = (new CustDao()).selectAll();

	for(CustVo c : list){
		System.out.println(c.getCustid());
	%><tr>
		<td><%=c.getCustid() %></td>
		<td><%=c.getName() %></td>
		<td><%=c.getAddress() %></td>
		<td><%=c.getPhone() %></td>
	</tr><%
	}
%>

</table>
</body>
</html>