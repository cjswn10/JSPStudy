<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<h2>${title}</h2>
	<hr>
	<table width="80%" border="1" style="border-collapse:collapse;">
		<tr>
			<td>�۹�ȣ</td>
			<td>������</td>
			<td>�ۼ���</td>
			<td>��ȸ��</td>
			<td>�����</td>
		</tr>
		<c:forEach var="b" items="${list}">
			<tr>
				<td>${b.no }</td>
				<td><a href="detailBoard.do?no=${b.no }">${b.title }</a></td>
				<td>${b.writer }</td>
				<td>${b.hit }</td>
				<td>${b.regdate }</td>
			</tr>
		</c:forEach>
	</table>
	<hr>
	<c:if test="${startPage>1}">
		<a href="listBoard.do?pageNUM=${startPage-1}">[����]</a>
	</c:if>
	
	<c:forEach var="i" begin="${startPage}" end="${endPage}">
		<a href="listBoard.do?pageNUM=${i}">${i}</a>&nbsp;
	</c:forEach>
	
	<c:if test="${endPage<totalPage}">
		<a href="listBoard.do?pageNUM=${endPage+1}">[����]</a>
	</c:if>
	
</body>
</html>