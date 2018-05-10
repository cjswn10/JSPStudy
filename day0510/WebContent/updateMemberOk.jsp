<%@page import="java.util.Arrays"%>
<%@page import="com.dao.MemberDAO"%>
<%@page import="com.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>회원정보 수정 완료</title>
</head>
<body>
	<%
		request.setCharacterEncoding("euc-kr");

		MemberVO mv = new MemberVO();
		mv.setId(request.getParameter("id"));
		mv.setPwd(request.getParameter("pwd"));
		mv.setName(request.getParameter("name"));
		mv.setAddr(request.getParameter("addr"));
		mv.setEmail(request.getParameter("email"));
		mv.setAge(Integer.parseInt(request.getParameter("age")));
		String[] arr = request.getParameterValues("hobby");
		mv.setHobby(Arrays.toString(arr));
		mv.setTel(request.getParameter("tel"));

		MemberDAO dao = new MemberDAO();
		int re = dao.updateMember(mv);

		if (re > 0) {
			response.sendRedirect("listMember.jsp");
		} else {
			%>
			수정 실패
			<hr>
			<a href="listMember.jsp">회원 목록</a>
			<%
		}
	%>
	
</body>
</html>