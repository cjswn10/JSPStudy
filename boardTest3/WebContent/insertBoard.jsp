<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<h2>${title}</h2>
	<form action="insertBoardOk.do" method="post" enctype="multipart/form-data">
		<input type="hidden" name="no" value="${no}">
		������ : <input type="text" name="title"><br>
		�ۼ��� : <input type="text" name="writer"><br>
		��й�ȣ : <input type="password" name="pwd"><br>
		���� <br><textarea rows="10" cols="60" name="content"></textarea><br>
		���� : <input type="file" name="fname"><br>
		<input type="submit" value="���">
		<input type="reset" value="���">
	</form>
</body>
</html>