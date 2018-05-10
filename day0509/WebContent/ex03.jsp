<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<table border="1" cellpadding="0" cellspacing="0">
	<tr>
		<%for(int i= 1; i <= 30; i++) {
			%><td><%=i%></td>
			<%
			if((i % 7)==0) {
				%></tr><tr><%
			}
		}
		%>
		
	</tr>
	</table>
</body>
</html>