<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<h2>게시물 수정</h2>
	<hr>
	<form action="updateBoard.do?" method="post" enctype="multipart/form-data">
	번호 : ${b.no }<input type="hidden" name="no" value="${b.no }"><br>
	제목 : <input type="text" name="title" value="${b.title }"><br>
	작성자 : <input type="text" name="writer" value="${b.writer }"><br>
	암호 : <input type="password" name="pwd" required="required"><br>
	내용 :<br>
	<textarea rows="10" cols="60" name="content">${b.content}</textarea><br>
	파일 : ${b.fname}(${b.fsize}) <input type="file" name="fname" value="${b.fname}"><br>
	<input type="submit" value="수정">
	<input type="reset" value="취소">
	</form>
</body>
</html>