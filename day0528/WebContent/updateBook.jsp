<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<h2>���� ����</h2>
<hr>
<form action="updateBookOk.do" method="POST">
������ȣ    ${b.bookid}<input type="hidden" name="bookid" value="${b.bookid}"><br>
�� �� ��<input type="text" name="bookname" value="${b.bookname}"><br>
�� �� ��<input type="text" name="publisher" value="${b.publisher}"><br>
�� ��<input type="number" name="price" value="${b.price}"><br>
<input type="submit" value="���">
<input type="reset" value="���">
</form>
</body>
</html>