<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body >
<h2 align="center">상품 목록</h2>
<hr>
	<table width="50%" border="1" style="border-collapse:collapse;" align="center">
		<tr>
			<td>상품번호</td>
			<td>상품명</td>
			<td>상품가격</td>
		</tr>
		<c:forEach var="g" items="${list}">
			<tr>
				<td>${g.no}</td>			
				<td><a href="detailGoods.do?no=${g.no}">${g.item}</a></td>			
				<td>${g.price}</td>			
			</tr>
		</c:forEach>
	</table>
	<hr><br><br>
	<a href="insertGoods.do">상품등록</a>
</body>
</html>