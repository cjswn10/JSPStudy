<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>�� ���</title>
</head>
<body>
	<table border="1">
		<tr>
			<td>����ȣ</td>
			<td>���̸�</td>
		</tr>

		<%
		CustomerDAO dao = new CustomerDAO();
		ArrayList<CustomerVO> arr = new ArrayList<CustomerVO>();
		arr = dao.selectAll();
		
		for(CustomerVO cv : arr){
		%>
		<tr>
			<td><%= cv.getId() %></td>
			<td><a href="detailCustomer.jsp?cid=<%= cv.getId() %>"><%= cv.getName() %></a></td>
		</tr>

		<%
	
		}

		%>



	</table>
</body>
</html>