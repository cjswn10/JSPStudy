<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>�Խù� ���</title>
</head>
<body>
<h2>�Խù� ���</h2>
<hr>
<form action="insertBoardOk.jsp" method="post" >
���� <input type="text" name="title"><br>
�ۼ��� <input type="text" name="writer"><br>
��й�ȣ <input type="password" name="pwd"><br>
<textarea name="content" cols="60" rows="10"></textarea><br>
<input type="submit" value="���">&nbsp;
<input type="reset" value="���">
</form>
</body>
</html>