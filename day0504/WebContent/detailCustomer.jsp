<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<h2>고객 정보</h2>
	<hr>

	<%
		int cid = Integer.parseInt(request.getParameter("cid"));
	
	%>



	<hr>
	<a href="listCustomer.jsp">고객목록</a>

</body>
</html>