<%@page import="com.bit.vo.BoardVO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>�Խ���</title>
</head>
<body>
	<h2>�Խù� ���</h2>
	<hr>
	<table>
		<tr>
		<td>��ȣ</td>
		<td>����</td>
		<td>�ۼ���</td>
		<td>��ȸ��</td>
		<td>��¥</td>
		</tr>
		
		<c:forEach var="b" items="${list}">
			<tr>
				<td>${b.no}</td>
				<td><a href="detailBoard.do?no=${b.no}">${b.title}</a></td>
				<td>${b.writer}</td>
				<td>${b.hit }</td>
				<td>${b.regdate }</td>
			</tr>
		</c:forEach>
	
	</table>
</body>
</html>