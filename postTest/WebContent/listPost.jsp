<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	${id }님 안녕하세요
	<h2>글 목록</h2>
	<hr>
	<a href="insertPost.do">글쓰기</a>
	<table border="1" width="80%">
		<tr>
			<td>글번호</td>
			<td>글제목</td>
			<td>작성자</td>
			<td>등록일</td>
		</tr>
		
		<c:forEach var="p" items="${list }">
			<tr>
				<td>${p.no }</td>
				<td>
					<a href="detailPost.do?no=${p.no }">${p.title }</a> 
				</td>					
				<td>${p.writer }</td>
				<td>${p.regdate }</td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>