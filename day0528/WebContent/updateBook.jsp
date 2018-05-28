<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<h2>도서 수정</h2>
<hr>
<form action="updateBookOk.do" method="POST">
도서번호    ${b.bookid}<input type="hidden" name="bookid" value="${b.bookid}"><br>
도 서 명<input type="text" name="bookname" value="${b.bookname}"><br>
출 판 사<input type="text" name="publisher" value="${b.publisher}"><br>
가 격<input type="number" name="price" value="${b.price}"><br>
<input type="submit" value="등록">
<input type="reset" value="취소">
</form>
</body>
</html>