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
	int no = Integer.parseInt(request.getParameter("no"));
	
	BoardDAO dao = new BoardDAO();
	BoardVO b = dao.getBoard(no, true);

%>
�۹�ȣ <%=b.getNo() %><br>
������ <%=b.getTitle() %><br>
�ۼ��� <%=b.getWriter() %><br>
�ۼ��� <%=b.getRegdate() %><br>
��ȸ�� <%=b.getHit() %><br>
���ϸ� <%=b.getFname() %><br>
����ũ�� <%=b.getFsize() %><br>
�۳��� : <br>
<textarea rows="10" cols="60" readonly="readonly"><%=b.getContent()%></textarea>
<hr>
<a href="listBoard.jsp">�۸��</a>
<a href="updateBoard.jsp?no=<%=b.getNo()%>">����</a>
<a href="deleteBoard.jsp?no=<%=b.getNo() %>">����</a>
</body>
</html>