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
	<h2>�����</h2>
	<table>
		<tr>
			<td>����ȣ</td>
			<td>����</td>
			<td>�ּ�</td>
			<td>��ȭ</td>
		</tr>
		<%
			try {
				String sql = "SELECT * FROM customer";

				Class.forName("oracle.jdbc.driver.OracleDriver");
				Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "madang",
						"madang");
				Statement stmt = conn.createStatement();
				ResultSet rs = stmt.executeQuery(sql);

				while (rs.next()) {
					%>
					<tr>
						<td><%=rs.getInt(1)%></td>
						<td><%=rs.getString(2)%></td>
						<td><%=rs.getString(3)%></td>
						<td><%=rs.getString(4)%></td>
						<td><a href="updateCustomer.jsp?cid=<%=rs.getInt(1)%>">����</a>
						<a href="deleteCustomer.jsp?cid=<%=rs.getInt(1)%>">����</a>
						</td>
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
	<a href="insertCustomer.jsp">�� ���</a>
	
	
</body>
</html>