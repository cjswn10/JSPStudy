<%@page import="com.vo.MemberVO"%>
<%@page import="com.dao.MemberDAO"%>
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
String id = request.getParameter("id");

MemberDAO dao = new MemberDAO();
MemberVO m = dao.getMember(id);
%>
<table border="1" width="80%">
<tr>
<td><img src="img/<%=m.getFname()%>"></td>
<td>
���̵� : <%=m.getId() %><br>
��й�ȣ : <%=m.getPwd() %><br>
�̸� : <%=m.getName() %><br>
�ּ� : <%=m.getAddr() %><br>
�̸��� : <%=m.getEmail() %><br>
���� : <%=m.getAge() %><br>
��� : <%=m.getHobby() %><br>
��ȭ��ȣ : <%=m.getTel() %>
</td>
</tr>
<tr>
	<td><a href="updateMember.jsp?id=<%=m.getId()%>">����</a></td>
	<td><a href="deleteMember.jsp?id=<%=m.getId() %>">����</a></td>
</table>
</body>
</html>