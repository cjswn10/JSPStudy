<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<h2>�Խù� ����</h2>
	<hr>
	<form action="updateBoard.do?" method="post" enctype="multipart/form-data">
	��ȣ : ${b.no }<input type="hidden" name="no" value="${b.no }"><br>
	���� : <input type="text" name="title" value="${b.title }"><br>
	�ۼ��� : <input type="text" name="writer" value="${b.writer }"><br>
	��ȣ : <input type="password" name="pwd" required="required"><br>
	���� :<br>
	<textarea rows="10" cols="60" name="content">${b.content}</textarea><br>
	���� : ${b.fname}(${b.fsize}) <input type="file" name="fname" value="${b.fname}"><br>
	<input type="submit" value="����">
	<input type="reset" value="���">
	</form>
</body>
</html>