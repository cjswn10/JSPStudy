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
<title>Insert title here</title>
</head>
<body>
	<table>
		<tr>
			<td>�����ȣ</td>
			<td>�����</td>
			<td>�޿�</td>
			<td>����</td>
			<td>�Ի���</td>
			<td>�ֹι�ȣ</td>
			<td>�μ���ȣ</td>
			<td>����</td>
			<td>�ּ�</td>
			<td>�����ڹ�ȣ</td>
			<td>�̸����ּ�</td>
		</tr>
		
		<%
			request.setCharacterEncoding("EUC-KR");
			String dloc = request.getParameter("dloc");
			
			String sql = "SELECT * FROM emp WHERE dno in(SELECT dno FROM dept WHERE dloc=?)";
			
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "madang", "madang");
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dloc);
		
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
		%>
					<tr>
						<td><%=rs.getInt(1)%></td>
						<td><%=rs.getString(2)%></td>
						<td><%=rs.getInt(3)%></td>
						<td><%=rs.getInt(4)%></td>
						<td><%=rs.getDate(5)%></td>
						<td><%=rs.getString(6)%></td>
						<td><%=rs.getInt(7)%></td>
						<td><%=rs.getString(8)%></td>
						<td><%=rs.getString(9)%></td>
						<td><%=rs.getInt(10)%></td>
						<td><%=rs.getString(11)%></td>
					</tr>
		<%			
			}
			rs.close();
			pstmt.close();
			conn.close();
		%>
	</table>
</body>
</html>