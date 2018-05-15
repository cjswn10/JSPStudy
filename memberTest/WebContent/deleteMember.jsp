<%@page import="java.io.File"%>
<%@page import="com.dao.MemberDAO"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
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
		String oldFname = dao.getMember(id).getFname();
		int re = dao.deleteMember(id);

		if (re > 0) {

			String path = request.getRealPath("/img");
			File file = new File(path + "/" + oldFname);
			file.delete();
			response.sendRedirect("listMember.jsp");

		} else {
	%>
	삭제 실패
	<hr>
	<a href="listMember.jsp">회원목록</a>
	<%
		}
	%>

</body>
</html>