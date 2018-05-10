<%@page import="java.sql.PreparedStatement"%>
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
	<%
		request.setCharacterEncoding("EUC-KR");
	
		try {
			int custid = Integer.parseInt(request.getParameter("custid"));
			String name = request.getParameter("name");
			String addr = request.getParameter("address");
			String phone = request.getParameter("phone");

			String sql = "INSERT INTO customer VALUES(?,?,?,?)";

			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "madang",
					"madang");
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, custid);
			pstmt.setString(2, name);
			pstmt.setString(3, addr);
			pstmt.setString(4, phone);

			int re = pstmt.executeUpdate();

			if (re > 0) {
				%>
				<font color="blue">고객 등록 성공</font>
				<%
			} else {
				%>
				<font color="red">고객 등록 실패</font>
				<%
			}

			pstmt.close();
			conn.close();
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
	%>

	<hr>
	<a href="listCustomer.jsp">고객 목록</a>

</body>
</html>