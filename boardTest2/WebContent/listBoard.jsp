<%@page import="com.vo.BoardVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.dao.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>�Խù� ���</title>
</head>
<body>
<h2>�Խù� ���</h2>
	<table border="1" width="60%">
	<tr>
		<td>�۹�ȣ</td>
		<td>����</td>
		<td>�ۼ���</td>
		<td>�����</td>
		<td>��ȸ��</td>
		<td>���ϸ�</td>
		<td>����ũ��</td>
	</tr>
	<%
		BoardDAO dao = new BoardDAO();
		ArrayList<BoardVO> list = dao.listBoard();
		
		for(BoardVO b : list) {
			out.print("<tr>");
			out.print("<td>"+b.getNo()+"</td>");
			out.print("<td><a href='detailBoard.jsp?no="+b.getNo()+"'>"+b.getTitle()+"</a>");
			
			if(b.getFsize() > 0)
				out.print("<img src='file.png'>");
			
			out.print("</td><td>"+b.getWriter()+"</td>");
			out.print("<td>"+b.getRegdate()+"</td>");
			out.print("<td>"+b.getHit()+"</td>");
			out.print("<td>"+b.getFname()+"</td>");
			out.print("<td>"+b.getFsize()+"</td>");
			out.print("</tr>");
		}
	%>
	</table>
	<hr>
	<a href="insertBoard.jsp">�Խù� ���</a>
</body>
</html>