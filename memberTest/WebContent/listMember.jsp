<%@page import="com.vo.MemberVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>회원목록</title>
</head>
<body>
	<h2>상품목록</h2>
	<hr>
	<%
		MemberDAO dao = new MemberDAO();
		ArrayList<MemberVO> list = dao.listMember();
	%>
	<table border="1" width="80%">
		<tr>
			<td bgcolor="pink">아이디</td>
			<td bgcolor="pink">이름</td>
			<td bgcolor="pink">주소</td>
			<td bgcolor="pink">이메일</td>
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
	<a href="insertMember.jsp">회원등록</a>
</body>
</html>