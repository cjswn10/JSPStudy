<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body >
<h2 align="center">��ǰ ���</h2>
<hr>
	<table width="50%" border="1" style="border-collapse:collapse;" align="center">
		<tr>
			<td>��ǰ��ȣ</td>
			<td>��ǰ��</td>
			<td>��ǰ����</td>
		</tr>
		<c:forEach var="g" items="${list}">
			<tr>
				<td>${g.no}</td>			
				<td><a href="detailGoods.do?no=${g.no}">${g.item}</a></td>			
				<td>${g.price}</td>			
			</tr>
		</c:forEach>
	</table>
	<hr><br><br>
	<a href="insertGoods.do">��ǰ���</a>
</body>
</html>