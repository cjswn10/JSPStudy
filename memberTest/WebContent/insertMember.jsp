<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<h2>ȸ�� �߰�</h2>
<hr>
<form action="insertMemberOk.jsp" method="POST" enctype="multipart/form-data">
���̵� : <input type="text" name="id"><br>
��й�ȣ : <input type="password" name="pwd"><br>
�̸� : <input type="text" name="name"><br>
�ּ� : <input type="text" name="addr"><br>
�̸��� : <input type="email" name="email"><br>
���� : <input type="number" name="age"><br>
��� : 
		<input type="checkbox" name="hobby" value="������">������
		<input type="checkbox" name="hobby" value="����">����
		<input type="checkbox" name="hobby" value="ũ�ν���">ũ�ν���
		<input type="checkbox" name="hobby" value="Ŭ���̹�">Ŭ���̹�
		<input type="checkbox" name="hobby" value="�����">�����
		<input type="checkbox" name="hobby" value="�ö��׿䰡">�ö��׿䰡		
<br>
��ȭ��ȣ : <input type="text" name="tel"><br>
ȸ������ : <input type="file" name="fname"><br>
<input type="submit" value="���">
<input type="reset" value="���">
</form>
</body>
</html>