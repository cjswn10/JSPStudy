<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<table width="60%" style="border-collapse:collapse;">
		<tr>
			<td><b>번호</b></td>
			<td colspan="3">${b.no}</td>
		</tr>
		<tr>
			<td><b>제목</b></td>
			<td>${b.title}</td>
			<td><b>작성자</b></td>	
			<td>${b.writer}</td>
		</tr>
		<tr>
		</tr>
		<tr>
			<td><b>작성일</b></td>	
			<td>${b.regdate}</td>
			<td><b>조회수</b></td>	
			<td>${b.hit}</td>
		</tr>
		<tr>
			<td colspan="4"><textarea rows="10"	cols="80" name="content" readonly="readonly">${b.content}</textarea></td>
		</tr>
	</table>
	<img src="upload/${b.fname}" width="200"><br>
	첨부파일 : ${b.fname}(${b.fsize})<br>
	IP : ${b.ip}<br>
	<a href="insertBoard.do?no=${b.no}">답글</a>
</body>
</html>