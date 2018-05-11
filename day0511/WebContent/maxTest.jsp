<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>큰 수 찾기</title>
</head>
<body>
<h2>큰수찾기</h2>
<!-- 맨 처음 페이지를 불러오는  방식은  GET방식이다 -->
<!-- 따라서 한 페이지안에서 부르기 위해서는 post로 요청해야 파라미터를 받을 수 있다.-->
<form action="maxTest.jsp" method="POST">
숫자1 : <input type="text" name="num1">
숫자2 : <input type="text" name="num2">
<input type="submit" value="찾기">
</form>

<%
	if(request.getMethod().equals("POST")) {
		int n1 = Integer.parseInt(request.getParameter("num1"));	
		int n2 = Integer.parseInt(request.getParameter("num2"));
		int max = n1;
		if(n1 < n2) {
			max = n2;
		}

		%>
			큰 수는 <%=max%>
		<%
	}

%>


</body>
</html>