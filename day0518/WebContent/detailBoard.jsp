<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<h2>�Խù� ��</h2>
	<hr>
	��ȣ :  ${b.no}<br>
	���� :  ${b.title}<br>
	�ۼ��� :  ${b.writer}<br>
	���� : <br>
	<textarea rows="10" cols="60" readonly="readonly">${b.content }</textarea><br>
	���� :  ${b.fname}(${b.fsize })<br>
	ip�ּ� :  ${b.ip}<br>
	����� :  ${b.regdate}<br>
	��ȸ�� :  ${b.hit}<br>
	<a href="updateBoard.do?no=${b.no}">����</a>
	<a href="deleteBoard.do?no=${b.no}">����</a>
</body>
</html>


