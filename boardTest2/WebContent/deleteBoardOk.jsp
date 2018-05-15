<%@page import="java.io.File"%>
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
	int no = Integer.parseInt(request.getParameter("no"));
	String pwd = request.getParameter("pwd");
	BoardDAO dao = new BoardDAO();
	String oldFname = dao.getBoard(no, false).getFname();
	
	int re = dao.deleteBoard(no, pwd);
	
	if(re > 0) {
		String path = request.getRealPath("/file");
		File file = new File(path + "/" + oldFname);
		file.delete();
		response.sendRedirect("listBoard.jsp");
	} else {
		out.print("<font color='red'>삭제 실패</font>");
		out.print("<hr><a href='listBoard.jsp'>글목록</a>");
	}
		
%>
</body>
</html>