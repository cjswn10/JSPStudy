<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>detailBook</title>
</head>
<body>
	<h2>도서 등록</h2>
	<hr>

	<form action="insertBookOk.jsp" method="post">
		<table>
			<tr>
				<td>도서번호 :</td><td><input type="text" name="bookid"></td>
				<!-- 이름을 안 헷갈리게 변수 이름이랑 똑같이줌 -->
			</tr>
			<tr>
				<td>도서명 :</td><td><input type="text" name="bookname"></td>
			</tr>
			<tr>
				<td>출판사 :</td><td><input type="text" name="publisher"></td>
			</tr>
			<tr>
				<td>가격 :</td><td><input type="text" name="price"></td>
			</tr>
		</table>
		<input type="submit" value="등록">
	</form>
	
	
	<hr>
	<a href="listBook.jsp">도서목록</a>


</body>
</html>