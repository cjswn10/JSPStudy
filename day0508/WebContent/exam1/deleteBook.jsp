<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
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

		String sql = "DELETE FROM book WHERE bookid=?";

		try {
			//�Ķ���� �̸��� html�±׿��� ��� name
			int bookid = Integer.parseInt(request.getParameter("bid"));

			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "madang",
					"madang");
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bookid);

			int re = pstmt.executeUpdate();

			if (re > 0) {
				%>
					<font color="blue">���� ����</font>
				<%
			} else {
				%>
				<font color="red">���� ����</font>
				<%
			}

			pstmt.close();
			conn.close();
		} catch (Exception e) {
			System.out.println(e.getMessage());

		}
	%>
	<hr>
	<a href="listBook.jsp">���� ���</a>

</body>
</html>