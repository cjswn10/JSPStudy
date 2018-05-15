<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>게시물 등록</title>
</head>
<body>
<h2>게시물 등록</h2>
<hr>
<form action="insertBoardOk.jsp" method="post" >
제목 <input type="text" name="title"><br>
작성자 <input type="text" name="writer"><br>
비밀번호 <input type="password" name="pwd"><br>
<textarea name="content" cols="60" rows="10"></textarea><br>
<input type="submit" value="등록">&nbsp;
<input type="reset" value="취소">
</form>
</body>
</html>