<%@page import="com.dao.GoodsDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>��ǰ ����</title>
</head>
<body>
<h2>��ǰ ����</h2>
<%
	int no = Integer.parseInt(request.getParameter("no"));
	GoodsDAO dao = new GoodsDAO();
	int re = dao.deleteGoods(no);

	if(re > 0)
		response.sendRedirect("listGoods.jsp");
	else {
		%>���� ����
		<a href="listGoods.jsp">��ǰ ���</a>	
		<%
	}

%>

</body>
</html>