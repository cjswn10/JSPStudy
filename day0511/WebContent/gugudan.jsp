<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>구구단</title>
</head>
<body>
<h2>구구단</h2>
<form action="gugudan.jsp" method="POST">
	<input type="number" name="n">단
	<input type="submit" value="출력">
</form>
<hr>
<%
	if(request.getMethod().equals("POST")) {
		int n = Integer.parseInt(request.getParameter("n"));
		
		for(int i = 1; i < 10; i++){
		%>
			<%=n%> * <%=i%> = <%=n*i%><br>
		<%
		}
	}

%>

</body>
</html>