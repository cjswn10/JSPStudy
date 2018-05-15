<%@page import="com.vo.BoardVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.dao.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>게시물 목록</title>
</head>
<body>
<h2>게시물 목록</h2>
	<table border="1" width="60%">
	<tr>
		<td>글번호</td>
		<td>제목</td>
		<td>작성자</td>
		<td>등록일</td>
		<td>조회수</td>
		<td>파일명</td>
		<td>파일크기</td>
	</tr>
	<%
		BoardDAO dao = new BoardDAO();
		ArrayList<BoardVO> list = dao.listBoard();
		
		for(BoardVO b : list) {
			out.print("<tr>");
			out.print("<td>"+b.getNo()+"</td>");
			out.print("<td><a href='detailBoard.jsp?no="+b.getNo()+"'>"+b.getTitle()+"</a></td>");
			out.print("<td>"+b.getWriter()+"</td>");
			out.print("<td>"+b.getRegdate()+"</td>");
			out.print("<td>"+b.getHit()+"</td>");
			out.print("<td>"+b.getFname()+"</td>");
			out.print("<td>"+b.getFsize()+"</td>");
			out.print("</tr>");
		}
	%>
	</table>
	<hr>
	<a href="insertBoard.jsp">게시물 등록</a>
</body>
</html>