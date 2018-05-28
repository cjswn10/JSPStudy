<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<h2>도서 상세 정보</h2>
<hr>
	<table width="60%" height="200" border="1" style="border-collapse:collapse;" align="center">
		<tr><td bgcolor="gold">도서번호</td> <td>${ b.bookid }</td></tr>
		<tr><td bgcolor="gold">도서명</td> <td>${ b.bookname }</td></tr>
		<tr><td bgcolor="gold">출판사</td> <td>${ b.publisher }</td></tr>
		<tr><td bgcolor="gold">가격</td> <td>${ b.price }</td></tr>
	</table>
<hr>
<center>
<a href="updateBook.do?bookid=${b.bookid}">수정</a>&nbsp;&nbsp;&nbsp;
<a href="deleteBook.do?bookid=${b.bookid}">삭제</a>
</center>
</body>
</html>