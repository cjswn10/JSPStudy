<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<h2>회원 목록</h2>
<hr>
<table width="50%" border="1" style="border-collapse:collapse;" align="center">
		<tr>
			<td>아이디</td>
			<td>회원명</td>
			<td>주소</td>
		</tr>
		<c:forEach var="c" items="${list}">
			<tr>
				<td>${c.id}</td>			
				<td><a href="detailMember.do?id=${c.id}">${c.name}</a></td>			
				<td>${c.addr}</td>			
			</tr>
		</c:forEach>
	</table>
	<hr><br><br>
	<a href="insertMember.do">회원등록</a>
</body>
</html>