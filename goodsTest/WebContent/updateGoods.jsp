<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<h2>��ǰ ���� ����</h2>
	<hr>
	<form action="updateGoodsOk.do" method="post" enctype="multipart/form-data">
	��ǰ��ȣ : ${g.no}<input type="hidden" name="no" value="${g.no}"><br>
	��ǰ�̸� : <input type="text" name="item" value="${g.item}"><br>
	��ǰ���� : <input type="number" name="price" value="${g.price}"><br>
	��ǰ���� : <input type="number" name="qty" value="${g.qty}"><br>
	��ǰ���� : <input type="file" name="fname" value="${g.fname}"><br>
	<input type="submit" value="���">
	<input type="reset" value="���">
	</form>
</body>
</html>