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
아이디 : <%=m.getId() %><br>
비밀번호 : <%=m.getPwd() %><br>
이름 : <%=m.getName() %><br>
주소 : <%=m.getAddr() %><br>
이메일 : <%=m.getEmail() %><br>
나이 : <%=m.getAge() %><br>
취미 : <%=m.getHobby() %><br>
전화번호 : <%=m.getTel() %>
</td>
</tr>
<tr>
	<td><a href="updateMember.jsp?id=<%=m.getId()%>">수정</a></td>
	<td><a href="deleteMember.jsp?id=<%=m.getId() %>">삭제</a></td>
</table>
</body>
</html>