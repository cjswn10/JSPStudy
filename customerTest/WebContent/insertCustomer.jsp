<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<h2>���� ���</h2>
 <form action="insertCustomerOk.jsp" method="post">
 <table>
	<tr>
		<td>������ȣ</td>
		<td><input type="text" name="custid"></td>
	</tr> 
	<tr>
		<td>������</td>
		<td><input type="text" name="name"></td>
	</tr> 
	<tr>
		<td>�� ��</td>
		<td><input type="text" name="address"></td>
	</tr> 
	<tr>
		<td>��ȭ��ȣ</td>
		<td><input type="text" name="phone"></td>
	</tr> 
 </table>
 <input type="submit" value="���">
 </form>
</body>
</html>