<%@page import="com.vo.GoodsVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.dao.GoodsDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>��ǰ ���</title>
</head>
<body>
	<h2>��ǰ���</h2>
	<hr>
	<%
		GoodsDAO dao = new GoodsDAO();
		ArrayList<GoodsVO> list = dao.listGoods();
	%>
	<table border="1" width="80%">
		<tr>
			<td>��ǰ��ȣ</td>
			<td>��ǰ��</td>
			<td>����</td>
		</tr>
		<%
			for (GoodsVO g : list) {
		%>
		<tr>
			<td><%=g.getNo()%></td>
			<td><a href="detailGoods.jsp?no=<%=g.getNo()%>"><%=g.getItem()%></a></td>
			<td><%=g.getPrice()%></td>
		</tr>
		<%
			}
		%>

	</table>
	<a href="insertGoods.jsp">��ǰ���</a>

</body>
</html>