<%@page import="com.bit.vo.EmpVO"%>
<%@page import="com.bit.dao.EmpDAO"%>
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
int eno = Integer.parseInt(request.getParameter("eno"));

EmpDAO dao = new EmpDAO();
EmpVO e = dao.getEmp(eno);
%>

�����ȣ : <%=e.getEno() %><br>
����̸� : <%=e.getEname() %><br>
�޿� : <%=e.getSal() %><br>
���� : <%=e.getComm() %><br>
�Ի��� : <%=e.getHiredate() %><br>
�ֹι�ȣ : <%=e.getJumin() %><br>
�μ���ȣ : <%=e.getDno() %><br>
��å : <%=e.getPosition() %><br>
�ּ� : <%=e.getAddr() %><br>
�����ڹ�ȣ : <%=e.getMgr() %><br>
�̸��� : <%=e.getEmail() %><br>

<hr>

<a href="updateEmp.jsp?eno=<%=e.getEno()%>">����</a>
<a href="deleteEmp.jsp?eno=<%=e.getEno()%>">����</a>
</body>
</html>