<%@page import="java.util.ArrayList"%>
<%@page import="com.bit.dao.EmpDAO"%>
<%@page import="com.bit.vo.EmpVO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<h2>������</h2>
	<table border="1" width="100%">
		<tr bgcolor="skyblue">
			<td>�����ȣ</td>
			<td>�����</td>
			<td>�μ���ȣ</td>
		</tr>

		<%
			EmpDAO dao = new EmpDAO();
			ArrayList<EmpVO> list = dao.listEmp();

			for (EmpVO e : list) {
		%>
		<tr>
			<td><%=e.getEno()%></td>
			<td><a href="detailEmp.jsp?eno=<%=e.getEno()%>"><%=e.getEname()%></a></td>
			<td><%=e.getDno()%></td>
		</tr>

		<%
			}
		%>

	</table>
	<hr>
	<a href="insertEmp.jsp">�߰�</a>
	<a href="updateEmp.jsp">����</a>
</body>
</html>