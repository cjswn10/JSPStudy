<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>1���� N���� ����</title>
</head>
<body>
<form action="totalTest.jsp" method="post">
	N : <input type="number" name="n"><br>
	<input type="submit" value="���">
</form>
	<% 
	
	if(request.getMethod().equals("POST")) {
		int n = Integer.parseInt(request.getParameter("n"));
		int sum= 0;
		
		for(int i = 1; i <= n; i++) 
			sum += i;
	%>		
		1���� <%=n%>������ �� : <%=sum %>
	<%	
	}
	%>
</body>
</html>