<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>detailBook</title>
</head>
<body>
	<h2>���� ���</h2>
	<hr>

	<form action="insertBookOk.jsp" method="post">
		<table>
			<tr>
				<td>������ȣ :</td><td><input type="text" name="bookid"></td>
				<!-- �̸��� �� �򰥸��� ���� �̸��̶� �Ȱ����� -->
			</tr>
			<tr>
				<td>������ :</td><td><input type="text" name="bookname"></td>
			</tr>
			<tr>
				<td>���ǻ� :</td><td><input type="text" name="publisher"></td>
			</tr>
			<tr>
				<td>���� :</td><td><input type="text" name="price"></td>
			</tr>
		</table>
		<input type="submit" value="���">
	</form>
	
	
	<hr>
	<a href="listBook.jsp">�������</a>


</body>
</html>