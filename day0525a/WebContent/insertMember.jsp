<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<h2>ȸ�� �߰�</h2>
<hr>
<form action="insertMemberOk.do" method="post" enctype="multipart/form-data">
���̵� : <input type="text" name="id"><br>
��й�ȣ : <input type="password" name="pwd"><br>
�̸� : <input type="text" name="name"><br>
�ּ� : <input type="text" name="addr"><br>
�̸��� : <input type="email" name="email"><br>
���� : <input type="number" name="age"><br>
��� : <input type="text" name="hobby"><br>
��ȭ��ȣ : <input type="text" name="tel"><br>
���� : <input type="file" name="fname"><br>
<input type="submit" value="�߰�">
</form>
</body>
</html>