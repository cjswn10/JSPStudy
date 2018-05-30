<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<style>
td {
    border-bottom: 1px solid #ddd;
}
</style>
</head>
<body>

	<h2>글 상세</h2>
	<hr>
	글번호 : ${p.no }<br>
	글제목 : ${p.title }<br>
	작성자 : ${p.writer }<br>
	등록일 : ${p.regdate }<br>
	조회수 : ${p.hit }<br>
	글내용 : <br>
	<textarea rows="10" cols="60">${p.content }</textarea><br>
	<hr>
	<table>
	<c:forEach var="comments" items="${clist}">
		<tr>
		<td width="500">${comments.content }</td>
		<td width="200">${comments.regdate }</td>
		<td>${comments.writer }</td>
		<c:if test="${id == comments.writer }">
		<td><a href="deleteComment.do?cno=${comments.cno}&no=${p.no}">삭제</a>
		</c:if>
		</tr>
	</c:forEach>
	</table>
	<br>댓글입력
	<form action="insertComment.do" method="post">
		<input type="hidden" name="writer" value="${id }">
		<input type="hidden" name="no" value="${p.no }">
		<textarea rows="2" cols="70" name="content"></textarea>
		<input type="submit" value="등록">
	</form>
	
	<a href="listPost.do">글목록</a>
</body>
</html>