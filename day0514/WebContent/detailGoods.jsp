<%@page import="com.vo.GoodsVO"%>
<%@page import="com.dao.GoodsDAO"%>
<%@page import="java.sql.ResultSet"%>
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

GoodsDAO dao = new GoodsDAO();
GoodsVO g = dao.detailGoods(no);
%>
<table border="1" width="80%">
<tr>
<td><img src="img/<%=g.getFname()%>"></td>
<td>
��ǰ��ȣ:<%=g.getNo() %><br>
��ǰ�̸�:<%=g.getItem() %><br>
��ǰ����:<%=g.getPrice() %><br>
��ǰ����:<%=g.getQty() %>
</td>
</tr>
<tr>
	<td><a href="updateGoods.jsp?no=<%=g.getNo() %>">����</a></td>
	<td><a href="deleteGoods.jsp?no=<%=g.getNo() %>">����</a></td>
</table>

</body>
</html>