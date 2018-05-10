<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<table border="1">
		<tr>
			<td>도서번호</td>
			<td>도서명</td>
			<td>출판사</td>
			<td>가격</td>
			<td> </td>

		</tr>


		<%
		
			String sql = "SELECT * FROM book";

			try {
				Class.forName("oracle.jdbc.driver.OracleDriver");
				Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "madang",
						"madang");
				Statement stmt = conn.createStatement();
				ResultSet rs = stmt.executeQuery(sql);

				while (rs.next()) {
		%>
					<tr> 
						<td><%= rs.getInt(1) %></td>
						<td><%= rs.getString(2) %></td>
						<td><%= rs.getString(3) %></td>
						<td><%= rs.getInt(4) %></td>
						<td><a href="updateBook.jsp?bid=<%=rs.getInt(1)%>">수정</a>
							<a href="deleteBook.jsp?bid=<%=rs.getInt(1)%>">삭제</a></td>
					</tr>
		<%
			}

				rs.close();
				stmt.close();
				conn.close();

			} catch (Exception e) {
				System.out.println(e.getMessage());
			}
		%>
	</table>
	<hr>
	<a href="insertBook.jsp">도서등록</a>
</body>
</html>