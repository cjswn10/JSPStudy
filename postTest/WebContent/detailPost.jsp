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

	<h2>�� ��</h2>
	<hr>
	�۹�ȣ : ${p.no }<br>
	������ : ${p.title }<br>
	�ۼ��� : ${p.writer }<br>
	����� : ${p.regdate }<br>
	��ȸ�� : ${p.hit }<br>
	�۳��� : <br>
	<textarea rows="10" cols="60">${p.content }</textarea><br>
	<hr>
	<table>
	<c:forEach var="comments" items="${clist}">
		<tr>
		<td width="500">${comments.content }</td>
		<td width="200">${comments.regdate }</td>
		<td>${comments.writer }</td>
		<c:if test="${id == comments.writer }">
		<td><a href="deleteComment.do?cno=${comments.cno}&no=${p.no}">����</a>
		</c:if>
		</tr>
	</c:forEach>
	</table>
	<br>����Է�
	<form action="insertComment.do" method="post">
		<input type="hidden" name="writer" value="${id }">
		<input type="hidden" name="no" value="${p.no }">
		<textarea rows="2" cols="70" name="content"></textarea>
		<input type="submit" value="���">
	</form>
	
	<a href="listPost.do">�۸��</a>
</body>
</html>