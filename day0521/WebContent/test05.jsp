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
		Cookie c = new Cookie("msg", "hello");
		//쿠키 생성
		response.addCookie(c);
		//쿠키를 하드웨어에 기록
		String str = c.getValue();
		//쿠키 값 가져오기
	%>
	쿠키쿠키	:	<%= str %>

	<hr>
	<a href="test06.jsp">연결</a>
</body>
</html>