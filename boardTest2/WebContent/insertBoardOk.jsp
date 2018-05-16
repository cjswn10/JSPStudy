<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="com.vo.BoardVO"%>
<%@page import="com.dao.BoardDAO"%>
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
		String path = request.getRealPath("/file");
		MultipartRequest multi = new MultipartRequest(request, path, 1024 * 1024 * 5, "euc-kr");

		BoardVO b = new BoardVO();
		b.setTitle(multi.getParameter("title"));
		b.setWriter(multi.getParameter("writer"));
		b.setPwd(multi.getParameter("pwd"));
		b.setContent(multi.getParameter("content"));

		//	if(multi.getFile("fname") != null) {
		//		b.setFname(multi.getFile("fname").getName());
		//		b.setFsize((int)multi.getFile("fname").length());
		//	}

		String fname = null;
		if (multi.getFile("fname") != null) {
			fname = multi.getFile("fname").getName();
		}

		if (fname != null && !fname.equals("")) {
			b.setFname(fname);
			b.setFsize((int)multi.getFile("fname").length());
		}

		BoardDAO dao = new BoardDAO();
		int re = dao.insertBoard(b);
		if (re > 0) {
			response.sendRedirect("listBoard.jsp");
		} else {
			out.print("<font color='red'>실패</font>");
		}
	%>
</body>
</html>