<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<h2>도서 등록</h2>
<hr>
<form action="insertBookOk.do" method="POST">
도서번호 <input type="number" name="bookid"><br><br>
도 서 명 <input type="text" name="bookname"><br><br>
출 판 사 <input type="text" name="publisher"><br><br>
가 격 <input type="number" name="price"><br><br><br>
<input type="submit" value="등록">
<input type="reset" value="취소">
</form>
</body>
</html>