<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>

�Խù� ��ȣ : ${b.no} <br>
�ۼ��� : ${b.writer} <br>
�ۼ��� : ${b.regdate}<br>
��ȸ�� : ${b.hit}<br>
����  : ${b.title} <br>
���� : <br><textarea name="content">${b.content}</textarea><br><br>
÷������ : ${b.fname}(<${b.fsize})<br>
IP : ${b.ip}<br>

</body>
</html>