<%@page import="com.vo.MemberVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>ȸ�����</title>
</head>
<body>
	<h2>��ǰ���</h2>
	<hr>
	<%
		MemberDAO dao = new MemberDAO();
		ArrayList<MemberVO> list = dao.listMember();
	%>
	<table border="1" width="80%">
		<tr>
			<td bgcolor="pink">���̵�</td>
			<td bgcolor="pink">�̸�</td>
			<td bgcolor="pink">�ּ�</td>
			<td bgcolor="pink">�̸���</td>
		</tr>
		<%
		for(MemberVO m : list) {
		%>
		<tr>
			<td><%= m.getId() %></td>
			<td><a href="detailMember.jsp?id=<%=m.getId()%>"><%= m.getName() %></a></td>
			<td><%= m.getAddr() %></td>
			<td><%= m.getEmail() %></td>
		</tr>
		<%
		}
		%>
	</table>
	<hr>
	<a href="insertMember.jsp">ȸ�����</a>
</body>
</html>