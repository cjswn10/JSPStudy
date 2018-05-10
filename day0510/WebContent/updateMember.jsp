<%@page import="com.dao.MemberDAO"%>
<%@page import="com.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>회원 정보 수정</title>
</head>
<body>
	<%
		String id = request.getParameter("id");
		MemberDAO dao = new MemberDAO();
		MemberVO mv = dao.selectMember(id);
	%>
	<h2>회원정보 수정</h2>
	<form action="updateMemberOk.jsp" method="post">
		<table>
			<tr>
				<td>아이디 :</td><td><input type="text" name="id" value="<%=mv.getId()%>"></td>
			</tr>
			<tr>
				<td>비밀번호 :</td><td><input type="password" name="pwd"></td>
			</tr>
			<tr>
				<td>이름 :</td><td><input type="text" name="name" value="<%=mv.getName()%>"></td>
			</tr>
			<tr>
				<td>주소 :</td><td><input type="text" name="addr" value="<%=mv.getAddr()%>"></td>
			</tr>
			<tr>
				<td>이메일 :</td><td><input type="email" name="email" value="<%=mv.getEmail()%>"></td>
			</tr>
			<tr>
				<td>나이 :</td><td><input type="number" name="age" value="<%=mv.getAge()%>"></td>
			</tr>
			<tr>
			<td>취미 :</td><td>
			<input type="checkbox" name="hobby" value="마라톤">마라톤
			<input type="checkbox" name="hobby" value="수영">수영
			<input type="checkbox" name="hobby" value="크로스핏">크로스핏
			<input type="checkbox" name="hobby" value="클라이밍">클라이밍
			<input type="checkbox" name="hobby" value="재즈댄스">재즈댄스
			<input type="checkbox" name="hobby" value="플라잉요가">플라잉요가
			</td>
			</tr>
			<tr>
				<td>전화번호 :</td><td><input type="tel" name="tel" value="<%=mv.getTel()%>">
			</tr>
		</table>
			<input type="submit" value="등록">
			<input type="reset" value="취소">
	</form>
</body>
</html>