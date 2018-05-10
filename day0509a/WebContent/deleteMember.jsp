<%@page import="com.dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>회원 삭제</title>
</head>
<body>
	<%
		String id = request.getParameter("id");
		MemberDAO dao = new MemberDAO();
		int re = dao.deleteMember(id);
		
		if(re > 0) {
			%>삭제 성공<%
		} else {
			%>삭제 실패<%
		}
	
	%>
	<hr>
	<a href="listMember.jsp">회원 목록</a>
</body>
</html>