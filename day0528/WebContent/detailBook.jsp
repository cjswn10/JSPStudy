<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<h2>���� �� ����</h2>
<hr>
	<table width="60%" height="200" border="1" style="border-collapse:collapse;" align="center">
		<tr><td bgcolor="gold">������ȣ</td> <td>${ b.bookid }</td></tr>
		<tr><td bgcolor="gold">������</td> <td>${ b.bookname }</td></tr>
		<tr><td bgcolor="gold">���ǻ�</td> <td>${ b.publisher }</td></tr>
		<tr><td bgcolor="gold">����</td> <td>${ b.price }</td></tr>
	</table>
<hr>
<center>
<a href="updateBook.do?bookid=${b.bookid}">����</a>&nbsp;&nbsp;&nbsp;
<a href="deleteBook.do?bookid=${b.bookid}">����</a>
</center>
</body>
</html>