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
			<c:forEach var="g" items="${list }">
				<td>
					<a href="detailGoods.do?no=${g.no }">
					<img src="img/${g.fname}" width="100" height="100"></a><br>
					${g.item }(${g.price })
				</td>
			</c:forEach>
		</tr>
	</table>
	<hr>
	<center>${pageStr }</center>
</body>
</html>