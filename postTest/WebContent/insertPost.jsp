<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>

	<h2>�� ���</h2>
	<form action="insertPostOk.do" method="post">		
		������ : <input type="text" name="title"><br>
		�ۼ��� : <input type="text" name="writer" value="${id }"><br>
		�۾�ȣ : <input type="password" name="pwd"><br>
		�۳��� : <br>
		<textarea rows="10" cols="60" name="content"></textarea><br>		
		<input type="submit" value="���">
		<input type="reset" value="���">
	</form>
</body>
</html>