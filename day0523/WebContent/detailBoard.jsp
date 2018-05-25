<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>

게시물 번호 : ${b.no} <br>
작성자 : ${b.writer} <br>
작성일 : ${b.regdate}<br>
조회수 : ${b.hit}<br>
제목  : ${b.title} <br>
내용 : <br><textarea name="content">${b.content}</textarea><br><br>
첨부파일 : ${b.fname}(<${b.fsize})<br>
IP : ${b.ip}<br>

</body>
</html>