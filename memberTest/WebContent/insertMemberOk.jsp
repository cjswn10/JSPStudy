<%@page import="java.util.Arrays"%>
<%@page import="com.dao.MemberDAO"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
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
<%
	request.setCharacterEncoding("euc-kr");
	String path = request.getRealPath("/img");
	MultipartRequest multi = new MultipartRequest(request, path, 1024*1024*5, "euc-kr");
	
	
	MemberVO m = new MemberVO();
	m.setId(multi.getParameter("id"));
	m.setPwd(multi.getParameter("pwd"));
	m.setName(multi.getParameter("name"));
	m.setAddr(multi.getParameter("addr"));
	m.setEmail(multi.getParameter("email"));
	m.setAge(Integer.parseInt(multi.getParameter("age")));
	m.setTel(multi.getParameter("tel"));
	
//	String[] arr = multi.getParameterValues("hobby");
//	String hobby = Arrays.toString(arr);
//	m.setHobby(hobby);
	m.setHobby(Arrays.toString(multi.getParameterValues("hobby")));

	m.setFname(multi.getFile("fname").getName());

	MemberDAO dao = new MemberDAO();
	int re = dao.insertMember(m);
	
	if(re > 0) {
		response.sendRedirect("listMember.jsp");
	} else {
		%>실패 
		<a href="insertMember.jsp">상품목록</a> <%
	}
	
%>
</body>
</html>