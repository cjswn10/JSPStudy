<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<table>
		<tr bgcolor="gold">
			<td>번호</td>
			<td>제목</td>
			<td>작성자</td>
			<td>등록일</td>
		</tr>
		<c:forEach var="b" items="${list}">
			<tr>
				<td>${b.no }</td>
				<td>
				<c:if test="${b.b_level > 0}">
					<c:forEach begin="1" end="${b.b_level}">
						&nbsp;
					</c:forEach>
					<font color="pink">=></font>
				</c:if>
				<a href="detailBoard.do?no=${b.no}">${b.title }</a></td>
				<td>${b.writer}</td>
				<td>${b.regdate}</td>
			</tr>
		</c:forEach>
	</table>
<a href="insertBoard.do">글쓰기</a>
</body>
</html>