<%@page import="com.dao.MemberDAO"%>
<%@page import="com.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<table border="1" cellspacing="0">
		<tr>
			<td bgcolor="yellow">���̵�</td>
			<td bgcolor="yellow">��й�ȣ</td>
			<td bgcolor="yellow">�̸�</td>
			<td bgcolor="yellow">�ּ�</td>
			<td bgcolor="yellow">�̸���</td>
			<td bgcolor="yellow">����</td>
			<td bgcolor="yellow">���</td>
			<td bgcolor="yellow">��ȭ��ȣ</td>
		</tr>
		<%
		String id = request.getParameter("id");
		MemberDAO dao = new MemberDAO();
		MemberVO mv = dao.selectMember(id);
		%>
				<tr>
					<td><%=mv.getId()%></td>
					<td><%=mv.getPwd()%></td>
					<td><%=mv.getName()%></td>
					<td><%=mv.getAddr()%></td>
					<td><%=mv.getEmail()%></td>
					<td><%=mv.getAge()%></td>
					<td><%=mv.getHobby()%></td>
					<td><%=mv.getTel()%></td>
				</tr>
	</table>
	<hr>
	<a href="updateMember.jsp?id=<%=mv.getId()%>">����</a>
	<a href="deleteMember.jsp?id=<%=mv.getId()%>">����</a>		
		
</body>
</html>