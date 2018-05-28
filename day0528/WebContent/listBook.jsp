<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>도서목록</title>
</head>
<body>
<h2>도서 목록</h2>
<hr>
	<table width="60%" border="1" style="border-collapse:collapse;" align="center">
		<tr>
			<td>도서번호</td>
			<td>도서이름</td>
		</tr>
		<c:forEach var="b" items="${list}">
			<tr>
				<td>${b.bookid}</td>
				<td><a href="detailBook.do?bookid=${b.bookid}">${b.bookname }</a></td>
			</tr>
		</c:forEach>
	</table>
<hr>

</body>
</html>