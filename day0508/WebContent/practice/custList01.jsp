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
<title>고객 정보</title>
</head>
<body>
<br><h1 align="center">모든 고객 정보</h1>
<table border=1 align="center">
<tr>
<th>고객아이디</th>
<th>고객명</th>
<th>고객주소</th>
<th>고객연락처</th>
</tr>

<%
	try{
		String sql="select * from customer";
		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection conn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","madang","madang");
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery(sql);
		
		while(rs.next()){
			%><tr>
			<td><%=rs.getInt(1) %></td>
			<td><%=rs.getString(2) %></td>
			<td><%=rs.getString(3) %></td>
			<td><%=rs.getString(4) %></td>
			</tr><%
		}
				
		rs.close();
		stmt.close();
		conn.close();
	}catch(Exception e){
		System.out.println(e.getMessage());
	}
%>

</table>
</body>
</html>