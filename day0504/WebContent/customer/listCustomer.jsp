<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
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
			<td>����ȣ</td>
			<td>���̸�</td>
		</tr>

		<%
			String sql = "SELECT * FROM customer";

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
						<td><a href="detailCustomer.jsp?cid=<%= rs.getInt(1) %>"><%= rs.getString(2) %></a></td>		
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
</body>
</html>