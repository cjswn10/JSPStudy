<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<h2>${title}</h2>
	<hr>
	<table width="80%" border="1">
		<tr>
			<td>�۹�ȣ</td>
			<td>������</td>
			<td>�ۼ���</td>
			<td>��ȸ��</td>
			<td>�����</td>
		</tr>
		<c:forEach var="b" items="${list}">
			<tr>
				<td>${b.no }</td>
				<td><a href="detailBoard.do?no=${b.no }">${b.title }</a></td>
				<td>${b.writer }</td>
				<td>${b.hit }</td>
				<td>${b.regdate }</td>
			</tr>
		</c:forEach>
	</table>
	<a href="insertBoard.do">�Խù� ���</a>
</body>
</html>