<%@page import="javax.swing.JOptionPane"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>deleteBook</title>
</head>
<body>
	<%
		try {
			int bid = Integer.parseInt(request.getParameter("bid"));
			String sql = "DELETE book WHERE bookid = ?";

			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "madang",
					"madang");

			conn.setAutoCommit(false);
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bid);

			int re = pstmt.executeUpdate();
			if (re != 0){
				conn.commit();
				%>
				<h1>����</h1>
				<%
			}
			else{
				conn.rollback();
				%>
				<h1>����</h1>
				<%		
				}
		pstmt.close();
		conn.close();
		} catch (Exception e) {
				%>
				�ش� ������ ���� �� �� �����ϴ�.
				<hr>
				<%
		}
	%>
</body>
</html>