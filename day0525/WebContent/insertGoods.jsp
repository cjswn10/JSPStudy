<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<h2>��ǰ ���</h2>
	<hr>
	<form action="insertGoodsOk.do" method="post" enctype="multipart/form-data">
	��ǰ��ȣ : <input type="number" name="no"><br>
	��ǰ�̸� : <input type="text" name="item"><br>
	��ǰ���� : <input type="number" name="price"><br>
	��ǰ���� : <input type="number" name="qty"><br>
	��ǰ���� : <input type="file" name="fname"><br>
	<input type="submit" value="���">
	<input type="reset" value="���">
	</form>
</body>
</html>