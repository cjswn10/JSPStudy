<%@page import="com.bit.dao.MemberDAO"%>
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
		String pwd = request.getParameter("pwd");
		
		//id�� "bit" ��ȣ�� "hanbit"�̸� �α��� ó��

		MemberDAO dao = new MemberDAO();
		
		if(dao.isMember(id, pwd)) {
			session.setAttribute("id", id);
			response.sendRedirect("main.jsp");
		}
		else
			response.sendRedirect("login.jsp");
		
		session.setAttribute("pwd", pwd);
	%>
</body>
</html>