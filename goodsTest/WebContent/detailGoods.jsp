<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<h2>�� ����</h2>
	<hr>
	<table style="border-collapse:collapse" >
		<tr>
			<td width="400"><img src="upload/${g.fname}" width="300"></td>
			<td width="300">
				��ǰ��ȣ : ${g.no}<br><br>
				��ǰ�� : ${g.item}<br><br>
				���� : ${g.price}<br><br>
				���� : ${g.qty}
			</td>
		</tr>
		<tr>
	</table>
	<hr>
	<a href="updateGoods.do?no=${g.no}">����</a>
	<a href="deleteGoods.do?no=${g.no}">����</a>
</body>
</html>