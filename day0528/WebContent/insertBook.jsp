<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<h2>���� ���</h2>
<hr>
<form action="insertBookOk.do" method="POST">
������ȣ <input type="number" name="bookid"><br><br>
�� �� �� <input type="text" name="bookname"><br><br>
�� �� �� <input type="text" name="publisher"><br><br>
�� �� <input type="number" name="price"><br><br><br>
<input type="submit" value="���">
<input type="reset" value="���">
</form>
</body>
</html>