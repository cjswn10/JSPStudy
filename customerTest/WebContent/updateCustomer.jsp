<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
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
	<h2>�� ����</h2>
	<%
		int custid = Integer.parseInt(request.getParameter("cid"));
		String name = "";
		String addr = "";
		String phone = "";

		String sql = "SELECT * FROM customer WHERE custid=?";
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "madang",
					"madang");
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, custid);
			ResultSet rs = pstmt.executeQuery();
			
			if (rs.next()) {
				name = rs.getString(2);
				addr = rs.getString(3);
				phone = rs.getString(4);
			}

			rs.close();
			pstmt.close();
			conn.close();
			
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
	%>
	<form action="updateCustomerOk.jsp" method="post">
		<table>
			<tr>
				<td>����ȣ</td>
				<td><input type="text" name="custid" value="<%=custid%>"></td>
			</tr>
			<tr>
				<td>����</td>
				<td><input type="text" name="name" value="<%=name%>"></td>
			</tr>
			<tr>
				<td>�� ��</td>
				<td><input type="text" name="address" value="<%=addr%>"></td>
			</tr>
			<tr>
				<td>��ȭ��ȣ</td>
				<td><input type="text" name="phone" value="<%=phone%>"></td>
			</tr>
		</table>
		<input type="submit" value="���">
	</form>
</body>
</html>