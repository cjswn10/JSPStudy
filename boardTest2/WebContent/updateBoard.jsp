<%@page import="com.vo.BoardVO"%>
<%@page import="com.dao.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>�Խù� ����</title>
</head>
<body>
<%
	request.setCharacterEncoding("euc-kr");
	int no = Integer.parseInt(request.getParameter("no"));
	BoardDAO dao = new BoardDAO();
	BoardVO b = dao.getBoard(no, false);
%>
<h2>�Խù� ����</h2>
<hr>
<form action="updateBoardOk.jsp" method="post" enctype="multipart/form-data">
<input type="hidden" name="no" value="<%=no%>"><br>
���� <input type="text" name="title" value="<%=b.getTitle()%>"><br>
�ۼ��� <input type="text" name="writer" value="<%=b.getWriter()%>"><br>
��й�ȣ <input type="password" name="pwd"><br>
<textarea name="content" cols="60" rows="10"><%=b.getContent()%></textarea><br>
÷������ : <%=b.getFname() %>(<%=b.getFsize() %>)<br>
<input type="file" name="fname"><br>

<input type="submit" value="����">&nbsp;
<input type="reset" value="���">
</form>
</body>
</html>